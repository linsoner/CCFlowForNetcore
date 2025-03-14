﻿
/*
简介：负责存取数据的类
创建时间：2002-10
最后修改时间：2004-2-1 ccb

 说明：
  在次文件种处理了4种方式的连接。
  1， sql server .
  2， oracle.
  3， ole.
  4,  odbc.
  
*/
using System;
using System.Data;
using System.Diagnostics;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;
using System.ComponentModel;
using System.Collections.Specialized;
using Oracle.ManagedDataAccess.Client;
using System.Web;
using System.Data.Odbc;
using System.IO;
using MySql.Data;
using MySql;
using MySql.Data.MySqlClient;
using BP.Sys;
using Npgsql;
using Nuxsql;
using Dm;
//增加人大金仓支持
using Kdbndp;
using BP.Difference;
using Newtonsoft.Json;
using KdbndpTypes;

namespace BP.DA
{
    /// <summary>
    /// 数据库访问。
    /// 这个类负责处理了 实体信息
    /// </summary>
    public class DBAccess
    {
        public static void UpdateTableColumnDefaultVal(string table, string colName, object defaultVal)
        {
            string sql = "";

            //是否存在该列?
            if (DBAccess.IsExitsTableCol(table, colName) == false)
                return;

            switch (BP.Difference.SystemConfig.AppCenterDBType)
            {
                case DBType.MySQL:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    if (defaultVal.GetType() == typeof(int) || defaultVal.GetType() == typeof(float) || defaultVal.GetType() == typeof(decimal))
                        sql = "ALTER TABLE " + table + " ALTER COLUMN " + colName + " SET DEFAULT " + defaultVal.ToString();
                    else
                        sql = "ALTER TABLE " + table + " ALTER COLUMN " + colName + " SET DEFAULT '" + defaultVal.ToString() + "'";
                    break;
                case DBType.MSSQL:
                    sql = "SELECT  b.name FROM sysobjects b join syscolumns a on b.id = a.cdefault WHERE a.id = object_id('" + table + "') AND a.name = '" + colName + "'";
                    string yueShu = DBAccess.RunSQLReturnStringIsNull(sql, null);
                    if (yueShu != null)
                    {
                        sql = "ALTER TABLE " + table + " DROP constraint " + yueShu;
                        DBAccess.RunSQL(sql); //删除约束.
                    }
                    if (defaultVal.GetType() == typeof(int) || defaultVal.GetType() == typeof(float) || defaultVal.GetType() == typeof(decimal))
                        sql = "ALTER TABLE " + table + " ADD DEFAULT " + defaultVal.ToString() + " FOR  " + colName;
                    else
                        sql = "ALTER TABLE " + table + " ADD DEFAULT '" + defaultVal.ToString() + "' FOR  " + colName;
                    break;
                default:
                    break;
            }

            if (DataType.IsNullOrEmpty(sql) == true)
                throw new Exception("err@没有判断的数据库类型.");

            //设置默认值.
            BP.DA.DBAccess.RunSQL(sql);
        }
        /// <summary>
        /// 获得数据表字段描述的SQL
        /// </summary>
        public static string SQLOfTableFieldDesc(string table)
        {
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MSSQL)
                return "SELECT column_name as FName,data_type as FType,CHARACTER_MAXIMUM_LENGTH as FLen from information_schema.columns where table_name='" + table + "'";

            throw new Exception("@没有涉及到的数据库类型");
        }
        /// <summary>
        /// 删除指定字段的约束
        /// </summary>
        /// <param name="table">表名</param>
        /// <param name="colName">列名</param>
        /// <returns>返回删除约束的个数</returns>
        public static int DropConstraintOfSQL(string table, string colName)
        {

            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MSSQL)
            {
                //获得约束.
                string sql = "select b.name from sysobjects b join syscolumns a on b.id = a.cdefault ";
                sql += " where a.id = object_id('" + table + "') ";
                sql += " and a.name ='" + colName + "' ";
                //遍历并删除它们.
                DataTable dt = DBAccess.RunSQLReturnTable(sql);
                foreach (DataRow dr in dt.Rows)
                {
                    string name = dr[0].ToString();
                    DBAccess.RunSQL("exec('alter table " + table + " drop constraint " + name + " ' )");
                }
                //返回执行的个数.
                return dt.Rows.Count;
            }

            return 0;
        }
        /// <summary>
        /// 获得约束
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public static string SQLOfTableFieldYueShu(string table)
        {
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MSSQL)
                return "SELECT b.name, a.name FName from sysobjects b join syscolumns a on b.id = a.cdefault where a.id = object_id('" + table + "') ";


            throw new Exception("@没有涉及到的数据库类型");

        }


        /// <summary>
        /// 是否大小写敏感
        /// </summary>
        public static bool IsCaseSensitive
        {
            get
            {
                if (DBAccess.IsExitsObject("TEST") == true)
                {
                    DBAccess.RunSQL("DROP TABLE TEST ");
                }
                if (DBAccess.IsExitsObject("test") == true)
                {
                    DBAccess.RunSQL("DROP table test ");
                }

                string mysql = "CREATE TABLE TEST(OID int NOT NULL )";
                DBAccess.RunSQL(mysql);
                if (DBAccess.IsExitsObject("test") == false)
                {
                    DBAccess.RunSQL("DROP TABLE TEST ");
                    return true;
                }
                if (DBAccess.IsExitsTableCol("test", "oid") == false)
                {
                    DBAccess.RunSQL("DROP TABLE TEST ");
                    return true;
                }
                return false;
            }
        }

        #region 文件存储数据库处理.
        /// <summary>
        /// 保存文件到数据库 
        /// </summary>
        /// <param name="bytes">数据流</param>
        /// <param name="tableName">表名称</param>
        /// <param name="tablePK">表主键</param>
        /// <param name="pkVal">主键值</param>
        /// <param name="saveFileField">保存到字段</param>
        public static void SaveBytesToDB(byte[] bytes, string tableName, string tablePK, object pkVal, string saveToFileField)
        {
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MSSQL)
            {
                SqlConnection cn = DBAccess.GetAppCenterDBConn as SqlConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                SqlCommand cm = new SqlCommand();
                cm.Connection = cn;
                cm.CommandType = CommandType.Text;
                if (cn.State == 0) cn.Open();
                cm.CommandText = "UPDATE " + tableName + " SET " + saveToFileField + "=@FlowJsonFile WHERE " + tablePK + " =@PKVal";

                SqlParameter spFile = new SqlParameter("@FlowJsonFile", SqlDbType.Image);
                spFile.Value = bytes;
                cm.Parameters.Add(spFile);

                SqlParameter spPK = new SqlParameter("@PKVal", SqlDbType.VarChar);
                spPK.Value = pkVal;
                cm.Parameters.Add(spPK);

                // 执行它.
                try
                {
                    cm.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, saveToFileField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD  " + saveToFileField + " Image ";

                        if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MSSQL)
                            sql = "ALTER TABLE " + tableName + " ADD  " + saveToFileField + " Image ";

                        DBAccess.RunSQL(sql);

                        SaveBytesToDB(bytes, tableName, tablePK, pkVal, saveToFileField);
                        return;
                    }
                    throw new Exception("@缺少此字段[" + tableName + "," + saveToFileField + "],有可能系统自动修复." + ex.Message);
                }
                finally
                {
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            //修复for：jlow  oracle 异常： ORA-01745: 无效的主机/绑定变量名 edited by qin 16.7.1
            //错误的引用oracle的关键字file
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.Oracle)
            {
                OracleConnection cn = DBAccess.GetAppCenterDBConn as OracleConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                OracleCommand cm = new OracleCommand();
                cm.Connection = cn;
                cm.CommandType = CommandType.Text;
                if (cn.State == 0) cn.Open();
                cm.CommandText = "UPDATE " + tableName + " SET " + saveToFileField + "=:FlowJsonFile WHERE " + tablePK + " =:PKVal";

                OracleParameter spFile = new OracleParameter("FlowJsonFile", OracleDbType.Blob);
                spFile.Value = bytes;
                cm.Parameters.Add(spFile);

                OracleParameter spPK = new OracleParameter("PKVal", OracleDbType.NVarchar2);
                spPK.Value = pkVal;
                cm.Parameters.Add(spPK);

                // 执行它.
                try
                {
                    cm.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, saveToFileField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        //修改数据类型   oracle 不存在image类型   edited by qin 16.7.1
                        string sql = "ALTER TABLE " + tableName + " ADD  " + saveToFileField + " blob ";
                        DBAccess.RunSQL(sql);
                        SaveBytesToDB(bytes, tableName, tablePK, pkVal, saveToFileField);
                        return;
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + saveToFileField + "]是否是  blob 类型.");

                }
                finally
                {
                    cm.Dispose();
                    cn.Dispose();
                }
            }
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR3 || BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR6)
            {
                KdbndpConnection conn = new KdbndpConnection();
                if (conn.State != ConnectionState.Open)
                {
                    conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                    conn.Open();
                }

                KdbndpCommand cm = new KdbndpCommand();
               
                cm.Connection = conn;
                cm.CommandType = CommandType.Text;
                if (conn.State == 0) conn.Open();
                cm.CommandText = "UPDATE " + tableName + " SET " + saveToFileField + "=:FlowJsonFile WHERE " + tablePK + " =:PKVal";

                KdbndpParameter spFile = new KdbndpParameter("FlowJsonFile", KdbndpDbType.Bytea);
                spFile.Value = bytes;
                cm.Parameters.Add(spFile);

                KdbndpParameter spPK = new KdbndpParameter("PKVal", KdbndpDbType.Varchar);
                spPK.Value = pkVal;
                cm.Parameters.Add(spPK);

                // 执行它.
                try
                {
                    cm.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, saveToFileField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        //修改数据类型   oracle 不存在image类型   edited by qin 16.7.1
                        string sql = "ALTER TABLE " + tableName + " ADD  " + saveToFileField + " blob ";
                        DBAccess.RunSQL(sql);
                        SaveBytesToDB(bytes, tableName, tablePK, pkVal, saveToFileField);
                        return;
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + saveToFileField + "]是否是  blob 类型.");

                }
                finally
                {
                    cm.Dispose();
                    conn.Dispose();
                }
            }

            //add by zhoupeng
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.UX || BP.Difference.SystemConfig.AppCenterDBType == DBType.UX)
            {
                Npgsql.NpgsqlConnection cn = DBAccess.GetAppCenterDBConn as Npgsql.NpgsqlConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                Npgsql.NpgsqlCommand cm = new Npgsql.NpgsqlCommand();
                cm.Connection = cn;
                cm.CommandType = CommandType.Text;
                cm.CommandText = "UPDATE " + tableName + " SET " + saveToFileField + "=@FlowJsonFile WHERE " + tablePK + " =@PKVal";

                Npgsql.NpgsqlParameter spFile = new Npgsql.NpgsqlParameter("FlowJsonFile", NpgsqlTypes.NpgsqlDbType.Bytea);
                spFile.Value = bytes;
                cm.Parameters.Add(spFile);

                NpgsqlParameter spPK = null;
                if (tableName.Contains("ND") == true || pkVal.GetType() == typeof(int) || pkVal.GetType() == typeof(Int64))
                {
                    spPK = new NpgsqlParameter("PKVal", NpgsqlTypes.NpgsqlDbType.Integer);
                    spPK.Value = int.Parse(pkVal.ToString());

                }
                else
                {
                    spPK = new NpgsqlParameter("PKVal", NpgsqlTypes.NpgsqlDbType.Varchar);
                    spPK.Value = pkVal;
                }

                //spPK.DbType= NpgsqlTypes.NpgsqlDbType.Integer.
                cm.Parameters.Add(spPK);

                try
                {
                    cm.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, saveToFileField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD  " + saveToFileField + " bytea NULL ";
                        DBAccess.RunSQL(sql);
                        SaveBytesToDB(bytes, tableName, tablePK, pkVal, saveToFileField);
                        return;
                    }
                    throw new Exception("@NpgsqlDbType缺少此字段[" + tableName + "," + saveToFileField + "],有可能系统自动修复." + ex.Message);
                }
                finally
                {
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            //added by liuxc,2016-12-7，增加对mysql大数据longblob字段存储逻辑
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MySQL)
            {
                MySqlConnection cn = DBAccess.GetAppCenterDBConn as MySqlConnection;

                if (cn.State != ConnectionState.Open)
                    cn.Open();

                MySqlCommand cm = new MySqlCommand();
                cm.Connection = cn;
                cm.CommandType = CommandType.Text;
                cm.CommandText = "UPDATE " + tableName + " SET " + saveToFileField + "=@FlowJsonFile WHERE " + tablePK + " =@PKVal";

                MySqlParameter spFile = new MySqlParameter("FlowJsonFile", MySqlDbType.Blob);
                spFile.Value = bytes;
                cm.Parameters.Add(spFile);

                MySqlParameter spPK = new MySqlParameter("PKVal", MySqlDbType.VarChar);
                spPK.Value = pkVal;
                cm.Parameters.Add(spPK);

                try
                {
                    cm.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, saveToFileField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD  " + saveToFileField + " MediumBlob  NULL ";
                        DBAccess.RunSQL(sql);
                        SaveBytesToDB(bytes, tableName, tablePK, pkVal, saveToFileField);
                        return;
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + saveToFileField + "]是否是  MediumBlob 类型.");

                }
                finally
                {
                    cm.Dispose();
                    cn.Dispose();
                }
            }
        }
        /// <summary>
        /// 保存文件到数据库
        /// </summary>
        /// <param name="docs">文内容</param>
        /// <param name="tableName">表名</param>
        /// <param name="tablePK">主键</param>
        /// <param name="pkVal">值</param>
        /// <param name="saveToFileField">保存到字段</param>
        /// <param name="isSaveByte">是否是保存byete</param>
        public static void SaveBigTextToDB(string docs, string tableName, string tablePK,
            object pkVal, string saveToFileField)
        {
            //对于特殊的数据库进行判断.
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.Oracle
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.PostgreSQL
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.DM
                || BP.Difference.SystemConfig.AppCenterDBType==DBType.KingBaseR3
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR6)
            {
                // System.Text.UnicodeEncoding converter = new System.Text.UnicodeEncoding();
                byte[] inputBytes = System.Text.Encoding.UTF8.GetBytes(docs);
                //执行保存.
                SaveBytesToDB(inputBytes, tableName, tablePK, pkVal, saveToFileField);
                return;
            }

            //其他数据库.
            Paras ps = new Paras();
            ps.SQL = "UPDATE " + tableName + " SET " + saveToFileField + "=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "MyDocs WHERE " + tablePK + "=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "PKVal";
            ps.Add("MyDocs", docs);
            ps.Add("PKVal", pkVal);

            try
            {
                var i = DBAccess.RunSQL(ps);
                if (i == 0)
                {
                    //如果没有该笔数据，执行insert一条.
                    ps.SQL = "INSERT INTO " + tableName + " (" + tablePK + "," + saveToFileField + ") VALUES (" + BP.Difference.SystemConfig.AppCenterDBVarStr + "PKVal," + BP.Difference.SystemConfig.AppCenterDBVarStr + "MyDocs)";
                    DBAccess.RunSQL(ps);
                }
            }
            catch (Exception ex)
            {
                /*如果没有此列，就自动创建此列.*/
                if (DBAccess.IsExitsTableCol(tableName, saveToFileField) == false)
                {
                    string sql = "ALTER TABLE " + tableName + " ADD " + saveToFileField + " text ";
                    DBAccess.RunSQL(sql);

                    //在执行一遍，存储数据.
                    DBAccess.RunSQL(ps);
                    return;
                }
                throw ex;
            }
        }
        /// <summary>
        /// 保存文件到数据库
        /// </summary>
        /// <param name="fullFileName">完成的文件路径</param>
        /// <param name="tableName">表名称</param>
        /// <param name="tablePK">表主键</param>
        /// <param name="pkVal">主键值</param>
        /// <param name="saveFileField">保存到字段</param>
        public static void SaveFileToDB(string fullFileName, string tableName, string tablePK, string pkVal, string saveToFileField)
        {
            FileInfo fi = new FileInfo(fullFileName);
            FileStream fs = fi.OpenRead();
            byte[] bytes = new byte[fs.Length];
            fs.Read(bytes, 0, Convert.ToInt32(fs.Length));

            // bug 的提示者 http://bbs.citydo.com.cn/showtopic-3958.aspx
            fs.Close();
            fs.Dispose();

            //执行保存.
            SaveBytesToDB(bytes, tableName, tablePK, pkVal, saveToFileField);
        }
        /// <summary>
        /// 获得从数据库的字段获取数据，存储到一个文件里.
        /// </summary>
        /// <param name="fileFullName">指定的存储文件全路径</param>
        /// <param name="tableName"></param>
        /// <param name="tablePK"></param>
        /// <param name="pkVal">主键值</param>
        /// <param name="fileSaveField">文件保存路径</param>
        public static byte[] GetFileFromDB(string fileFullName, string tableName, string tablePK, string pkVal, string fileSaveField)
        {
            byte[] byteFile = GetByteFromDB(tableName, tablePK, pkVal, fileSaveField);

            FileStream fs;
            //如果文件不为空,就把流数据保存一个文件.
            if (fileFullName != null)
            {
                FileInfo fi = new System.IO.FileInfo(fileFullName);
                fs = fi.OpenWrite();

                if (byteFile != null)
                    fs.Write(byteFile, 0, byteFile.Length);

                fs.Close();
                fs.Dispose();
            }
            if (byteFile == null)
                return null;

            return byteFile;
        }
        /// <summary>
        /// 从数据库里获得文本
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="tablePK">主键</param>
        /// <param name="pkVal">主键值</param>
        /// <param name="fileSaveField">保存字段</param>
        /// <param name="isByte">保存字段类型是否为Blob</param>
        /// <returns></returns>
        public static string GetBigTextFromDB(string tableName, string tablePK, string pkVal,
            string fileSaveField)
        {
            if (DataType.IsNullOrEmpty(pkVal) == true)
                return "";
            //对于特殊的数据库进行判断.
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.Oracle
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.PostgreSQL
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.DM
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR3
                || BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR6)
            {
                byte[] byteFile = GetByteFromDB(tableName, tablePK, pkVal, fileSaveField);
                if (byteFile == null)
                    return "";

                string strs = System.Text.Encoding.UTF8.GetString(byteFile);
                int idx = strs.IndexOf('$');
                if (idx != 0)
                    strs = strs.Substring(idx + 1);
                return strs;
            }

            //其他的数据库类型直接从 text字段去.
            try
            {
                string getSql = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + " = '" + pkVal + "'";
                return DBAccess.RunSQLReturnStringIsNull(getSql, "");
            }
            catch (Exception ex)
            {
                if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                {
                    string sql = "ALTER TABLE " + tableName + " ADD  " + fileSaveField + " text ";
                    DBAccess.RunSQL(sql);
                }
                string getSql = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + " = '" + pkVal + "'";
                return DBAccess.RunSQLReturnString(getSql);
            }
        }
        /// <summary>
        /// 从数据库里提取文件
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="tablePK">表主键</param>
        /// <param name="pkVal">主键值</param>
        /// <param name="fileSaveField">字段</param>
        public static byte[] GetByteFromDB(string tableName, string tablePK, string pkVal, string fileSaveField)
        {

            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MSSQL)
            {
                SqlConnection cn = DBAccess.GetAppCenterDBConn as SqlConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                string strSQL = "SELECT [" + fileSaveField + "] FROM " + tableName + " WHERE " + tablePK + "='" + pkVal + "'";

                SqlDataReader dr = null;
                SqlCommand cm = new SqlCommand();
                cm.Connection = cn;
                cm.CommandText = strSQL;
                cm.CommandType = CommandType.Text;

                // 执行它.
                try
                {
                    dr = cm.ExecuteReader();

                    byte[] byteFile = null;
                    if (dr.Read())
                    {
                        if (dr[0] == null || DataType.IsNullOrEmpty(dr[0].ToString()))
                            return null;

                        byteFile = (byte[])dr[0];
                    }
                    return byteFile;
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                    {
                        /*如果没有此列，就自动创建此列. */
                        string sql = "ALTER TABLE " + tableName + " ADD  " + fileSaveField + " Image ";
                        DBAccess.RunSQL(sql);
                        return null;
                        // return GetByteFromDB(tableName, tablePK, pkVal, fileSaveField);
                    }

                    throw ex;
                    //throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message);
                }
                finally
                {
                    if (dr != null)
                        dr.Close();
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            //增加对oracle数据库的逻辑 qin
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.Oracle)
            {
                OracleConnection cn = DBAccess.GetAppCenterDBConn as OracleConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                string strSQL = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + "='" + pkVal + "'";

                OracleDataReader dr = null;
                OracleCommand cm = new OracleCommand();
                cm.Connection = cn;
                cm.CommandText = strSQL;
                cm.CommandType = CommandType.Text;


                // 执行它.
                try
                {
                    dr = cm.ExecuteReader();
                    byte[] byteFile = null;
                    if (dr.Read())
                    {
                        if (dr[0] == null || DataType.IsNullOrEmpty(dr[0].ToString()))
                            return null;

                        byteFile = (byte[])dr[0];
                    }

                    return byteFile;
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD  " + fileSaveField + " blob ";
                        DBAccess.RunSQL(sql);
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + fileSaveField + "]是否是  blob 类型.");

                }
                finally
                {
                    dr.Close();
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR3 || BP.Difference.SystemConfig.AppCenterDBType == DBType.KingBaseR6)
            {
                KdbndpConnection conn = new KdbndpConnection();
                if (conn.State != ConnectionState.Open)
                {
                    conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                    conn.Open();
                }

                string strSQL = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + "='" + pkVal + "'";

                KdbndpDataReader dr = null;
                KdbndpCommand cm = new KdbndpCommand();
                cm.Connection = conn;
                cm.CommandText = strSQL;
                cm.CommandType = CommandType.Text;


                // 执行它.
                try
                {
                    dr = cm.ExecuteReader();
                    byte[] byteFile = null;
                    if (dr.Read())
                    {
                        if (dr[0] == null || DataType.IsNullOrEmpty(dr[0].ToString()))
                            return null;

                        byteFile = (byte[])dr[0];
                    }

                    return byteFile;
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD  " + fileSaveField + " blob ";
                        DBAccess.RunSQL(sql);
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + fileSaveField + "]是否是  blob 类型.");

                }
                finally
                {
                    dr.Close();
                    cm.Dispose();
                    conn.Dispose();
                }
            }


            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.UX)
            {
                NuxsqlConnection cn = DBAccess.GetAppCenterDBConn as NuxsqlConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                string strSQL = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + "='" + pkVal + "'";

                NuxsqlDataReader dr = null;
                NuxsqlCommand cm = new NuxsqlCommand();
                cm.Connection = cn;
                cm.CommandText = strSQL;
                cm.CommandType = CommandType.Text;

                // 执行它.
                try
                {
                    dr = cm.ExecuteReader();

                    byte[] byteFile = null;
                    if (dr.Read())
                    {
                        if (dr[0] == null || DataType.IsNullOrEmpty(dr[0].ToString()))
                            return null;

                        byteFile = dr[0] as byte[];
                        //System.Text.Encoding.Default.GetBytes(dr[0].ToString());
                    }

                    return byteFile;
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD " + fileSaveField + " LONGBLOB NULL ";
                        DBAccess.RunSQL(sql);
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + fileSaveField + "]是否是  LONGBLOB 类型.");

                }
                finally
                {
                    dr.Close();
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            //added by liuxc,2016-12-7,增加对mysql数据库的逻辑
            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.MySQL)
            {
                MySqlConnection cn = DBAccess.GetAppCenterDBConn as MySqlConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                string strSQL = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + "='" + pkVal + "'";

                MySqlDataReader dr = null;
                MySqlCommand cm = new MySqlCommand();
                cm.Connection = cn;
                cm.CommandText = strSQL;
                cm.CommandType = CommandType.Text;

                // 执行它.
                try
                {
                    dr = cm.ExecuteReader();

                    byte[] byteFile = null;
                    if (dr.Read())
                    {
                        if (dr[0] == null || DataType.IsNullOrEmpty(dr[0].ToString()))
                            return null;

                        byteFile = dr[0] as byte[];
                        //System.Text.Encoding.Default.GetBytes(dr[0].ToString());
                    }

                    return byteFile;
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD " + fileSaveField + " LONGBLOB NULL ";
                        DBAccess.RunSQL(sql);
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + fileSaveField + "]是否是  LONGBLOB 类型.");

                }
                finally
                {
                    dr.Close();
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            if (BP.Difference.SystemConfig.AppCenterDBType == DBType.PostgreSQL)
            {
                NpgsqlConnection cn = DBAccess.GetAppCenterDBConn as NpgsqlConnection;
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                string strSQL = "SELECT " + fileSaveField + " FROM " + tableName + " WHERE " + tablePK + "='" + pkVal + "'";

                NpgsqlDataReader dr = null;
                NpgsqlCommand cm = new NpgsqlCommand();
                cm.Connection = cn;
                cm.CommandText = strSQL;
                cm.CommandType = CommandType.Text;

                // 执行它.
                try
                {
                    dr = cm.ExecuteReader();

                    byte[] byteFile = null;
                    if (dr.Read())
                    {
                        if (dr[0] == null || DataType.IsNullOrEmpty(dr[0].ToString()))
                            return null;

                        byteFile = dr[0] as byte[];
                        //System.Text.Encoding.Default.GetBytes(dr[0].ToString());
                    }

                    return byteFile;
                }
                catch (Exception ex)
                {
                    if (DBAccess.IsExitsTableCol(tableName, fileSaveField) == false)
                    {
                        /*如果没有此列，就自动创建此列.*/
                        string sql = "ALTER TABLE " + tableName + " ADD " + fileSaveField + " LONGBLOB NULL ";
                        DBAccess.RunSQL(sql);
                    }
                    throw new Exception("@缺少此字段,有可能系统自动修复." + ex.Message + "， 请检查该表[" + tableName + "]字段[" + fileSaveField + "]是否是  LONGBLOB 类型.");
                }
                finally
                {
                    dr.Close();
                    cm.Dispose();
                    cn.Dispose();
                }
            }

            //最后仍然没有找到.
            throw new Exception("@获取文件，从数据库里面，没有判断的数据库类型.");
        }

        #endregion 文件存储数据库处理.

        #region 事务处理
        /// <summary>
        /// 执行增加一个事务
        /// </summary>
        public static void DoTransactionBegin()
        {
            return;

            //if (BP.Difference.SystemConfig.AppCenterDBType != DBType.MSSQL)
            //    return;
            //if (BP.Web.WebUser.No == null)
            //    return;
            //SqlConnection conn = new SqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            //Cash.SetConn(BP.Web.WebUser.No, conn);
            //DBAccess.RunSQL("BEGIN TRANSACTION");
        }
        /// <summary>
        /// 回滚事务
        /// </summary>
        public static void DoTransactionRollback()
        {
            return;

            //if (BP.Difference.SystemConfig.AppCenterDBType != DBType.MSSQL)
            //    return;

            //if (BP.Web.WebUser.No == null)
            //    return;

            //DBAccess.RunSQL("Rollback TRANSACTION");
            //SqlConnection conn = Cash.GetConn(BP.Web.WebUser.No) as SqlConnection;
            //conn.Close();
            //conn.Dispose();
        }
        /// <summary>
        /// 提交事务
        /// </summary>
        public static void DoTransactionCommit()
        {
            /*
            return;

            if (BP.Difference.SystemConfig.AppCenterDBType != DBType.MSSQL)
                return;

            if (BP.Web.WebUser.No == null)
                return;

            DBAccess.RunSQL("Commit TRANSACTION");
            */
        }
        #endregion 事务处理

        public static Paras DealParasBySQL(string sql, Paras ps)
        {
            Paras myps = new Paras();
            foreach (Para p in ps)
            {
                if (sql.Contains(":" + p.ParaName) == false)
                    continue;
                myps.Add(p);
            }
            return myps;
        }
        /// <summary>
        /// 运行一个sql返回该table的第1列，组成一个查询的where in 字符串.
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>i
        public static string GenerWhereInPKsString(string sql)
        {
            DataTable dt = DBAccess.RunSQLReturnTable(sql);
            return GenerWhereInPKsString(dt);
        }
        /// <summary>
        /// 通过table的第1列，组成一个查询的where in 字符串.
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static string GenerWhereInPKsString(DataTable dt)
        {
            string pks = "";
            foreach (DataRow dr in dt.Rows)
            {
                pks += "'" + dr[0] + "',";
            }
            if (pks == "")
                return "";
            return pks.Substring(0, pks.Length - 1);
        }
        /// <summary>
        /// 检查是否连接成功.
        /// </summary>
        /// <returns></returns>
        public static bool TestIsConnection()
        {
            try
            {
                switch (BP.Difference.SystemConfig.AppCenterDBType)
                {
                    case DBType.MSSQL:
                    case DBType.PostgreSQL:
                    case DBType.UX:
                        DBAccess.RunSQLReturnString("SELECT 1+2 ");
                        break;
                    case DBType.Oracle:
                    case DBType.KingBaseR3:
                    case DBType.KingBaseR6:
                    case DBType.MySQL:
                        DBAccess.RunSQLReturnString("SELECT 1+2 FROM DUAL ");
                        break;
                    //case DBType.Informix:
                    //    DBAccess.RunSQLReturnString("SELECT 1+2 FROM DUAL ");
                    //    break;
                    default:
                        break;
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }

            //return true;
        }

        //构造函数
        static DBAccess()
        {
            CurrentSys_Serial = new Hashtable();
            KeyLockState = new Hashtable();
        }

        #region 运行中定义的变量
        public static readonly Hashtable CurrentSys_Serial;
        private static int readCount = -1;
        private static readonly Hashtable KeyLockState;
        #endregion


        #region 产生序列号码方法

        /// <summary>
        /// 生成 GenerOIDByGUID.
        /// </summary>
        /// <returns></returns>
        public static int GenerOIDByGUID()
        {
            int i = BP.Tools.CRC32Helper.GetCRC32(Guid.NewGuid().ToString());
            if (i <= 0)
                i = -i;
            return i;
        }

        /// <summary>
        /// 生成 GenerGUID
        /// </summary>
        /// <returns></returns>
        public static string GenerGUID(int length = 0, string ptable = null, string colName = null)
        {
            if (length == 0)
                return Guid.NewGuid().ToString();

            if (ptable == null)
                return Guid.NewGuid().ToString().Substring(0, length);

            while (true)
            {
                string str = Guid.NewGuid().ToString().Substring(0, length);
                string sql = "SELECT COUNT(" + colName + ") as Num FROM " + ptable + " WHERE " + colName + " ='" + str + "'";
                if (DBAccess.RunSQLReturnValInt(sql) == 0)
                    return str;
            }
            return null;
        }
        /// <summary>
        /// 锁定OID
        /// </summary>
        private static bool lock_OID = false;
        /// <summary>
        /// 产生一个OID
        /// </summary>
        /// <returns></returns>
        public static int GenerOID()
        {
            while (lock_OID == true)
            {
            }

            lock_OID = true;
            if (DBAccess.RunSQL("UPDATE Sys_Serial SET IntVal=IntVal+1 WHERE CfgKey='OID'") == 0)
                DBAccess.RunSQL("INSERT INTO Sys_Serial (CfgKey,IntVal) VALUES ('OID',100)");
            int oid = DBAccess.RunSQLReturnValInt("SELECT  IntVal FROM Sys_Serial WHERE CfgKey='OID'");
            lock_OID = false;
            return oid;
        }
        /// <summary>
        /// 锁
        /// </summary>
        private static bool lock_OID_CfgKey = false;

        #region 第二版本的生成 OID。
        /// <summary>
        /// 锁
        /// </summary>
        private static bool lock_HT_CfgKey = false;
        private static Hashtable lock_HT = new Hashtable();
        /// <summary>
        /// 生成唯一的序列号
        /// </summary>
        /// <param name="cfgKey">配置信息</param>
        /// <returns>唯一的序列号</returns>
        public static Int64 GenerOID(string cfgKey)
        {
            //while (lock_HT_CfgKey == true)
            //{
            //}
            lock_HT_CfgKey = true;

            if (lock_HT.ContainsKey(cfgKey) == false)
            {
            }
            else
            {
            }

            Paras ps = new Paras();
            ps.Add("CfgKey", cfgKey);
            //string sql = "UPDATE Sys_Serial SET IntVal=IntVal+1 WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            //int num = DBAccess.RunSQL(sql, ps);
            string sql = "SELECT IntVal FROM Sys_Serial WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            int num = DBAccess.RunSQLReturnValInt(sql, ps);
            if (num == 0)
            {
                sql = "INSERT INTO Sys_Serial (CFGKEY,INTVAL) VALUES ('" + cfgKey + "',100)";
                DBAccess.RunSQL(sql);
                lock_HT_CfgKey = false;

                if (lock_HT.ContainsKey(cfgKey) == false)
                    lock_HT.Add(cfgKey, 200);

                return 100;
            }
            else
            {
                sql = "UPDATE Sys_Serial SET IntVal=IntVal+1 WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
                DBAccess.RunSQL(sql, ps);
            }
            sql = "SELECT IntVal FROM Sys_Serial WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            num = DBAccess.RunSQLReturnValInt(sql, ps);
            lock_HT_CfgKey = false;
            return num;
        }
        #endregion 第二版本的生成 OID。

        /// <summary>
        /// 获取一个从OID, 更新到OID.
        /// 用例: 我已经明确知道要用到260个OID, 
        /// 但是为了避免多次取出造成效率浪费，就可以一次性取出 260个OID.
        /// </summary>
        /// <param name="cfgKey"></param>
        /// <param name="getOIDNum">要获取的OID数量.</param>
        /// <returns>从OID</returns>
        public static Int64 GenerOID(string cfgKey, int getOIDNum)
        {
            Paras ps = new Paras();
            ps.Add("CfgKey", cfgKey);
            string sql = "UPDATE Sys_Serial SET IntVal=IntVal+" + getOIDNum + " WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            int num = DBAccess.RunSQL(sql, ps);
            if (num == 0)
            {
                getOIDNum = getOIDNum + 100;
                sql = "INSERT INTO Sys_Serial (CFGKEY,INTVAL) VALUES (" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey," + getOIDNum + ")";
                DBAccess.RunSQL(sql, ps);
                return 100;
            }
            sql = "SELECT  IntVal FROM Sys_Serial WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            return DBAccess.RunSQLReturnValInt(sql, ps) - getOIDNum;
        }

        public static Int32 GenerOIDByKey32(string intKey)
        {
            Paras ps = new Paras();
            ps.Add("CfgKey", intKey);

            string sql = "";
            sql = "UPDATE Sys_Serial SET IntVal=IntVal+1 WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            int num = DBAccess.RunSQL(sql, ps);
            if (num == 0)
            {
                sql = "INSERT INTO Sys_Serial (CFGKEY,INTVAL) VALUES (" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey,'100')";
                DBAccess.RunSQL(sql, ps);
                return int.Parse(intKey + "100");
            }
            sql = "SELECT IntVal FROM Sys_Serial WHERE CfgKey=" + BP.Difference.SystemConfig.AppCenterDBVarStr + "CfgKey";
            int val = DBAccess.RunSQLReturnValInt(sql, ps);
            return int.Parse(intKey + val.ToString());
        }

        #endregion

        #region 取得连接对象 ，CS、BS共用属性【关键属性】

        /// <summary>
        /// AppCenterDBType
        /// </summary>
        public static DBType AppCenterDBType
        {
            get
            {
                return BP.Difference.SystemConfig.AppCenterDBType;
            }
        }
        public static string _connectionUserID = null;
        /// <summary>
        /// 连接用户的ID
        /// </summary>
        public static string ConnectionUserID
        {
            get
            {
                if (_connectionUserID == null)
                {
                    string[] strs = BP.Difference.SystemConfig.AppCenterDSN.Split(';');
                    foreach (string str in strs)
                    {
                        if (str.ToLower().Contains("user ") == true)
                        {
                            _connectionUserID = str.Split('=')[1];
                            break;
                        }
                    }
                }
                return _connectionUserID;
            }
        }
        public static IDbConnection GetAppCenterDBConn
        {
            get
            {
                string connstr = BP.Difference.SystemConfig.AppCenterDSN;
                switch (AppCenterDBType)
                {
                    case DBType.MSSQL:
                        return new SqlConnection(connstr);
                    case DBType.KingBaseR3:
                    case DBType.KingBaseR6:
                        return new KdbndpConnection(connstr);
                    case DBType.Oracle:
                    case DBType.DM:
                        return new OracleConnection(connstr);
                    case DBType.MySQL:
                        return new MySqlConnection(connstr);
                    case DBType.PostgreSQL:
                        return new Npgsql.NpgsqlConnection(connstr);
                    case DBType.UX:
                        return new Nuxsql.NuxsqlConnection(connstr);

                    case DBType.Access:
                    default:
                        throw new Exception("err@GetAppCenterDBConn发现未知的数据库连接类型！");
                }
            }
        }

        #endregion 取得连接对象 ，CS、BS共用属性

        /// <summary>
        /// 同一个Connetion执行多条sql返回DataSet
        /// edited by qin 16.6.30 oracle数据库执行多条sql语句异常的修复
        /// </summary>
        /// <param name="sqls"></param>
        /// <returns></returns>1
        public static DataSet RunSQLReturnDataSet(string sqls)
        {
            DataSet ds = new DataSet();
            string[] sqlArray = sqls.Split(';');
            DataTable dt = null;
            for (int i = 0; i < sqlArray.Length; i++)
            {
                if (DataType.IsNullOrEmpty(sqlArray[i]) == true)
                    continue;

                dt = DBAccess.RunSQLReturnTable(sqlArray[i]);
                dt.TableName = "dt_" + i.ToString();
                ds.Tables.Add(dt);
            }
            return ds;
        }
        #region 运行 SQL

        #region 在指定的Connection上执行 SQL 语句，返回受影响的行数

        #region OleDbConnection
        public static int RunSQLDropTable(string table)
        {
            if (IsExitsObject(new DBUrl(DBUrlType.AppCenterDSN), table))
            {
                switch (AppCenterDBType)
                {
                    case DBType.Oracle:
                    case DBType.KingBaseR6:
                    case DBType.KingBaseR3:
                    case DBType.DM:
                    case DBType.MSSQL:
                    case DBType.Informix:
                    case DBType.Access:
                        return RunSQL("DROP TABLE " + table);
                    default:
                        throw new Exception(" Exception ");
                }
            }
            return 0;

            /* return RunSQL("TRUNCATE TABLE " + table);*/

        }
        #endregion

        #region SqlConnection
        /// <summary>
        /// 运行SQL
        /// </summary>
        // private static bool lock_SQL_RunSQL = false;
        /// <summary>
        /// 运行SQL, 返回影响的行数.
        /// </summary>
        /// <param name="sql">msSQL</param>
        /// <param name="conn">SqlConnection</param>
        /// <returns>返回运行结果。</returns>
        public static int RunSQL(string sql, SqlConnection conn, string dsn)
        {
            return RunSQL(sql, conn, CommandType.Text, dsn);
        }
        /// <summary>
        /// 运行SQL , 返回影响的行数.
        /// </summary>
        /// <param name="sql">msSQL</param>
        /// <param name="conn">SqlConnection</param>
        /// <param name="sqlType">CommandType</param>
        /// <param name="pars">params</param>
        /// <returns>返回运行结果</returns>
        public static int RunSQL(string sql, SqlConnection conn, CommandType sqlType, string dsn)
        {
            SqlCommand cmd = new SqlCommand();
            try
            {
                if (conn == null)
                    conn = new SqlConnection(dsn);

                if (conn.State != System.Data.ConnectionState.Open)
                {
                    conn.ConnectionString = dsn;
                    conn.Open();
                }
                cmd = new SqlCommand(sql, conn);
                cmd.CommandType = sqlType;

                return cmd.ExecuteNonQuery();
            }
            catch (System.Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("RunSQL2 step=" + ex.Message + " 设置连接时间=" + conn.ConnectionTimeout);
            }
            finally
            {
                if (cmd != null)
                    cmd.Dispose();
                if (conn != null)
                    conn.Dispose();
            }
        }
        #endregion

        #region OracleConnection

        public static int RunSQL(string sql, OracleConnection conn, CommandType sqlType, string dsn)
        {
            OracleCommand cmd = new OracleCommand();
            try
            {
                if (conn == null)
                    conn = new OracleConnection(dsn);

                if (conn.State != System.Data.ConnectionState.Open)
                {
                    conn.ConnectionString = dsn;
                    conn.Open();
                }

                cmd = new OracleCommand(sql, conn);
                cmd.CommandType = sqlType;

                return cmd.ExecuteNonQuery();
            }
            catch (System.Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("RunSQL2" + ex.Message);
            }
            finally
            {
                if (cmd != null)
                    cmd.Dispose();

                if (conn != null)
                    conn.Dispose();
            }
        }
        #endregion

        #endregion

        #region 通过主应用程序在其他库上运行sql
        public static void DropTableColumn(string table, string columnName)
        {
            try
            {
                DBAccess.DropConstraintOfSQL(table, columnName);
                string sql = "ALTER TABLE " + table + " DROP COLUMN " + columnName;
                DBAccess.RunSQL(sql);
            }
            catch (Exception ex)
            {

            }
        }
        /// <summary>
        /// 删除表的主键
        /// </summary>
        /// <param name="table">表名称</param>
        public static void DropTablePK(string table)
        {
            string pkName = DBAccess.GetTablePKName(table);
            if (pkName == null)
                return;

            string sql = "";
            switch (BP.Difference.SystemConfig.AppCenterDBType)
            {
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                case DBType.DM:
                case DBType.MSSQL:
                    sql = "ALTER TABLE " + table + " DROP CONSTRAINT " + pkName;
                    break;
                case DBType.PostgreSQL:
                case DBType.UX:
                    sql = "ALTER TABLE " + table.ToLower() + " DROP CONSTRAINT " + pkName.ToLower();
                    break;
                case DBType.MySQL:
                    sql = "ALTER TABLE " + table + " DROP primary key";
                    break;
                default:
                    throw new Exception("err@DropTablePK不支持的数据库类型." + BP.Difference.SystemConfig.AppCenterDBType);
                    //break;
            }
            DBAccess.RunSQL(sql);
        }
        public static void RenameTableField(string table, string oldfield, string newfield)
        {
            if (oldfield.Equals(newfield) == true)
                return;
            if (DBAccess.IsExitsTableCol(table, oldfield) == false)
                return;
            if (DBAccess.IsExitsTableCol(table, newfield) == true)
                return;
            string sql = "";
            DataTable dt = null;
            switch (SystemConfig.AppCenterDBType)
            {
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                case DBType.PostgreSQL:
                    sql = "alter table " + table + " rename column " + oldfield + " to " + newfield;
                    break;
                case DBType.MSSQL:
                    sql = "exec sp_rename '" + table + ".[" + oldfield + "]','" + newfield + "','column'";
                    break;

                case DBType.MySQL:
                case DBType.DM:
                    sql = "select COLUMN_TYPE, COLUMN_DEFAULT  FROM information_schema.columns WHERE TABLE_SCHEMA='" + SystemConfig.AppCenterDBDatabase + "' AND table_name='" + table + "' AND  column_Name='" + oldfield + "'";
                    dt = DBAccess.RunSQLReturnTable(sql);
                    sql = "ALTER TABLE " + table + " CHANGE " + oldfield + " " + newfield + " " + dt.Rows[0][0] ;
                    break;
                default:
                    throw new Exception("err@DropTablePK不支持的数据库类型." + SystemConfig.AppCenterDBType);
            }
            DBAccess.RunSQL(sql);
        }
        #region pk
        /// <summary>
        /// 建立主键
        /// </summary>
        /// <param name="tab">物理表</param>
        /// <param name="pk">主键</param>
        public static void CreatePK(string tab, string pk, DBType db)
        {
            if (tab == null || tab == "")
                return;
            if (DBAccess.IsExitsTabPK(tab) == true)
                return;
            string sql;
            switch (db)
            {
                case DBType.Informix:
                    sql = "ALTER TABLE " + tab.ToUpper() + " ADD CONSTRAINT  PRIMARY KEY(" + pk + ") CONSTRAINT " + tab + "pk ";
                    break;
                case DBType.MySQL:
                    //   ALTER TABLE Port_emp ADD CONSTRAINT Port_emppk PRIMARY KEY (NO)
                    sql = "ALTER TABLE " + tab + " ADD CONSTRAINT  " + tab + "px PRIMARY KEY(" + pk + ")";
                    //sql = "ALTER TABLE " + tab + " ADD CONSTRAINT  PRIMARY KEY(" + pk + ") CONSTRAINT " + tab + "pk ";
                    break;
                default:
                    sql = "ALTER TABLE " + tab.ToUpper() + " ADD CONSTRAINT " + tab + "pk PRIMARY KEY(" + pk.ToUpper() + ")";
                    break;
            }

            //这个地方不应该出现异常, 需要处理一下在向数据库计划流程中出现.
            try
            {
                DBAccess.RunSQL(sql);
            }
            catch (Exception ex)
            {
                Log.DebugWriteError(ex);
            }
        }
        public static void CreatePK(string tab, string pk1, string pk2, DBType db)
        {
            if (tab == null || tab == "")
                return;

            if (DBAccess.IsExitsTabPK(tab) == true)
                return;

            string sql;
            switch (db)
            {
                case DBType.Informix:
                    sql = "ALTER TABLE " + tab.ToUpper() + " ADD CONSTRAINT  PRIMARY KEY(" + pk1.ToUpper() + "," + pk2.ToUpper() + ") CONSTRAINT " + tab + "pk ";
                    break;
                case DBType.MySQL:
                    sql = "ALTER TABLE " + tab + " ADD CONSTRAINT " + tab + "pk  PRIMARY KEY(" + pk1 + "," + pk2 + ")";
                    break;
                default:
                    sql = "ALTER TABLE " + tab.ToUpper() + " ADD CONSTRAINT " + tab + "pk  PRIMARY KEY(" + pk1.ToUpper() + "," + pk2.ToUpper() + ")";
                    break;
            }
            DBAccess.RunSQL(sql);
        }
        public static void CreatePK(string tab, string pk1, string pk2, string pk3, DBType db)
        {
            if (tab == null || tab == "")
                return;

            if (DBAccess.IsExitsTabPK(tab) == true)
                return;

            string sql;
            switch (db)
            {
                case DBType.Informix:
                    sql = "ALTER TABLE " + tab.ToUpper() + " ADD CONSTRAINT  PRIMARY KEY(" + pk1.ToUpper() + "," + pk2.ToUpper() + "," + pk3.ToUpper() + ") CONSTRAINT " + tab + "pk ";
                    break;
                case DBType.MySQL:
                    sql = "ALTER TABLE " + tab + " ADD CONSTRAINT " + tab + "pk PRIMARY KEY(" + pk1 + "," + pk2 + "," + pk3 + ")";
                    break;
                default:
                    sql = "ALTER TABLE " + tab.ToUpper() + " ADD CONSTRAINT " + tab + "pk PRIMARY KEY(" + pk1.ToUpper() + "," + pk2.ToUpper() + "," + pk3.ToUpper() + ")";
                    break;
            }
            DBAccess.RunSQL(sql);
        }
        #endregion


        #region index
        public static void CreatIndex(string table, string fields)
        {
            string idxName = table + "_" + fields;

            string sql = "";
            if (DBAccess.IsExitsTableIndex(table, idxName) == true)
                return;

            sql = "CREATE INDEX " + idxName + " ON " + table + " (" + fields + ")";
            DBAccess.RunSQL(sql);
        }
        public static void CreatIndex(string table, string pk1, string pk2)
        {
            try
            {
                DBAccess.RunSQL("CREATE INDEX " + table + "ID ON " + table + " (" + pk1 + "," + pk2 + ")");
            }
            catch
            {
            }
        }
        public static void CreatIndex(string table, string pk1, string pk2, string pk3)
        {
            try
            {
                DBAccess.RunSQL("CREATE INDEX " + table + "ID ON " + table + " (" + pk1 + "," + pk2 + "," + pk3 + ")");
            }
            catch (Exception ex)
            {
            }
        }
        public static void CreatIndex(string table, string pk1, string pk2, string pk3, string pk4)
        {
            try
            {
                DBAccess.RunSQL("CREATE INDEX " + table + "ID ON " + table + " (" + pk1 + "," + pk2 + "," + pk3 + "," + pk4 + ")");
            }
            catch (Exception ex)
            {
            }
        }
        #endregion


        #endregion

        #region 在当前的Connection执行 SQL 语句，返回受影响的行数
        /// <summary>
        /// 是否去掉 -- 
        /// </summary>
        /// <param name="sqlOfScriptFilePath">文件路径</param>
        /// <param name="isCutDoubleJianHao"> 是否排除双减号 </param>
        public static void RunSQLScript(string sqlOfScriptFilePath, bool isCutDoubleJianHao = true)
        {
            string str = DataType.ReadTextFile(sqlOfScriptFilePath);
            string[] strs = str.Split(';');
            foreach (string s in strs)
            {
                if (DataType.IsNullOrEmpty(s) || string.IsNullOrWhiteSpace(s))
                    continue;

                if (isCutDoubleJianHao == true && s.Contains("--"))
                    continue;

                if (s.Contains("/*"))
                    continue;

                DBAccess.RunSQL(s);
            }
        }
        /// <summary>
        /// 执行具有Go的sql 文本。
        /// </summary>
        /// <param name="sqlOfScriptFilePath"></param>
        public static void RunSQLScriptGo(string sqlOfScriptFilePath)
        {
            string str = DataType.ReadTextFile(sqlOfScriptFilePath);
            string[] strs = str.Split(new String[] { "--GO--" }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string s in strs)
            {
                if (DataType.IsNullOrEmpty(s) || string.IsNullOrWhiteSpace(s))
                    continue;

                if (s.Contains("/**"))
                    continue;

                string mysql = s.Replace("--GO--", "");
                if (DataType.IsNullOrEmpty(mysql.Trim()))
                    continue;
                if (s.Contains("--"))
                    continue;

                DBAccess.RunSQL(mysql);
            }
        }

        /// <summary>
        /// 运行SQLs
        /// </summary>
        /// <param name="sql"></param>
        public static void RunSQLs(string sql)
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
        /// <summary>
        /// 运行带有参数的sql
        /// </summary>
        /// <param name="ps"></param>
        /// <returns></returns>
        public static int RunSQL(Paras ps)
        {
            return RunSQL(ps.SQL, ps);
        }
        /// <summary>
        /// 运行sql
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static int RunSQL(string sql)
        {
            if (sql == null || sql.Trim() == "")
                return 1;
            Paras ps = new Paras();
            ps.SQL = sql;
            return RunSQL(ps);
        }

        public static int RunSQL(string sql, string paraKey, object val)
        {
            Paras ens = new Paras();
            ens.Add(paraKey, val);
            return RunSQL(sql, ens);
        }
        public static int RunSQL(string sql, string paraKey1, object val1, string paraKey2, object val2)
        {
            Paras ens = new Paras();
            ens.Add(paraKey1, val1);
            ens.Add(paraKey2, val2);
            return RunSQL(sql, ens);
        }
        public static int RunSQL(string sql, string paraKey1, object val1, string paraKey2, object val2, string k3, object v3)
        {
            Paras ens = new Paras();
            ens.Add(paraKey1, val1);
            ens.Add(paraKey2, val2);
            ens.Add(k3, v3);
            return RunSQL(sql, ens);
        }
        /// <summary>
        /// 
        /// </summary>
        public static bool lockRunSQL = false;
        /// <summary>
        /// 执行sql
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        public static int RunSQL(string sql, Paras paras)
        {
            if (DataType.IsNullOrEmpty(sql))
                return 1;

            int result = 0;
            try
            {
                switch (AppCenterDBType)
                {
                    case DBType.MSSQL:
                        result = RunSQL_200705_SQL(sql, paras);
                        break;
                    case DBType.Oracle:
                        result = RunSQL_200705_Ora(sql.Replace("]", "").Replace("[", ""), paras);
                        break;
                    case DBType.MySQL:
                        result = RunSQL_200705_MySQL(sql, paras);
                        break;
                    case DBType.PostgreSQL:
                        result = RunSQL_201902_PSQL(sql, paras);
                        break;
                    case DBType.UX:
                        result = RunSQL_201902_UXQL(sql, paras);
                        break;
                    case DBType.DM:
                        result = RunSQL_20191230_DM(sql, paras);
                        break;
                    case DBType.KingBaseR3:
                    case DBType.KingBaseR6:
                        result = RunSQL_201902_KingBase(sql.Replace("]", "").Replace("[", ""), paras);
                        break;
                    //case DBType.Informix:
                    //    result = RunSQL_201205_Informix(sql, paras);
                    //    break;
                    default:
                        throw new Exception("err@RunSQL发现未知的数据库连接类型！");
                }
                lockRunSQL = false;
                return result;
            }
            catch (Exception ex)
            {
                lockRunSQL = false;
                string msg = "";
                string mysql = sql.Clone() as string;

                string dbstr = BP.Difference.SystemConfig.AppCenterDBVarStr;
                foreach (Para p in paras)
                {
                    msg += "@" + p.ParaName + "=" + p.val + "," + p.DAType.ToString();

                    string str = mysql;

                    mysql = mysql.Replace(dbstr + p.ParaName + ",", "'" + p.val + "',");

                    // add by qin 16/3/22  
                    if (str == mysql)//表明类似":OID"的字段没被替换
                        mysql = mysql.Replace(dbstr + p.ParaName, "'" + p.val + "'");

                }
                throw new Exception("执行sql错误:" + ex.Message + " Paras(" + paras.Count + ")=" + msg + "<hr>" + mysql);
            }
        }
        private static Npgsql.NpgsqlConnection _conn = null;
        private static bool isCloseConn = true;
        private static Npgsql.NpgsqlConnection connOfPGSQL
        {
            get
            {
                return new Npgsql.NpgsqlConnection(BP.Difference.SystemConfig.AppCenterDSN);

                if (_conn == null)
                {
                    _conn = new Npgsql.NpgsqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
                    return _conn;
                }
                return _conn;
            }
        }

        private static Nuxsql.NuxsqlConnection connOfUXSQL
        {
            get
            {
                return new Nuxsql.NuxsqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            }
        }


        /// <summary>
        /// 运行sql返回结果
        /// </summary>
        /// <param name="sql">sql</param>
        /// <param name="paras">参数</param>
        /// <returns>执行的结果</returns>
        private static int RunSQL_201902_PSQL(string sql, Paras paras)
        {
            if (1 == 1)
            {
                if (paras == null)
                    paras = new Paras();
                paras.SQL = sql;
            }

            Npgsql.NpgsqlConnection conn = DBAccess.connOfPGSQL;
            if (conn.State != System.Data.ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }

            Npgsql.NpgsqlCommand cmd = new Npgsql.NpgsqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            try
            {
                foreach (Para para in paras)
                {
                    Npgsql.NpgsqlParameter oraP = new Npgsql.NpgsqlParameter(para.ParaName, para.val);
                    cmd.Parameters.Add(oraP);
                }
                int i = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (isCloseConn == true)
                    conn.Close();
                return i;
            }
            catch (System.Exception ex)
            {
                paras.SQL = sql;
                string msg = "";
                if (paras.Count == 0)
                    msg = "SQL=" + sql + ",异常信息:" + ex.Message;
                else
                    msg = "SQL=" + paras.SQLNoPara + ",异常信息:" + ex.Message;

                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (cmd != null)
                    conn.Dispose();
                if (cmd != null)
                    conn.Dispose();
            }
        }


        private static int RunSQL_201902_KingBase(string sql, Paras paras)
        {
            if (1 == 1)
            {
                if (paras == null)
                    paras = new Paras();
                paras.SQL = sql;
            }

            KdbndpConnection conn = new KdbndpConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != System.Data.ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }

            KdbndpCommand cmd = new KdbndpCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            try
            {
                foreach (Para para in paras)
                {
                    KdbndpParameter oraP = new KdbndpParameter(para.ParaName, para.val);
                    cmd.Parameters.Add(oraP);
                }
                int i = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (isCloseConn == true)
                    conn.Close();
                return i;
            }
            catch (System.Exception ex)
            {
                paras.SQL = sql;
                string msg = "";
                if (paras.Count == 0)
                    msg = "SQL=" + sql + ",异常信息:" + ex.Message;
                else
                    msg = "SQL=" + paras.SQLNoPara + ",异常信息:" + ex.Message;

                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (cmd != null)
                    conn.Dispose();
                if (cmd != null)
                    conn.Dispose();
            }
        }
        private static int RunSQL_201902_UXQL(string sql, Paras paras)
        {
            if (1 == 1)
            {
                if (paras == null)
                    paras = new Paras();
                paras.SQL = sql;
            }

            Nuxsql.NuxsqlConnection conn = DBAccess.connOfUXSQL;
            if (conn.State != System.Data.ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }

            Nuxsql.NuxsqlCommand cmd = new Nuxsql.NuxsqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            try
            {
                foreach (Para para in paras)
                {
                    Nuxsql.NuxsqlParameter oraP = new Nuxsql.NuxsqlParameter(para.ParaName, para.val);
                    cmd.Parameters.Add(oraP);
                }
                int i = cmd.ExecuteNonQuery();
                cmd.Dispose();

                if (isCloseConn == true)
                    conn.Close();
                return i;
            }
            catch (System.Exception ex)
            {
                paras.SQL = sql;
                string msg = "";
                if (paras.Count == 0)
                    msg = "SQL=" + sql + ",异常信息:" + ex.Message;
                else
                    msg = "SQL=" + paras.SQLNoPara + ",异常信息:" + ex.Message;

                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (cmd != null)
                    conn.Dispose();
                if (cmd != null)
                    conn.Dispose();
            }
        }
        private static int RunSQL_20191230_KingBase(string sql, Paras paras)
        {
            KdbndpConnection conn = new KdbndpConnection();
            if (conn.State != ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }

            KdbndpCommand cmd = new KdbndpCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            try
            {
                if (paras != null)
                {
                    foreach (Para para in paras)
                    {
                        KdbndpParameter oraP = new KdbndpParameter(para.ParaName, para.val);
                        cmd.Parameters.Add(oraP);
                    }
                }

                int i = cmd.ExecuteNonQuery();
                return i;
            }
            catch (System.Exception ex)
            {
                paras.SQL = sql;
                string msg = "";
                if (paras.Count == 0)
                    msg = "SQL=" + sql + ",异常信息:" + ex.Message;
                else
                    msg = "SQL=" + paras.SQLNoPara + ",异常信息:" + ex.Message;

                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (cmd != null)
                    cmd.Dispose();
                if (conn != null)
                    conn.Close();
            }
        }

        /// <summary>
        /// 运行sql返回结果
        /// </summary>
        /// <param name="sql">sql</param>
        /// <param name="paras">参数</param>
        /// <returns>执行的结果</returns>
        private static int RunSQL_20191230_DM(string sql, Paras paras)
        {
            DmConnection conn = new DmConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }

            DmCommand cmd = new DmCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            try
            {
                if (paras != null)
                {
                    foreach (Para para in paras)
                    {
                        DmParameter oraP = new DmParameter(para.ParaName, para.val);
                        cmd.Parameters.Add(oraP);
                    }
                }

                int i = cmd.ExecuteNonQuery();
                return i;
            }
            catch (System.Exception ex)
            {
                paras.SQL = sql;
                string msg = "";
                if (paras.Count == 0)
                    msg = "SQL=" + sql + ",异常信息:" + ex.Message;
                else
                    msg = "SQL=" + paras.SQLNoPara + ",异常信息:" + ex.Message;

                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (cmd != null)
                    cmd.Dispose();
                if (conn != null)
                    conn.Close();
            }
        }
        private static int RunSQL_200705_SQL(string sql, Paras paras)
        {
            SqlConnection conn = new SqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != System.Data.ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;

            try
            {
                foreach (Para para in paras)
                {
                    SqlParameter oraP = new SqlParameter(para.ParaName, para.val);
                    cmd.Parameters.Add(oraP);
                }
                int i = cmd.ExecuteNonQuery();

                return i;
            }
            catch (System.Exception ex)
            {
                paras.SQL = sql;
                string msg = "";
                if (paras.Count == 0)
                    msg = "SQL=" + sql + ",异常信息:" + ex.Message;
                else
                    msg = "SQL=" + paras.SQLNoPara + ",异常信息:" + ex.Message;

                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (cmd != null)
                    cmd.Dispose();
                if (conn != null)
                    conn.Close();
            }
        }

        #region 处理mysql conn的缓存.
        private static Hashtable _ConnHTOfMySQL = null;
        public static Hashtable ConnHTOfMySQL
        {
            get
            {
                if (_ConnHTOfMySQL == null || _ConnHTOfMySQL.Count <= 0)
                {
                    _ConnHTOfMySQL = new Hashtable();
                    int numConn = 10;
                    for (int i = 0; i < numConn; i++)
                    {
                        MySqlConnection conn = new MySqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
                        conn.Open(); //打开连接.
                        _ConnHTOfMySQL.Add("Conn" + i, conn);
                    }
                }
                return _ConnHTOfMySQL;
            }
        }
        #endregion 处理mysql conn的缓存.

        /// <summary>
        /// RunSQL_200705_MySQL
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        private static int RunSQL_200705_MySQL(string sql, Paras paras)
        {
            MySqlConnection connOfMySQL = new MySqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (connOfMySQL.State != System.Data.ConnectionState.Open)
            {
                connOfMySQL.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                connOfMySQL.Open();
            }

            try
            {
                MySqlCommand cmd = new MySqlCommand(sql, connOfMySQL);
                cmd.CommandType = CommandType.Text;

                if (paras != null)
                {
                    foreach (Para para in paras)
                    {
                        MySqlParameter oraP = new MySqlParameter(para.ParaName, para.val);
                        cmd.Parameters.Add(oraP);
                    }
                }
                return cmd.ExecuteNonQuery();
            }
            catch (System.Exception ex)
            {
                throw new Exception("err@RunSQL_200705_MySQL:" + ex.Message + "@SQL:" + sql);
            }
            finally
            {
                if (connOfMySQL != null)
                    connOfMySQL.Dispose();
                if (connOfMySQL != null)
                    connOfMySQL.Close();
            }
        }
        private static int RunSQL_200705_Ora(string sql, Paras paras)
        {
            if (sql.EndsWith(";") == true)
                sql = "begin " + sql + " end;";

            OracleConnection conn = new OracleConnection(BP.Difference.SystemConfig.AppCenterDSN);

            if (conn.State != System.Data.ConnectionState.Open)
            {
                conn.ConnectionString = BP.Difference.SystemConfig.AppCenterDSN;
                conn.Open();
            }

            OracleCommand cmd = new OracleCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            cmd.BindByName = true;

            try
            {
                foreach (Para para in paras)
                {
                    OracleParameter oraP = new OracleParameter(para.ParaName, para.DATypeOfOra);
                    oraP.Size = para.Size;

                    if (para.DATypeOfOra == OracleDbType.Clob)
                    {
                        if (DataType.IsNullOrEmpty(para.val as string) == true)
                            oraP.Value = DBNull.Value;
                        else
                            oraP.Value = para.val;
                    }
                    else
                        oraP.Value = para.val;

                    oraP.DbType = para.DAType;
                    cmd.Parameters.Add(oraP);
                }

                return cmd.ExecuteNonQuery();
            }
            catch (System.Exception ex)
            {
                if (paras != null)
                {
                    foreach (Para item in paras)
                    {
                        if (item.DAType == DbType.String)
                        {
                            if (sql.Contains(":" + item.ParaName + ","))
                                sql = sql.Replace(":" + item.ParaName + ",", "'" + item.val + "',");
                            else
                                sql = sql.Replace(":" + item.ParaName, "'" + item.val + "'");
                        }
                        else
                        {
                            if (sql.Contains(":" + item.ParaName + ","))
                                sql = sql.Replace(":" + item.ParaName + ",", item.val + ",");
                            else
                                sql = sql.Replace(":" + item.ParaName, item.val.ToString());
                        }
                    }
                }

                if (BP.Difference.SystemConfig.IsDebug)
                {
                    string msg = "RunSQL2   SQL=" + sql + ex.Message;
                    //Log.DebugWriteError(msg);

                    throw new Exception("err@" + ex.Message + " SQL=" + sql);
                }
                else
                {
                    //    Log.DebugWriteError(ex.Message);
                    throw new Exception(ex.Message + "@可以执行的SQL:" + sql);
                }
            }
            finally
            {

                if (cmd != null)
                    cmd.Dispose();
                if (conn != null)
                    conn.Close();
            }
        }
        #endregion

        #endregion

        #region 运行SQL 返回 DataTable

        #region SqlConnection
        /// <summary>
        /// 锁
        /// </summary>
        private static bool lock_msSQL_ReturnTable = false;
        public static DataTable RunSQLReturnTable(string oraSQL, OracleConnection conn, CommandType sqlType, string dsn)
        {
            try
            {
                if (conn == null)
                {
                    conn = new OracleConnection(dsn);
                    conn.Open();
                }

                if (conn.State != ConnectionState.Open)
                {
                    conn.ConnectionString = dsn;
                    conn.Open();
                }

                OracleDataAdapter oraAda = new OracleDataAdapter(oraSQL, conn);
                oraAda.SelectCommand.CommandType = sqlType;


                DataTable oratb = new DataTable("otb");
                oraAda.Fill(oratb);

                // peng add 07-19
                oraAda.Dispose();

                return oratb;
            }
            catch (System.Exception ex)
            {
                throw new Exception(ex.Message + " [RunSQLReturnTable on OracleConnection dsn=App ] sql=" + oraSQL + "<br>");
            }
            finally
            {
                if (conn != null)
                    conn.Dispose();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="msSQL"></param>
        /// <param name="sqlconn"></param>
        /// <param name="sqlType"></param>
        /// <param name="pars"></param>
        /// <returns></returns>
        public static DataTable RunSQLReturnTable(string msSQL, SqlConnection conn, string connStr, CommandType sqlType, Paras paras)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.ConnectionString = connStr;
                conn.Open();
            }

            while (lock_msSQL_ReturnTable)
            {
            }

            SqlDataAdapter msAda = new SqlDataAdapter(msSQL, conn);

            msAda.SelectCommand.CommandType = sqlType;
            if (paras != null)
            {
                //CommandType.
                foreach (Para para in paras)
                {
                    msAda.SelectCommand.Parameters.AddWithValue(para.ParaName, para.val);
                }
            }

            DataTable mstb = new DataTable("mstb");
            //如果是锁定状态，就等待
            lock_msSQL_ReturnTable = true; //锁定
            try
            {
                msAda.Fill(mstb);

                lock_msSQL_ReturnTable = false;// 返回前一定要开锁
            }
            catch (System.Exception ex)
            {
                lock_msSQL_ReturnTable = false;
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("[RunSQLReturnTable on SqlConnection 1]" + "<BR>" + ex.Message + " sql=" + msSQL);
            }
            finally
            {
                if (msAda != null)
                    msAda.Dispose();
                if (conn != null)
                    conn.Close();
            }
            return mstb;
        }
        #endregion SqlConnection


        #region OracleConnection
        private static DataTable RunSQLReturnTable_20191231_DM(string selectSQL, Paras paras)
        {
            DmConnection conn = new DmConnection(BP.Difference.SystemConfig.AppCenterDSN);
            try
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                DmDataAdapter ada = new DmDataAdapter(selectSQL, conn);
                ada.SelectCommand.CommandType = CommandType.Text;

                // 加入参数
                if (paras != null)
                {
                    foreach (Para para in paras)
                    {
                        DmParameter myParameter = new DmParameter(para.ParaName, para.DATypeOfOra);
                        myParameter.Size = para.Size;
                        myParameter.Value = para.val;
                        ada.SelectCommand.Parameters.Add(myParameter);
                    }
                }

                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);
                ada.Dispose();

                return oratb;
            }
            catch (System.Exception ex)
            {
                string msg = "@运行查询在(RunSQLReturnTable_20191231_DM with paras)出错 sql=" + selectSQL + " @异常信息：" + ex.Message;
                msg += "@Para Num= " + paras.Count;
                foreach (Para pa in paras)
                {
                    msg += "@" + pa.ParaName + "=" + pa.val;
                }
                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
        }
        private static DataTable RunSQLReturnTable_200705_Ora(string selectSQL, Paras paras)
        {
            OracleConnection conn = new OracleConnection(BP.Difference.SystemConfig.AppCenterDSN);
            try
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                OracleDataAdapter ada = new OracleDataAdapter(selectSQL, conn);
                ada.SelectCommand.CommandType = CommandType.Text;

                // 加入参数
                if (paras != null)
                {
                    foreach (Para para in paras)
                    {
                        OracleParameter myParameter = new OracleParameter(para.ParaName, para.DATypeOfOra);
                        myParameter.Size = para.Size;
                        myParameter.Value = para.val;
                        ada.SelectCommand.Parameters.Add(myParameter);
                    }
                }

                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);
                ada.Dispose();

                return oratb;
            }
            catch (System.Exception ex)
            {
                string msg = "@运行查询在(RunSQLReturnTable_200705_Ora with paras)出错 sql=" + selectSQL + " @异常信息：" + ex.Message;
                msg += "@Para Num= " + paras.Count;
                foreach (Para pa in paras)
                {
                    msg += "@" + pa.ParaName + "=" + pa.val;
                }
                BP.DA.Log.DebugWriteError(msg);
                throw new Exception(msg);
            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
        }



        private static DataTable RunSQLReturnTable_200705_SQL(string sql, Paras paras)
        {

            SqlConnection conn = new SqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            SqlDataAdapter ada = new SqlDataAdapter(sql, conn);
            ada.SelectCommand.CommandType = CommandType.Text;

            // 加入参数
            if (paras != null)//qin 解决为null时的异常
            {
                foreach (Para para in paras)
                {
                    SqlParameter myParameter = new SqlParameter(para.ParaName, para.val);
                    myParameter.Size = para.Size;
                    ada.SelectCommand.Parameters.Add(myParameter);
                }
            }

            try
            {

                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);
                return oratb;


            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
            }
            finally
            {
                if (ada != null)
                    ada.Dispose();
                if (conn != null)
                    conn.Dispose();
            }


        }

        private static DataTable RunProcReturnTable_SQL(string sql, Paras paras)
        {
            SqlConnection conn = new SqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            SqlCommand comm = new SqlCommand(sql, conn);
            comm.CommandType = CommandType.StoredProcedure;

            // 加入参数
            if (paras != null)//qin 解决为null时的异常
            {
                foreach (Para para in paras)
                {
                    SqlParameter myParameter = new SqlParameter("@" + para.ParaName, para.val);
                    //myParameter.Value = para.val;
                    myParameter.Size = para.Size;
                    myParameter.Direction = ParameterDirection.Input;
                    comm.Parameters.Add(myParameter);
                }
            }
            SqlDataAdapter ada = new SqlDataAdapter(comm);
            try
            {
                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);

                return oratb;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
            }
            finally
            {
                if (ada != null)
                    ada.Dispose();
                if (conn != null)
                    conn.Dispose();
            }
        }
        private static DataTable RunSQLReturnTable_201902_KingBase(string sql, Paras paras)
        {

            KdbndpConnection conn = new KdbndpConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            KdbndpDataAdapter ada = new KdbndpDataAdapter(sql, conn);
            ada.SelectCommand.CommandType = CommandType.Text;

            // 加入参数
            if (paras != null)//qin 解决为null时的异常
            {
                foreach (Para para in paras)
                {
                    // 2019-8-8 zl 适配postgreSql新版驱动，要求数据类型一致
                    object valObj = para.val;

                    KdbndpParameter myParameter = new KdbndpParameter(para.ParaName, valObj);
                    myParameter.Size = para.Size;
                    ada.SelectCommand.Parameters.Add(myParameter);
                }
            }

            try
            {
                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);

                return oratb;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
            }
            finally
            {
                if (ada != null)
                    ada.Dispose();
                if (conn != null)
                    conn.Dispose();
            }
        }

        private static DataTable RunSQLReturnTable_201902_UXQL(string sql, Paras paras)
        {
            Nuxsql.NuxsqlConnection conn = DBAccess.connOfUXSQL; // new Nuxsql.NuxsqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            Nuxsql.NuxsqlDataAdapter ada = new Nuxsql.NuxsqlDataAdapter(sql, conn);
            ada.SelectCommand.CommandType = CommandType.Text;

            // 加入参数
            if (paras != null)//qin 解决为null时的异常
            {
                foreach (Para para in paras)
                {
                    // 2019-8-8 zl 适配postgreSql新版驱动，要求数据类型一致
                    object valObj = para.val;

                    Nuxsql.NuxsqlParameter myParameter = new Nuxsql.NuxsqlParameter(para.ParaName, valObj);
                    myParameter.Size = para.Size;
                    ada.SelectCommand.Parameters.Add(myParameter);
                }
            }

            try
            {
                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);

                return oratb;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
            }
            finally
            {
                if (ada != null)
                    ada.Dispose();
                if (conn != null)
                    conn.Dispose();
            }
        }
        /// <summary>
        /// 运行sql返回datatable
        /// </summary>
        /// <param name="sql">要运行的SQL</param>
        /// <param name="paras">参数</param>
        /// <returns>返回的数据.</returns>
        private static DataTable RunSQLReturnTable_201902_PSQL(string sql, Paras paras)
        {
            Npgsql.NpgsqlConnection conn = DBAccess.connOfPGSQL; // new Npgsql.NpgsqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            Npgsql.NpgsqlDataAdapter ada = new Npgsql.NpgsqlDataAdapter(sql, conn);
            ada.SelectCommand.CommandType = CommandType.Text;

            // 加入参数
            if (paras != null)//qin 解决为null时的异常
            {
                foreach (Para para in paras)
                {
                    // 2019-8-8 zl 适配postgreSql新版驱动，要求数据类型一致
                    object valObj = para.val;

                    Npgsql.NpgsqlParameter myParameter = new Npgsql.NpgsqlParameter(para.ParaName, valObj);
                    myParameter.Size = para.Size;
                    ada.SelectCommand.Parameters.Add(myParameter);
                }
            }

            try
            {
                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);

                return oratb;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
            }
            finally
            {
                if (ada != null)
                    ada.Dispose();
                if (conn != null)
                    conn.Dispose();
            }
        }


        private static DataTable RunSQLReturnTable_200705_KingBase(string sql, Paras paras)
        {
            KdbndpConnection conn = new KdbndpConnection(BP.Difference.SystemConfig.AppCenterDSN); // new Npgsql.NpgsqlConnection(BP.Difference.SystemConfig.AppCenterDSN);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            KdbndpDataAdapter ada = new KdbndpDataAdapter(sql, conn);
            ada.SelectCommand.CommandType = CommandType.Text;

            // 加入参数
            if (paras != null)//qin 解决为null时的异常
            {
                foreach (Para para in paras)
                {
                    // 2019-8-8 zl 适配postgreSql新版驱动，要求数据类型一致
                    object valObj = para.val;

                    KdbndpParameter myParameter = new KdbndpParameter(para.ParaName, valObj);
                    myParameter.Size = para.Size;
                    ada.SelectCommand.Parameters.Add(myParameter);
                }
            }

            try
            {
                DataTable oratb = new DataTable("otb");
                ada.Fill(oratb);

                return oratb;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
            }
            finally
            {
                if (ada != null)
                    ada.Dispose();
                if (conn != null)
                    conn.Dispose();
            }
        }




        private static DataTable RunSQLReturnTable_200705_MySQL(string sql, Paras paras)
        {


            using (MySqlConnection conn = new MySqlConnection(BP.Difference.SystemConfig.AppCenterDSN))
            {
                using (MySqlDataAdapter ada = new MySqlDataAdapter(sql, conn))
                {

                    try
                    {
                        if (conn.State != ConnectionState.Open)
                            conn.Open();

                        ada.SelectCommand.CommandType = CommandType.Text;

                        // 加入参数
                        if (paras != null)
                        {
                            foreach (Para para in paras)
                            {
                                MySqlParameter myParameter = new MySqlParameter(para.ParaName, para.val);
                                myParameter.Size = para.Size;
                                ada.SelectCommand.Parameters.Add(myParameter);
                            }
                        }
                        DataTable oratb = new DataTable("otb");
                        ada.Fill(oratb);
                        return oratb;
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                    }
                }
            }
        }

        private static DataTable RunProcReturnTable_MySQL(string sql, Paras paras)
        {


            using (MySqlConnection conn = new MySqlConnection(BP.Difference.SystemConfig.AppCenterDSN))
            {
                using (MySqlDataAdapter ada = new MySqlDataAdapter(sql, conn))
                {
                    if (conn.State != ConnectionState.Open)
                        conn.Open();

                    ada.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // 加入参数
                    if (paras != null)
                    {
                        foreach (Para para in paras)
                        {
                            MySqlParameter myParameter = new MySqlParameter("_" + para.ParaName, para.val);
                            ada.SelectCommand.Parameters.Add(myParameter);
                        }
                    }


                    try
                    {
                        DataTable oratb = new DataTable("otb");
                        ada.Fill(oratb);
                        return oratb;
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        throw new Exception("SQL=" + sql + " Exception=" + ex.Message);
                    }
                }
            }
        }


        #endregion

        #endregion

        #region 在当前Connection上执行
        public static DataTable RunSQLReturnTable(Paras ps)
        {
            return RunSQLReturnTable(ps.SQL, ps);
        }
        public static int RunSQLReturnTableCount = 0;
        /// <summary>
        /// 传递一个select 语句返回一个查询结果集合。
        /// </summary>
        /// <param name="sql">select sql</param>
        /// <returns>查询结果集合DataTable</returns>
        public static DataTable RunSQLReturnTable(string sql)
        {
            Paras ps = new Paras();
            return RunSQLReturnTable(sql, ps);
        }

        public static DataTable RunSQLReturnTable(string sql, string key, object val)
        {
            Paras ens = new Paras();
            ens.Add(key, val);
            return RunSQLReturnTable(sql, ens);
        }

        /// <summary>
        /// 通用SQL查询分页返回DataTable
        /// </summary>
        /// <param name="sql">SQL语句，不带排序（Order By）语句</param>
        /// <param name="pageSize">每页记录数量</param>
        /// <param name="pageIdx">请求页码</param>
        /// <param name="key">记录主键（不能为空，不能有重复，必须包含在返回字段中）</param>
        /// <param name="orderKey">排序字段（此字段必须包含在返回字段中）</param>
        /// <param name="orderType">排序方式，ASC/DESC</param>
        /// <returns></returns>
        public static DataTable RunSQLReturnTable(string sql, int pageSize, int pageIdx, string key, string orderKey, string orderType)
        {
            switch (DBAccess.AppCenterDBType)
            {
                case DBType.MSSQL:
                    return RunSQLReturnTable_201612_SQL(sql, pageSize, pageIdx, key, orderKey, orderType);
                case DBType.Oracle:
                    return RunSQLReturnTable_201612_Ora(sql, pageSize, pageIdx, orderKey, orderType);
                case DBType.DM:
                    return RunSQLReturnTable_201612_Ora(sql, pageSize, pageIdx, orderKey, orderType);

                case DBType.MySQL:
                    return RunSQLReturnTable_201612_MySql(sql, pageSize, pageIdx, key, orderKey, orderType);
                case DBType.PostgreSQL:
                case DBType.UX:
                    return RunSQLReturnTable_201612_PostgreSQL(sql, pageSize, pageIdx, key, orderKey, orderType);
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    return RunSQLReturnTable_201612_KingBase(sql, pageSize, pageIdx, key, orderKey, orderType);
                default:
                    throw new Exception("@未涉及的数据库类型！");
            }
        }
        private static DataTable RunSQLReturnTable_201612_PostgreSQL(string sql, int pageSize, int pageIdx, string key, string orderKey, string orderType)
        {
            string sqlstr = string.Empty;
            orderType = string.IsNullOrWhiteSpace(orderType) ? "ASC" : orderType.ToUpper();

            if (pageIdx < 1)
                pageIdx = 1;
            //    limit  A  offset  B;  A就是你需要多少行B就是查询的起点位置
            sqlstr = "SELECT * FROM (" + sql + ") T1 WHERE T1." + key + (orderType == "ASC" ? " >= " : " <= ")
                     + "(SELECT T2." + key + " FROM (" + sql + ") T2"
                     + (string.IsNullOrWhiteSpace(orderKey)
                            ? string.Empty
                            : string.Format(" ORDER BY T2.{0} {1}", orderKey, orderType))
                     + " LIMIT " + ((pageIdx - 1) * pageSize + 1) + " offset 1) LIMIT " + pageSize;
            return RunSQLReturnTable(sqlstr);
        }


        private static DataTable RunSQLReturnTable_201612_KingBase(string sql, int pageSize, int pageIdx, string key, string orderKey, string orderType)
        {
            string sqlstr = string.Empty;
            orderType = string.IsNullOrWhiteSpace(orderType) ? "ASC" : orderType.ToUpper();

            if (pageIdx < 1)
                pageIdx = 1;
            //    limit  A  offset  B;  A就是你需要多少行B就是查询的起点位置
            sqlstr = "SELECT * FROM (" + sql + ") T1 WHERE T1." + key + (orderType == "ASC" ? " >= " : " <= ")
                     + "(SELECT T2." + key + " FROM (" + sql + ") T2"
                     + (string.IsNullOrWhiteSpace(orderKey)
                            ? string.Empty
                            : string.Format(" ORDER BY T2.{0} {1}", orderKey, orderType))
                     + " LIMIT " + ((pageIdx - 1) * pageSize + 1) + " offset 1) LIMIT " + pageSize;
            return RunSQLReturnTable(sqlstr);
        }

        /// <summary>
        /// 通用SqlServer查询分页返回DataTable
        /// </summary>
        /// <param name="sql">SQL语句，不带排序（Order By）语句</param>
        /// <param name="pageSize">每页记录数量</param>
        /// <param name="pageIdx">请求页码</param>
        /// <param name="key">记录主键（不能为空，不能有重复，必须包含在返回字段中）</param>
        /// <param name="orderKey">排序字段（此字段必须包含在返回字段中）</param>
        /// <param name="orderType">排序方式，ASC/DESC</param>
        /// <returns></returns>
        private static DataTable RunSQLReturnTable_201612_SQL(string sql, int pageSize, int pageIdx, string key, string orderKey, string orderType)
        {
            string sqlstr = string.Empty;

            orderType = string.IsNullOrWhiteSpace(orderType) ? "ASC" : orderType.ToUpper();

            if (pageIdx < 1)
                pageIdx = 1;

            if (pageIdx == 1)
            {
                sqlstr = "SELECT TOP " + pageSize + " * FROM (" + sql + ") T1" +
                         (string.IsNullOrWhiteSpace(orderKey)
                              ? string.Empty
                              : string.Format(" ORDER BY T1.{0} {1}", orderKey, orderType));
            }
            else
            {
                sqlstr = "SELECT TOP " + pageSize + " * FROM (" + sql + ") T1"
                         + " WHERE T1." + key + (orderType == "ASC" ? " > " : " < ") + "("
                         + " SELECT " + (orderType == "ASC" ? "MAX(T3." : "MIN(T3.") + key + ") FROM ("
                         + " SELECT TOP ((" + pageIdx + " - 1) * 10) T2." + key + "FROM (" + sql + ") T2"
                         + (string.IsNullOrWhiteSpace(orderKey)
                                ? string.Empty
                                : string.Format(" ORDER BY T2.{0} {1}", orderKey, orderType))
                         + " ) T3)"
                         + (string.IsNullOrWhiteSpace(orderKey)
                                ? string.Empty
                                : string.Format(" ORDER BY T.{0} {1}", orderKey, orderType));
            }

            return RunSQLReturnTable(sqlstr);
        }

        /// <summary>
        /// 通用Oracle查询分页返回DataTable
        /// </summary>
        /// <param name="sql">SQL语句，不带排序（Order By）语句</param>
        /// <param name="pageSize">每页记录数量</param>
        /// <param name="pageIdx">请求页码</param>
        /// <param name="orderKey">排序字段（此字段必须包含在返回字段中）</param>
        /// <param name="orderType">排序方式，ASC/DESC</param>
        /// <returns></returns>
        private static DataTable RunSQLReturnTable_201612_Ora(string sql, int pageSize, int pageIdx, string orderKey, string orderType)
        {
            if (pageIdx < 1)
                pageIdx = 1;

            int start = (pageIdx - 1) * pageSize + 1;
            int end = pageSize * pageIdx;

            orderType = string.IsNullOrWhiteSpace(orderType) ? "ASC" : orderType.ToUpper();

            string sqlstr = "SELECT * FROM ( SELECT T1.*, ROWNUM RN "
                            + "FROM (SELECT * FROM  (" + sql + ") T2 "
                            +
                            (string.IsNullOrWhiteSpace(orderType)
                                 ? string.Empty
                                 : string.Format("ORDER BY T2.{0} {1}", orderKey, orderType)) + ") T1 WHERE ROWNUM <= " +
                            end + " ) WHERE RN >=" + start;

            return RunSQLReturnTable(sqlstr);
        }

        /// <summary>
        /// 通用MySql查询分页返回DataTable
        /// </summary>
        /// <param name="sql">SQL语句，不带排序（Order By）语句</param>
        /// <param name="pageSize">每页记录数量</param>
        /// <param name="pageIdx">请求页码</param>
        /// <param name="key">记录主键（不能为空，不能有重复，必须包含在返回字段中）</param>
        /// <param name="orderKey">排序字段（此字段必须包含在返回字段中）</param>
        /// <param name="orderType">排序方式，ASC/DESC</param>
        /// <returns></returns>
        private static DataTable RunSQLReturnTable_201612_MySql(string sql, int pageSize, int pageIdx, string key, string orderKey, string orderType)
        {
            string sqlstr = string.Empty;
            orderType = string.IsNullOrWhiteSpace(orderType) ? "ASC" : orderType.ToUpper();

            if (pageIdx < 1)
                pageIdx = 1;

            sqlstr = "SELECT * FROM (" + sql + ") T1 WHERE T1." + key + (orderType == "ASC" ? " >= " : " <= ")
                     + "(SELECT T2." + key + " FROM (" + sql + ") T2"
                     + (string.IsNullOrWhiteSpace(orderKey)
                            ? string.Empty
                            : string.Format(" ORDER BY T2.{0} {1}", orderKey, orderType))
                     + " LIMIT " + ((pageIdx - 1) * pageSize) + ",1) LIMIT " + pageSize;

            return RunSQLReturnTable(sqlstr);
        }

        private static bool lockRunSQLReTable = false;
        /// <summary>
        /// 运行SQL
        /// </summary>
        /// <param name="sql">带有参数的SQL语句</param>
        /// <param name="paras">参数</param>
        /// <returns>返回执行结果</returns>
        public static DataTable RunSQLReturnTable(string sql, Paras paras)
        {
            if (DataType.IsNullOrEmpty(sql))
                throw new Exception("要执行的 sql = null ");

            try
            {
                DataTable dt = null;
                switch (AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dt = RunSQLReturnTable_200705_SQL(sql, paras);
                        break;
                    case DBType.Oracle:
                        dt = RunSQLReturnTable_200705_Ora(sql, paras);
                        break;
                    case DBType.DM:
                        dt = RunSQLReturnTable_20191231_DM(sql, paras);
                        break;
                    case DBType.PostgreSQL:
                        dt = RunSQLReturnTable_201902_PSQL(sql, paras);
                        break;
                    case DBType.UX:
                        dt = RunSQLReturnTable_201902_UXQL(sql, paras);
                        break;
                    case DBType.MySQL:
                        dt = RunSQLReturnTable_200705_MySQL(sql, paras);
                        break;
                    case DBType.KingBaseR3:
                    case DBType.KingBaseR6:
                        dt = RunSQLReturnTable_200705_KingBase(sql, paras);
                        break;
                    default:
                        throw new Exception("err@RunSQLReturnTable发现未知的数据库连接类型！");
                }
                return dt;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw ex;
            }
        }

        public static DataTable RunProcReturnTable(string sql, Paras paras)
        {
            if (DataType.IsNullOrEmpty(sql))
                throw new Exception("要执行的 sql = null ");

            try
            {
                DataTable dt = null;
                switch (AppCenterDBType)
                {
                    case DBType.MSSQL:
                        dt = RunProcReturnTable_SQL(sql, paras);
                        break;
                    case DBType.MySQL:
                        dt = RunProcReturnTable_MySQL(sql, paras);
                        break;
                    case DBType.Oracle:
                    case DBType.KingBaseR3:
                    case DBType.KingBaseR6:
                    case DBType.DM:
                    case DBType.PostgreSQL:
                    case DBType.UX:
                        throw new Exception("err@RunProcReturnTable数据库类型还未处理！");
                        break;
                    default:
                        throw new Exception("err@RunProcReturnTable发现未知的数据库连接类型！");
                }
                return dt;
            }
            catch (Exception ex)
            {
                BP.DA.Log.DebugWriteError(ex.Message);
                throw ex;
            }
        }
        #endregion 在当前Connection上执行

        #region 查询单个值的方法.

        #region OleDbConnection
        public static float RunSQLReturnValFloat(Paras ps)
        {
            return RunSQLReturnValFloat(ps.SQL, ps, 0);
        }
        public static float RunSQLReturnValFloat(string sql, Paras ps, float val)
        {
            ps.SQL = sql;
            object obj = DBAccess.RunSQLReturnVal(ps);

            try
            {
                if (obj == null || obj.ToString() == "")
                    return val;
                else
                    return float.Parse(obj.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + sql + " @OBJ=" + obj);
            }
        }
        /// <summary>
        /// 运行sql返回float
        /// </summary>
        /// <param name="sql">要执行的sql,返回一行一列.</param>
        /// <param name="isNullAsVal">如果是空值就返回的默认值</param>
        /// <returns>float的返回值</returns>
        public static float RunSQLReturnValFloat(string sql, float isNullAsVal)
        {
            return RunSQLReturnValFloat(sql, new Paras(), isNullAsVal);
        }
        /// <summary>
        /// sdfsd
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static float RunSQLReturnValFloat(string sql)
        {
            try
            {
                return float.Parse(DBAccess.RunSQLReturnVal(sql).ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + sql);
            }
        }
        public static int RunSQLReturnValInt(Paras ps, int IsNullReturnVal)
        {
            return RunSQLReturnValInt(ps.SQL, ps, IsNullReturnVal);
        }
        /// <summary>
        /// sdfsd
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="IsNullReturnVal"></param>
        /// <returns></returns>
        public static int RunSQLReturnValInt(string sql, int IsNullReturnVal)
        {
            object obj = "";
            obj = DBAccess.RunSQLReturnVal(sql);
            if (obj == null || obj.ToString() == "" || obj == DBNull.Value)
                return IsNullReturnVal;
            else
                return Convert.ToInt32(obj);
        }
        public static int RunSQLReturnValInt(string sql, int IsNullReturnVal, Paras paras)
        {
            object obj = "";

            obj = DBAccess.RunSQLReturnVal(sql, paras);
            if (obj == null || obj.ToString() == "")
                return IsNullReturnVal;
            else
                return Convert.ToInt32(obj);
        }
        public static decimal RunSQLReturnValDecimal(string sql, decimal IsNullReturnVal, int blws)
        {
            Paras ps = new Paras();
            ps.SQL = sql;
            return RunSQLReturnValDecimal(ps, IsNullReturnVal, blws);
        }
        public static decimal RunSQLReturnValDecimal(Paras ps, decimal IsNullReturnVal, int blws)
        {
            try
            {
                object obj = DBAccess.RunSQLReturnVal(ps);
                if (obj == null || obj.ToString() == "")
                    return IsNullReturnVal;
                else
                {
                    decimal d = decimal.Parse(obj.ToString());
                    return decimal.Round(d, blws);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + ps.SQL);
            }
        }
        public static int RunSQLReturnValInt(Paras ps)
        {
            string str = DBAccess.RunSQLReturnString(ps.SQL, ps);
            if (str.Contains("."))
                str = str.Substring(0, str.IndexOf("."));
            try
            {
                return Convert.ToInt32(str);
            }
            catch (Exception ex)
            {
                throw new Exception("@" + ps.SQL + "   Val=" + str + ex.Message);
            }
        }
        public static int RunSQLReturnValInt(string sql)
        {
            object obj = DBAccess.RunSQLReturnVal(sql);
            if (obj == null || obj == DBNull.Value)
                throw new Exception("@没有获取您要查询的数据,请检查SQL:" + sql);

            string s = obj.ToString();
            if (s.Contains("."))
                s = s.Substring(0, s.IndexOf("."));
            return Convert.ToInt32(s);
        }
        public static int RunSQLReturnValInt(string sql, Paras paras)
        {
            return Convert.ToInt32(DBAccess.RunSQLReturnVal(sql, paras));
        }
        public static int RunSQLReturnValInt(string sql, Paras paras, int isNullAsVal)
        {
            try
            {
                return Convert.ToInt32(DBAccess.RunSQLReturnVal(sql, paras));
            }
            catch
            {
                return isNullAsVal;
            }
        }
        public static string RunSQLReturnString(string sql, Paras ps)
        {
            if (ps == null)
                ps = new Paras();
            object obj = DBAccess.RunSQLReturnVal(sql, ps);
            if (obj == DBNull.Value || obj == null)
                return null;
            else
                return obj.ToString();
        }
        /// <summary>
        /// 执行查询返回结果,如果为dbNull 返回 null.
        /// </summary>
        /// <param name="sql">will run sql.</param>
        /// <returns>,如果为dbNull 返回 null.</returns>
        public static string RunSQLReturnString(string sql)
        {
            try
            {
                return RunSQLReturnString(sql, new Paras());
            }
            catch (Exception ex)
            {
                throw new Exception("@运行 RunSQLReturnString出现错误：" + ex.Message + sql);
            }
        }
        public static string RunSQLReturnStringIsNull(Paras ps, string isNullAsVal)
        {
            string v = RunSQLReturnString(ps);
            if (v == null)
                return isNullAsVal;
            else
                return v;
        }
        /// <summary>
        /// 运行sql返回一个值
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="isNullAsVal"></param>
        /// <returns></returns>
        public static string RunSQLReturnStringIsNull(string sql, string isNullAsVal)
        {
            //try{
            string s = RunSQLReturnString(sql, new Paras());
            if (s == null)
                return isNullAsVal;
            return s;
            //}
            //catch (Exception ex)
            //{
            //    Log.DebugWriteInfo("RunSQLReturnStringIsNull@" + ex.Message);
            //    return isNullAsVal;
            //}
        }
        public static string RunSQLReturnString(Paras ps)
        {
            return RunSQLReturnString(ps.SQL, ps);
        }
        #endregion

        #region SqlConnection

        /// <summary>
        /// 查询单个值的方法
        /// </summary>
        /// <param name="sql">sql</param>
        /// <param name="conn">SqlConnection</param>
        /// <param name="sqlType">CommandType</param>
        /// <param name="pars">pars</param>
        /// <returns>object</returns>
        public static object RunSQLReturnVal(string sql, SqlConnection conn, CommandType sqlType, string dsn, params object[] pars)
        {
            object val = null;
            SqlCommand cmd = null;

            try
            {
                if (conn == null)
                {
                    conn = new SqlConnection(dsn);
                    conn.Open();
                }

                if (conn.State != System.Data.ConnectionState.Open)
                {
                    conn.ConnectionString = dsn;
                    conn.Open();
                }

                cmd = new SqlCommand(sql, conn);
                cmd.CommandType = sqlType;
                val = cmd.ExecuteScalar();
            }
            catch (System.Exception ex)
            {
                throw new Exception(ex.Message + " [RunSQLReturnVal on SqlConnection] " + sql);
            }
            finally
            {
                if (cmd != null)
                    cmd.Dispose();
                if (conn != null)
                    conn.Close();
            }

            return val;
        }
        #endregion


        #region 在当前的Connection执行 SQL 语句，返回首行首列
        public static int RunSQLReturnCOUNT(string sql)
        {
            return RunSQLReturnTable(sql).Rows.Count;
            //return RunSQLReturnVal( sql ,sql, sql );
        }


        public static object RunSQLReturnVal(string sql, Paras paras)
        {
            RunSQLReturnTableCount++;
            DataTable dt = null;
            switch (BP.Difference.SystemConfig.AppCenterDBType)
            {
                case DBType.Oracle:
                    dt = DBAccess.RunSQLReturnTable_200705_Ora(sql, paras);
                    break;
                case DBType.DM:
                    dt = DBAccess.RunSQLReturnTable_20191231_DM(sql, paras);
                    break;
                case DBType.MSSQL:
                    dt = DBAccess.RunSQLReturnTable_200705_SQL(sql, paras);
                    break;
                case DBType.MySQL:
                    dt = DBAccess.RunSQLReturnTable_200705_MySQL(sql, paras);
                    break;
                case DBType.PostgreSQL:
                    dt = DBAccess.RunSQLReturnTable_201902_PSQL(sql, paras);
                    break;
                case DBType.UX:
                    dt = DBAccess.RunSQLReturnTable_201902_UXQL(sql, paras);
                    break;
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    dt = DBAccess.RunSQLReturnTable_200705_KingBase(sql, paras);
                    break;
                default:
                    throw new Exception("@没有判断的数据库类型");
            }

            if (dt.Rows.Count == 0)
                return null;
            return dt.Rows[0][0];
        }
        public static object RunSQLReturnVal(Paras ps)
        {
            return RunSQLReturnVal(ps.SQL, ps);
        }
        public static object RunSQLReturnVal(string sql)
        {
            RunSQLReturnTableCount++;
            DataTable dt = null;
            switch (BP.Difference.SystemConfig.AppCenterDBType)
            {
                case DBType.Oracle:
                    dt = DBAccess.RunSQLReturnTable_200705_Ora(sql, new Paras());
                    break;
                case DBType.DM:
                    dt = DBAccess.RunSQLReturnTable_20191231_DM(sql, new Paras());
                    break;
                case DBType.MSSQL:
                    dt = DBAccess.RunSQLReturnTable_200705_SQL(sql, new Paras());
                    break;
                case DBType.PostgreSQL:
                    dt = DBAccess.RunSQLReturnTable_201902_PSQL(sql, new Paras());
                    break;
                case DBType.UX:
                    dt = DBAccess.RunSQLReturnTable_201902_UXQL(sql, new Paras());
                    break;

                case DBType.MySQL:
                    dt = DBAccess.RunSQLReturnTable_200705_MySQL(sql, new Paras());
                    break;

                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    dt = DBAccess.RunSQLReturnTable_200705_KingBase(sql, new Paras());
                    break;
                default:
                    throw new Exception("@没有判断的数据库类型");
            }
            if (dt.Rows.Count == 0)
                return null;
            return dt.Rows[0][0];
        }
        #endregion

        #endregion

        #region 检查是不是存在
        /// <summary>
        /// 检查是不是存在
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns>检查是不是存在</returns>
        public static bool IsExits(string sql)
        {
            if (sql.ToUpper().Contains("SELECT") == false)
                throw new Exception("@非法的查询语句:" + sql);

            if (RunSQLReturnVal(sql) == null)
                return false;
            return true;
        }
        public static bool IsExits(string sql, Paras ps)
        {
            if (RunSQLReturnVal(sql, ps) == null)
                return false;
            return true;
        }

        /// <summary>
        /// 获得table的主键
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>主键名称、没有返回为空.</returns>
        public static string GetTablePKName(string table)
        {
            Paras ps = new Paras();
            string sql = "";
            switch (AppCenterDBType)
            {
                case DBType.Access:
                    return null;
                case DBType.MSSQL:
                    sql = "SELECT CONSTRAINT_NAME,column_name FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE table_name =@Tab ";
                    ps.Add("Tab", table);
                    break;
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                case DBType.DM:
                    sql = "SELECT constraint_name, constraint_type,search_condition, r_constraint_name  from user_constraints WHERE table_name = upper(:tab) AND constraint_type = 'P'";
                    ps.Add("Tab", table);
                    break;
                case DBType.MySQL:
                    sql = "SELECT CONSTRAINT_NAME , column_name, table_name CONSTRAINT_NAME from INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE table_name =@Tab and table_schema='" + BP.Difference.SystemConfig.AppCenterDBDatabase + "' ";
                    ps.Add("Tab", table);
                    break;
                case DBType.Informix:
                    sql = "SELECT * FROM sysconstraints c inner join systables t on c.tabid = t.tabid where t.tabname = lower(?) and constrtype = 'P'";
                    ps.Add("Tab", table);
                    break;
                case DBType.PostgreSQL:
                case DBType.UX:
                    sql = " SELECT ";
                    sql += " pg_constraint.conname AS pk_name ";
                    sql += " FROM ";
                    sql += " pg_constraint ";
                    sql += " INNER JOIN pg_class ON pg_constraint.conrelid = pg_class.oid ";
                    sql += " WHERE ";
                    sql += " pg_class.relname =:Tab ";
                    sql += " AND pg_constraint.contype = 'p' ";
                    ps.Add("Tab", table.ToLower());
                    break;
                default:
                    throw new Exception("@GetTablePKName没有判断的数据库类型.");
            }

            DataTable dt = DBAccess.RunSQLReturnTable(sql, ps);
            if (dt.Rows.Count == 0)
                return null;
            return dt.Rows[0][0].ToString();
        }
        /// <summary>
        /// 判断是否存在主键pk .
        /// </summary>
        /// <param name="tab">物理表</param>
        /// <returns>是否存在</returns>
        public static bool IsExitsTabPK(string tab)
        {
            if (DBAccess.GetTablePKName(tab) == null)
                return false;
            else
                return true;
        }
        /// <summary>
        /// 是否是view 
        /// </summary>
        /// <param name="tabelOrViewName"></param>
        /// <returns></returns>
        public static bool IsView(string tabelOrViewName)
        {
            return IsView(tabelOrViewName, BP.Difference.SystemConfig.AppCenterDBType);
        }
        /// <summary>
        /// 是否是view
        /// </summary>
        /// <param name="tabelOrViewName"></param>
        /// <returns></returns>
        public static bool IsView(string tabelOrViewName, DBType dbType)
        {
            //if (dbType == null) dbType是Enum，永远不会为null. 张磊 2019-7-24
            //    dbType =  BP.Difference.SystemConfig.AppCenterDBType;

            string sql = "";
            switch (dbType)
            {
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    sql = "Select count(*) as nm From user_objects Where object_type='VIEW' and object_name=:v";
                    DataTable Oracledt = DBAccess.RunSQLReturnTable(sql, "v", tabelOrViewName.ToUpper());
                    if (Oracledt.Rows[0]["nm"].ToString() == "1")
                        return true;
                    else
                        return false;
                case DBType.DM:
                    sql = "SELECT TABTYPE  FROM TAB WHERE UPPER(TNAME)=:v";
                    DataTable oradt = DBAccess.RunSQLReturnTable(sql, "v", tabelOrViewName.ToUpper());
                    if (oradt.Rows.Count == 0)
                        return false;

                    if (oradt.Rows[0][0].ToString().ToUpper().Trim() == "V")
                        return true;
                    else
                        return false;

                case DBType.MSSQL:
                    sql = "select xtype from sysobjects WHERE name =" + BP.Difference.SystemConfig.AppCenterDBVarStr + "v";
                    DataTable dt1 = DBAccess.RunSQLReturnTable(sql, "v", tabelOrViewName);
                    if (dt1.Rows.Count == 0)
                        return false;

                    if (dt1.Rows[0][0].ToString().ToUpper().Trim().Equals("V") == true)
                        return true;
                    else
                        return false;
                case DBType.PostgreSQL:
                case DBType.UX:
                    sql = "select relkind from pg_class WHERE relname ='" + tabelOrViewName + "'";
                    DataTable dt3 = DBAccess.RunSQLReturnTable(sql);
                    if (dt3.Rows.Count == 0)
                        return false;

                    //如果是个表.
                    if (dt3.Rows[0][0].ToString().ToLower().Trim().Equals("r") == true)
                        return false;
                    else
                        return true;
                case DBType.Informix:
                    sql = "select tabtype from systables where tabname = '" + tabelOrViewName.ToLower() + "'";
                    DataTable dtaa = DBAccess.RunSQLReturnTable(sql);
                    if (dtaa.Rows.Count == 0)
                        throw new Exception("@表不存在[" + tabelOrViewName + "]");

                    if (dtaa.Rows[0][0].ToString().ToUpper().Trim() == "V")
                        return true;
                    else
                        return false;
                case DBType.MySQL:
                    sql = "SELECT Table_Type FROM information_schema.TABLES WHERE table_name='" + tabelOrViewName + "' and table_schema='" + BP.Difference.SystemConfig.AppCenterDBDatabase + "'";
                    DataTable dt2 = DBAccess.RunSQLReturnTable(sql);
                    if (dt2.Rows.Count == 0)
                        return false;

                    if (dt2.Rows[0][0].ToString().ToUpper().Trim() == "VIEW")
                        return true;
                    else
                        return false;
                case DBType.Access:
                    sql = "select   Type   from   msysobjects  WHERE  UCASE(name)='" + tabelOrViewName.ToUpper() + "'";
                    DataTable dtw = DBAccess.RunSQLReturnTable(sql);
                    if (dtw.Rows.Count == 0)
                        return false;

                    if (dtw.Rows[0][0].ToString().Trim() == "5")
                        return true;
                    else
                        return false;
                default:
                    throw new Exception("@没有做的判断。");
            }

        }
        /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static bool IsExitsObject(string obj)
        {
            if (DataType.IsNullOrEmpty(obj) == true)
                return false;

            obj = obj.Trim();

            return IsExitsObject(new DBUrl(DBUrlType.AppCenterDSN), obj);
        }
        /// <summary>
        /// 判断系统中是否存在对象.
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public static bool IsExitsObject(DBUrl dburl, string obj)
        {
            //有的同事写的表名包含dbo.导致创建失败.
            obj = obj.Replace("dbo.", "");
            obj = obj.Trim();

            // 增加参数.
            Paras ps = new Paras();
            ps.Add("obj", obj);

            switch (AppCenterDBType)
            {
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                case DBType.DM:
                    if (obj.IndexOf(".") != -1)
                        obj = obj.Split('.')[1];
                    return IsExits("select object_name from all_objects WHERE  object_name = upper(:obj) and OWNER='" + DBAccess.ConnectionUserID.ToUpper() + "' ", ps);
                case DBType.MSSQL:
                    return IsExits("SELECT name FROM sysobjects WHERE name = '" + obj + "'");
                case DBType.PostgreSQL:
                case DBType.UX:
                    return IsExits("SELECT relname FROM pg_class WHERE relname = '" + obj.ToLower() + "'");
                case DBType.Informix:
                    return IsExits("select tabname from systables where tabname = '" + obj.ToLower() + "'");
                case DBType.MySQL:

                    /*如果不是检查的PK.*/
                    if (obj.IndexOf(".") != -1)
                        obj = obj.Split('.')[1];

                    // *** 屏蔽到下面的代码, 不需要从那个数据库里取，jflow 发现的bug  edit by :zhoupeng   2016.01.26 for fuzhou.
                    return IsExits("SELECT table_name, table_type FROM information_schema.tables  WHERE  table_name = '" + obj + "' AND TABLE_SCHEMA='" + BP.Difference.SystemConfig.AppCenterDBDatabase + "' ");

                case DBType.Access:
                    //return false ; //IsExits("SELECT * FROM MSysObjects WHERE (((MSysObjects.Name) =  '"+obj+"' ))");
                    return IsExits("SELECT * FROM MSysObjects WHERE Name =  '" + obj + "'");
                default:
                    throw new Exception("没有识别的数据库编号");
            }

        }
        /// <summary>
        ///是否存在索引？
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="indexName">索引名称</param>
        /// <returns>是否存在索引？</returns>
        public static bool IsExitsTableIndex(string table, string indexName)
        {
            string sql = "";

            int i = 0;
            switch (DBAccess.AppCenterDBType)
            {
                case DBType.MSSQL:
                    i = DBAccess.RunSQLReturnValInt("SELECT COUNT(*) FROM sys.indexes  WHERE object_id=OBJECT_ID('" + table + "', N'U') and NAME='" + indexName + "'", 0);
                    break;
                case DBType.MySQL:
                    sql = "SELECT count(*) FROM information_schema.statistics WHERE table_schema='" + BP.Difference.SystemConfig.AppCenterDBDatabase + "' AND table_name = '" + table + "' AND index_name = '" + indexName + "' ";
                    i = DBAccess.RunSQLReturnValInt(sql);
                    break;
                case DBType.PostgreSQL:
                case DBType.UX:
                    sql = "SELECT count(*) FROM pg_indexes WHERE  tablename = '" + table.ToLower() + "' ";
                    //string sql1 = "select count(*) from information_schema.statistics where   table_name ='" + table.ToLower() + "' and  index_name='" + indexName.ToLower() + "'";
                    i = DBAccess.RunSQLReturnValInt(sql);

                    break;
                case DBType.DM:
                    if (table.IndexOf(".") != -1)
                        table = table.Split('.')[1];
                    i = DBAccess.RunSQLReturnValInt("SELECT COUNT(*) from user_indexes   WHERE table_name= upper('" + table + "') ");
                    break;
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    if (table.IndexOf(".") != -1)
                        table = table.Split('.')[1];
                    i = DBAccess.RunSQLReturnValInt("SELECT COUNT(*) from user_indexes   WHERE table_name= upper('" + table + "') ");
                    break;

                default:
                    throw new Exception("err@IsExitsTableCol没有判断的数据库类型.");
            }

            if (i >= 1)
                return true;
            else
                return false;
        }
        /// <summary>
        /// 表中是否存在指定的列
        /// </summary>
        /// <param name="table">表名</param>
        /// <param name="col">列名</param>
        /// <returns>是否存在</returns>
        public static bool IsExitsTableCol(string table, string col)
        {
            Paras ps = new Paras();
            ps.Add("tab", table);
            ps.Add("col", col);

            int i = 0;
            switch (DBAccess.AppCenterDBType)
            {
                case DBType.MSSQL:
                    i = DBAccess.RunSQLReturnValInt("SELECT COUNT(*) FROM information_schema.COLUMNS  WHERE TABLE_NAME='" + table + "' AND COLUMN_NAME='" + col + "'", 0);
                    break;
                case DBType.MySQL:
                    string sql = "select count(*) FROM information_schema.columns WHERE TABLE_SCHEMA='" + BP.Difference.SystemConfig.AppCenterDBDatabase + "' AND table_name ='" + table + "' and column_Name='" + col + "'";
                    i = DBAccess.RunSQLReturnValInt(sql);
                    break;
                case DBType.PostgreSQL:
                case DBType.UX:
                    string sql1 = "select count(*) from information_schema.columns where   table_name ='" + table.ToLower() + "' and  column_name='" + col.ToLower() + "'";
                    i = DBAccess.RunSQLReturnValInt(sql1);
                    break;
                case DBType.Oracle:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                case DBType.DM:
                    if (table.IndexOf(".") != -1)
                        table = table.Split('.')[1];
                    i = DBAccess.RunSQLReturnValInt("SELECT COUNT(*) from user_tab_columns  WHERE table_name= upper(:tab) AND column_name= upper(:col) ", ps);
                    break;
                //case DBType.Informix:
                //    i = DBAccess.RunSQLReturnValInt("select count(*) from syscolumns c where tabid in (select tabid	from systables	where tabname = lower('" + table + "')) and c.colname = lower('" + col + "')", 0);
                //    break;
                //case DBType.Access:
                //    return false;
                //    break;
                default:
                    throw new Exception("err@IsExitsTableCol没有判断的数据库类型.");
            }

            if (i == 1)
                return true;
            else
                return false;
        }
        #endregion

        /// <summary>
        /// 获得表的基础信息，返回如下列:
        /// 1, 字段名称，字段描述，字段类型，字段长度.
        /// </summary>
        /// <param name="tableName">表名</param>
        public static DataTable GetTableSchema(string tableName, bool isUpper = true)
        {
            string sql = "";
            switch (BP.Difference.SystemConfig.AppCenterDBType)
            {
                case DBType.MSSQL:
                    sql = "SELECT column_name as FNAME, data_type as FTYPE, CHARACTER_MAXIMUM_LENGTH as FLEN , column_name as FDESC FROM information_schema.columns where table_name='" + tableName + "'";
                    break;
                case DBType.Oracle:
                case DBType.DM:
                case DBType.KingBaseR3:
                case DBType.KingBaseR6:
                    sql = "SELECT COLUMN_NAME as FNAME,DATA_TYPE as FTYPE,DATA_LENGTH as FLEN,COLUMN_NAME as FDESC FROM all_tab_columns WHERE table_name = upper('" + tableName + "')";
                    break;
                case DBType.MySQL:
                    sql = "SELECT COLUMN_NAME FNAME,DATA_TYPE FTYPE,CHARACTER_MAXIMUM_LENGTH FLEN,COLUMN_COMMENT FDESC FROM information_schema.columns WHERE table_name='" + tableName + "' and TABLE_SCHEMA='" + BP.Difference.SystemConfig.AppCenterDBDatabase + "'";
                    break;
                default:
                    break;
            }

            DataTable dt = DBAccess.RunSQLReturnTable(sql);
            if (isUpper == false)
            {
                dt.Columns["FNAME"].ColumnName = "FName";
                dt.Columns["FTYPE"].ColumnName = "FType";
                dt.Columns["FLEN"].ColumnName = "FLen";
                dt.Columns["FDESC"].ColumnName = "FDesc";
            }
            return dt;
        }
        #region LoadConfig
        public static void LoadConfig(string cfgFile, string basePath)
        {
            if (!File.Exists(cfgFile))
                throw new Exception("找不到配置文件==>[" + cfgFile + "]1");

            StreamReader read = new StreamReader(cfgFile);
            string firstline = read.ReadLine();
            string cfg = read.ReadToEnd();
            read.Close();

            int start = cfg.ToLower().IndexOf("<appsettings>");
            int end = cfg.ToLower().IndexOf("</appsettings>");

            cfg = cfg.Substring(start, end - start + "</appsettings".Length + 1);

            cfgFile = basePath + "\\__$AppConfig.cfg";
            StreamWriter write = new StreamWriter(cfgFile);
            write.WriteLine(firstline);
            write.Write(cfg);
            write.Flush();
            write.Close();

            DataSet dscfg = new DataSet("cfg");
            try
            {
                dscfg.ReadXml(cfgFile);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //  SystemConfig.CS_AppSettings = new System.Collections.Specialized.NameValueCollection();
            SystemConfig.CS_DBConnctionDic.Clear();
            foreach (DataRow row in dscfg.Tables["add"].Rows)
            {
                SystemConfig.CS_AppSettings.Add(row["key"].ToString().Trim(), row["value"].ToString().Trim());
            }
            dscfg.Dispose();

            SystemConfig.IsBSsystem = false;
        }


        #endregion
    }
}
