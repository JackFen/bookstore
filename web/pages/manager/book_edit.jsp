<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/style.css" />
    <link rel="stylesheet" href="static/css/cart.css" />
    <link rel="stylesheet" href="static/css/bookManger.css" />
    <link rel="stylesheet" href="static/css/register.css" />
    <link rel="stylesheet" href="static/css/book_edit.css" />
  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.gif" alt=""
          /></a>
          <h1>编辑图书</h1>
        </div>
        <%--静态包含manager管理模块的菜单--%>
        <%@include file="/pages/common/manager_menu.jsp"%>
      </div>
    </div>
    <div class="login_banner">
      <div class="register_form">
        <form action="manager/bookServlet"method="get">
          <input type="hidden" name="pageNo" value="${param.pageNo}">
          <input type="hidden" name="action" value="${empty param.id?"add":"update"}"/>
          <input type="hidden" name="id" value="${requestScope.book.id}"/>
          <div class="form-item">
            <div>
              <label>名称:</label>
              <input type="text" name="name" placeholder="请输入名称"  value="${requestScope.book.name}"/>
            </div>
            <span class="errMess" style="visibility: visible;">请输入正确的名称</span>
          </div>
          <div class="form-item">
            <div>
              <label>价格:</label>
              <input type="text" name="price" placeholder="请输入价格" value="${requestScope.book.price}" />
            </div>
            <span class="errMess">请输入正确数字</span>
          </div>
          <div class="form-item">
            <div>
              <label>作者:</label>
              <input type="text" name="author" placeholder="请输入作者" value="${requestScope.book.author}" />
            </div>
            <span class="errMess">请输入正确作者</span>
          </div>
          <div class="form-item">
            <div>
              <label>销量:</label>
              <input type="text" name="sales" placeholder="请输入销量" value="${requestScope.book.sales}"/>
            </div>
            <span class="errMess">请输入正确销量</span>
          </div>
          <div class="form-item">
            <div>
              <label>库存:</label>
              <input type="text" name="stock" placeholder="请输入库存" value="${requestScope.book.stock}"/>
            </div>
            <span class="errMess">请输入正确库存</span>
          </div>

          <button class="btn">提交</button>
        </form>
      </div>
    </div>
    <div class="bottom">
      尚硅谷书城.Copyright ©2015
    </div>
  </body>
</html>
