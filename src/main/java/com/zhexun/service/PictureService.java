package com.zhexun.service;

import com.zhexun.entity.Picture;

import java.util.List;

public interface PictureService {
    boolean postPicture(Picture picture);
    List<Picture> getAllPicture();
    boolean deletePicture(int pictureid);
}
