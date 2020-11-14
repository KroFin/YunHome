package com.hopu.mapper;

import com.hopu.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {

    @Select("SELECT * FROM t_user")
    List<User> selectAll();

    void addUser(User user);

    @Select("select * from t_user where id=#{userId}")
    User findById(Integer userId);

    void updateUser(User user);

    @Delete("delete from t_user where id=#{id}")
    void deleteById(Integer id);

    void userSearch(String searchContent ,String searchKeywords);
}
