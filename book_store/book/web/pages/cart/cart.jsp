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
    <script type="text/javascript" src="static/script/jquery-3.6.0.js"></script>
    <script type="text/javascript">
      $(function () {
          $("a.deleteItem").click(function () {
             return confirm("你确定要删除【"+$(this).parent().parent().find("td:nth-child(2)").text()+"】吗？");
          });
          $("a.clear-cart").click(function () {
              return confirm("你确定要清空购物车吗？");
          });
          //给输入框绑定失去焦点事件==onchange内容发生改变事件
          $(".count-num").change(function () {
              //获取商品数量
              var count = this.value;
              var id=$(this).attr('bookId');
              if (confirm("你确定要【"+$(this).parent().parent().find("td:nth-child(2)").text()+"】数量改为"+count+"吗？")){
                  //发起请求，给服务器保存
                  location.href="cartServlet?action=updateCount&count="+count+"&id="+id;
              }
              else {
                  //defaultValue属性是表单项dom对象的属性，它表示默认的value属性值
                  this.value=this.defaultValue;
              }
          })
      });

    </script>
  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.jpg" alt=""
          /></a>
          <h1>我的购物车</h1>
        </div>
        <div class="header-right">
          <h3><span> ${sessionScope.user.username}</span> 欢迎光临某某书城</h3>
          <div class="order"><a href="orderServlet?action=showMyOrders&userId=${sessionScope.user.id}">我的订单</a></div>
          <div class="destory"><a href="userServlet?action=loginout">注销</a></div>
          <div class="gohome">
            <a href="index.jsp">返回</a>
          </div>
        </div>
      </div>
    </div>
    <div class="list">
      <div class="w">
        <table>
          <thead>
            <tr>
              <th>图片</th>
              <th>商品名称</th>

              <th>数量</th>
              <th>单价</th>
              <th>金额</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
          <c:if test="${empty sessionScope.cart.items}">
            <%--购物车为空的情况--%>
            <td colspan="6"><a href="index.jsp"> 亲，当前购物车为空!快跟小伙伴们去浏览商品吧</a></td>
          </c:if>
          <c:if test="${not empty sessionScope.cart.items}">
            <%--购物车不为空的情况--%>
            <c:forEach items="${sessionScope.cart.items}" var="entry">
              <tr>
                <td>
                  <img src="${entry.value.imgPath}" alt="" />
                </td>
                <td>${entry.value.name}</td>
                <td>
                  <input class="count-num" type="text" bookId="${entry.value.id}" value="${entry.value.count}">
                </td>
                <td>${entry.value.price}</td>
                <td>${entry.value.totalPrice}</td>
                <td><a class="deleteItem" href="cartServlet?action=deleteItem&id=${entry.value.id}">删除</a></td>
              </tr>
            </c:forEach>
          </c:if>
          </tbody>
        </table>
        <c:if test="${not empty sessionScope.cart.items}">
        <div class="footer">
          <div class="footer-left">
            <a href="cartServlet?action=clear" class="clear-cart">清空购物车</a>
            <a href="index.jsp">继续购物</a>
          </div>
            <div class="footer-right">
              <div>共<span>${sessionScope.cart.totalCount}</span>件商品</div>
              <div class="total-price">总金额<span>${sessionScope.cart.totalPrice}</span>元</div>
              <a class="pay" href="orderServlet?action=createOrder">去结账</a>
            </div>
          </c:if>
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
            <dt>关于某某</dt>
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
