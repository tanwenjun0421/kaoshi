<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2019/11/18
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function $(id) {
            return document.getElementById(id)
        }

        function check() {
            if ($("title").value == ""){
                alert("文档名称不能为空！")
                return false;
            }else if ($("createdate").value == ""){
                alert("上传时间不能为空！")
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<center>
    <form action="${pageContext.request.contextPath}/update" method="post" onsubmit="return check()" >
        <input type="hidden" name="id" id="id" value="${entry.id}">
        <table border="1" cellspacing="0" cellpadding="5" width="80%">
            <tr>
                <td colspan="2"><h1 style="text-align: center">更新电子文档</h1></td>
            </tr>
            <tr>
                <td>文档名称</td>
                <td><input type="text" name="title" id="title" value="${entry.title}"></td>
            </tr>
            <tr>
                <td>文档分类</td>
                <td>
                    <select name="categoryid">
                        <option name="" value="">全部</option>
                        <%--     动态代码       --%>
                        <c:forEach items="${categoryList}" var="category">
                            <option value="${category.id}" <c:if test="${category.id == entry.categoryid}">selected</c:if> >
                                    ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>文档摘要</td>
                <td>
                    <textarea name="summary" id="summary" cols="30" rows="10" >${entry.summary}</textarea>
                </td>
            </tr>
            <tr>
                <td>上传人</td>
                <td><input type="text" name="uploaduser" id="uploaduser" value="${entry.uploaduser}"></td>
            </tr>
            <tr>
                <td>上传时间</td>
                <td><input type="text" name="createdate" id="createdate" value="<fmt:formatDate value="${entry.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate>"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <input type="submit" value="提交">&nbsp;&nbsp;
                    <input type="button" value="返回首页" onclick="toMain()">
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
<script>
    function toMain() {
        location.href="${pageContext.request.contextPath}/index.jsp"
    }
</script>
</html>
