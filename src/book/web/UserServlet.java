package book.web;

import book.pojo.User;
import book.service.UserService;
import book.service.impl.UserServiceImpl;
import book.utils.WebUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

public class UserServlet extends BaseServlet {
    private UserService userService=new UserServiceImpl();
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action=req.getParameter("action");
//        try {
//            //获取action业务鉴别字符串，获取相应的业务，方法反射对象
//            Method method = this.getClass().getDeclaredMethod(action,HttpServletRequest.class,HttpServletResponse.class);
//            //调用目标业务方法
//            method.invoke(this,req,resp );
//            System.out.println(method);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获取请求参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        //2.调用uerService.login()登录处理业务
        User loginUser=userService.login(new User(null,username,password,null));
        //如果等于null,说明登录失败
        if (loginUser==null){
            //把错误信息和回显的表单项信息保存到Request域中
            req.setAttribute("msg","用户名或密码错误");
            req.setAttribute("username",username);
            //跳回登录页面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }
        else {
            //登录成功
            //跳到成功页面Login_success.html
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req,resp);
        }
    }
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //1.获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
            //2.检擦验证码是否正确
            if ("7364".equals(code)) {
                //3.用户名是否可用
                if (userService.existsUsername(username)) {
                    req.setAttribute("msg", "用户名已存在！！");
                    req.setAttribute("username", username);
                    req.setAttribute("email", email);
                    //不可用
                    req.getRequestDispatcher("pages/user/regist.jsp").forward(req, resp);
                } else {
                    //可用
                    //调用Service保存到数据库
                    userService.registUser(new User(null, username, password, email));

                    req.getRequestDispatcher("pages/user/regist_success.jsp").forward(req, resp);
                }

            } else {
                req.setAttribute("msg", "验证码错误！！");
                req.setAttribute("username", username);
                req.setAttribute("email", email);
                //不正确，跳回注册界面
                req.getRequestDispatcher("pages/user/regist.jsp").forward(req, resp);
            }
        }
    }