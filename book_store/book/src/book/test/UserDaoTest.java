package book.test;

import book.dao.UserDao;
import book.dao.impl.UserDaoImpl;
import book.pojo.User;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoTest {
    UserDao userDao=new UserDaoImpl();
    @Test
    public void queryUsername() {
        if (userDao.queryUsername("admin")==null){
            System.out.println("用户名可用");
        }
        else {
            System.out.println("用户名已存在");
        }
    }

    @Test
    public void queryUsernameAndPassword() {
        if (userDao.queryUsernameAndPassword("admin","admin123")==null){
            System.out.println("用户名或密码错误");
        }
        else {
            System.out.println("登录成功");
        }
    }

    @Test
    public void saveUser() {
        System.out.println(userDao.saveUser(new User(null,"jack12","123456","jack@163.com")));
    }
}