package book.service.impl;

import book.dao.UserDao;
import book.dao.impl.UserDaoImpl;
import book.pojo.User;
import book.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao=new UserDaoImpl();
    @Override
    public void registUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.queryUsernameAndPassword(user.getUsername(),user.getPassword());
    }

    @Override
    public boolean existsUsername(String username) {
        if (userDao.queryUsername(username)==null){
            //等于null，说明没查到，没查到表明可用
            return false;
        }
        return true;
    }
}
