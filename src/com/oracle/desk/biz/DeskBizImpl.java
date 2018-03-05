package com.oracle.desk.biz;

import com.oracle.desk.dao.DeskDaoImpl;
import com.oracle.desk.entity.Desk;

import java.sql.SQLException;
import java.util.List;

public class DeskBizImpl {
    private DeskDaoImpl deskDao = new DeskDaoImpl();

    public List<Desk> findAllDesk() {
        List<Desk> deskList = null;
        try {
            deskList = deskDao.findAllDesk();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deskList;
    }
}
