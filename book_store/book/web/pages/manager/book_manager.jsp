<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
      pageContext.setAttribute("basePath",basePath );
    %>
    <!--写base标签，永远固定相对路径跳转的结果-->
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/cart.css" />
    <link rel="stylesheet" href="static/css/bookManger.css" />
    <script type="text/javascript" src="static/script/jquery-3.6.0.js"></script>
    <script type="text/javascript">
      $(function () {
          //用于删除的确定提示操作
          $("a.del").click(function () {
              //在事件的function函数中，有一个this对象这个对象是当前正在相应事件的dom对象
              /*
              * confirm是确认提示框函数
              * 它有两个按钮，一个确认，一个是取消
              * 返回true表示点击了确认，返回false表示点击了取消
              * */
              return confirm("你确定要删除【"+$(this).parent().parent().find("td:nth-child(2)").text()+"】?");
          });
      });
    </script>
  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.jpg" alt=""/>
          </a>
          <h1>图书管理系统</h1>
        </div>
        <%--静态包含manager管理模块的菜单--%>
        <%@include file="/pages/common/manager_menu.jsp"%>
      </div>
    </div>
    <div class="list">
      <div class="w">
        <div class="add">
          <a href="pages/manager/book_edit.jsp?pageNo=${requestScope.page.pageTotal}">添加图书</a>
        </div>
        <table>
          <thead>
            <tr>
              <th>图片</th>
              <th>商品名称</th>
              <th>价格</th>
              <th>作者</th>
              <th>销量</th>
              <th>库存</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${requestScope.page.items}" var="book">
            <tr>
              <td>
                <img src="${book.imgPath}" alt="" />
              </td>
              <td>${book.name}</td>
              <td>${book.price}</td>
              <td>${book.author}</td>
              <td>${book.sales}</td>
              <td>${book.stock}</td>
              <td>
                <a href="manager/bookServlet?action=getBook&id=${book.id}&pageNo=${requestScope.page.pageNo}">修改</a>
                <a href="manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}" class="del">删除</a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <div class="footer">
          <div class="footer-right">
          <%--静态包含分页条--%>
         <%@include file="/pages/common/page_nav.jsp"%>
          </div>
        </div>
      </div>
    </div>
    <div class="bottom">
      <div class="w">
        <div class="top">
          <ul>
            <li>
              <a href="">
                <img src="static/img/bottom1.png" alt="" />
                <span>大咖级讲师亲自授课</span>
              </a>
            </li>
            <li>
              <a href="">
                <img src="static/img/bottom.png" alt="" />
                <span>课程为学员成长持续赋能</span>
              </a>
            </li>
            <li>
              <a href="">
                <img src="static/img/bottom2.png" alt="" />
                <span>学员真是情况大公开</span>
              </a>
            </li>
          </ul>
        </div>
        <div class="content">
          <dl>
            <dt>关于尚硅谷</dt>
            <dd>教育理念</dd>
            <!-- <dd>名师团队</dd>
            <dd>学员心声</dd> -->
          </dl>
          <dl>
            <dt>资源下载</dt>
            <dd>视频下载</dd>
            <!-- <dd>资料下载</dd>
            <dd>工具下载</dd> -->
          </dl>
          <dl>
            <dt>加入我们</dt>
            <dd>招聘岗位</dd>
            <!-- <dd>岗位介绍</dd>
            <dd>招贤纳师</dd> -->
          </dl>
          <dl>
            <dt>联系我们</dt>
            <dd>http://www.moumou.com</dd>
            <dd></dd>
          </dl>
        </div>
      </div>
      <div class="down">
        某某书城.Copyright ©2015
      </div>
    </div>
  </body>
</html>
