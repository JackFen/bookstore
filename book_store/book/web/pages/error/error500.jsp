<%--
  Created by IntelliJ IDEA.
  User: fengzhanwei
  Date: 2022/2/5
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        String basePath=request.getScheme()
                +"://"
                +request.getServerName()
                +":"
                +request.getServerPort()
                +request.getContextPath()
                +"/";
        pageContext.setAttribute("basePath",basePath );
    %>
    <!--写base标签，永远固定相对路径跳转的结果-->
    <base href="<%=basePath%>">
</head>
<body>
抱歉，后台出现错误
<a href="index.jsp">返回首页</a>
</body>
</html>
