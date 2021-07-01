window.onload= function () {

    var AllMenuLi=document.getElementsByClassName('first');
    var i=0;
    for(i=0;i<AllMenuLi.length;i++)
    {
        AllMenuLi[i].onclick= function () {
//              alert("sss");
            var UlMenuLi=this.getElementsByTagName("ul")[0];
            if(UlMenuLi.className=='menu')
            {
                UlMenuLi.className='';
            }
            else {
                UlMenuLi.className='menu';
            }
        };
    }


    $("#select_attendant").click(function(){
        //得到input的值
        var info=$("#select_option").val()
        //设置linkToCart的href的值
        if(info==""){
            alert("请输入姓名");
            //设置linkToCart的href的值
            return false;
        }else {
            //设置linkToCart的href的值
            $("#select_attendant").attr("href","/ssm2/selectAttendant?attendant="+info);
        }
    });


};




var All = document.getElementsByName("selectall");
var obj = document.getElementsByName("faultIds");//将复选框定义成一个jquery对象
var check_val  = [];//定义一个数组
var Checkbox=false;
All.checked=false;


function selectall() {
    All.checked=true;
    if(All.checked==true){
        for(var i=0;i<obj.length;i++){
            //所有的选择框和全选一致
            obj[i].checked=All.checked;
        }
    }


    for (var k in obj) {//k相当于i,往这个jquery对象添加勾选的id;
        if (obj[k].checked)//选中的都放进 数组里
            check_val.push(obj[k].value);
    }

};


function todelect() {


    $("input[name='faultIds']").each(function () {//获取复选框节点id
        if (this.checked == true) {
            Checkbox = true;    //已勾选
        }
    });

    if (All.checked) {
        var t = confirm("您确认要删除选中的内容吗？");//弹出对话进行警告
        if (t == false) return false;    //不勾选不处理

        $.ajax({//利用ajax发出请求
            url: 'http://localhost:8080/ssm2/deletedormitroyfault?faultids=' + check_val, //向Controller里的deleteSelect传输ids
            type: "post",//post类型
            data:{"data":check_val},
            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
                if (data == "ok") {
                    alert("删除成功！");//返回ok后弹出一个对话框。
                    location.href = "http://localhost:8080/ssm2/dormitoryFaultInformation";//相当于刷新界面
                }
            }
        });
    }



    else if (Checkbox) {//boolean值为true

        var t = confirm("您确认要删除选中的内容吗？");//弹出对话进行警告
        if (t == false) return false;    //不勾选不处理
        for (var k in obj) {//k相当于i,往这个jquery对象添加勾选的id;
            if (obj[k].checked)//选中的都放进 数组里
                check_val.push(obj[k].value);
        }

        $.ajax({//利用ajax发出请求
            type: "POST",//post类型
            url: 'http://localhost:8080/ssm2/deletedormitroyfault?faultids=' + check_val, //向Controller里的deleteSelect传输ids
            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
                if (data == "ok") {
                    alert("删除成功！");//返回ok后弹出一个对话框。
                    location.href = "http://localhost:8080/ssm2/dormitoryFaultInformation";//相当于刷新界面
                }
            }
        });

    } else {
        alert("请选择您要删除的内容!");//不勾选不提交，弹出警告框。
        return false;
    }
}


function toupdate() {
    alert("请选择您要更新的内容!");//不勾选不提交，弹出警告框。
    return false;
}


function fault_update(update_faultId) {
    $.ajax({
        url: "http://localhost:8080/ssm2/update_faultId"+'?faultId='+update_faultId,
        type: "post",
        data: {"faultId":update_faultId},
        success:function (data) {
            //传递过来的是json格式的字符串，需要解析为json对象

            var data = $.parseJSON(data);
            $('#faultId1').val(data.account.faultId);
            $('#dormitory1').val(data.account.dormitory);
            $('#dorm1').val(data.account.dorm);
            $('#fault1').val(data.account.fault);
        },
        error:function () {
            alert("Aja失败了");
        }
    });

}

