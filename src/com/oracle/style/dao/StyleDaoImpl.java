package com.oracle.style.dao;

import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.style.entity.Style;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class StyleDaoImpl {
    private QueryRunner qr = new TxQueryRunner();

    /**
     * 查询两级目录
     *
     * @return 查找的目录
     * @throws SQLException 查询异常
     */
    public List<Style> findAllStyle() throws SQLException {
        //查询一级目录
        String sql = "SELECT c.*  FROM style c " +
                "WHERE NOT EXISTS(SELECT * FROM style p WHERE p.sid = c.spid)";
        List<Style> styleList = qr.query(sql, new BeanListHandler<>(Style.class));

        for (Style style : styleList) {
            sql = "select * from style where spid=?";
            List<Style> childrenList = qr.query(sql, new BeanListHandler<>(Style.class), style.getSid());
            style.setChildStyle(childrenList);
        }
        return styleList;
    }
}
