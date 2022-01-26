package book.dao;

import book.pojo.User;

public interface UserDao {

    /*根据用户名查询用户信息
    * 如果返回null，说明没有这个用户，反之亦然*/
    public User queryUsername(String username);
    /*根据用户名查询用户信息
    * 如果返回null，说明用户名或密码错误，反之亦然*/
    public User queryUsernameAndPassword(String username,String password);
    /*保存用户信息
    * @return 返回-1表示操作失败，其它是sql语句影响的行数*/
    public int saveUser(User user);
}
