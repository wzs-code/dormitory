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
        //设置linkToCart的href的值
        $("#select_sno").attr("href","/ssm2/selectSno?sno="+info);
    });


    $("#select_dormitory").click(function(){
        //得到input的值
        var info=$("#select_option").val()
        //设置linkToCart的href的值
        $("#select_dormitory").attr("href","/ssm2/selectDormitory?dormitory="+info);
    });




};


function insertdormitory() {
    var dataJson = {
        "dormitory":$("#dormitory").val(),
        "dorm":$("#dorm").val(),
        "status":$("#status").val(),
        "site":$("#site").val(),
        "equipment":$("#equipment").val(),
        "leader":$("#leader").val()
    };
    if($("#dormitory").val().length!=0&&$("#dorm").val().length!=0&&$("#site").val().length!=0&&$("#equipment").val().length!=0&&$("#leader").val().length!=0){
        $.ajax({
            url: "http://localhost:8080/ssm2/dormitory_insert",
            type: "post",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify(dataJson),
            success:function (data) {
                if(data =="ok"){
                    alert("建造成功");
                    location.href="http://localhost:8080/ssm2/dormitory";
                }else if(data=="error"){
                    alert("该寝室已存在");
                    return false;
                }
            },
            error:function () {
                alert("建造失败");
            }
        });
    }else{
        $(".error").html("带*号的为必填写，不可跳过");
    }

}



function  selectdormitory() {
    var a = document.getElementsByName("dormitory");
    var k;
    for (var i=0; i<a.length; i++)
        /*当前获得焦点的元素:*/
        if (a[i] == document.activeElement)
            k = i;
    var dormitory = document.getElementsByName("dormitory")[k].value;
    $.ajax({
        url: "http://localhost:8080/ssm2/selectdormitory"+'?dormitory='+dormitory,
        type: "post",
        contentType : "application/json;charset=utf-8",
        dataType: "json", //表示返回值类型，不必须
        data: JSON.stringify(dormitory),
        success:function (data) {

            //传递过来的是json格式的字符串，需要解析为json对象
            location.href = "http://localhost:8080/ssm2/dormitorys";//相当于刷新界面
        },
        error:function () {
            alert("查询失败");
        }
    });


}

