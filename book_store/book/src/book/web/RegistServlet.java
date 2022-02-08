package book.web;

import book.pojo.User;
import book.service.UserService;
import book.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class RegistServlet extends HttpServlet {
    private UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取Session中的验证码
        String token= (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //删除session中的验证码
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);/*注意：此类已被抛弃，功能转到userServlet*/
        String code = req.getParameter("code");
        System.out.println(code);
        System.out.println(token);
        //1.获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        //2.检擦验证码是否正确
        if (token!=null&&token.equalsIgnoreCase(code)){
            //3.用户名是否可用
            if (userService.existsUsername(username)){
                req.setAttribute("msg","用户名已存在！！");
                req.setAttribute("username",username);
                req.setAttribute("email",email);
                //不可用
                req.getRequestDispatcher("pages/user/regist.jsp").forward(req,resp);
            }
            else {
                //可用
                //调用Service保存到数据库
                userService.registUser(new User(null,username,password,email));

                req.getRequestDispatcher("pages/user/regist_success.jsp").forward(req,resp);
            }

        }
        else {
            req.setAttribute("msg","验证码错误！！");
            req.setAttribute("username",username);
            req.setAttribute("email",email);
            //不正确，跳回注册界面
            req.getRequestDispatcher("pages/user/regist.jsp").forward(req,resp);
        }
    }
}
