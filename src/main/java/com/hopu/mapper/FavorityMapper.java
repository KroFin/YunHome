package com.hopu.mapper;

import com.hopu.domain.Favority;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface FavorityMapper {

    @Select("select * from t_favorites")
    List<Favority> findAll();

    @Select("select * from t_favorites where room_id=#{id} and user_id=#{userid}")
    Favority findByRoomId(@Param("id") Integer id, @Param("userid") Integer userid);

    @Select("delete from t_favorites where room_id=#{roomId} and user_id=#{userId}")
    void deleteByRoomIdAndUserId(@Param("roomId") Integer roomId, @Param("userId") Integer userId);

    @Insert("insert into t_favorites (room_id,user_id,create_time) values (#{roomId},#{userId},#{createTime})")
    void addFavorite(@Param("roomId") Integer roomId, @Param("userId") Integer userId, @Param("createTime") Date createTime);

    @Select("select * from t_favorites where user_id =#{userId}")
    List<Favority> findByUserId(Integer userId);
}
