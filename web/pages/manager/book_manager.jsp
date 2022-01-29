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
            <img src="static/img/logo.gif" alt=""/>
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
            <%--大于首页才显示--%>
            <c:if test="${requestScope.page.pageNo>1}">
              <div><a href="manager/bookServlet?action=page&pageNo=1">首页</a></div>
              <div><a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a></div>
            </c:if>
            <ul>
              <%--页码输出的开始--%>
              <c:choose>
              <%--情况1：如果总页码小于等于5的情况，页码的范围是：1-总页码--%>
              <c:when test="${requestScope.page.pageTotal<=5}">
                <c:set var="begin" value="1"/>
                <c:set var="end" value="${requestScope.page.pageTotal}"/>
              </c:when>
                <%--情况2：总页码大于5的情况--%>
                <c:when test="${requestScope.page.pageTotal>5}">
                  <c:choose>
                    <%--小情况1：当前页码为前面3个：1 2 3的情况，页码范围是1-5，--%>
                    <c:when test="${requestScope.page.pageNo<=3}">
                      <c:set var="begin" value="1"/>
                      <c:set var="end" value="5"/>
                    </c:when>
                    <%--小情况2：当前页码为最后三个，8.9.10，页码范围是：总页码减4-总页码--%>
                    <c:when test="${requestScope.page.pageNo>requestScope.page.pageTotal-3}">
                      <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                      <c:set var="end" value="${requestScope.page.pageTotal}"/>
                    </c:when>
                    <%--小情况3：4，5，6，7，页码范围是：当前页码减2-当前页码加2--%>
                    <c:otherwise>
                      <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                      <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                    </c:otherwise>
                  </c:choose>
                </c:when>
            </c:choose>

                <c:forEach begin="${begin}" end="${end}" var="i">
                <c:if test="${i==requestScope.page.pageNo}">
                  <li class="active">【${requestScope.page.pageNo}】</li>
                </c:if>
                <c:if test="${i!=requestScope.page.pageNo}">
                  <li><a href="manager/bookServlet?action=page&pageNo=${i}">${i}</a></li>
                </c:if>
              </c:forEach>
            </ul>
            <%--小于于末页才显示--%>
            <c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
              <div><a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a></div>
              <div><a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageTotal}">末页</a></div>
            </c:if>
            <span>共${requestScope.page.pageTotal}页</span>
            <span>${requestScope.page.pageTotalCount}条记录</span>
            <span>到第</span>
            <input value="${param.pageNo}" type="text" name="pn" id="pn_input" />
            <span>页</span>
            <button id="searchPageBtn">确定</button>
            <script type="text/javascript">
              $(function () {
                  //跳到指定的页码
                  $("#searchPageBtn").click(function () {
                      var pageNo=$("#pn_input").val();
                      var pageTotal=${requestScope.page.pageTotal};
                      //javaScript语言提供了一个location地址栏对象
                      //它有一个属性叫href，它可以获取浏览器地址栏中的地址
                      //href属性可读可写
                      if (pageNo>=1&&pageNo<=pageTotal){
                          location.href="${pageScope.basePath}manager/bookServlet?action=page&pageNo="+pageNo;
                      }
                  });
              })
            </script>
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
