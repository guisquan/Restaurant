package com.oracle.user.biz;

import com.oracle.user.dao.UserDaoImpl;
import com.oracle.user.entity.User;

import java.sql.SQLException;

public class UserBizImpl {
    UserDaoImpl userDao = new UserDaoImpl();

    public User login(User form) {
        User user = null;
        try {
            user = userDao.login(form);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
