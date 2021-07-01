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


    $("#select_visitorname").click(function(){
        //得到input的值
        var info=$("#select_option").val()
        //设置linkToCart的href的值
        if(info==""){
            alert("请输入访客姓名");
            //设置linkToCart的href的值
            return false;
        }else {
            //设置linkToCart的href的值
            $("#select_visitorname").attr("href","/ssm2/select_visitorname?visitor_name="+info);
        }

    });



};


var All = document.getElementsByName("selectall");
var obj = document.getElementsByName("visitorID");//将复选框定义成一个jquery对象
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

    $("input[name='visitorID']").each(function () {//获取复选框节点id
        if (this.checked == true) {
            Checkbox = true;    //已勾选
        }
    });

    if (All.checked) {
        var t = confirm("您确认要删除选中的内容吗？");//弹出对话进行警告
        if (t == false) return false;    //不勾选不处理

        $.ajax({//利用ajax发出请求
            type: "POST",//post类型
            url: 'http://localhost:8080/ssm2/deleteVisitorSelect?visitorids=' + check_val, //向Controller里的deleteSelect传输ids
            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
                if (data == "ok") {
                    alert("删除成功！");//返回ok后弹出一个对话框。
                    location.href = "http://localhost:8080/ssm2/visitor";//相当于刷新界面
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
            url: 'http://localhost:8080/ssm2/deleteVisitorSelect?visitorids=' + check_val, //向Controller里的deleteSelect传输ids
            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
                if (data == "ok") {
                    alert("删除成功！");//返回ok后弹出一个对话框。
                    location.href = "http://localhost:8080/ssm2/visitor";//相当于刷新界面
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


function visitor_update(update_id) {
    $.ajax({
        url: "http://localhost:8080/ssm2/update_visitor_id"+'?id='+update_id,
        type: "post",
        data: {"id":update_id},
        success:function (data) {
            //传递过来的是json格式的字符串，需要解析为json对象
            var data = $.parseJSON(data);
            $('#visitor_id1').val(data.account.id);
            $('#visitor_name1').val(data.account.visitor_name);
            $('#visitor_dormitory1').val(data.account.visitor_dormitory);
            $('#visit_studentname1').val(data.account.visit_studentname);
            $('#visitor_relation1').val(data.account.visitor_relation);
            $('#visitor_reason1').val(data.account.visitor_reason);
            $('#visitor_telephone1').val(data.account.visitor_telephone);
            $('#visitor_cometime1').val(data.account.visitor_cometime);
            $('#visitor_leavetime1').val(data.account.visitor_leavetime);
        },
        error:function () {
            alert("Aja失败了");
        }
    });

}




function selecton(){
    var sno =document.getElementById('visitorid').value;
    if(sno.length!=10){
        alert("输入正确的学号格式")
    }
    $.ajax({
        url: "http://localhost:8080/ssm2/selectone"+'?sno='+sno,
        type: "post",
        data: {"sno":sno},
        success:function (data) {
            //传递过来的是json格式的字符串，需要解析为json对象\
            alert("该学号已存在");

        },

    });
}

function tel(){
    alert("ss")
    var tel =document.getElementById('tel').value;
    if(tel.length!=11){
        alert("手机号错误")
    }

}













function ww(){
    $.ajax({
        url: "http://localhost:8080/ssm2/update"+'?sno='+update_sno,
        type: "post",
        data: {"sno":update_sno},
        success:function (data) {
            //传递过来的是json格式的字符串，需要解析为json对象
            alert("该学号已存在");

        },
        error:function () {
            alert("Aja失败了");
        }
    });
}

