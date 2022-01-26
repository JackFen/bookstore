<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>书城首页</title>
    <link rel="stylesheet" href="./static/css/minireset.css" />
    <link rel="stylesheet" href="./static/css/common.css" />
    <link rel="stylesheet" href="./static/css/iconfont.css" />
    <link rel="stylesheet" href="./static/css/index.css" />
    <link rel="stylesheet" href="./static/css/swiper.min.css" />
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
            <a href="pages/user/login.jsp" class="login">登录</a>
            <a href="pages/user/regist.jsp" class="register">注册</a>
            <a
              href="pages/cart/cart.jsp"
              class="cart iconfont icon-gouwuche
			"
            >
              购物车
              <div class="cart-num">3</div>
            </a>
            <a href="pages/manager/book_manager.jsp" class="admin">后台管理</a>
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
        <a href="#" class="header-logo"></a>
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
                <span>价格:</span>
                <input type="text">
                <span>-元</span>
                <input type="text">
                <span>元</span>
                <button>查询</button>
              </div>
            </div>
            <div class="list-content">
              <div class="list-item">
                <img src="./static/uploads/huozhe.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/huranqiri.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/Javabianchengsixiang.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/jiaofu.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/jieyouzahuodian.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/kanjian.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/pinang.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/pingfandeshijie.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/qiadaohaochudexingfu.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>
              <div href="" class="list-item">
                <img src="./static/uploads/renyueshenhua.jpg" alt="">
                <p>书名:活着</p>
                <p>作者:余华</p>
                <p>价格:￥66.6</p>
                <p>销量:230</p>
                <p>库存:1000</p>
                <button>加入购物车</button>
              </div>

            </div>
            <div class="list-footer">
                <div>首页</div>
                <div>上一页</div>
                <ul><li class="active">1</li><li>2</li><li>3</li></ul>
                <div>下一页</div>
                <div>末页</div>
                <span>共10页</span>
                <span>30条记录</span>
                <span>到第</span>
                <input type="text">
                <span>页</span>
                <button>确定</button>
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
              <dd>http://www.atguigu.com<dd>
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
