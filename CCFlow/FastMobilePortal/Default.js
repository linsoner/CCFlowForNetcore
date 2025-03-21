﻿
new Vue({
    el: '#apps-home',
    data: {
        stateColumn: [],
        commonColumn: [],
        historyFlow: [],
        MyStart_Runing: 0,
        Todolist_EmpWorks: 0,
        todoNums: []
    },
    methods: {
        //打开菜单.
        OpenMenu: function (no) {

            var menu = new Entity("BP.GPM.Menu2020.Menu", no);
            menu = DealMenuUrlSelf(menu);

            if (menu.Url == undefined)
                return;

            window.open(menu.Url)
            // window.location.href = menu.Url;
        },
        OpenApps: function (systemNo) {

            /* var menu = new Entity("BP.GPM.Menu2020.Menu", no);
             menu = DealMenuUrlSelf(menu);
             if (menu.Url == undefined)
                 return;
             window.open(menu.Url)*/

            window.location.href = 'Apps.htm?SystemNo=' + systemNo;

        },
    },

    mounted: function () {

        //查询出来当前的系统数.  No, Name,Icon 三个列.
        var todoNums = new Entities("BP.GPM.Menu2020.MySystems");
        todoNums.RetrieveAll();
        todoNums = obj2arr(todoNums);
        for (var i = 0; i < todoNums.length; i++) {
            var en = todoNums[i];
            if (en.Icon === "")
                todoNums[i].Icon = "icon-folder";
        }
        //最新使用的流程. FK_Flow,FlowName,Icon 三个列.//最近发起的流程
        var handler = new HttpHandler("BP.CCBill.WF_CCBill_Portal");
        flows = handler.DoMethodReturnJSON("Default_FlowsNearly");
        // console.log(flows);
        // flows.RetrieveAll();

        for (var i = 0; i < flows.length; i++) {
            var fen = flows[i];
            if (fen.Icon === "")
                flows[i].Icon = "icon-folder";
        }
        flows = obj2arr(flows);
        //top获得待办的数量:  Todolist_Draft=草稿,MyStart_Runing=运行中.,MyStart_Complete=已完成,Todolist_EmpWorks=待办数量.
        var handler = new HttpHandler("BP.CCBill.WF_CCBill_Portal");
        infoNums = handler.DoMethodReturnJSON("Default_TodoNums");
        //console.log(todoNums);
        // todoNums.RetrieveAll();
        //todoNums = obj2arr(todoNums);
        this.MyStart_Runing = infoNums.MyStart_Runing;
        //console.log(this.MyStart_Runing);
        this.Todolist_EmpWorks = infoNums.Todolist_EmpWorks;
        //console.log(this.Todolist_EmpWorks);

        //菜单JSON.:  No,Name,Icon
        var menus = handler.DoMethodReturnJSON("Default_MenusOfFlag");
        //console.log(menus);

        this.commonColumn = menus;
        this.historyFlow = flows;
        this.todoNums = todoNums;

        // console.log(systems);
    }
});


function obj2arr(obj) {
    delete obj.Paras
    delete obj.ensName
    delete obj.length
    var arr = []
    for (var key in obj) {
        if (Object.hasOwnProperty.call(obj, key)) {
            arr.push(obj[key]);
        }
    }
    return arr
}


//处理 url 根据 MenuModel 菜单类型 解析url.
function DealMenuUrlSelf(menu) {


    if (menu.Icon == "" || menu.Icon == null) menu.Icon = "icon-clock";

    var basePath = "";

    //如果是修改基础数据..
    if (menu.MenuModel === "FlowBaseData" || menu.MenuModel === "FlowEtc") {

        if (menu.Mark == "Todolist")
            menu.Url = basePath + "/WF/Todolist.htm?FK_Flow=" + menu.Tag1;

        if (menu.Mark == "Runing")
            menu.Url = basePath + "/WF/Runing.htm?FK_Flow=" + menu.Tag1;

        if (menu.Mark == "Start") {
            menu.Url = basePath + "/WF/MyFlow.htm?FK_Flow=" + menu.Tag1;
            menu.Icon = "icon-planct";
        }

        if (menu.Mark == "FlowSearch")
            menu.Url = basePath + "/WF/Search.htm?FK_Flow=" + menu.Tag1;

        if (menu.Mark == "FlowGroup")
            menu.Url = basePath + "/WF/Group.htm?FK_Flow=" + menu.Tag1;

        return menu;
    }

    //新建实体.
    if (menu.MenuModel == "FlowNewEntity") {
        if (menu.Mark == "StartFlow")
            menu.Url = basePath + "/WF/CCBill/Opt/StartFlowByNewEntity.htm?FK_Flow=" + menu.Tag1 + "&MenuNo=" + menu.No;
        return menu;
    }

    if (menu.MenuModel == "FlowSearch") {
        menu.Url = basePath + "/WF/Search.htm?FK_Flow=" + menu.Tag;
        return menu;
    }

    if (menu.MenuModel === "Dict") {
        if (menu.ListModel === 0) //如果是批量编辑模式.
            menu.Url = basePath + "/WF/CCBill/SearchEditer.htm?FrmID=" + menu.UrlExt;
        else
            menu.Url = basePath + "/WF/CCBill/SearchDict.htm?FrmID=" + menu.UrlExt;
        return menu;
    }

    //流程菜单.
    if (menu.MenuModel == "FlowUrl") {
        // menu.Url = basePath + "/WF/" + menu.Url;
        menu.Url = basePath + "/WF/" + menu.UrlExt;
        return menu;
    }

    if (menu.MenuModel == "DictTable") {
        url = basePath + "/WF/Admin/FoolFormDesigner/SFTableEditData.htm?FK_SFTable=" + menu.UrlExt + "&QueryType=Dict";
        menu.Url = url;
        return menu;
    }

    if (menu.MenuModel === "Bill") {
        menu.Url = basePath + "/WF/CCBill/SearchBill.htm?FrmID=" + menu.UrlExt;
        return menu;
    }

    //独立功能.
    if (menu.MenuModel === "Func" || menu.MenuModel === "StandAloneFunc") {
        menu.Url = basePath + "/WF/CCBill/Sys/Func.htm?FuncNo=" + menu.UrlExt;
        return menu;
    }

    alert('没有判断的模式:' + menu.MenuModel);
    return menu;
}