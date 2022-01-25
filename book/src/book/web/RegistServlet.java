package book.web;

import book.pojo.User;
import book.service.UserService;
import book.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegistServlet extends HttpServlet {
    private UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
        //2.检擦验证码是否正确
        if ("7364".equals(code)){
            //3.用户名是否可用
            if (userService.existsUsername(username)){
                //不可用
                System.out.println("用户名"+username+"已存在");
                req.getRequestDispatcher("pages/user/regist.html").forward(req,resp);
            }
            else {
                //可用
                //调用Service保存到数据库
                userService.registUser(new User(null,username,password,email));

                req.getRequestDispatcher("pages/user/regist_success.html").forward(req,resp);
            }

        }
        else {
            //不正确，跳回注册界面
            System.out.println("验证码"+code+"错误");
            req.getRequestDispatcher("pages/user/regist.html").forward(req,resp);
        }
    }
}
