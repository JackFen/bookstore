<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
	<%
		String basePath=request.getScheme()
				+"://"
				+request.getServerName()
				+":"
				+request.getServerPort()
				+request.getContextPath()
				+"/";
	%>
	<!--写base标签，永远固定相对路径跳转的结果-->
	<base href="<%=basePath%>">
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/logo.jpg" >
			<span class="wel_word">后台管理系统</span>
		<%--静态包含manager管理模块的菜单--%>
		<%@include file="/pages/common/manager_menu.jsp"%>>
	</div>
	
	<div id="main">
		<h1>欢迎管理员进入后台管理系统</h1>
	</div>

	<%@include file="/pages/common/foot.jsp"%>
</body>
</html>