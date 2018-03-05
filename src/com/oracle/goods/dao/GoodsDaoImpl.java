package com.oracle.goods.dao;

import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.goods.entity.Goods;
import com.oracle.style.entity.Style;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class GoodsDaoImpl {
    private QueryRunner qr = new TxQueryRunner();

    public List<Goods> findGoodsByStyle(int styleId) throws SQLException {
        String sql = "SELECT * FROM restaurant.goods WHERE sid = ?";
        return qr.query(sql, new BeanListHandler<>(Goods.class), styleId);
    }

    public Goods findGoodsDesc(int gid) throws SQLException {
        String sql = "SELECT * FROM restaurant.goods WHERE gid=?";
        return qr.query(sql, new BeanHandler<>(Goods.class), gid);
    }

}
