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

    $("#select_sno").click(function(){
        //得到input的值
        var info=$("#select_option").val()
        if(info==""){
            alert("请输入学号");
            //设置linkToCart的href的值
            return false;
        }else {
            //设置linkToCart的href的值
            $("#select_sno").attr("href", "/ssm2/selectSno?sno=" + info);
        }
    });


    $("#select_dormitory").click(function(){
        //得到input的值
        var info=$("#select_option").val();
        if(info==""){
            alert("请输入公寓");
            //设置linkToCart的href的值
            return false;
        }else{
            //设置linkToCart的href的值
            $("#select_dormitory").attr("href","/ssm2/selectDormitory?dormitory="+info);
        }



    });


};


var All = document.getElementsByName("selectall");
var obj = document.getElementsByName("Sno");//将复选框定义成一个jquery对象
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

    $("input[name='Sno']").each(function () {//获取复选框节点id
        if (this.checked == true) {
            Checkbox = true;    //已勾选
        }
    });

    if (All.checked) {
        var t = confirm("您确认要删除选中的内容吗？");//弹出对话进行警告
        if (t == false) return false;    //不勾选不处理

        $.ajax({//利用ajax发出请求
            type: "POST",//post类型
            url: 'http://localhost:8080/ssm2/deleteSelect?ids=' + check_val, //向Controller里的deleteSelect传输ids
            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
                if (data == "ok") {
                    alert("删除成功！");//返回ok后弹出一个对话框。
                    location.href = "http://localhost:8080/ssm2/stu_list";//相当于刷新界面
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
            url: 'http://localhost:8080/ssm2/deleteSelect?ids=' + check_val, //向Controller里的deleteSelect传输ids
            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
                if (data == "ok") {
                    alert("删除成功！");//返回ok后弹出一个对话框。
                    location.href = "http://localhost:8080/ssm2/stu_list";//相当于刷新界面
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





//
// function  select(){
//     var select = $("#selectoption option:selected"); //获取选中的项
//     var sno = select.val();
//     var select_option = $('#select_sno').val(); //获取选中的项
//    if(sno=="学号"){
//
//        $.ajax({//利用ajax发出请求
//            type: "POST",//post类型
//            url: 'http://localhost:8080/ssm2/selectAll'+'?sno='+select_option, //向Controller里的deleteSelect传输ids
//            data: {"sno":select_option},
//            success: function (data) {//删除成功后，deleteMany会返回一个"ok";
//                if (data == "ok") {
//                     alert("ok");
//                    location.href = "http://localhost:8080/ssm2/stu_list";//相当于刷新界面
//                }
//            },
//            error:function () {
//                location.href = "http://localhost:8080/ssm2/stu_list";//相当于刷新界面
//            }
//        });
//    }
// }



function stu_update(update_sno) {
    var bunk;
    var dorm;
    var dormitory;
    $.ajax({
        url: "http://localhost:8080/ssm2/update"+'?sno='+update_sno,
        type: "post",
        data: {"sno":update_sno},
        success:function (data) {
            //传递过来的是json格式的字符串，需要解析为json对象
            var data = $.parseJSON(data);

            $('#sno').val(data.account.sno);
            $('#name').val(data.account.name);
            $('#college').val(data.account.college);
            $('#major').val(data.account.major);
            $('#classes').val(data.account.classes);
            $('#teacher').val(data.account.teacher);
            bunk = data.account.dorm.substring(4,data.account.dorm.length);
            dorm = data.account.dorm.substring(0,4);
            dormitory = data.account.dormitory;
        },
        error:function () {
            alert("Aja失败了");
        }
    });

}

function selecton(){
    var sno =document.getElementById('sno').value;
    if(sno.length!=10){
        alert("输入正确的学号格式")
    }
    $.ajax({
        url: "http://localhost:8080/ssm2/selectone"+'?sno='+sno,
        type: "post",
        data: {"sno":sno},
        success:function (data) {
            //传递过来的是json格式的字符串，需要解析为json对象\
            if(data=="ok"){
                console.log("学号已存在");
                alert("该学号已存在");
              return false;
            }


        },

    });
}

$("#insertstudent").click(function(){
    var error =document.getElementsByName('name').value;
    if(error==null){
        $("#error").html("*为必填项");
    }
});



















/*

var reg=/[^0-9]/g
var len=insert_sno.length
var s=false;
function stu_insert(){


    if(s==true){
        $.ajax({
            url: "http://localhost:8080/ssm2/stu_insertAll",
            type: "post",
            success:function (data) {
                //传递过来的是json格式的字符串，需要解析为json对象
                if (data == "ok") {
                    location.href = "http://localhost:8080/ssm2/stu_list";//相当于刷新界面
                }

            },

        });
    }else if(s==false){
        alter("重新添加");
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

*/
