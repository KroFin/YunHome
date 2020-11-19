package com.hopu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hopu.domain.User;
import com.hopu.mapper.UserMapper;
import com.hopu.service.UserService;
import com.hopu.utils.MD5Util;
import com.hopu.utils.RedisClient;
import com.hopu.utils.SmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageInfo<User> selectAll(Integer pageNum, Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);

        List<User> list = userMapper.selectAll();

        return new PageInfo<>(list);
    }

    @Override
    public void addUser(User user) {
        // 用户密码加密处理
        user.setPassword(MD5Util.encodeByMd5(user.getPassword()));
        user.setCreateTime(new Date());
        userMapper.addUser(user);
    }

    @Override
    public User findById(Integer userId) {
        return userMapper.findById(userId);
    }

    @Override
    public void updateUser(User user) {
        user.setUpdateTime(new Date());
        userMapper.updateUser(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteById(id);
    }

    @Override
    public void userSearch(String searchContent, String searchKeywords) {
        switch (searchKeywords){
            case "用户名" :
                searchKeywords = "username";
                break;
            case "别名" :
                searchKeywords = "nick_name";
                break;
            case "联系电话" :
                searchKeywords = "phone";
                break;
            case "邮箱" :
                searchKeywords = "email";
                break;
        }
        User user = new User();
        userMapper.userSearch(searchContent,searchKeywords);
    }

    @Override
    public User findByUserName(String username) {
        return userMapper.findByUserName(username);
    }

    @Override
    public void sendSMSCode(String telephone) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i <6 ; i++) {
            stringBuffer.append(new Random().nextInt(9) + 1);
        }
        String code=stringBuffer.toString();

        // 2、发送短信
        SmsUtil.sendSms(telephone,code);

        // 3、发送成，就直接讲验证码存入Redis中
        RedisTemplate redisTemplate = RedisClient.getRedisTemplate();
        // 设置短信验证码有效期为1分钟（60s）
        redisTemplate.opsForValue().set("smscode",code,1, TimeUnit.MINUTES);
    }
}
