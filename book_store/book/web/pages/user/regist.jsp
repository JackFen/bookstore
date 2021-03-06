<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>某某会员注册页面</title>
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
    <link type="text/css" rel="stylesheet" href="static/css1/style.css">
    <script type="text/javascript" src="static/script/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        //页面加载完成之后
        $(function () {
            $("#username").blur(function () {
               //1.获取用户名
               var username=this.value;
               $.getJSON("http://localhost:8080/book/userServlet","action=ajaxExistUsername&username="+username,function (data) {
                   if (data.existsUsername){
                       $("span.errorMsg").text("*用户名已存在！*");
                   }
               });

            });
            $("#codepic").click(function () {
                this.src="${basePath}/kaptcha.jpg?d="+new Date();
            });
            //给注册绑定单击事件
            $("#sub_btn1").click(function () {
                //验证用户名：必须由字母，数组下划线组成，并且长度为5到12位
                  //1.获取用户名输入框的内容
                var usernameText=$("#username").val();
                  //2.创建正则表达式对象
                var usernamePatt=/^\w{5,12}$/;
                  //3.使用test方法验证
                if(!usernamePatt.test(usernameText)){
                    //4.提示用户结果
                    $("span.errorMsg").text("*用户名不合法！*");
                    return false;
                }

                //验证密码：必须由字母，数组下划线组成，并且长度为5到12位
                var passwordText=$("#password").val();
                //2.创建正则表达式对象
                var passwordPatt=/^\w{5,12}$/;
                //3.使用test方法验证
                if(!passwordPatt.test(passwordText)){
                    //4.提示用户结果
                    $("span.errorMsg").text("*密码不合法！*");
                    return false;
                }
                //验证确认密码：和密码相同
                  //1.获取确认密码内容
                var repwdText=$("#repwd").val();
                  //2.和密码相比较
                if(repwdText!=passwordText){
                    //3.提示用户
                    $("span.errorMsg").text("*两次输入的密码不相同！*");
                    return false;
                }
                //邮箱验证：xxxx@xxx.com
                   //1.获取邮箱里的内容
                var emailText=$("#email").val();
                   //2.创建正则表达式对象
                var emailPatt=/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                  //3.使用test方法验证
                if(!emailPatt.test(emailText)){
                    $("span.errorMsg").text("*邮箱格式不合法！*");
                    return false;
                }
                //验证码：现在只需要验证用户已经输入
                var codeText=$("#code").val();
                //去掉验证码前后的空格
                codeText=$.trim(codeText);
                if(codeText==null||codeText==""){
                    $("span.errorMsg").text("*验证码不能为空！*");
                    return false;
                }
                $("span.errorMsg").text("");
            })
        })
    </script>
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="static/img/logo.jpg" style="height: 82px;width:258px">
    <div style="display: inline; margin-left:30px;line-height: 110px;font-size: 50px;color: #36997A;">您的选择十分正确</div>
</div>
<div style="height: 500px;width: 1520px;background-color:#38997A;position: relative">
    <div class="logo_word1">欢迎注册</div>
    <div class="regist_form">
        <div class="regist_box">
            <h2 id="title">注册某某会员</h2>

        </div>
        <div class="form">
            <form action="userServlet" method="post" style="margin-left:20px;">
                <input type="hidden" name="action" value="regist"/>
                <label>用户名称：</label>
                <input class="itext" type="text" placeholder="请输入用户名"
                       autocomplete="off" tabindex="1" name="username" id="username"
                       value="${requestScope.username}"
                       style="height: 36px;width: 200px"/><br/>
                <span class="errorMsg">
                    ${requestScope.msg}
                </span>
                <br/>
                <label>用户密码：</label>
                <input class="itext" type="password" placeholder="请输入密码"
                       autocomplete="off" tabindex="1" name="password" id="password"
                        style="height: 36px;width: 200px"/><br/>
                <br/>
                <label>确认密码：</label>
                <input class="itext" type="password" placeholder="确认密码"
                       autocomplete="off" tabindex="1" name="repwd" id="repwd"  style="height: 36px;width: 200px"/>
                <br/>
                <br/>
                <label>电子邮件：</label>
                <input class="itext" type="text" placeholder="请输入邮箱地址"
                       autocomplete="off" tabindex="1" name="email" id="email"
                       value="${requestScope.email}" style="height: 36px;width: 200px"/><br/>
                <br/>
                <label>验证码:</label>
                <input class="itext" type="text"
                       autocomplete="off" tabindex="1" name="code" id="code"style="height: 36px;width: 130px"/><br/>
                        <input type="submit" value="注册" id="sub_btn1" />
                <img id="codepic" alt="" src="kaptcha.jpg" style="height: 44px;width:100px;">
            </form>
        </div>
    </div>
</div>
</body>
</html>