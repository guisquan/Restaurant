package com.oracle.messages.dao;

import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.messages.entity.Message;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @author gui
 */
public class MessageDaoImpl {
    /**
     * 使用快捷的操作方式对数据库进行增删改查
     */
    private QueryRunner qr = new TxQueryRunner();
    private static final String orderDesc = "order by mDate desc";
    private static final String orderAsc = "order by mDate asc";

    public boolean addMessage(Message message) throws SQLException {
        String sql = "INSERT INTO messages(mId, mEmail, message, mSubject, mState, mDate) VALUES(?, ?, ?, ?, 0, ?)";
        Object[] params = {message.getmId(),
                message.getmEmail(),
                message.getMessage(),
                message.getmSubject(),
                message.getmState()};
        if (qr.update(sql, params) > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Message> findMessageBySubject(String subject) throws SQLException {
        //构建查询任务
        String sql = "SELECT * FROM message WHERE subject like ? order by mDate desc";
        return qr.query(sql, new BeanListHandler<>(Message.class), "%" + subject + "%");
    }

    public Message findMessageByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM message WHERE email=? ";
        return qr.query(sql, new BeanHandler<>(Message.class), email);
    }

    public List<Message> findMessageByState(int state) throws SQLException {
        String sql = "SELECT * FROM message WHERE state=? ";
        return qr.query(sql, new BeanListHandler<>(Message.class), state);
    }
}
