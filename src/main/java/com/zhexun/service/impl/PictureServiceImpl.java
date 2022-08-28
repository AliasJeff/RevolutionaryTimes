package com.zhexun.service.impl;

import com.zhexun.dao.PictureDao;
import com.zhexun.dao.impl.PictureDaoImpl;
import com.zhexun.entity.Picture;
import com.zhexun.service.PictureService;
import com.zhexun.util.JDBCUtil;

import java.sql.Connection;
import java.util.List;

public class PictureServiceImpl implements PictureService {
    PictureDao pictureDao = new PictureDaoImpl();
    @Override
    public boolean postPicture(Picture picture) {
        Connection conn = JDBCUtil.getConnection();
        boolean success;
        success = pictureDao.postPicture(conn, picture);
        JDBCUtil.release(conn);
        return success;
    }

    @Override
    public List<Picture> getAllPicture() {
        Connection conn = JDBCUtil.getConnection();
        List<Picture> pictures;
        pictures = pictureDao.getAllPicture(conn);
        JDBCUtil.release(conn);
        return pictures;
    }

    @Override
    public boolean deletePicture(int pictureid) {
        Connection conn = JDBCUtil.getConnection();
        boolean success;
        success = pictureDao.deletePicture(conn, pictureid);
        JDBCUtil.release(conn);
        return success;
    }
}
