package com.hopu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hopu.domain.FtpConfig;
import com.hopu.domain.Room;
import com.hopu.domain.RoomImg;
import com.hopu.mapper.RoomImgMapper;
import com.hopu.mapper.RoomMapper;
import com.hopu.service.RoomService;
import com.hopu.utils.FTPUtil;
import com.hopu.utils.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomMapper roomMapper;

    @Autowired
    private RoomImgMapper roomImgMapper;

    @Autowired
    private FtpConfig ftpConfig;

    @Override
    public PageInfo<Room> findPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Room> list = roomMapper.findAll();
        return new PageInfo(list);
    }

    @Override
    public void add(Room room, MultipartFile[] uploadfiles) {
        roomMapper.save(room);
        File file = new File("E:\\nginx-1.18.0\\html");
        for (MultipartFile multipartFile : uploadfiles){
            String newFileName = UUID.randomUUID() + multipartFile.getOriginalFilename();
            try {
                multipartFile.transferTo(new File(file,newFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            roomImgMapper.add(room.getId(),newFileName);
        }
    }

    @Override
    public Room findById(Integer id) {
        return roomMapper.findById(id);
    }

    @Override
    public void update(Room room) {
        // 一旦对房源进行修改，要将原本上架的房源改为下架
        room.setRentStatus(-1);
        roomMapper.update(room);
    }

    @Override
    public void delete(Integer id) {
        roomMapper.deleteById(id);
        // 同时删除数据库图片
        List<RoomImg> roomImgList =roomImgMapper.findByRoomId(id);
        roomImgMapper.deleteByRoomId(id);
        roomImgList.forEach(roomImg -> {
            String img = roomImg.getImg();
            // 同时删除nginx服务器上图片
            File file = new File("E:\\nginx-1.18.0\\html",img);
            if(file.exists()){
                file.delete();
            }
        });
    }

    @Override
    public void updateRoomRentStatus(Integer id, int rentStatus) {
        roomMapper.updateRoom(id,rentStatus);
    }

    public FtpConfig getFtpConfig() {
        return ftpConfig;
    }

    public void setFtpConfig(FtpConfig ftpConfig) {
        this.ftpConfig = ftpConfig;
    }
}
