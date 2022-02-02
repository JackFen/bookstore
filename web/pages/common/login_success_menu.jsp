<%--
  Created by IntelliJ IDEA.
  User: fengzhanwei
  Date: 2022/1/26
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <span><span class="um_span">${sessionScope.user.username}</span> 欢迎光临某某书城</span>
    <a href="./pages/order/order.jsp">我的订单</a>
    <a href="userServlet?action=loginout">注销</a>&nbsp;&nbsp;
    <a href="./index.jsp">返回</a>
</div>