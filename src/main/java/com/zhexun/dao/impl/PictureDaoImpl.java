package com.zhexun.dao.impl;

import com.zhexun.dao.PictureDao;
import com.zhexun.entity.Comment;
import com.zhexun.entity.Picture;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PictureDaoImpl implements PictureDao {
    @Override
    public boolean postPicture(Connection conn, Picture picture) {
        String sql = "INSERT INTO picture(" + picture.getInsertCondition() + ")";
        Statement st = null;
        int i = 0;
        try {
            st = conn.createStatement();
            i = st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return i != 0;
    }

    @Override
    public List<Picture> getAllPicture(Connection conn) {
        int id = 100;
        int count = 100;
        Picture pic = new Picture();
        List<Picture> pictures = new ArrayList<>();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM picture WHERE pictureid=" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    pic.setPictureid(rs.getInt("pictureid"));
                    pic.setUid(rs.getInt("uid"));
                    pic.setUname(rs.getString("uname"));
                    pic.setPname(rs.getString("pname"));
                    pic.setDate(rs.getString("date"));
                    pictures.add(new Picture(pic));
                    count--;
                }
                id--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return pictures;
    }

    @Override
    public boolean deletePicture(Connection conn, int pictureid) {
        String sql = "DELETE FROM picture WHERE pictureid=" + pictureid;
        Statement statement = null;
        int rs;
        try {
            statement = conn.createStatement();
            rs = statement.executeUpdate(sql);
            return rs != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }
}
