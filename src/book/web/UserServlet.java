package book.web;

import book.pojo.User;
import book.service.UserService;
import book.service.impl.UserServiceImpl;
import book.utils.WebUtils;
import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

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

    protected void ajaxExistUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求的参数username
        String username = req.getParameter("username");
        //调用userService.existsUsername();
        boolean existsUsername = userService.existsUsername(username);
        //把返回的结果封装成为map对象
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("existsUsername",existsUsername );
        Gson gson=new Gson();
        String json = gson.toJson(resultMap);
        resp.getWriter().write(json);
    }
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
            //保存用户登录的信息
            req.getSession().setAttribute("user",loginUser );
            //跳到成功页面Login_success.html
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req,resp);
        }
    }
    protected void loginout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.摧毁session中用户登录的信息（或者销毁session）
        req.getSession().invalidate();
        //2.重新定向到首页（或者登录页面）
        resp.sendRedirect(req.getContextPath());
    }
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, InvocationTargetException, IllegalAccessException {
        //获取Session中的验证码
        String token= (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //删除session中的验证码
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        String code = req.getParameter("code");
        //1.获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

            //2.检擦验证码是否正确
            if (token!=null&&token.equalsIgnoreCase(code)) {
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