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

    /**
     * 所有类型，无级别
     *
     * @return
     * @throws SQLException
     */
    public List<Style> allStyle() throws SQLException {
        String sql = "select * from style where 1 ";
        return qr.query(sql, new BeanListHandler<>(Style.class));
    }

    /**
     * 根据名称查找类型
     *
     * @param name
     * @return
     * @throws SQLException
     */
    public Style findStyleByName(String name) throws SQLException {
        String sql = "select * from style where sName = ?";
        return qr.query(sql, new BeanHandler<>(Style.class), name);
    }

    public Style findStyleById(int sid) throws SQLException {
        String sql = "select * from style where sid = ?";
        return qr.query(sql, new BeanHandler<>(Style.class), sid);
    }

    public boolean insertStyle(Style style) throws SQLException {
        String sql = "insert into style(sName, spid, sPath) values(?,?,?)";
        return 0 < qr.update(sql, style.getsName(), style.getSpid(), style.getsPath());
    }

    public boolean updateStyle(Style style) throws SQLException {
        String sql = "UPDATE `style` SET sName=?, spid=?, sPath=? WHERE sid=?";
        return 0 < qr.update(sql, style.getsName(), style.getSpid(), style.getsPath(), style.getSid());
    }
}
