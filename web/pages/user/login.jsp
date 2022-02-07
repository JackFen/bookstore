<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>某某会员登录页面</title>
    <!--写base标签，永远固定相对路径跳转的结果-->
    <base href="http://localhost:8080/book/">
    <link type="text/css" rel="stylesheet" href="static/css1/style.css">
    <script type="text/javascript" src="static/script/jquery-3.6.0.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="static/img1/logo.jpeg" style="height: 100px;width:200px">
    <div style="display: inline; margin-left:30px;line-height: 110px;font-size: 50px;color: #36997A;">您的选择十分正确</div>
</div>
<div style="height: 500px;width: 1520px;background-color:#38997A;position: relative">
    <div class="logo_word1">欢迎登录</div>
    <div class="login_form">
        <div class="login_box">
            <h2 id="title">登录某某会员</h2>
            <div id="prompt">
                <span><%--<%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%>--%>
                ${empty requestScope.msg?"请输入用户名和密码":requestScope.msg}</span>
            </div>
        </div>
        <br/>
        <div class="form1">
            <form action="userServlet" method="post" style="margin-left:20px;">
                <input type="hidden" name="action" value="login"/>
                <label>用户名称：</label>
                <input class="itext" type="text" placeholder="请输入用户名"
                       autocomplete="off" tabindex="1" name="username" id="username"
                       value="${requestScope.username}"
                       style="height: 36px;width: 200px"/><br/>
                <br/>
                <label>用户密码：</label>
                <input class="itext" type="password" placeholder="请输入密码"
                       autocomplete="off" tabindex="1" name="password" id="password" style="height: 36px;width: 200px"/><br/>
                <br/>
                <input type="submit" value="登录" id="login_btn" /><br/>
            </form>
            <input type="button" value="立即注册" id="sub_btn"
                   onclick="javascrtpt:window.location.href='pages/user/regist.jsp'">
        </div>
    </div>
</div>
</body>
</html>