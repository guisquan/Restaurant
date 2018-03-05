package com.oracle.desk.dao;

import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.desk.entity.Desk;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DeskDaoImpl {
    private QueryRunner qr = new TxQueryRunner();

    public List<Desk> findAllDesk() throws SQLException {
        String sql = "select * from desk";
        return qr.query(sql, new BeanListHandler<>(Desk.class));
    }
}
