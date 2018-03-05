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
}
