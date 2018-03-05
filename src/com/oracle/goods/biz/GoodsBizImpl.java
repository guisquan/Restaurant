package com.oracle.goods.biz;

import com.oracle.goods.dao.GoodsDaoImpl;
import com.oracle.goods.entity.Goods;

import java.sql.SQLException;
import java.util.List;

public class GoodsBizImpl {
    private GoodsDaoImpl goodsDao = new GoodsDaoImpl();

    public List<Goods> findGoodsByStyle(int styleId) {
        List<Goods> goodsList = null;
        try {
            goodsList = goodsDao.findGoodsByStyle(styleId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsList;
    }

    public Goods findGoodsDesc(int gid) {
        Goods goods = null;
        try {
            goods = goodsDao.findGoodsDesc(gid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goods;
    }
}
