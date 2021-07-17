<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>chat</title>
    <style>
    </style>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script>
        const maxFileSize = 1048576;
        var count = 0;
        function add(){
            let all = $("#all");
            let a1 = "";
            a1+='<div id="container'+count+'">';
            a1+='<p>视频标题：<input type="text" name="video_title'+count+'"></p>';
            a1+='<p>视频封面：<input type="file" name="attrs" id="attr1'+count+'"></p>';
            a1+='<p>视频地址：<input type="file" name="attrs" id="attr2'+count+'"></p>';
            a1+='<p><input type="button" id="del'+count+'" value="删除" onclick="del('+count+')"></p>';
            a1+='<hr size="3" color="pink">';
            a1+='</div>';
            all.append(a1);
            count++;
        }
        function del(index){
            let container = $("#container"+index+"");
            console.log(container);
            container.remove();
            count--;
        }
        $(function(){
            $("#del")
        });
    </script>
</head>
<body>
<div>
    <#--enctype="multipart/form-data" 含有二进制文件需要添加-->
    <p><input type="button" onclick="add()" value="增加"></p>
    <form action="uploadMovie" method="post" enctype="multipart/form-data" name="form1" id="form1">
        <div id="all">

        </div>
<#--        <p>视频标题：<input type="text" name="video_title"></p>-->
<#--        <p>视频封面：<input type="file" name="video_"></p>-->
        <p><input type="submit" value="提交"></p>
    </form>
<#--    <hr size="3" color="pink">-->
</div>
</body>