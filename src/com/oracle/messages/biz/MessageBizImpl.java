package com.oracle.messages.biz;

import com.oracle.messages.dao.MessageDaoImpl;
import com.oracle.messages.entity.Message;

import java.sql.SQLException;

public class MessageBizImpl {
    MessageDaoImpl messageDao = new MessageDaoImpl();

    public boolean addMsg(Message message) {
        boolean flag = false;
        try {
            flag = messageDao.addMessage(message);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
