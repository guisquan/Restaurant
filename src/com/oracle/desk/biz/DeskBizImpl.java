package com.oracle.desk.biz;

import com.oracle.desk.dao.DeskDaoImpl;
import com.oracle.desk.entity.Desk;
import com.oracle.user.entity.User;

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

    /**
     * 绑定桌子和服务员
     *
     * @param did   桌子ID
     * @param water 服务员
     * @return
     */
    public boolean bindDesk(int did, User water) {
        try {
            return deskDao.bindDesk(did, water);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 清除桌子上的服务员和状态
     *
     * @param did 桌子ID
     * @return
     */
    public boolean clearDesk(int did) {
        try {
            return deskDao.clearDeskState(did);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Desk findDeskById(int did) {
        Desk desk = null;
        try {
            desk = deskDao.findDeskById(did);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return desk;
    }
}
