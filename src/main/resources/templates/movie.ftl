<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>chat</title>
    <style>
    </style>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
</head>
<body>
<div>
    <#--enctype="multipart/form-data" 含有二进制文件需要添加-->
    <p><input type="button" onclick="add()" value="增加"></p>
    <form action="uploadMovie" method="post" enctype="multipart/form-data" name="form1" id="form1">
        <input type="hidden" value="" id="str" name="str">
        <div id="all">

        </div>
<#--        <p>视频标题：<input type="text" name="video_title"></p>-->
<#--        <p>视频封面：<input type="file" name="video_"></p>-->
    </form>
    <p><input type="button" id="submit" value="提交"></p>
</div>

<script>
    const maxFileSize = 1024*1024*10;
    let count = 0;
    let judge = 0;
    let s = new Array();

    $("#submit").click(function(){
        if(judge===s.length)
        $("#form1").submit();
    })
    function checkImg(object){
        if(object.files.length===1){
            let file = object.files[0];
            let next = $($(object).nextAll()[0]);
            console.log("img",file,$(object).nextAll()[0]);
            if(file.type.split("/")[0]!=="image"){
                next.html("文件必须是图片格式").css('color','red');
            }else{
                if(file.size>maxFileSize){
                    next.html("图片大小不能超过"+maxFileSize/1024/1024+"M").css('color','red');
                }else{
                    next.html("请长传封面").css('color','black');
                    judge+=1;
                }
            }
        }
    }
    function checkVideo(object){
        if(object.files.length===1){
            let file = object.files[0];
            let next = $($(object).nextAll()[0]);
            console.log("video",file,$(object).next());
            if(file.type.split("/")[0]!=="audio"){
                next.html("文件必须是视频格式").css('color','red');
            }else{
                if(file.size>maxFileSize){
                    next.html("文件大小不能超过"+maxFileSize/1024/1024+"M").css('color','red');
                }else{
                    next.html("请长传视频").css('color','black');
                    judge+=1;
                }
            }
        }
    }
    function add(){
        s.push(count);
        let result = "";
        for(let i=0;i<s.length;i++){
            if(s[i]!==undefined){
                result+=s[i]+",";
            }
        }
        $("#str").val(result);
        let all = $("#all");
        let a1 = "";
        a1+='<div id="container'+count+'">';
        a1+='<p>视频标题：<input type="text" name="video_title'+count+'"></p>';
        a1+='视频封面：<input type="file" name="attrs" id="attr1'+count+'" onblur="checkImg(this)"> <span>   请长传封面</span>';
        a1+='<p>视频地址：<input type="file" name="attrs" id="attr2'+count+'" onblur="checkVideo(this)"></p> <span>   请长传视频</span>';
        a1+='<p><input type="button" id="del'+count+'" value="删除" onclick="del('+count+')"></p>';
        a1+='<hr size="3" color="pink">';
        a1+='</div>';
        all.append(a1);
        count++;
    }
    // function add(){
    //     let all = document.getElementById("all");
    //
    //     let div_result = document.createElement("div");
    //     div_result.setAttribute("id","container"+count);
    //
    //     let p1 = document.createElement("p");
    //     p1.append("视频标题");
    //     let input1 = document.createElement("input");
    //     input1.setAttribute("type",'text');
    //     input1.setAttribute("name","video_title"+count);
    //     p1.appendChild(input1);
    //     div_result.appendChild(p1);
    //
    //     let p2 = document.createElement("p");
    //     p2.append("视频封面");
    //     let input2 = document.createElement("input");
    //     input2.setAttribute("type",'file');
    //     input2.setAttribute("name","attr");
    //     p2.appendChild(input2);
    //     div_result.appendChild(p2);
    //
    //     let p3 = document.createElement("p");
    //     p3.append("视频封面");
    //     let input3 = document.createElement("input");
    //     input3.setAttribute("type",'file');
    //     input3.setAttribute("name","attr");
    //     p3.appendChild(input3);
    //     div_result.appendChild(p3);
    //
    //     all.appendChild(div_result);
    //
    //     ++count;
    // }
    function del(index){
        delete s[index];
        let result = "";
        for(let i=0;i<s.length;i++){
            if(s[i]!==undefined){
                result+=s[i]+",";
            }
        }
        $("#str").val(result);
        let container = $("#container"+index+"");
        console.log(container);
        container.remove();
        count--;
    }
</script>

</body>