<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>书城首页</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="static/script/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="./static/css/minireset.css" />
    <link rel="stylesheet" href="./static/css/common.css" />
    <link rel="stylesheet" href="./static/css/iconfont.css" />
    <link rel="stylesheet" href="./static/css/index.css" />
    <link rel="stylesheet" href="./static/css/swiper.min.css" />
    <script type="text/javascript">
      $(function () {
          //给加入购物车按钮绑定单击事件
          $("button.addToCart").click(function () {
              var bookId=$(this).attr("bookId");
              location.href="cartServlet?action=addItem&id="+bookId;
              //发ajax请求，添加商品到购物车
              // $.getJSON("cartServlet","action=ajaxAddItem&id="+bookId,function (data) {
              //     $("div.cart-num").text(data.totalCount);
              // })
          });
      });
      //自动定位滚动条的位置
      window.onbeforeunload = function () {
          var scrollPos;
          if (typeof window.pageYOffset != 'undefined') {
              scrollPos = window.pageYOffset;
          }
          else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {
              scrollPos = document.documentElement.scrollTop;
          }
          else if (typeof document.body != 'undefined') {
              scrollPos = document.body.scrollTop;
          }
          document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中
      }


      window.onload = function () {
          if (document.cookie.match(/scrollTop=([^;]+)(;|$)/) != null) {
              var arr = document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
              document.documentElement.scrollTop = parseInt(arr[1]);
              document.body.scrollTop = parseInt(arr[1]);
          }
      }
    </script>
  </head>
  <body>
    <div id="app">
      <div class="topbar">
        <div class="w">
          <div class="topbar-left">
            <i>送至:</i>
            <i>北京</i>
            <i class="iconfont icon-ai-arrow-down"></i>
          </div>
          <div class="topbar-right">
            <%--如果用户还没有登录，显示登录和注册的菜单--%>
            <c:if test="${empty sessionScope.user}">
              <a href="pages/user/login.jsp" class="login">登录</a>
              <a href="pages/user/regist.jsp" class="register">注册</a>
            </c:if>
              <%--如果已经登录，则显示登录成功之后的用户信息--%>
            <c:if test="${not empty sessionScope.user}">
              <span style="font-size: 18px">${sessionScope.user.username} 欢迎光临某某书城</span>
              <a style="font-size: 18px" href="orderServlet?action=showMyOrders&userId=${sessionScope.user.id}">我的订单</a>
              <a style="font-size: 18px" href="userServlet?action=loginout">注销</a>&nbsp;&nbsp;
            </c:if>
            <a href="pages/cart/cart.jsp" class="cart iconfont icon-gouwuche">购物车
              <c:if test="${ not empty sessionScope.cart.items}">
                <%--购物车非空的时候有数量显示--%>
                <div  class="cart-num">${sessionScope.cart.totalCount}</div>
              </c:if>
            </a>
            <a href="pages/manager/manager.jsp" class="admin">后台管理</a>
          </div>
<!--          登录后风格-->
<!--          <div class="topbar-right">-->
<!--            <span>欢迎你<b>张总</b></span>-->
<!--            <a href="#" class="register">注销</a>-->
<!--            <a-->
<!--                    href="pages/cart/cart.jsp"-->
<!--                    class="cart iconfont icon-gouwuche-->
<!--			">-->
<!--              购物车-->
<!--              <div class="cart-num">3</div>-->
<!--            </a>-->
<!--            <a href="./pages/manager/book_manager.jsp" class="admin">后台管理</a>-->
<!--          </div>-->
        </div>
      </div>
      <div class="header w">
        <a href="#" class="header-logo" ></a>
        <div class="header-nav">
          <ul>
            <li><a href="#">java</a></li>
            <li><a href="#">前端</a></li>
            <li><a href="#">小说</a></li>
            <li><a href="#">文学</a></li>
            <li><a href="#">青春文学</a></li>
            <li><a href="#">艺术</a></li>
            <li><a href="#">管理</a></li>
          </ul>
        </div>
        <div class="header-search">
          <input type="text" placeholder="十万个为什么" />
          <button class="iconfont icon-search"></button>
        </div>
      </div>
      <div class="banner w clearfix">
        <div class="banner-left">
          <ul>
            <li>
              <a href="">
                <span>文学 鉴赏</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>社科 研究</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>少儿 培训</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>艺术 赏析</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>生活 周边</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>文教 科技</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>热销 畅读</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
          </ul>
        </div>
        <div class="banner-right">
          <div class="swiper-container">
            <ul class="swiper-wrapper">
              <li class="swiper-slide">
                <img src="./static/uploads/banner4.jpg" alt="">
                <!-- <div class="banner-img"></div> -->
              </li>
              <li class="swiper-slide">
                <img src="./static/uploads/banner5.jpg" alt="">
                <!-- <div class="banner-img"></div> -->
              </li>
              <li class="swiper-slide">
                <img src="./static/uploads/banner6.jpg" alt="">
                <!-- <div class="banner-img"></div> -->
              </li>
            </ul>
            <div class="swiper-button-prev"></div>

            <div class="swiper-button-next"></div>

            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </div>
      <div class="books-list ">
        <div class="w">
          <div class="list">
            <div class="list-header">
              <div class="title">图书列表</div>
              <div class="price-search">
                <form action="client/bookServlet" method="get">
                  <input type="hidden" name="action" value="pageByPrice">
                  <span>价格:</span>
                  <input type="text" name="min" value="${param.min}">
                  <span>—元</span>
                  <input type="text" name="max" value="${param.max}">
                  <span>元</span>
                  <button type="submit">查询</button>
                </form>

              </div>
            </div>
            <div class="list-content">


              <c:forEach items="${requestScope.page.items}" var="book">
                <div href="" class="list-item">
                  <img src="${book.imgPath}" alt="">
                  <p>书名:${book.name}</p>
                  <p>作者:${book.author}</p>
                  <p>价格:￥${book.price}</p>
                  <p>销量:${book.sales}</p>
                  <p>库存:${book.stock}</p>
                  <button bookId="${book.id}" class="addToCart">加入购物车</button>
                </div>
              </c:forEach>


            </div>
            <div class="list-footer">
              <%--静态包含分页条--%>
              <%@include file="/pages/common/page_nav.jsp"%>
            </div>
          </div>
            </div>
          </div>
        </div>
       
      </div>
      <div class="cate w">
        <div class="list">
          <a href="" class="list-item">
            <i class="iconfont icon-java"></i>
            <span>java</span>
          </a>
          <a href="" class="list-item"
            ><i class="iconfont icon-h5"></i>h5</a
          >
          <a href="" class="list-item">
            <i class="iconfont icon-python"></i>python
          </a>
          <a href="" class="list-item"
            ><i class="iconfont icon-tianchongxing-"></i>pm</a
          >
          <a href="" class="list-item"
            ><i class="iconfont icon-php_elephant"></i>php</a
          >
          <a href="" class="list-item"
            ><i class="iconfont icon-go"></i>go</a
          >
        </div>
        <a href="" class="img">
          <img src="./static/uploads/cate4.jpg" alt="" />
        </a>
        <a href="" class="img">
          <img src="./static/uploads/cate5.jpg" alt="" />
        </a>
        <a href="" class="img">
          <img src="./static/uploads/cate6.jpg" alt="" />
        </a>
      </div>
      <div class="books">
        <div class="w">
          <div class="seckill">
            <div class="seckill-header">
              <div class="title">
                图书秒杀
              </div>
              <!-- <i class="iconfont icon-huanyipi"></i> -->
            </div>
            <div class="seckill-content">
             
                  <a href="" class="tip"> 
                     <h5>距离结束还有</h5>
                     <i class="iconfont icon-shandian"></i>
                     <div class="downcount">
                      <span class="time">00</span>
                      <span class="token">:</span>
                      <span class="time">00</span>
                      <span class="token">:</span>
                      <span class="time">00</span>
                     </div>
                  </a>
              
              
                  <a href="" class="books-sec">
                    <img src="./static/uploads/congwanqingdaominguo.jpg" alt="">
                    <p>从晚晴到民国</p>
                    <div>
                      <span class="cur-price">￥28.9</span>
                      <span class="pre-price">￥36.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
                  <a href="" class="books-sec">
                    <img src="./static/uploads/cyuyanrumenjingdian.jpg" alt="">
                    <p>c语言入门经典</p>
                    <div>
                      <span class="cur-price">￥55.9</span>
                      <span class="pre-price">￥68.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
                  <a href="" class="books-sec">
                    <img src="./static/uploads/fusang.jpg" alt="">
                    <p>扶桑</p>
                    <div>
                      <span class="cur-price">￥30.9</span>
                      <span class="pre-price">￥47.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
                  <a href="" class="books-sec">
                    <img src="./static/uploads/geihaizideshi.jpg" alt="">
                    <p>给孩子的诗</p>
                    <div>
                      <span class="cur-price">￥18.9</span>
                      <span class="pre-price">￥25.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
             
           
                 
             
              </ul>
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
                  <img src="./static/img/bottom1.png" alt="">
                  <span>大咖级讲师亲自授课</span>
                </a>
              </li>
              <li>
                <a href="">
                  <img src="./static/img/bottom.png" alt="">
                  <span>课程为学员成长持续赋能</span>
                </a>
              </li>
              <li>
                <a href="">
                  <img src="./static/img/bottom2.png" alt="">
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
              <dd>http://www.moumou.com<dd>
            </dl>
          </div>
        </div>
        <div class="down">
          某某书城.Copyright ©2015
        </div>
      </div>
     

    </div>
    <script src="./static/script/swiper.min.js"></script>
    <script>
      var swiper = new Swiper('.swiper-container', {
        autoplay: true,
        pagination: {
          el: '.swiper-pagination',
          dynamicBullets: true
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      })
    </script>
  </body>
</html>
