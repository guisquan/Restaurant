package com.oracle.desk.dao;

import com.oracle.desk.biz.DeskBizImpl;
import com.oracle.desk.entity.Desk;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

import static org.junit.Assert.*;

public class DeskDaoImplTest {

    @Test
    public void findAllDesk() {
        DeskDaoImpl deskDao = new DeskDaoImpl();
        List<Desk> deskList = null;
        try {
            deskList = deskDao.findAllDesk();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assertNotNull(deskList);
        for (Desk desk : deskList) {
            System.out.println(desk.toString());
        }
    }
}