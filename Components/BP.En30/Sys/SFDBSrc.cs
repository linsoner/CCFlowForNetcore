﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Oracle.ManagedDataAccess.Client;
using System.Collections;
using System.IO;
using System.Net;
using System.Text;
using System.Xml.Schema;
using BP.DA;
using BP.En;
using MySql.Data.MySqlClient;
using System.Threading;

namespace BP.Sys
{

    /// <summary>
    /// 数据源
    /// </summary>
    public class SFDBSrcAttr : EntityNoNameAttr
    {
        /// <summary>
        /// 数据源类型
        /// </summary>
        public const string DBSrcType = "DBSrcType";
        /// <summary>
        /// 用户编号
        /// </summary>
        public const string UserID = "UserID";
        /// <summary>
        /// 密码
        /// </summary>
        public const string Password = "Password";
        /// <summary>
        /// IP地址
        /// </summary>
        public const string IP = "IP";
        /// <summary>
        /// 数据库名称
        /// </summary>
        public const string DBName = "DBName";
        public const string ConnString = "ConnString";
    }
    /// <summary>
    /// 数据源
    /// </summary>
    public class SFDBSrc : EntityNoName
    {
        #region 属性
        public FieldCaseModel FieldCaseModel
        {
            get
            {
                switch (this.DBSrcType)
                {
                    case BP.Sys.DBSrcType.Oracle:
                        return FieldCaseModel.UpperCase;
                    case BP.Sys.DBSrcType.PostgreSQL:
                    case BP.Sys.DBSrcType.UX:
                        return FieldCaseModel.Lowercase;
                        break;
                    default:
                        return FieldCaseModel.None;
                }
            }
        }
        /// <summary>
        /// 数据库类型
        /// </summary>
        public string DBSrcType
        {
            get
            {
                return this.GetValStringByKey(SFDBSrcAttr.DBSrcType);
            }
            set
            {
                this.SetValByKey(SFDBSrcAttr.DBSrcType, value);
            }
        }
       
        public string DBName
        {
            get
            {
                return this.GetValStringByKey(SFDBSrcAttr.DBName);
            }
            set
            {
                this.SetValByKey(SFDBSrcAttr.DBName, value);
            }
        }
        public string IP
        {
            get
            {
                return this.GetValStringByKey(SFDBSrcAttr.IP);
            }
            set
            {
                this.SetValByKey(SFDBSrcAttr.IP, value);
            }
        }

        /// <summary>
        /// 数据库类型
        /// </summary>
        public DBType HisDBType
        {
            get
            {
                switch (this.DBSrcType)
                {
                    case Sys.DBSrcType.local:
                        return BP.Difference.SystemConfig.AppCenterDBType;
                    case Sys.DBSrcType.MSSQL:
                        return DBType.MSSQL;
                    case Sys.DBSrcType.Oracle:
                        return DBType.Oracle;
                    case Sys.DBSrcType.KingBaseR3:
                        return DBType.KingBaseR3;
                    case Sys.DBSrcType.KingBaseR6:
                        return DBType.KingBaseR6;
                    case Sys.DBSrcType.MySQL:
                        return DBType.MySQL;
                    case Sys.DBSrcType.Informix:
                        return DBType.Informix;
                    case Sys.DBSrcType.PostgreSQL:
                        return DBType.PostgreSQL;
                    default:
                        throw new Exception("err@HisDBType没有判断的数据库类型.");
                }
            }
        }
        #endregion

        #region 数据库访问方法
        /// <summary>
        /// 运行SQL返回数值
        /// </summary>
        /// <param name="sql">一行一列的SQL</param>
        /// <param name="isNullAsVal">如果为空，就返回制定的值.</param>
        /// <returns>要返回的值</returns>
        public int RunSQLReturnInt(string sql, int isNullAsVal)
        {
            DataTable dt = this.RunSQLReturnTable(sql);
            if (dt.Rows.Count == 0)
                return isNullAsVal;
            return int.Parse(dt.Rows[0][0].ToString());
        }

        public Entities DoQuery(Entities ens, string sql, string expPageSize, string pk, Attrs attrs, int count, int pageSize, int pageIdx, string orderBy, bool isDesc = false)
        {
            DataTable dt = new DataTable();
            if (count == 0)
                return null;
            int pageNum = 0;
            string orderBySQL = "";
            //如果没有加入排序字段，使用主键
            if (DataType.IsNullOrEmpty(orderBy) == false)
            {
                orderBy = pk;
                string isDescStr = "";
                if (isDesc)
                    isDescStr = " DESC ";
                orderBySQL = orderBy + isDescStr;
            }
            sql = sql + " " + orderBySQL;
            try
            {
                if (pageSize == 0)
                    pageSize = 10;
                if (pageIdx == 0)
                    pageIdx = 1;
                int top = pageSize * (pageIdx - 1) + 1;
                int max = pageSize * pageIdx;
                int myleftCount = count - (pageNum * pageSize);
                string mysql = "";
                switch (this.DBSrcType)
                {
                    case Sys.DBSrcType.Oracle:
                    case Sys.DBSrcType.KingBaseR3:
                    case Sys.DBSrcType.KingBaseR6:
                        mysql = "SELECT * FROM (" + sql + " AND ROWNUM<=" + max + ") temp WHERE temp.rn>=" + top;
                        break;
                    case Sys.DBSrcType.MySQL:
                        mysql = sql + " LIMIT " + pageSize * (pageIdx - 1) + "," + pageSize;
                        break;
                    case Sys.DBSrcType.PostgreSQL:
                    case Sys.DBSrcType.UX:
                    case Sys.DBSrcType.MSSQL:
                    default:
                        //获取主键的类型
                        Attr attr = attrs.GetAttrByKeyOfEn(pk);

                        //mysql = countSql;
                        //mysql = mysql.Substring(mysql.ToUpper().IndexOf("FROM "));
                        // mysql = "SELECT  "+ mainTable+pk + " "  + mysql;
                        string pks = this.GenerPKsByTableWithPara(pk, attr.IsNum, expPageSize, pageSize * (pageIdx - 1), max, null);

                        if (pks == null)
                            mysql = sql + " AND 1=2 ";
                        else
                            mysql = sql + " AND OID in(" + pks + ")";
                        break;
                }
                dt = this.RunSQLReturnTable(mysql);
                return InitEntitiesByDataTable(ens, dt, null);

            }
            catch (Exception ex)
            {
                throw new Exception("err@数据源执行分页SQL出现错误：" + sql + "错误原因:" + ex.Message);
            }
        }

        public Entities InitEntitiesByDataTable(Entities ens, DataTable dt, string[] fullAttrs)
        {
            if (fullAttrs == null)
            {
                Map enMap = ens.GetNewEntity.EnMap;
                Attrs attrs = enMap.Attrs;
                try
                {

                    foreach (DataRow dr in dt.Rows)
                    {
                        Entity en = ens.GetNewEntity;
                        foreach (Attr attr in attrs)
                        {
                            if (dt.Columns.Contains(attr.Key) == false
                                && dt.Columns.Contains(attr.Key.ToUpper()) == false)
                                continue;
                            if (BP.Difference.SystemConfig.AppCenterDBFieldCaseModel == FieldCaseModel.UpperCase)
                            {
                                if (attr.MyFieldType == FieldType.RefText)
                                    en.SetValByKey(attr.Key, dr[attr.Key]);
                                else
                                    en.SetValByKey(attr.Key, dr[attr.Key.ToUpper()]);
                            }
                            else if (BP.Difference.SystemConfig.AppCenterDBFieldCaseModel == FieldCaseModel.Lowercase)
                            {
                                if (attr.MyFieldType == FieldType.RefText)
                                    en.SetValByKey(attr.Key, dr[attr.Key]);
                                else
                                    en.SetValByKey(attr.Key, dr[attr.Key.ToLower()]);
                            }
                            else
                                en.SetValByKey(attr.Key, dr[attr.Key]);
                        }
                        ens.AddEntity(en);
                    }
                }
                catch (Exception ex)
                {
                    // warning 不应该出现的错误. 2011-12-03 add
                    String cols = "";
                    foreach (DataColumn dc in dt.Columns)
                    {
                        cols += " , " + dc.ColumnName;
                    }
                    throw new Exception("Columns=" + cols + "@Ens=" + ens.ToString() + " @异常信息:" + ex.Message);
                }

                return ens;
            }

            foreach (DataRow dr in dt.Rows)
            {
                Entity en = ens.GetNewEntity;
                foreach (String str in fullAttrs)
                {
                    if (dt.Columns.Contains(str) == false
                                && dt.Columns.Contains(str.ToUpper()) == false)
                        continue;
                    if (BP.Difference.SystemConfig.AppCenterDBFieldCaseModel == FieldCaseModel.UpperCase)
                    {
                        if (dt.Columns.Contains(str) == true)
                            en.SetValByKey(str, dr[str]);
                        else
                            en.SetValByKey(str, dr[str.ToUpper()]);
                    }
                    else if (BP.Difference.SystemConfig.AppCenterDBFieldCaseModel == FieldCaseModel.Lowercase)
                    {
                        if (dt.Columns.Contains(str) == true)
                            en.SetValByKey(str, dr[str]);
                        else
                            en.SetValByKey(str, dr[str.ToLower()]);
                    }

                    else
                        en.SetValByKey(str, dr[str]);

                }
                ens.AddEntity(en);
            }

            return ens;

        }

        public string GenerPKsByTableWithPara(string pk, bool isNum, string sql, int from, int to, Paras paras)
        {
            DataTable dt = this.RunSQLReturnTable(sql, paras);
            string pks = "";
            int i = 0;
            int paraI = 0;

            string dbStr = BP.Difference.SystemConfig.AppCenterDBVarStr;
            foreach (DataRow dr in dt.Rows)
            {
                i++;
                if (i > from)
                {


                    if (isNum == true)
                        pks += int.Parse(dr[pk].ToString()) + ",";
                    else
                        pks += "'" + dr[pk].ToString() + "',";
                    if (i >= to)
                        return pks.Substring(0, pks.Length - 1);
                }
            }
            if (pks == "")
            {
                return null;
            }
            return pks.Substring(0, pks.Length - 1);
        }
        /// <summary>
        /// 运行SQL
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public int RunSQL(string sql)
        {
            int i = 0;
            switch (this.DBSrcType)
            {
                case Sys.DBSrcType.local:
                    return DBAccess.RunSQL(sql);
                case Sys.DBSrcType.MSSQL:
                    SqlConnection conn = new SqlConnection(this.ConnString);
                    SqlCommand cmd = null;

                    try
                    {
                        conn.Open();
                        cmd = new SqlCommand(sql, conn);
                        cmd.CommandType = CommandType.Text;
                        i = cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        conn.Close();
                        return i;
                    }
                    catch (Exception ex)
                    {
                        if (conn.State == ConnectionState.Open)
                            conn.Close();
                        if (cmd != null)
                            cmd.Dispose();
                        // throw new Exception("RunSQL 错误，SQL=" + sql);
                        throw new Exception("RunSQL 错误，SQL=" + sql + " ex=" + ex.Message);

                    }
                case Sys.DBSrcType.Oracle:
                    OracleConnection connOra = new OracleConnection(this.ConnString);
                    OracleCommand cmdOra = null;

                    try
                    {
                        connOra.Open();
                        cmdOra = new OracleCommand(sql, connOra);
                        cmdOra.CommandType = CommandType.Text;
                        i = cmdOra.ExecuteNonQuery();
                        cmdOra.Dispose();
                        connOra.Close();
                        return i;
                    }
                    catch (Exception ex)
                    {
                        if (connOra.State == ConnectionState.Open)
                            connOra.Close();
                        if (cmdOra != null)
                            cmdOra.Dispose();
                        throw new Exception("RunSQL 错误，SQL=" + sql + " ex=" + ex.Message);
                    }
                case Sys.DBSrcType.MySQL:
                    MySqlConnection connMySQL = new MySqlConnection(this.ConnString);
                    MySqlCommand cmdMySQL = null;
                    try
                    {
                        connMySQL.Open();
                        cmdMySQL = new MySqlCommand(sql, connMySQL);
                        cmdMySQL.CommandType = CommandType.Text;
                        i = cmdMySQL.ExecuteNonQuery();
                        cmdMySQL.Dispose();
                        connMySQL.Close();
                        return i;
                    }
                    catch (Exception ex)
                    {
                        if (connMySQL.State == ConnectionState.Open)
                            connMySQL.Close();
                        if (cmdMySQL != null)
                            cmdMySQL.Dispose();
                        throw new Exception("RunSQL 错误，SQL=" + sql + " ex=" + ex.Message);

                        //throw new Exception("RunSQL 错误，SQL=" + sql);
                    }
                //From Zhou IBM删除
                //case Sys.DBSrcType.Informix:
                //    IfxConnection connIfx = new IfxConnection(this.ConnString);
                //    IfxCommand cmdIfx = null;
                //    try
                //    {
                //        connIfx.Open();
                //        cmdIfx = new IfxCommand(sql, connIfx);
                //        cmdIfx.CommandType = CommandType.Text;
                //        i = cmdIfx.ExecuteNonQuery();
                //        cmdIfx.Dispose();
                //        connIfx.Close();
                //        return i;
                //    }
                //    catch (Exception ex)
                //    {
                //        if (connIfx.State == ConnectionState.Open)
                //            connIfx.Close();
                //        if (cmdIfx != null)
                //            cmdIfx.Dispose();
                //        throw new Exception("RunSQL 错误，SQL=" + sql);
                //    }
                default:
                    throw new Exception("@没有判断的支持的数据库类型.");
            }

            return 0;
        }
        public void RunSQLs(string sql)
        {
            if (DataType.IsNullOrEmpty(sql))
                return;

            //sql = DealSQL(sql);//去掉注释.

            sql = sql.Replace("@GO", "~");
            sql = sql.Replace("@", "~");

            if (sql.Contains("';'") == false)
                sql = sql.Replace(";", "~");

            sql = sql.Replace("UPDATE", "~UPDATE");
            sql = sql.Replace("DELETE", "~DELETE");
            sql = sql.Replace("INSERT", "~INSERT");

            string[] strs = sql.Split('~');
            foreach (string str in strs)
            {
                if (DataType.IsNullOrEmpty(str))
                    continue;

                if (str.Contains("--") || str.Contains("/*"))
                    continue;

                RunSQL(str);
            }
        }

        private static readonly object _lock = new object();
        /// <summary>
        /// 运行SQL
        /// </summary>
        /// <param name="runObj"></param>
        /// <returns></returns>
        public DataTable RunSQLReturnTable(string runObj)
        {

            DataTable dt = RunSQLReturnTable(runObj, new Paras());
            Thread thread = Thread.CurrentThread;
            System.Diagnostics.Debug.WriteLine("SFTable --- Thread-" + thread.ManagedThreadId + ",runObj: --" + runObj);
            return dt;

        }

        public string RunSQLReturnString(string runObj, string isNullasVal = null)
        {

            DataTable dt = RunSQLReturnTable(runObj);
            if (dt.Rows.Count == 0)
                return isNullasVal;

            return dt.Rows[0][0].ToString();
        }


        /// <summary>
        /// 运行SQL返回datatable
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public DataTable RunSQLReturnTable(string runObj, Paras ps)
        {
            try
            {
                Thread thread = Thread.CurrentThread;
                System.Diagnostics.Debug.WriteLine("Thread:" + thread.ManagedThreadId + ",NO:" + this.No + ",runObj:" + runObj + ",paras:" + ps);
                switch (this.DBSrcType)
                {
                    case BP.Sys.DBSrcType.local: //如果是本机，直接在本机上执行.
                        return DBAccess.RunSQLReturnTable(runObj, ps);
                    case BP.Sys.DBSrcType.MSSQL: //如果是SQLServer.
                        SqlConnection connSQL = new SqlConnection(this.ConnString);
                        SqlDataAdapter ada = null;
                        SqlParameter myParameter = null;

                        try
                        {
                            connSQL.Open(); //打开.
                            ada = new SqlDataAdapter(runObj, connSQL);
                            ada.SelectCommand.CommandType = CommandType.Text;

                            // 加入参数
                            if (ps != null)
                            {
                                foreach (Para para in ps)
                                {
                                    myParameter = new SqlParameter(para.ParaName, para.val);
                                    myParameter.Size = para.Size;
                                    ada.SelectCommand.Parameters.Add(myParameter);
                                }
                            }

                            DataTable oratb = new DataTable("otb");
                            ada.Fill(oratb);
                            ada.Dispose();
                            connSQL.Close();
                            return oratb;
                        }
                        catch (Exception ex)
                        {
                            if (ada != null)
                                ada.Dispose();
                            if (connSQL.State == ConnectionState.Open)
                                connSQL.Close();
                            throw new Exception("SQL=" + runObj + " Exception=" + ex.Message);
                        }
                    case Sys.DBSrcType.Oracle:
                        OracleConnection oracleConn = new OracleConnection(ConnString);
                        OracleDataAdapter oracleAda = null;
                        OracleParameter myParameterOrcl = null;

                        try
                        {
                            oracleConn.Open();
                            oracleAda = new OracleDataAdapter(runObj, oracleConn);
                            oracleAda.SelectCommand.CommandType = CommandType.Text;

                            if (ps != null)
                            {
                                // 加入参数
                                foreach (Para para in ps)
                                {
                                    myParameterOrcl = new OracleParameter(para.ParaName, para.val);
                                    myParameterOrcl.Size = para.Size;
                                    oracleAda.SelectCommand.Parameters.Add(myParameterOrcl);
                                }
                            }

                            DataTable oracleTb = new DataTable("otb");
                            oracleAda.Fill(oracleTb);
                            oracleAda.Dispose();
                            oracleConn.Close();
                            return oracleTb;
                        }
                        catch (Exception ex)
                        {
                            if (oracleAda != null)
                                oracleAda.Dispose();
                            if (oracleConn.State == ConnectionState.Open)
                                oracleConn.Close();
                            throw new Exception("SQL=" + runObj + " Exception=" + ex.Message);
                        }
                    case Sys.DBSrcType.MySQL:
                        MySqlConnection mysqlConn = new MySqlConnection(ConnString);
                        MySqlDataAdapter mysqlAda = null;
                        MySqlParameter myParameterMysql = null;

                        try
                        {
                            mysqlConn.Open();
                            mysqlAda = new MySqlDataAdapter(runObj, mysqlConn);
                            mysqlAda.SelectCommand.CommandType = CommandType.Text;

                            if (ps != null)
                            {
                                // 加入参数
                                foreach (Para para in ps)
                                {
                                    myParameterMysql = new MySqlParameter(para.ParaName, para.val);
                                    myParameterMysql.Size = para.Size;
                                    mysqlAda.SelectCommand.Parameters.Add(myParameterMysql);
                                }
                            }

                            DataTable mysqlTb = new DataTable("otb");
                            mysqlAda.Fill(mysqlTb);
                            mysqlAda.Dispose();
                            mysqlConn.Close();
                            return mysqlTb;
                        }
                        catch (Exception ex)
                        {
                            if (mysqlAda != null)
                                mysqlAda.Dispose();
                            if (mysqlConn.State == ConnectionState.Open)
                                mysqlConn.Close();
                            throw new Exception("SQL=" + runObj + " Exception=" + ex.Message);
                        }

                    default:
                        break;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw new Exception("err@从自定义数据源中获取数据失败，" + this.No + " , " + this.Name + " 异常信息:" + ex.Message);
                BP.DA.Log.DebugWriteError(ex.Message);
            }

        }

        public DataTable RunSQLReturnTable(string sql, int startRecord, int recordCount)
        {
            switch (this.DBSrcType)
            {
                case BP.Sys.DBSrcType.local: //如果是本机，直接在本机上执行.
                    return DBAccess.RunSQLReturnTable(sql);
                case BP.Sys.DBSrcType.MSSQL: //如果是SQLServer.
                    SqlConnection connSQL = new SqlConnection(this.ConnString);
                    SqlDataAdapter ada = null;
                    try
                    {
                        connSQL.Open(); //打开.
                        ada = new SqlDataAdapter(sql, connSQL);
                        ada.SelectCommand.CommandType = CommandType.Text;
                        DataTable oratb = new DataTable("otb");
                        ada.Fill(startRecord, recordCount, oratb);
                        ada.Dispose();
                        connSQL.Close();
                        return oratb;
                    }
                    catch (Exception ex)
                    {
                        if (ada != null)
                            ada.Dispose();
                        if (connSQL.State == ConnectionState.Open)
                            connSQL.Close();
                        throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                    }
                case Sys.DBSrcType.Oracle:
                    OracleConnection oracleConn = new OracleConnection(ConnString);
                    OracleDataAdapter oracleAda = null;

                    try
                    {
                        oracleConn.Open();
                        oracleAda = new OracleDataAdapter(sql, oracleConn);
                        oracleAda.SelectCommand.CommandType = CommandType.Text;
                        DataTable oracleTb = new DataTable("otb");
                        oracleAda.Fill(startRecord, recordCount, oracleTb);
                        oracleAda.Dispose();
                        oracleConn.Close();
                        return oracleTb;
                    }
                    catch (Exception ex)
                    {
                        if (oracleAda != null)
                            oracleAda.Dispose();
                        if (oracleConn.State == ConnectionState.Open)
                            oracleConn.Close();
                        throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                    }
                case Sys.DBSrcType.MySQL:
                    MySqlConnection mysqlConn = new MySqlConnection(ConnString);
                    MySqlDataAdapter mysqlAda = null;

                    try
                    {
                        mysqlConn.Open();
                        mysqlAda = new MySqlDataAdapter(sql, mysqlConn);
                        mysqlAda.SelectCommand.CommandType = CommandType.Text;
                        DataTable mysqlTb = new DataTable("otb");
                        mysqlAda.Fill(startRecord, recordCount, mysqlTb);
                        mysqlAda.Dispose();
                        mysqlConn.Close();
                        return mysqlTb;
                    }
                    catch (Exception ex)
                    {
                        if (mysqlAda != null)
                            mysqlAda.Dispose();
                        if (mysqlConn.State == ConnectionState.Open)
                            mysqlConn.Close();
                        throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                    }
                //
                //case Sys.DBSrcType.Informix:
                //    IfxConnection ifxConn = new IfxConnection(ConnString);
                //    IfxDataAdapter ifxAda = null;

                //    try
                //    {
                //        ifxConn.Open();
                //        ifxAda = new IfxDataAdapter(sql, ifxConn);
                //        ifxAda.SelectCommand.CommandType = CommandType.Text;
                //        DataTable ifxTb = new DataTable("otb");
                //        ifxAda.Fill(startRecord, recordCount, ifxTb);
                //        ifxAda.Dispose();
                //        ifxConn.Close();
                //        return ifxTb;
                //    }
                //    catch (Exception ex)
                //    {
                //        if (ifxAda != null)
                //            ifxAda.Dispose();
                //        if (ifxConn.State == ConnectionState.Open)
                //            ifxConn.Close();
                //        throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                //    }
                default:
                    break;
            }
            return null;
        }
        /// <summary>
        /// 判断数据源所在库中是否已经存在指定名称的对象【表/视图】
        /// </summary>
        /// <param name="objName">表/视图 名称</param>
        /// <returns>如果不存在，返回null，否则返回对象的类型：TABLE(表)、VIEW(视图)、PROCEDURE(存储过程，判断不完善)、OTHER(其他类型)</returns>
        public string IsExistsObj(string objName)
        {
            string sql = string.Empty;
            DataTable dt = null;

            switch (this.DBSrcType)
            {
                case Sys.DBSrcType.local:
                    sql = GetIsExitsSQL(DBAccess.AppCenterDBType, objName, DBAccess.GetAppCenterDBConn.Database);
                    dt = DBAccess.RunSQLReturnTable(sql);
                    break;
                case Sys.DBSrcType.MSSQL:
                    sql = GetIsExitsSQL(DBType.MSSQL, objName, this.DBName);
                    dt = RunSQLReturnTable(sql);
                    break;
                case Sys.DBSrcType.Oracle:
                    sql = GetIsExitsSQL(DBType.Oracle, objName, this.DBName);
                    dt = RunSQLReturnTable(sql);
                    break;
                case Sys.DBSrcType.MySQL:
                    sql = GetIsExitsSQL(DBType.MySQL, objName, this.DBName);
                    dt = RunSQLReturnTable(sql);
                    break;
                case Sys.DBSrcType.Informix:
                    sql = GetIsExitsSQL(DBType.Informix, objName, this.DBName);
                    dt = RunSQLReturnTable(sql);
                    break;
                default:
                    throw new Exception("@未涉及的数据库类型。");
            }

            return dt.Rows.Count == 0 ? null : dt.Rows[0][0].ToString();
        }

        /// <summary>
        /// 获取判断数据库中是否存在指定名称的表/视图SQL语句
        /// </summary>
        /// <param name="dbType">数据库类型</param>
        /// <param name="objName">表/视图名称</param>
        /// <param name="dbName">数据库名称</param>
        /// <returns></returns>
        public string GetIsExitsSQL(DBType dbType, string objName, string dbName)
        {
            switch (dbType)
            {
                case DBType.MSSQL:
                case DBType.PostgreSQL:
                case DBType.UX:
                    return string.Format("SELECT (CASE s.xtype WHEN 'U' THEN 'TABLE' WHEN 'V' THEN 'VIEW' WHEN 'P' THEN 'PROCEDURE' ELSE 'OTHER' END) OTYPE FROM sysobjects s WHERE s.name = '{0}'", objName);
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    return string.Format("SELECT uo.OBJECT_TYPE OTYPE FROM user_objects uo WHERE uo.OBJECT_NAME = '{0}'", objName.ToUpper());
                case DBType.MySQL:
                    return string.Format("SELECT (CASE t.TABLE_TYPE WHEN 'BASE TABLE' THEN 'TABLE' ELSE 'VIEW' END) OTYPE FROM information_schema.tables t WHERE t.TABLE_SCHEMA = '{1}' AND t.TABLE_NAME = '{0}'", objName, dbName);
                case DBType.Informix:
                    return string.Format("SELECT (CASE s.tabtype WHEN 'T' THEN 'TABLE' WHEN 'V' THEN 'VIEW' ELSE 'OTHER' END) OTYPE FROM systables s WHERE s.tabname = '{0}'", objName);
                case DBType.DB2:
                    return string.Format("");
                case DBType.Access:
                    return string.Format("");
                default:
                    throw new Exception("@没有涉及的数据库类型。");
            }
        }
        #endregion

        #region 构造方法
        /// <summary>
        /// 编辑类型
        /// </summary>
        public int EditType
        {
            get
            {
                return this.GetParaInt("EditType", 0);
            }
            set
            {
                this.SetPara("EditType", value);
            }
        }
        /// <summary>
        /// 数据源
        /// </summary>
        public SFDBSrc()
        {
        }
        public SFDBSrc(string mypk)
        {
            this.No = mypk;
            this.Retrieve();
        }
        /// <summary>
        /// EnMap
        /// </summary>
        public override Map EnMap
        {
            get
            {
                if (this._enMap != null)
                    return this._enMap;

                Map map = new Map("Sys_SFDBSrc", "数据源");

                map.AddTBStringPK(SFDBSrcAttr.No, null, "编号", true, false, 1, 20, 20);
                map.AddTBString(SFDBSrcAttr.Name, null, "名称", true, false, 0, 30, 20);
                //string cfg = "@0=应用系统主数据库(默认)@1=SQLServer数据库@2=Oracle数据库@3=MySQL数据库@4=Informix数据库@50=Dubbo服务@100=WebService数据源";
                //map.AddDDLSysEnum(SFDBSrcAttr.DBSrcType, 0, "数据源类型", true, true,
                //  SFDBSrcAttr.DBSrcType,cfg);

                string cfg1 = "@local=应用系统数据库(默认)@MSSQL=SQLServer数据库@Oracle=Oracle数据库@MySQL=MySQL数据库@Informix=Informix数据库@KindingBase3=人大金仓库R3@KindingBase6=人大金仓库R6@UX=优漩@Dubbo=Dubbo服务@WS=WebService数据源@URL=url模式@CCFromRef.js";

                map.AddDDLStringEnum(SFDBSrcAttr.DBSrcType, "local", "类型", cfg1, true, null, false);
                map.AddTBString(SFDBSrcAttr.DBName, null, "数据库名称/Oracle保持为空", true, false, 0, 30, 20);
                map.AddTBString(SFDBSrcAttr.ConnString, null, "连接串/URL", true, false, 0, 200, 20,true);

                map.AddTBAtParas(200);

                //string runPlant = BP.Difference.SystemConfig.RunOnPlant;
                //if (runPlant.Equals("CCFlow") == false && runPlant.Equals("bp") == false)
                //{
                //    map.AddTBString(SFDBSrcAttr.UserID, null, "数据库登录用户ID", true, false, 0, 30, 20);
                //    map.AddTBString(SFDBSrcAttr.Password, null, "密码", true, false, 0, 30, 20);
                //    map.AddTBString(SFDBSrcAttr.IP, null, "IP地址/数据库实例名", true, false, 0, 500, 20);
                //}

                //map.AddDDLSysEnum(SFDBSrcAttr.DBSrcType, 0, "数据源类型", true, true,
                //    SFDBSrcAttr.DBSrcType, "@0=应用系统主数据库@1=SQLServer@2=Oracle@3=MySQL@4=Infomix");

                RefMethod rm = new RefMethod();

                rm = new RefMethod();
                rm.Title = "测试连接";
                rm.ClassMethodName = this.ToString() + ".DoConn";
                rm.RefMethodType = RefMethodType.Func; // 仅仅是一个功能.
                map.AddRefMethod(rm);

                this._enMap = map;
                return this._enMap;
            }
        }
        #endregion

        #region 方法.
        /// <summary>
        /// 连接字符串.
        /// </summary>
        public string ConnString
        {
            get
            {
                switch (this.DBSrcType)
                {
                    case Sys.DBSrcType.local:
                        return BP.Difference.SystemConfig.AppCenterDSN;
                    default:
                        return this.GetValStringByKey(SFDBSrcAttr.ConnString);
                        //case Sys.DBSrcType.SQLServer:
                        //    return "password=" + this.Password + ";persist security info=true;user id=" + this.UserID + ";initial catalog=" + this.DBName + ";data source=" + this.IP + ";timeout=999;multipleactiveresultsets=true";
                        //case Sys.DBSrcType.Oracle:
                        //    return "user id=" + this.UserID + ";data source=" + this.IP + ";password=" + this.Password + ";Max Pool Size=200";
                        //case Sys.DBSrcType.MySQL:
                        //    return "Data Source=" + this.IP + ";Persist Security info=True;Initial Catalog=" + this.DBName + ";User ID=" + this.UserID + ";Password=" + this.Password + ";";
                        //case Sys.DBSrcType.Informix:
                        //    return "Host=" + this.IP + "; Service=; Server=; Database=" + this.DBName + "; User id=" + this.UserID + "; Password=" + this.Password + "; ";  //Service为监听客户端连接的服务名，Server为数据库实例名，这两项没提供
                        //case Sys.DBSrcType.PostgreSQL:
                        //    return "Server=" + this.IP + ";Port=5432;Database=" + this.DBName + ";UserId=" + this.UserID + ";Password=" + this.Password + ";;Pooling=False;";
                        //default:
                        //    throw new Exception("@没有判断的类型.");
                }
            }
        }
        /// <summary>
        /// 执行连接
        /// </summary>
        /// <returns></returns>
        public string DoConn()
        {
            if (this.No == "local")
                return "本地连接不需要测试.";

            if (this.DBSrcType == BP.Sys.DBSrcType.local)
                return "@在该系统中只能有一个本地连接.";

            string dsn = "";
            if (this.DBSrcType == BP.Sys.DBSrcType.MSSQL)
            {
                try
                {
                    System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
                    conn.ConnectionString = this.ConnString;
                    conn.Open();
                    conn.Close();
                    return "恭喜您，该(" + this.Name + ")连接配置成功。";
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }

            if (this.DBSrcType == BP.Sys.DBSrcType.Oracle)
            {
                try
                {
                    //  dsn = "user id=" + this.UserID + ";data source=" + this.DBName + ";password=" + this.Password + ";Max Pool Size=200";
                    //System.Data.OracleClient.OracleConnection conn = new System.Data.OracleClient.OracleConnection();
                    //zyt改造OracleConnection,Core And Fram4编译正常
                    OracleConnection conn = new OracleConnection();
                    conn.ConnectionString = this.ConnString;
                    conn.Open();
                    conn.Close();
                    return "恭喜您，该(" + this.Name + ")连接配置成功。";
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }

            if (this.DBSrcType == BP.Sys.DBSrcType.MySQL)
            {
                try
                {
                    //   dsn = "Data Source=" + this.IP + ";Persist Security info=True;Initial Catalog=" + this.DBName + ";User ID=" + this.UserID + ";Password=" + this.Password + ";";
                    MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection();
                    conn.ConnectionString = this.ConnString;
                    conn.Open();
                    conn.Close();
                    return "恭喜您，该(" + this.Name + ")连接配置成功。";
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }

            if (this.DBSrcType == BP.Sys.DBSrcType.WebServices)
            {
                string url = this.ConnString;
                try
                {
                    HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(url);
                    myRequest.Method = "GET";　              //设置提交方式可以为＂ｇｅｔ＂，＂ｈｅａｄ＂等
                    myRequest.Timeout = 30000;　             //设置网页响应时间长度
                    myRequest.AllowAutoRedirect = false;//是否允许自动重定向
                    HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
                    return myResponse.StatusCode == HttpStatusCode.OK ? "连接配置成功。" : "连接配置失败。";//返回响应的状态
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            return "没有涉及到的连接测试类型...";
        }
        /// <summary>
        /// 获取所有数据表，不包括视图
        /// </summary>
        /// <returns></returns>
        public DataTable GetAllTablesWithoutViews()
        {
            var sql = new StringBuilder();
            var dbType = this.DBSrcType;
            if (dbType == BP.Sys.DBSrcType.local)
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dbType = BP.Sys.DBSrcType.MSSQL;
                        break;
                    case DBType.Oracle:
                        dbType = BP.Sys.DBSrcType.Oracle;
                        break;
                    case DBType.MySQL:
                        dbType = BP.Sys.DBSrcType.MySQL;
                        break;
                    case DBType.Informix:
                        dbType = BP.Sys.DBSrcType.Informix;
                        break;
                    case DBType.PostgreSQL:
                        dbType = BP.Sys.DBSrcType.PostgreSQL;
                        break;
                    case DBType.UX:
                        dbType = BP.Sys.DBSrcType.UX;
                        break;
                    case DBType.KingBaseR3:
                        dbType = BP.Sys.DBSrcType.KingBaseR3;
                        break;
                    case DBType.KingBaseR6:
                        dbType = BP.Sys.DBSrcType.KingBaseR6;
                        break;
                    default:
                        throw new Exception("没有涉及到的连接测试类型...");
                }
            }

            switch (dbType)
            {
                case Sys.DBSrcType.MSSQL:
                    sql.AppendLine("SELECT NAME AS No,");
                    sql.AppendLine("       NAME");
                    sql.AppendLine("FROM   sysobjects");
                    sql.AppendLine("WHERE  xtype = 'U'");
                    sql.AppendLine("ORDER BY");
                    sql.AppendLine("       Name");
                    break;
                case Sys.DBSrcType.Oracle:
                    sql.AppendLine("SELECT uo.OBJECT_NAME No,");
                    sql.AppendLine("       uo.OBJECT_NAME Name");
                    sql.AppendLine("  FROM user_objects uo");
                    sql.AppendLine(" WHERE uo.OBJECT_TYPE = 'TABLE'");
                    sql.AppendLine(" ORDER BY uo.OBJECT_NAME");
                    break;
                case Sys.DBSrcType.MySQL:
                    sql.AppendLine("SELECT ");
                    sql.AppendLine("    table_name No,");
                    sql.AppendLine("    table_name Name");
                    sql.AppendLine("FROM");
                    sql.AppendLine("    information_schema.tables");
                    sql.AppendLine("WHERE");
                    sql.AppendLine(string.Format("    table_schema = '{0}'", this.DBSrcType == BP.Sys.DBSrcType.local ? DBAccess.GetAppCenterDBConn.Database : this.DBName));
                    sql.AppendLine("        AND table_type = 'BASE TABLE'");
                    sql.AppendLine("ORDER BY table_name;");
                    break;
                case Sys.DBSrcType.Informix:
                    sql.AppendLine("");
                    break;
                case Sys.DBSrcType.PostgreSQL:
                case Sys.DBSrcType.UX:
                    sql.AppendLine("SELECT ");
                    sql.AppendLine("    table_name No,");
                    sql.AppendLine("    table_name Name");
                    sql.AppendLine("FROM");
                    sql.AppendLine("    information_schema.tables");
                    sql.AppendLine("WHERE");
                    sql.AppendLine(string.Format("    table_schema = '{0}'", this.DBSrcType == BP.Sys.DBSrcType.local ? DBAccess.GetAppCenterDBConn.Database : this.DBName));
                    sql.AppendLine("        AND table_type = 'BASE TABLE'");
                    sql.AppendLine("ORDER BY table_name;");
                    break;
                default:
                    break;
            }

            DataTable allTables = null;
            if (this.No == "local")
            {
                allTables = DBAccess.RunSQLReturnTable(sql.ToString());
            }
            else
            {
                var dsn = this.ConnString;
                var conn = GetConnection(dsn);
                try
                {
                    conn.Open();
                    allTables = RunSQLReturnTable(sql.ToString(), conn, dsn, CommandType.Text);
                }
                catch (Exception ex)
                {
                    throw new Exception("@失败:" + ex.Message + " dns:" + dsn);
                }
            }

            return allTables;
        }
        /// <summary>
        /// 获得数据列表.
        /// </summary>
        /// <returns></returns>
        public DataTable GetTables(bool isCutFlowTables = false)
        {
            var sql = new StringBuilder();
            sql.AppendFormat("SELECT ss.SrcTable FROM Sys_SFTable ss WHERE ss.FK_SFDBSrc = '{0}'", this.No);

            var allTablesExist = DBAccess.RunSQLReturnTable(sql.ToString());

            sql.Clear();

            var dbType = this.DBSrcType;
            if (dbType == BP.Sys.DBSrcType.local)
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dbType = BP.Sys.DBSrcType.MSSQL;
                        break;
                    case DBType.Oracle:
                        dbType = BP.Sys.DBSrcType.Oracle;
                        break;
                    case DBType.MySQL:
                        dbType = BP.Sys.DBSrcType.MySQL;
                        break;
                    case DBType.Informix:
                        dbType = BP.Sys.DBSrcType.Informix;
                        break;
                    case DBType.PostgreSQL:
                        dbType = BP.Sys.DBSrcType.PostgreSQL;
                        break;
                    case DBType.UX:
                        dbType = BP.Sys.DBSrcType.UX;
                        break;
                    case DBType.KingBaseR3:
                        dbType = BP.Sys.DBSrcType.KingBaseR3;
                        break;
                    case DBType.KingBaseR6:
                        dbType = BP.Sys.DBSrcType.KingBaseR6;
                        break;
                    default:
                        throw new Exception("没有涉及到的连接测试类型...");
                }
            }

            switch (dbType)
            {
                case Sys.DBSrcType.MSSQL:
                    sql.AppendLine("SELECT NAME AS No,");
                    sql.AppendLine("       [Name] = '[' + (CASE xtype WHEN 'U' THEN '表' ELSE '视图' END) + '] ' + ");
                    sql.AppendLine("       NAME,");
                    sql.AppendLine("       xtype");
                    sql.AppendLine("FROM   sysobjects");
                    sql.AppendLine("WHERE  (xtype = 'U' OR xtype = 'V')");
                    //   sql.AppendLine("       AND (NAME NOT LIKE 'ND%')");
                    sql.AppendLine("       AND (NAME NOT LIKE 'Demo_%')");
                    sql.AppendLine("       AND (NAME NOT LIKE 'Sys_%')");
                    sql.AppendLine("       AND (NAME NOT LIKE 'WF_%')");
                    sql.AppendLine("       AND (NAME NOT LIKE 'GPM_%')");
                    sql.AppendLine("ORDER BY");
                    sql.AppendLine("       xtype,");
                    sql.AppendLine("       NAME");
                    break;
                case Sys.DBSrcType.Oracle:
                    sql.AppendLine("SELECT uo.OBJECT_NAME AS No,");
                    sql.AppendLine("       '[' || (CASE uo.OBJECT_TYPE");
                    sql.AppendLine("         WHEN 'TABLE' THEN");
                    sql.AppendLine("          '表'");
                    sql.AppendLine("         ELSE");
                    sql.AppendLine("          '视图'");
                    sql.AppendLine("       END) || '] ' || uo.OBJECT_NAME AS Name,");
                    sql.AppendLine("       CASE uo.OBJECT_TYPE");
                    sql.AppendLine("         WHEN 'TABLE' THEN");
                    sql.AppendLine("          'U'");
                    sql.AppendLine("         ELSE");
                    sql.AppendLine("          'V'");
                    sql.AppendLine("       END AS xtype");
                    sql.AppendLine("  FROM user_objects uo");
                    sql.AppendLine(" WHERE (uo.OBJECT_TYPE = 'TABLE' OR uo.OBJECT_TYPE = 'VIEW')");
                    //sql.AppendLine("   AND uo.OBJECT_NAME NOT LIKE 'ND%'");
                    //sql.AppendLine("   AND uo.OBJECT_NAME NOT LIKE 'Demo_%'");
                    //sql.AppendLine("   AND uo.OBJECT_NAME NOT LIKE 'Sys_%'");
                    //sql.AppendLine("   AND uo.OBJECT_NAME NOT LIKE 'WF_%'");
                    //sql.AppendLine("   AND uo.OBJECT_NAME NOT LIKE 'GPM_%'");
                    sql.AppendLine(" ORDER BY uo.OBJECT_TYPE, uo.OBJECT_NAME");
                    break;
                case Sys.DBSrcType.MySQL:
                    sql.AppendLine("SELECT ");
                    sql.AppendLine("    table_name AS No,");
                    sql.AppendLine("    CONCAT('[',");
                    sql.AppendLine("            CASE table_type");
                    sql.AppendLine("                WHEN 'BASE TABLE' THEN '表'");
                    sql.AppendLine("                ELSE '视图'");
                    sql.AppendLine("            END,");
                    sql.AppendLine("            '] ',");
                    sql.AppendLine("            table_name) AS Name,");
                    sql.AppendLine("    CASE table_type");
                    sql.AppendLine("        WHEN 'BASE TABLE' THEN 'U'");
                    sql.AppendLine("        ELSE 'V'");
                    sql.AppendLine("    END AS xtype");
                    sql.AppendLine("FROM");
                    sql.AppendLine("    information_schema.tables");
                    sql.AppendLine("WHERE");
                    sql.AppendLine(string.Format("    table_schema = '{0}'", this.DBSrcType == BP.Sys.DBSrcType.local ? DBAccess.GetAppCenterDBConn.Database : this.DBName));
                    sql.AppendLine("        AND (table_type = 'BASE TABLE'");
                    sql.AppendLine("        OR table_type = 'VIEW')");
                    //   sql.AppendLine("       AND (table_name NOT LIKE 'ND%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'Demo_%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'Sys_%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'WF_%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'GPM_%'");
                    sql.AppendLine("ORDER BY table_type , table_name;");
                    break;
                case Sys.DBSrcType.Informix:
                    sql.AppendLine("");
                    break;
                case Sys.DBSrcType.PostgreSQL:
                case Sys.DBSrcType.UX:
                    sql.AppendLine("SELECT ");
                    sql.AppendLine("    table_name AS No,");
                    sql.AppendLine("    CONCAT('[',");
                    sql.AppendLine("            CASE table_type");
                    sql.AppendLine("                WHEN 'BASE TABLE' THEN '表'");
                    sql.AppendLine("                ELSE '视图'");
                    sql.AppendLine("            END,");
                    sql.AppendLine("            '] ',");
                    sql.AppendLine("            table_name) AS Name,");
                    sql.AppendLine("    CASE table_type");
                    sql.AppendLine("        WHEN 'BASE TABLE' THEN 'U'");
                    sql.AppendLine("        ELSE 'V'");
                    sql.AppendLine("    END AS xtype");
                    sql.AppendLine("FROM");
                    sql.AppendLine("    information_schema.tables");
                    sql.AppendLine("WHERE");
                    sql.AppendLine(string.Format("    table_schema = '{0}'", this.DBSrcType == BP.Sys.DBSrcType.local ? DBAccess.GetAppCenterDBConn.Database : this.DBName));
                    sql.AppendLine("        AND (table_type = 'BASE TABLE'");
                    sql.AppendLine("        OR table_type = 'VIEW')");
                    //   sql.AppendLine("       AND (table_name NOT LIKE 'ND%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'Demo_%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'Sys_%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'WF_%'");
                    sql.AppendLine("        AND table_name NOT LIKE 'GPM_%'");
                    sql.AppendLine("ORDER BY table_type , table_name;");
                    break;
                default:
                    break;
            }

            DataTable allTables = null;
            if (this.No == "local")
            {
                allTables = DBAccess.RunSQLReturnTable(sql.ToString());

                #region 把tables 的英文名称替换为中文.
                //把tables 的英文名称替换为中文.
                string mapDT = "SELECT PTable,Name FROM Sys_MapData ";
                DataTable myDT = DBAccess.RunSQLReturnTable(mapDT);
                foreach (DataRow myDR in allTables.Rows)
                {
                    string no = myDR["No"].ToString();

                    string name = null;
                    foreach (DataRow dr in myDT.Rows)
                    {
                        string pTable = dr["PTable"].ToString();
                        if (pTable.Equals(no) == false)
                            continue;

                        name = dr["Name"].ToString();
                        break;
                    }
                    if (name != null)
                        myDR["Name"] = myDR["Name"].ToString() + "-" + name;
                }
                #endregion 把tables 的英文名称替换为中文.


            }
            else
            {
                var dsn = this.ConnString;
                var conn = GetConnection(dsn);
                try
                {
                    conn.Open();
                    allTables = RunSQLReturnTable(sql.ToString(), conn, dsn, CommandType.Text);
                }
                catch (Exception ex)
                {
                    throw new Exception("@失败:" + ex.Message + " dns:" + dsn);
                }
            }

            //去除已经使用的表
            var filter = string.Empty;
            foreach (DataRow dr in allTablesExist.Rows)
                filter += string.Format("No='{0}' OR ", dr[0]);

            if (filter != "")
            {
                var deletedRows = allTables.Select(filter.TrimEnd(" OR ".ToCharArray()));
                foreach (DataRow dr in deletedRows)
                {
                    allTables.Rows.Remove(dr);
                }
            }

            //去掉系统表.
            if (isCutFlowTables == true)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("No", typeof(string));
                dt.Columns.Add("Name", typeof(string));

                foreach (DataRow dr in allTables.Rows)
                {
                    string no = dr["No"].ToString();

                    if (no.Contains("WF_")
                        || no.Contains("Track")
                        || no.Contains("Sys_")
                        || no.Contains("Demo_"))
                        continue;

                    DataRow mydr = dt.NewRow();
                    mydr["No"] = dr["No"];
                    mydr["Name"] = dr["Name"];
                    dt.Rows.Add(mydr);
                }

                return dt;
            }

            return allTables;
        }
        /// <summary>
        /// 获取数据库连接
        /// </summary>
        /// <param name="dsn">连接字符串</param>
        /// <returns></returns>
        private System.Data.Common.DbConnection GetConnection(string dsn)
        {
            System.Data.Common.DbConnection conn = null;

            var dbType = this.DBSrcType;
            if (dbType == BP.Sys.DBSrcType.local)
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dbType = BP.Sys.DBSrcType.MSSQL;
                        break;
                    case DBType.Oracle:
                        dbType = BP.Sys.DBSrcType.Oracle;
                        break;
                    case DBType.MySQL:
                        dbType = BP.Sys.DBSrcType.MySQL;
                        break;
                    case DBType.Informix:
                        dbType = BP.Sys.DBSrcType.Informix;
                        break;
                    case DBType.KingBaseR3:
                        dbType = BP.Sys.DBSrcType.KingBaseR3;
                        break;
                    case DBType.KingBaseR6:
                        dbType = BP.Sys.DBSrcType.KingBaseR6;
                        break;
                    default:
                        throw new Exception("没有涉及到的连接测试类型...");
                }
            }
            this.DBSrcType = dbType;
            switch (dbType)
            {
                case Sys.DBSrcType.MSSQL:
                    conn = new System.Data.SqlClient.SqlConnection(dsn);
                    break;
                case Sys.DBSrcType.Oracle:
                    //conn = new System.Data.OracleClient.OracleConnection(dsn);
                    conn = new OracleConnection(dsn);
                    break;
                case Sys.DBSrcType.MySQL:
                    conn = new MySql.Data.MySqlClient.MySqlConnection(dsn);
                    break;
                    // from Zhou 删除IBM
                    //case Sys.DBSrcType.Informix:
                    //    conn = new System.Data.OleDb.OleDbConnection(dsn);
                    //    break;
            }
            return conn;
        }
        public string GetTablesJSON()
        {
            DataTable dt = this.GetTables(true);
            return BP.Tools.Json.ToJson(dt);
        }

        private DataTable RunSQLReturnTable(string sql, System.Data.Common.DbConnection conn, string dsn, CommandType cmdType)
        {
            if (conn is System.Data.SqlClient.SqlConnection)
                return DBAccess.RunSQLReturnTable(sql, (System.Data.SqlClient.SqlConnection)conn, dsn, cmdType, null);

            //if (conn is System.Data.OracleClient.OracleConnection)
            //    return DBAccess.RunSQLReturnTable(sql, (System.Data.OracleClient.OracleConnection)conn, cmdType, dsn);
            if (conn is OracleConnection)
                return DBAccess.RunSQLReturnTable(sql, (OracleConnection)conn, cmdType, dsn);

            if (conn is MySqlConnection)
            {
                var mySqlConn = (MySqlConnection)conn;
                if (mySqlConn.State != ConnectionState.Open)
                    mySqlConn.Open();

                var ada = new MySqlDataAdapter(sql, mySqlConn);
                ada.SelectCommand.CommandType = CommandType.Text;
                try
                {
                    DataTable oratb = new DataTable("otb");
                    ada.Fill(oratb);
                    ada.Dispose();

                    conn.Close();
                    conn.Dispose();
                    return oratb;
                }
                catch (Exception ex)
                {
                    ada.Dispose();
                    conn.Close();
                    throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                }
            }

            throw new Exception("没有涉及到的连接测试类型...");
            return null;
        }

        /// <summary>
        /// 修改表/视图/列名称（不完善）
        /// </summary>
        /// <param name="objType">修改对象的类型，TABLE(表)、VIEW(视图)、COLUMN(列)</param>
        /// <param name="oldName">旧名称</param>
        /// <param name="newName">新名称</param>
        /// <param name="tableName">修改列名称时，列所属的表名称</param>
        public void Rename(string objType, string oldName, string newName, string tableName = null)
        {
            var dbType = this.DBSrcType;
            if (dbType == BP.Sys.DBSrcType.local)
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dbType = BP.Sys.DBSrcType.MSSQL;
                        break;
                    case DBType.Oracle:
                        dbType = BP.Sys.DBSrcType.Oracle;
                        break;
                    case DBType.MySQL:
                        dbType = BP.Sys.DBSrcType.MySQL;
                        break;
                    case DBType.Informix:
                        dbType = BP.Sys.DBSrcType.Informix;
                        break;
                    case DBType.KingBaseR3:
                        dbType = BP.Sys.DBSrcType.KingBaseR3;
                        break;
                    case DBType.KingBaseR6:
                        dbType = BP.Sys.DBSrcType.KingBaseR6;
                        break;
                    default:
                        throw new Exception("@没有涉及到的连接测试类型。");
                }
            }

            switch (dbType)
            {
                case Sys.DBSrcType.MSSQL:
                    if (objType.ToLower() == "column")
                        RunSQL(string.Format("EXEC SP_RENAME '{0}', '{1}', 'COLUMN'", oldName, newName));
                    else
                        RunSQL(string.Format("EXEC SP_RENAME '{0}', '{1}'", oldName, newName));
                    break;
                case Sys.DBSrcType.Oracle:
                case Sys.DBSrcType.KingBaseR3:
                case Sys.DBSrcType.KingBaseR6:
                    if (objType.ToLower() == "column")
                        RunSQL(string.Format("ALTER TABLE {0} RENAME COLUMN {1} TO {2}", tableName, oldName, newName));
                    else if (objType.ToLower() == "table")
                        RunSQL(string.Format("ALTER TABLE {0} RENAME TO {1}", oldName, newName));
                    else if (objType.ToLower() == "view")
                        RunSQL(string.Format("RENAME {0} TO {1}", oldName, newName));
                    else
                        throw new Exception("@未涉及到的Oracle数据库改名逻辑。");
                    break;
                case Sys.DBSrcType.MySQL:
                    if (objType.ToLower() == "column")
                    {
                        string sql = string.Format("SELECT c.COLUMN_TYPE FROM information_schema.columns c WHERE c.TABLE_SCHEMA = '{0}' AND c.TABLE_NAME = '{1}' AND c.COLUMN_NAME = '{2}'", this.DBName, tableName, oldName);

                        DataTable dt = RunSQLReturnTable(sql);
                        if (dt.Rows.Count > 0)
                        {
                            RunSQL(string.Format("ALTER TABLE {0} CHANGE COLUMN {1} {2} {3}", tableName, oldName,
                                                 newName, dt.Rows[0][0]));
                        }
                    }
                    else if (objType.ToLower() == "table")
                    {
                        RunSQL(string.Format("ALTER TABLE `{0}`.`{1}` RENAME `{0}`.`{2}`", this.DBName, oldName, newName));
                    }
                    else if (objType.ToLower() == "view")
                    {
                        string sql = string.Format(
                            "SELECT t.VIEW_DEFINITION FROM information_schema.views t WHERE t.TABLE_SCHEMA = '{0}' AND t.TABLE_NAME = '{1}'",
                            this.DBName, oldName);

                        DataTable dt = RunSQLReturnTable(sql);
                        if (dt.Rows.Count == 0)
                        {
                            RunSQL("DROP VIEW " + oldName);
                        }
                        else
                        {
                            RunSQL(string.Format("CREATE VIEW {0} AS {1}", newName, dt.Rows[0][0]));
                            RunSQL("DROP VIEW " + oldName);
                        }
                    }
                    else
                        throw new Exception("@未涉及到的Oracle数据库改名逻辑。");
                    break;
                case Sys.DBSrcType.Informix:

                    break;
                default:
                    throw new Exception("@没有涉及到的数据库类型。");
            }
        }
        /// <summary>
        /// 获取判断指定表达式如果为空，则返回指定值的SQL表达式
        /// <para>注：目前只对MSSQL/ORACLE/MYSQL三种数据库做兼容</para>
        /// <para>added by liuxc,2017-03-07</para>
        /// </summary>
        /// <param name="expression">要判断的表达式，在SQL中的写法</param>
        /// <param name="isNullBack">判断的表达式为NULL，返回值的表达式，在SQL中的写法</param>
        /// <returns></returns>
        public string GetIsNullInSQL(string expression, string isNullBack)
        {
            var dbType = this.DBSrcType;
            if (dbType == BP.Sys.DBSrcType.local)
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dbType = BP.Sys.DBSrcType.MSSQL;
                        break;
                    case DBType.Oracle:
                        dbType = BP.Sys.DBSrcType.Oracle;
                        break;
                    case DBType.MySQL:
                        dbType = BP.Sys.DBSrcType.MySQL;
                        break;
                    case DBType.Informix:
                        dbType = BP.Sys.DBSrcType.Informix;
                        break;
                    case DBType.KingBaseR3:
                        dbType = BP.Sys.DBSrcType.KingBaseR3;
                        break;
                    case DBType.KingBaseR6:
                        dbType = BP.Sys.DBSrcType.KingBaseR6;
                        break;
                    default:
                        throw new Exception("没有涉及到的连接测试类型...");
                }
            }
            switch (dbType)
            {
                case Sys.DBSrcType.MSSQL:
                    return " ISNULL(" + expression + "," + isNullBack + ")";
                case Sys.DBSrcType.Oracle:
                    return " NVL(" + expression + "," + isNullBack + ")";
                case Sys.DBSrcType.MySQL:
                    return " IFNULL(" + expression + "," + isNullBack + ")";
                case Sys.DBSrcType.PostgreSQL:
                case Sys.DBSrcType.UX:
                    return " COALESCE(" + expression + "," + isNullBack + ")";
                default:
                    throw new Exception("GetIsNullInSQL未涉及的数据库类型");
            }
        }

        /// <summary>
        /// 获取表的字段信息
        /// </summary>
        /// <param name="tableName">表/视图名称</param>
        /// <returns>有四个列 No,Name,DBType,DBLength 分别标识  列的字段名，列描述，类型，长度。</returns>
        public DataTable GetColumns(string tableName)
        {
            //SqlServer数据库
            var sql = new StringBuilder();

            var dbType = this.DBSrcType;
            if (dbType == BP.Sys.DBSrcType.local)
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dbType = BP.Sys.DBSrcType.MSSQL;
                        break;
                    case DBType.Oracle:
                        dbType = BP.Sys.DBSrcType.Oracle;
                        break;
                    case DBType.MySQL:
                        dbType = BP.Sys.DBSrcType.MySQL;
                        break;
                    case DBType.Informix:
                        dbType = BP.Sys.DBSrcType.Informix;
                        break;
                    case DBType.KingBaseR3:
                        dbType = BP.Sys.DBSrcType.KingBaseR3;
                        break;
                    case DBType.KingBaseR6:
                        dbType = BP.Sys.DBSrcType.KingBaseR6;
                        break;
                    default:
                        throw new Exception("没有涉及到的连接测试类型...");
                }
            }

            this.DBSrcType = dbType;

            switch (dbType)
            {
                case Sys.DBSrcType.MSSQL:
                    sql.AppendLine("SELECT sc.name as No,");
                    sql.AppendLine("       st.name AS [DBType],");
                    sql.AppendLine("       (");
                    sql.AppendLine("           CASE ");
                    sql.AppendLine("                WHEN st.name = 'nchar' OR st.name = 'nvarchar' THEN sc.length / 2");
                    sql.AppendLine("                ELSE sc.length");
                    sql.AppendLine("           END");
                    sql.AppendLine("       ) AS DBLength,");
                    sql.AppendLine("       sc.colid,");
                    sql.AppendLine(string.Format("       {0} AS [Name]", GetIsNullInSQL("ep.[value]", "''")));
                    sql.AppendLine("FROM   dbo.syscolumns sc");
                    sql.AppendLine("       INNER JOIN dbo.systypes st");
                    sql.AppendLine("            ON  sc.xtype = st.xusertype");
                    sql.AppendLine("       LEFT OUTER JOIN sys.extended_properties ep");
                    sql.AppendLine("            ON  sc.id = ep.major_id");
                    sql.AppendLine("            AND sc.colid = ep.minor_id");
                    sql.AppendLine("            AND ep.name = 'MS_Description'");
                    sql.AppendLine(string.Format("WHERE  sc.id = OBJECT_ID('dbo.{0}')", tableName));
                    break;
                case Sys.DBSrcType.Oracle:
                    sql.AppendLine("SELECT utc.COLUMN_NAME AS No,");
                    sql.AppendLine("       utc.DATA_TYPE   AS DBType,");
                    sql.AppendLine("       utc.CHAR_LENGTH AS DBLength,");
                    sql.AppendLine("       utc.COLUMN_ID   AS colid,");
                    sql.AppendLine(string.Format("       {0}    AS Name", GetIsNullInSQL("ucc.comments", "''")));
                    sql.AppendLine("  FROM user_tab_cols utc");
                    sql.AppendLine("  LEFT JOIN user_col_comments ucc");
                    sql.AppendLine("    ON ucc.table_name = utc.TABLE_NAME");
                    sql.AppendLine("   AND ucc.column_name = utc.COLUMN_NAME");
                    sql.AppendLine(string.Format(" WHERE utc.TABLE_NAME = '{0}'", tableName.ToUpper()));
                    sql.AppendLine(" ORDER BY utc.COLUMN_ID ASC");

                    break;
                case Sys.DBSrcType.MySQL:
                    //分别代表字段名,类型，描述，类型加长度（char（11））
                    sql.AppendLine("SELECT ");
                    sql.AppendLine("    column_name AS 'No',");
                    sql.AppendLine("    data_type AS 'DBType',");
                    sql.AppendLine(string.Format("    {0} AS DBLength,", GetIsNullInSQL("character_maximum_length", "numeric_precision")));
                    sql.AppendLine("    ordinal_position AS colid,");
                    sql.AppendLine("    column_comment AS 'Name'");
                    sql.AppendLine("FROM");
                    sql.AppendLine("    information_schema.columns");
                    sql.AppendLine("WHERE");
                    sql.AppendLine(string.Format("    table_schema = '{0}'", DBAccess.GetAppCenterDBConn.Database));
                    sql.AppendLine(string.Format("        AND table_name = '{0}';", tableName));
                    break;
                case Sys.DBSrcType.Informix:
                    break;
                default:
                    throw new Exception("没有涉及到的连接测试类型...");
            }

            DataTable dt = null;
            if (this.No.Equals("local") == true)
            {
                dt = DBAccess.RunSQLReturnTable(sql.ToString());
                return dt;
            }


            var dsn = this.ConnString;
            var conn = GetConnection(dsn);

            try
            {
                //System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
                //conn.ConnectionString = dsn;
                conn.Open();

                return RunSQLReturnTable(sql.ToString(), conn, dsn, CommandType.Text);
            }
            catch (Exception ex)
            {
                throw new Exception("@失败:" + ex.Message + " dns:" + dsn);
            }

            return null;
        }

        protected override bool beforeDelete()
        {
            if (this.No == "local")
                throw new Exception("@默认连接(local)不允许删除、更新.");

            string str = "";
            MapDatas mds = new MapDatas();
            mds.Retrieve(MapDataAttr.DBSrc, this.No);
            if (mds.Count != 0)
            {
                str += "如下表单使用了该数据源，您不能删除它。";
                foreach (MapData md in mds)
                {
                    str += "@\t\n" + md.No + " - " + md.Name;
                }
            }

            SFTables tabs = new SFTables();
            tabs.Retrieve(SFTableAttr.FK_SFDBSrc, this.No);
            if (tabs.Count != 0)
            {
                str += "如下 table 使用了该数据源，您不能删除它。";
                foreach (SFTable tab in tabs)
                {
                    str += "@\t\n" + tab.No + " - " + tab.Name;
                }
            }

            if (str != "")
                throw new Exception("@删除数据源的时候检查，是否有引用，出现错误：" + str);

            return base.beforeDelete();
        }
        protected override bool beforeUpdate()
        {
            if (this.No == "local")
                throw new Exception("@默认连接(local)不允许删除、更新.");
            return base.beforeUpdate();
        }
        //added by liuxc,2015-11-10,新建修改时，判断只能加一个本地主库数据源
        protected override bool beforeUpdateInsertAction()
        {
            if (this.No != "local" && this.DBSrcType == BP.Sys.DBSrcType.local)
                throw new Exception("@在该系统中只能有一个本地连接，请选择其他数据源类型。");

            //测试数据库连接.
            DoConn();

            return base.beforeUpdateInsertAction();
        }
        #endregion 方法.

    }
    /// <summary>
    /// 数据源s
    /// </summary>
    public class SFDBSrcs : EntitiesNoName
    {
        #region 构造
        /// <summary>
        /// 数据源s
        /// </summary>
        public SFDBSrcs()
        {
        }
        /// <summary>
        /// 得到它的 Entity
        /// </summary>
        public override Entity GetNewEntity
        {
            get
            {
                return new SFDBSrc();
            }
        }
        #endregion

        public override int RetrieveAll()
        {
            int i = this.RetrieveAllFromDBSource();
            if (i == 0)
            {
                SFDBSrc src = new SFDBSrc();
                src.No = "local";
                src.Name = "应用系统主数据库(默认)";
                src.Insert();
                this.AddEntity(src);
                return 1;
            }
            return i;
        }
        /// <summary>
        /// 查询数据源
        /// </summary>
        /// <returns>返回查询的个数</returns>
        public int RetrieveDBSrc()
        {
            QueryObject qo = new QueryObject(this);
            qo.AddWhere(SFDBSrcAttr.DBSrcType, " < ", 100);
            int i = qo.DoQuery();
            if (i == 0)
                return this.RetrieveAll();
            return i;
        }
        /// <summary>
        /// 查询数据源
        /// </summary>
        /// <returns>返回查询的个数</returns>
        public int RetrieveWCSrc()
        {
            QueryObject qo = new QueryObject(this);
            qo.AddWhere(SFDBSrcAttr.DBSrcType, "= ", BP.Sys.DBSrcType.WebServices);
            int i = qo.DoQuery();
            if (i == 0)
                return this.RetrieveAll();
            return i;
        }
        #region 为了适应自动翻译成java的需要,把实体转换成List.
        /// <summary>
        /// 转化成 java list,C#不能调用.
        /// </summary>
        /// <returns>List</returns>
        public System.Collections.Generic.IList<SFDBSrc> ToJavaList()
        {
            return (System.Collections.Generic.IList<SFDBSrc>)this;
        }
        /// <summary>
        /// 转化成list
        /// </summary>
        /// <returns>List</returns>
        public System.Collections.Generic.List<SFDBSrc> Tolist()
        {
            System.Collections.Generic.List<SFDBSrc> list = new System.Collections.Generic.List<SFDBSrc>();
            for (int i = 0; i < this.Count; i++)
            {
                list.Add((SFDBSrc)this[i]);
            }
            return list;
        }
        #endregion 为了适应自动翻译成java的需要,把实体转换成List.
    }
}
