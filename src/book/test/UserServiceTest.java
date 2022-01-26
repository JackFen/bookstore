package book.test;

import book.pojo.User;
import book.service.UserService;
import book.service.impl.UserServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceTest {
    UserService userService=new UserServiceImpl();
    @Test
    public void registUser() {
        userService.registUser(new User(null,"bbj123","666666","bbj123@qq.com"));
        userService.registUser(new User(null,"abc123","666666","abc123@qq.com"));
    }

    @Test
    public void login() {
        System.out.println(userService.login(new User(null,"jack","123456",null)));
    }

    @Test
    public void existsUsername() {
        if (userService.existsUsername("jack")){
            System.out.println("用户名已存在");
        }
        else {
            System.out.println("用户名可用");
        }
    }
}