<%--
  Created by IntelliJ IDEA.
  User: fengzhanwei
  Date: 2022/1/30
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%--大于首页才显示--%>
    <c:if test="${requestScope.page.pageNo>1}">
        <div><a href="${requestScope.page.url}&pageNo=1">首页</a></div>
        <div><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">上一页</a></div>
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
                <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
    </ul>
    <%--小于于末页才显示--%>
    <c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
        <div><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">下一页</a></div>
        <div><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a></div>
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
                    location.href="${pageScope.basePath}${requestScope.page.url}&pageNo="+pageNo;
                }
            });
        })
    </script>
