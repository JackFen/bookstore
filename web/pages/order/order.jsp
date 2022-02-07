<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>我的订单</title>
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
    <link rel="stylesheet" href="static/css/orderManger.css" />
    <script type="text/javascript" src="static/script/jquery-3.6.0.js"></script>
    <script type="text/javascript">
    </script>
  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.gif" alt=""
          /></a>
          <h1>我的订单</h1>
        </div>
        <div class="header-right">
          <h3>${sessionScope.user.username} 欢迎光临某某书城</h3>
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
              <th>订单号</th>
              <th>订单日期</th>
              <th>订单金额</th>
              <th></th>
              <th>订单状态</th>
              <th>订单详情</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${sessionScope.orders}" var="order">
            <tr>
              <td>${order.orderId}</td>
              <td>
                ${order.createTime}
              </td>
              <td>${order.price}</td>
              <td></td>
              <td><a href="" class="send">
                <c:if test="${order.status==0}">
                  未发货
                </c:if>
                <c:if test="${order.status==1}">
                  已发货
                </c:if>
                <c:if test="${order.status==2}">
                  已签收
                </c:if>
              </a></td>
              <td><a href="orderServlet?action=showOrderDetail&orderId=${order.orderId}">查看详情</a></td>
            </tr>
          </c:forEach>

          </tbody>
        </table>
        <div class="footer">
          <div class="footer-right">
            <%--&lt;%&ndash;静态包含分页条&ndash;%&gt;--%>
            <%--<%@include file="/pages/common/page_nav.jsp"%>--%>
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
            <dd>http://www.atguigu.com</dd>
            <dd></dd>
          </dl>
        </div>
      </div>
      <div class="down">
        尚硅谷书城.Copyright ©2015
      </div>
    </div>
  </body>
</html>
