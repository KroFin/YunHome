package com.hopu.mapper;

import com.hopu.domain.History;
import com.hopu.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    @Select("SELECT * FROM t_user WHERE username = #{username}")
    User findByUserName(String username);

    @Select("SELECT * FROM t_user")
    List<User> selectAll();

    void addUser(User user);

    @Select("select * from t_user where id=#{userId}")
    User findById(Integer userId);

    void updateUser(User user);

    @Delete("delete from t_user where id=#{id}")
    void deleteById(Integer id);

    void userSearch(String searchContent ,String searchKeywords);

    @Select("SELECT * FROM t_user WHERE username= #{username} AND password =#{password}")
    User findUserByNameAndPWD(@Param("username") String username, @Param("password")String password);

    @Update("update t_user set password = #{password} where email = #{email}")
    void ChangePasswordBackByMail(@Param("email")String email , @Param("password") String password);

    @Select("select * from t_user where email = #{email}")
    User selectUserByMail(@Param("email")String email);

    @Insert("insert t_history value(null,#{roomId}, Now(), #{userId})")
    void insertHistory(@Param("userId")Integer userId,@Param("roomId")Integer roomId);
}
