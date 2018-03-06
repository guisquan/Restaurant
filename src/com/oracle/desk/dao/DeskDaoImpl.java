package com.oracle.desk.dao;

import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.desk.entity.Desk;
import com.oracle.user.entity.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DeskDaoImpl {
    private QueryRunner qr = new TxQueryRunner();

    public List<Desk> findAllDesk() throws SQLException {
        String sql = "select * from desk";
        return qr.query(sql, new BeanListHandler<>(Desk.class));
    }

    public boolean bindDesk(int did, User water) throws SQLException {
        String sql = "update desk set uid=? , dState=? where did=?";
        return 0 < qr.update(sql, water.getUid(), 1, did);
    }

    public boolean clearDeskState(int did) throws SQLException {
        String sql = "update desk set uid null,dSate=0 where did=?";
        return 0 < qr.update(sql, did);
    }

    public Desk findDeskById(int did) throws SQLException {
        String sql = "select * from desk where did =?";
        return qr.query(sql, new BeanHandler<>(Desk.class), did);
    }
}
