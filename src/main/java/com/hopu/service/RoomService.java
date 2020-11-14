package com.hopu.service;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Room;
import org.springframework.web.multipart.MultipartFile;

public interface RoomService {
    PageInfo<Room> findPage(Integer pageNum, Integer pageSize);

    void add(Room room, MultipartFile[] uploadfiles);

    Room findById(Integer id);

    void update(Room room);

    void delete(Integer id);

    void updateRoomRentStatus(Integer id, int rentStatus);
}
