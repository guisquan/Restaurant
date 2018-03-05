package com.oracle.user.dao;

import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.user.entity.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl {
    public QueryRunner qr = new TxQueryRunner();

    public User login(User form) throws SQLException {
        String sql = "select * from users where userName=? and userPwd=?";
        User user = qr.query(sql, new BeanHandler<User>(User.class), form.getUserName(), form.getUserPwd());
        return user;
    }

    /**
     * 根据Uid查找用户
     *
     * @param uid
     * @return
     * @throws SQLException
     */
    public User findUserByUid(int uid) throws SQLException {
        String sql = "select * from users where uid=?";
        return qr.query(sql, new BeanHandler<>(User.class), uid);
    }

    /**
     * 根据姓名模糊查找服务员、管理员
     *
     * @param name
     * @return
     * @throws SQLException
     */
    public List<User> findUserByName(String name) throws SQLException {
        String sql = "select * from users where userName like ?";
        return qr.query(sql, new BeanListHandler<>(User.class), "%" + name + "%");
    }

}
