


function show(){
    var date = new Date(); //日期对象
    var now = "";
    var now1 = "";
    var now2 = "";
    var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
    now = date.getFullYear()+"年"; //读英文就行了
    now = now + (date.getMonth()+1)+"月"; //取月的时候取的是当前月-1如果想取当前月+1就可以了
    now = now + date.getDate()+"日";
    now1 = now1 + date.getHours()+":";
    now1 = now1 + date.getMinutes()+":";
    now1 = now1 + date.getSeconds();
    now2 = weekday[date.getDay()];
    document.getElementById("nowDiv").innerHTML = now; //div的html是now这个字符串
    document.getElementById("nowDiv1").innerHTML = now1; //div的html是now这个字符串
    document.getElementById("nowDiv2").innerHTML = now2; //div的html是now这个字符串
    setTimeout("show()",1000); //设置过1000毫秒就是1秒，调用show方法
}

var websocket = null;

window.onload= function(){

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



    show();
//判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket('ws://localhost:8080/ssm2/websocketTest');

    }
    else {
        alert('当前浏览器 Not support websocket')
    }

//连接发生错误的回调方法
    websocket.onerror = function () {
        alert("WebSocket连接发生错误");
    };

//连接成功建立的回调方法
    websocket.onopen = function () {
        alert("WebSocket连接成功");
    }

//接收到消息的回调方法
    websocket.onmessage = function (event) {
        setMessageInnerHTML(event.data);

    }

//连接关闭的回调方法
    websocket.onclose = function () {
        alert("WebSocket连接关闭");
    }

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }


};

//将消息显示在网页上
function setMessageInnerHTML(innerHTML) {
    var ss = document.getElementById("admin").innerHTML;


        document.getElementById('message').innerHTML +=innerHTML + '<br/>';



}

//关闭WebSocket连接
function closeWebSocket() {
    websocket.close();
}

//发送消息
function send() {
    var ss = document.getElementById("admin").innerHTML;
    var message = document.getElementById('text').value;
    websocket.send("<span style=\"font-weight: 900;float: left;\">"+ss+"</span>"+"："+message);
    websocket.send("<span style=\"font-weight: 900;float: right;\">"+ss+"</span>");

}



