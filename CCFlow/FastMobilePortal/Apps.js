function GenerDoc(menu) {
    return menu;
}

new Vue({
    el: '#flow',
    data: {
        flowNodes: [],
        expandAll: false,
        selectedTopMenuIndex: '',
        loadingDialog: false,
        menuTreeData: [], // 目录数据
        subMenuData: [], // 二级目录数据      
    },
    watch: {
        expandAll(val) {
            this.expandMenus(val)
        }
    },
    methods: {
        expandAssignMenu: function () {
            var sysNo = GetQueryString('SystemNo')
            var moduleNo = GetQueryString('ModuleNo')
            if (!sysNo) return
            for (var i = 0; i < this.flowNodes.length; i++) {
                var system = this.flowNodes[i]
                if (system.No === sysNo) {
                    system.open = true
                    if (!moduleNo) {
                        system.children.forEach(function (item) {
                            item.open = true
                        })
                    } else {
                        for (var j = 0; j < system.children.length; j++) {
                            var module = system.children[j]
                            if (module.No === moduleNo) {
                                module.open = true
                            }
                        }
                    }
                }
            }

        },
       
    },
    mounted: function () {
        // fix firefox bug
        document.body.ondrop = function (event) {
            event.preventDefault();
            event.stopPropagation();
        }

        var systems = new Entities("BP.GPM.Menu2020.MySystems");
        systems.RetrieveAll();
        systems = obj2arr(systems)

        //模块.
        var modules = new Entities("BP.GPM.Menu2020.Modules");
        modules.RetrieveAll();

        for (var i = 0; i < modules.length; i++) {
            var en = modules[i];
            if (en.Icon === "")
                modules[i].Icon = "icon-folder";
        }
        modules = obj2arr(modules);

        //菜单.
        var menus = new Entities("BP.GPM.Menu2020.Menus");
        menus.RetrieveAll();
        menus = obj2arr(menus);

        for (var i = 0; i < systems.length; i++) {
            var sys = systems[i];
            sys.open = false
            sys.children = []
            var childModules = modules.filter(function (module) {
                // return module.SystemNo === ''
                return module.SystemNo === sys.No
            })
            for (var j = 0; j < childModules.length; j++) {
                var module = childModules[j]
                module.open = false
              
                module.children = menus.filter(function (menu) {
                    return menu.ModuleNo == module.No
                })

            }
            sys.children = childModules;
        }

        this.flowNodes = systems;
        this.expandAssignMenu()
        this.selectedTopMenuIndex = GetQueryString("SystemNo");//  urlGet()
        console.log(this.selectedTopMenuIndex)
    }
})


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
function urlGet() {
    var aQuery = window.location.href.split("?");  //取得Get参数
    var aGET = new Array();
    if (aQuery.length > 1) {
        var aBuf = aQuery[1].split("&");
        for (var i = 0, iLoop = aBuf.length; i < iLoop; i++) {
            var aTmp = aBuf[i].split("=");  //分离key与Value
            aGET[aTmp[0]] = aTmp[1];
        }
    }
    return aGET['tabnum']
}
