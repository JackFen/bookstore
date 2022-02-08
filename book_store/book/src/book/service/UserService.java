package book.service;

import book.pojo.User;

public interface UserService {

    /*注册用户*/
    public void registUser(User user);
    /*登录*/
    public User login (User user);
    /*检查用户名是否可用，返回true表示用户名已经存在，返回false表示用户名可用*/
    public boolean existsUsername(String username);
}
