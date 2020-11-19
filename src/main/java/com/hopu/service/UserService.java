package com.hopu.service;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.User;

public interface UserService {
    PageInfo<User> selectAll(Integer pageNum, Integer pageSize);

    void addUser(User user);

    User findById(Integer userId);

    void updateUser(User user);

    void deleteUser(Integer id);

    void userSearch(String searchContent ,String searchKeywords);

    User findByUserName(String username);

    void sendSMSCode(String telephone);

}
