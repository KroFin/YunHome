package com.hopu.mapper;

import com.hopu.domain.Room;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomMapper {
    List<Room> findAll();
}
