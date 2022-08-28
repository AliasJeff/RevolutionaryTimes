package com.zhexun.dao;

import com.zhexun.entity.Picture;

import java.sql.Connection;
import java.util.List;

public interface PictureDao {
    boolean postPicture(Connection conn, Picture picture);
    List<Picture> getAllPicture(Connection conn);
    boolean deletePicture(Connection conn, int pictureid);
}
