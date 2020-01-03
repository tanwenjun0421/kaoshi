<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2019/12/15
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" >
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <%--引入分页查询的js文件--%>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-paginator.js"></script>
    <script>
        <c:if test="${add =='success'}">
        alert("添加景点信息成功！");
        </c:if>
        <c:if test="${add =='failure'}">
        alert("添加景点信息失败！");
        </c:if>
        <c:if test="${del =='success'}">
        alert("删除景点信息成功！");
        </c:if>
        <c:if test="${del =='failure'}">
        alert("删除景点信息失败！");
        </c:if>
        <c:if test="${update =='success'}">
        alert("修改景点信息成功！");
        </c:if>
        <c:if test="${update =='failure'}">
        alert("修改景点信息失败！");
        </c:if>
    </script>
</head>
<body>
    <center>
        <form action="${pageContext.request.contextPath}/list" method="post" id="myform">
            <input type="hidden" name="pageNum" id="pageNum">
            <select name="categoryid" id="categoryid">
                <option name="" value="">全部</option>
                <%--     动态代码       --%>
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.id}" <c:if test="${category.id == categoryid.categoryid}">selected</c:if> >
                            ${category.name}
                    </option>
                </c:forEach>
            </select>
            <input type="submit" value="查询">
            <input type="button" onclick="addEntry()" value="新增电子文档"><br>
        </form>
        <table border="1" cellspacing="0" cellpadding="5" width="80%">
            <tr>
                <td colspan="6"><h1 style="text-align: center">电子文档列表</h1></td>
            </tr>
            <tr>
                <th>文档编号</th>
                <th>文档名称</th>
                <th>文档摘要</th>
                <th>上传人</th>
                <th>上传时间</th>
                <th>操作</th>
            </tr>
            <%--    动态代码      --%>
            <c:forEach items="${pageInfo.list}" var="entry" varStatus="vs">
                <tr <c:if test="${vs.index%2==0}">bgcolor="#7fff00" </c:if>>
                    <td>${entry.id}</td>
                    <td>${entry.title}</td>
                    <td>${entry.summary}</td>
                    <td>${entry.uploaduser}</td>
                    <td><fmt:formatDate value="${entry.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/modify?id=${entry.id}">修改</a>&nbsp;&nbsp;
                        <a href="javascript:Del(${entry.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <%--必须要写ul标签: 分页的数据都放在ul标签中--%>
                <ul id="pagination"></ul>
            </div>
        </div>
    </center>
</body>
<script>
    $(function () {
        var element = $('#pagination');
        options = {
            bootstrapMajorVersion:3, //对应的bootstrap版本
            currentPage: ${pageInfo.pageNum}, //当前页数，这里是用的EL表达式，获取从后台传过来的值
            totalPages:${pageInfo.pages}, //总页数，这里是用的EL表达式，获取从后台传过来的值
            itemTexts: function (type, page, current) {//设置显示的样式，默认是箭头
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },
            //点击事件  page:当前的页码
            onPageClicked: function (event, originalEvent, type, page) {
                //处理具体的业务
                //把当前页码发送到后台的controller做分页查询
                //给隐藏域赋值
                $("#pageNum").val(page);
                //提交表单
                $("#myform").submit();
            }
        };
        element.bootstrapPaginator(options);
    })
</script>
<script>
    function addEntry() {
        location.href="${pageContext.request.contextPath}/pages/add.jsp";
    }
    function Del(id) {
        if (confirm("确认删除文档信息吗？")){
            location.href="${pageContext.request.contextPath}/delEntry?id="+id;
        }
    }
</script>
</html>
