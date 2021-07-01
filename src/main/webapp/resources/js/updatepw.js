function updatepw() {
    $.ajax({//利用ajax发出请求
        type: "POST",//post类型
        url: 'http://localhost:8080/ssm2/update?sno=' + sno, //向Controller里的deleteSelect传输ids
        success: function (data) {//删除成功后，deleteMany会返回一个"ok";
            if (data == "ok") {
                alert("删除成功！");//返回ok后弹出一个对话框。
                location.href = "http://localhost:8080/ssm2/stu_list";//相当于刷新界面
                document.getElementById('light').style.display='block';
                document.getElementById('fade').style.display='block'
            }

        }
    });
}