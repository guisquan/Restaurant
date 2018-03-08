package com.oracle.style.biz;

import com.oracle.style.dao.StyleDaoImpl;
import com.oracle.style.entity.Style;

import java.sql.SQLException;
import java.util.List;

public class StyleBizImpl {
    private StyleDaoImpl styleDao = new StyleDaoImpl();

    /**
     * 查找目录
     *
     * @return 目录
     */
    public List<Style> findAllStyle() {
        List<Style> styleList = null;
        try {
            styleList = styleDao.findAllStyle();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return styleList;
    }

    /**
     * 查找Style
     *
     * @param name
     * @return 存在：true：不存在：false
     */
    public boolean hasStyle(String name) {
        Style result = null;
        try {
            //这个方法完蛋了，参数为中文无法查询；
//            style = styleDao.findStyleByName(name);
            for (Style style : styleDao.allStyle()) {
                if (name.equals(style.getsName())) {
                    result = style;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result != null;
    }

    /**
     * 添加Style
     *
     * @param style
     * @return
     */
    public boolean addStyle(Style style) {
        try {
            return styleDao.insertStyle(style);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean modifyStyle(Style style) {
        try {
            return styleDao.updateStyle(style);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Style findStyleById(int sid) {
        try {
            return styleDao.findStyleById(sid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Style> allStyle() {
        try {
            return styleDao.allStyle();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
