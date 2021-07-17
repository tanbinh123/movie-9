<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>chat</title>
    <style>
        #img{
            width: 300px; height: 300px
        }
    </style>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
</head>
<body>
    <img id="img" src=${url}>
    <p>
        ----------------------------------------------------
    </p>
    <#list urls as urlPath>
        <img id="img" src=${urlPath}>
    </#list>
</body>
</html>