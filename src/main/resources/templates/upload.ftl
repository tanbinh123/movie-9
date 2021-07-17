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
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script>
        const maxFileSize = 1048576;
        $(function(){
            $("#btn1").click(function(){
                let files = document.getElementById("attr").files;
                if(files.length===1){
                    if(files[0].type!=='image/jpeg'){
                        console.log("文件必须是图片jpeg格式");
                    }else{
                        if(files[0].size>maxFileSize){
                            $("#file1").html('不能高于140kb').css('color','red');
                        }else{
                            $("#form1").submit();
                        }
                    }
                }else{
                    $("#file1").html('必须上传一个图片').css('color','red');
                }
            })
        })
    </script>
</head>
<body>
    <div id="all">
        <#--enctype="multipart/form-data" 含有二进制文件需要添加-->
        <form action="uploadOne" method="post" enctype="multipart/form-data" name="form1" id="form1">
            <p>
                视频：<input type="file" name="attr" id="attr">
                <span id="file1">   请长传视频</span>
            </p>
        </form>
        <button id="btn1">发送</button>

        <form action="uploadMore" method="post" enctype="multipart/form-data" name="form2" id="form2" onsubmit="return check()">
            <p>
                视频：<input type="file" name="attrs" id="attrs" multiple="multiple">
                <span id="file2">   请长传视频</span>
            </p>
            <input type="submit" value="发送">
        </form>
    </div>
</body>