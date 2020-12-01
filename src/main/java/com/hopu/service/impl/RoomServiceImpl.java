package com.hopu.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hopu.domain.Favority;
import com.hopu.domain.FtpConfig;
import com.hopu.domain.Room;
import com.hopu.domain.RoomImg;
import com.hopu.mapper.FavorityMapper;
import com.hopu.mapper.RoomImgMapper;
import com.hopu.mapper.RoomMapper;
import com.hopu.mapper.UserMapper;
import com.hopu.service.RoomService;
import com.hopu.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {

    @Autowired
    private FavorityMapper favorityMapper;

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

    @Override
    public List<Room> findAll() {
        return roomMapper.findAll();
    }

    @Override
    public PageInfo<Room> findPageFront(Integer index, Integer size,Integer rentStatus,Integer regionId,String rent) {
        PageHelper.startPage(index,size);
        // 对region进行判断
        if(regionId !=null &&regionId==0){
            regionId=null;
        }
        // 对rent租金进行拆解
        int beginRent=0;
        int endRent=9999999;
        if(StringUtils.isNotEmpty(rent)){
            String[] rents = rent.split("_");
            beginRent=Integer.parseInt(rents[0]);
            endRent=Integer.parseInt(rents[1]);
        }
        List<Room> list = roomMapper.findAllFront(rentStatus,regionId,beginRent,endRent);
        return new PageInfo(list);
    }

    @Override
    public PageInfo<Room> findFavorityByPage(Integer pageNum, Integer pageSize, Integer userId) {
        List<Favority> favorityList =favorityMapper.findByUserId(userId);
        List<Integer> roomIdList = favorityList.stream().map(favority -> favority.getRoomId()).collect(Collectors.toList());
        // 非空处理判断
        if(roomIdList==null || roomIdList.size()<=0){
            return null;
        }
        PageHelper.startPage(pageNum,pageSize);

        List<Room> list = roomMapper.findAllByIds(roomIdList);
        // 查询图片
        list.forEach(room -> {
            List<RoomImg> roomImgList = roomImgMapper.findByRoomId(room.getId());
            room.setRoomImgList(roomImgList);
        });

        return new PageInfo(list);
    }

    @Override
    public List<Room> findRoomByHistoryUser(Integer userId) {
        return roomMapper.findRoomByHistoryUser(userId);
    }


    public FtpConfig getFtpConfig() {
        return ftpConfig;
    }

    public void setFtpConfig(FtpConfig ftpConfig) {
        this.ftpConfig = ftpConfig;
    }
}
