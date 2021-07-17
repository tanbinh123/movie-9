<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>chat</title>
    <style>
        #all{
            border:1px solid red;
            width: 800px;
            height: 400px;
            margin:0 auto;
        }
        #left{
            border:1px solid red;
            width: 500px;
            height: 490px;
            float: left;
            overflow: auto;
        }
        #right{
            border:1px solid red;
            width: 290px;
            height: 490px;
            float: left;
            overflow: auto;
            text-align: center;
        }
        #bottom{
            border:1px solid red;
            width: 790px;
            height: 100px;
            float: left;
        }
    </style>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script>

        function work(){
            $.ajax({
                url:'loadNickList',//地址
                dataType:'json',//返回的数据类型
                type:'get',//请求方式
                async:true,//异步//false同步
                success:function(data) {
                    //console.log(data);
                    $("#right").html('');
                    for(let i=0;i<data.length;i++){
                        $("#right").append("<p>"+data[i]+"</p>");
                    }
                }
            });
            $.ajax({
                url: "loadInfoList",
                dataType: "json",
                type: "get",
                async: true,
                success:function(data){
                    console.log(data);
                    $("#left").html('');
                    for(let i=0; i<data.length; i++){
                        $("#left").append("<p>"+data[i]+"</p>");
                    }
                }
            })
        }


        setInterval("work();",1000);

        $(function(){
           $("#send").click(function(){
               $.ajax({
                   url: "sendMessage",
                   dataType: "json",
                   type: "post",
                   async: true,
                   // data:{
                   //     "message":$("#message").val(),
                   //     "user":$("#nick").val()
                   // },
                   data:$("#form1").serialize(),
                   success:function(data){
                       console.log(data);
                       if(data===0){
                           alert("0");
                       }
                   }
               })
           })
        });

    </script>
</head>
<body>
<div id="all">
    <div id="left">

    </div>
    <div id="right">

    </div>
    <div id="bottom">
        <form name="form1" id="form1">
            <strong>
                <input type="hidden" id="nick" name="nick" value=${nick}>
                消息：<input type="text" id="message" name="message" size="50">
            </strong>
            <input type="button" id="send" value="发送">
        </form>
    </div>
</div>
</