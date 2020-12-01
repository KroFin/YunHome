package com.hopu.service;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Room;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface RoomService {

    PageInfo<Room> findPage(Integer pageNum, Integer pageSize);

    void add(Room room, MultipartFile[] uploadfiles);

    Room findById(Integer id);

    void update(Room room);

    void delete(Integer id);

    void updateRoomRentStatus(Integer id, int rentStatus);

    List<Room> findAll();

    PageInfo<Room> findPageFront(Integer pageNum, Integer pageSize,Integer rent_status,Integer regionId,String rent);

    PageInfo<Room> findFavorityByPage(Integer pageNum, Integer pageSize,Integer userId);

    List<Room> findRoomByHistoryUser(Integer userId);
}
