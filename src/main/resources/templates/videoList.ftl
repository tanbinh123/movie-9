<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script>

    </script>
</head>
<body>
<#if list?? && (list?size > 0) >
    <table border="1" width="700" height="500" align="center">
        <tr><td>序号</td><td>video_id</td><td>视频名称</td><td>视频封面</td><td>视频地址</td><td>上传时间</td><td>文件类型</td><td>文件大小</td></tr>
        <#list list as video>
            <tr>
                <td>${video_index+1}</td>
                <td>${video.video_id}</td>
                <td>${video.video_title}</td>
                <td><img src="${video.video_img_url}" width="200" height="100"></td>
                <td>
                    <video width="320" height="240" controls>
                        <source src="${video.video_movie_url}" type="video/mp4">
                        <source src="${video.video_movie_url}" type="video/ogg">
                        <source src="${video.video_movie_url}" type="video/webm">
                        <object data="${video.video_movie_url}" width="320" height="240">
                            <embed src="${video.video_movie_url}" width="320" height="240">
                        </object>
                    </video>
                </td>
                <td>${video.video_upload_time}</td>
                <td>${video.suffixName}</td><
                td>${video.video_size}</td>
            </tr>
        </#list>
        <tr><td colspan="8">${space[0]}--------${space[1]}</td></tr>
    </table>
<#else>
    <h1>暂无数据</h1>
</#if>

</body>
</html>