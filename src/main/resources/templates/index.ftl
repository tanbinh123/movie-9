<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index</title>
</head>
<body>
<#--<h1>Hello</h1>-->

<table border="1">
    <form action="index" method="get" id="form1">
        <tr>
            <td colspan="2">姓名：<input type="text" name="user_name" value="${user_name}"></td>
            <td colspan="2">年龄：<input type="text" name="user_age" value="${user_age}"></td>
            <td colspan="2">
                <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                <input type="hidden" name="pageSize" id="pageSize" value="10">
                <input type="submit" value="查询" >
            </td>
        </tr>
    </form>
    <tr>
        <td><input type="checkbox" name="ids" onclick="selectAll()"/>全选/非全选</td>
        <td>序号</td>
        <td>ID号</td>
        <td>用户名称</td>
        <td>用户年龄</td>
        <td>用户性别</td>
    </tr>
    <#list list as user>
        <tr>
            <td><input type="checkbox" name="ids" value=${user.user_id} onclick="checkOne()"/></td>
            <td>${user_index+1}</td>
            <td>${user.user_id}</td>
            <td>${user.user_name}</td>
            <td>${user.user_age}</td>
            <td>${user.user_sex}</td>
        </tr>
    </#list>
    <tr>
        <td colspan="5"><a href="javascript:void(0);" onclick="btn();">点击我进行注册</a></td>
        <td colspan="2"> <input id="deleteBtn" type="button" value="删除" disabled="disabled" onclick="deleteBtn()"> </td>
    </tr>
    <tr>
        <td>
            <#if (pageIndex>1)>
                <a href="javascript:pageInfo(${pageIndex}-1);">上一页</a>
            </#if>
        </td>
        <td>当前第${pageIndex}页</td>
        <td>每页最大条数是:${pageSize}</td>
        <td>总的页数:${totalPage}</td>
        <td>总的数量:${totalCount}</td>
        <td>
            <#if (pageIndex!=totalPage)>
                <a href="javascript:pageInfo(${pageIndex}+1);">下一页</a>
            </#if>
        </td>

    </tr>
</table>
</body>
<script>
    function btn(){
        location.href='insertUser';
    }
    //全部选中按钮
    function selectAll(){
        let box = document.getElementsByName("ids");
        let deleteBtn = document.getElementById("deleteBtn");
        console.log(box);
        if(box[0].checked){
            for(let i=1; i<box.length; i++){
                box[i].checked=true;
                deleteBtn.disabled="";
            }
        }else{
            for(let i=1; i<box.length; i++){
                box[i].checked=false;
                deleteBtn.disabled="disabled";
            }
        }
    }

    //监控每一条数据
    function checkOne(){
        let box = document.getElementsByName("ids");
        let deleteBtn = document.getElementById("deleteBtn");
        console.log(box);
        let result = 0;
        for(let i=1; i<box.length; i++){
            if(box[i].checked === true){   //统计数据
                result++;
            }
        }
        box[0].checked = result === box.length - 1;
        if(result>0){
            deleteBtn.disabled="";
        }else{
            deleteBtn.disabled="disabled";
        }
        console.log(deleteBtn);
    }
    
    //删除数据
    function deleteBtn() {
        let box = document.getElementsByName("ids");
        let data = "";
        for(let i=1; i<box.length; i++){
            if(box[i].checked){
                data+=box[i].value;
                data+=",";
            }
        }
        window.location.href="deleteUsers?data="+data;
        console.log(data);
    }

    //点击上一页和下一页事件的触发
    function pageInfo(pageIndex){
        //console.log(pageIndex);
        //var pageSize=10;
        // location.href='index?pageIndex='+pageIndex+"&pageSize="+pageSize
        document.getElementById("pageIndex").value=pageIndex;
        document.getElementById("pageSize").value=10;
        document.getElementById("form1").submit();

    }
</script>

</html> 