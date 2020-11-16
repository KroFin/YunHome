package com.hopu.service;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.RoomImg;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface RoomImgService {
    PageInfo<RoomImg> findPage(Integer pageNum, Integer pageSize);

    void add(RoomImg roomImg, MultipartFile roomImgs , HttpServletRequest request);

    void delete(Integer id);
}
