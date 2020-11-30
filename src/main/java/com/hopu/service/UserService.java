package com.hopu.service;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserService {
    PageInfo<User> selectAll(Integer pageNum, Integer pageSize);

    void add(User user);

    User findById(Integer userId);

    void updateUser(User user);

    void deleteUser(Integer id);

    void userSearch(String searchContent ,String searchKeywords);

    User findByUserName(String username);

    void sendSMSCode(String telephone);

    User login(User user);

    void ChangePasswordBackByMail(@Param("email")String email , @Param("password") String password);

    User selectUserByMail(@Param("email")String email);

}
