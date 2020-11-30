package com.hopu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hopu.domain.Favority;
import com.hopu.mapper.FavorityMapper;
import com.hopu.service.FavorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.PrivilegedExceptionAction;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class FavorityServiceImpl implements FavorityService {

    @Autowired
    private FavorityMapper favorityMapper;

    @Override
    public PageInfo<Favority> findByPage(Integer pageNum, Integer pageSize, Integer userId) {

        PageHelper.startPage(pageNum,pageSize);

        List<Favority> list = favorityMapper.findAll();

        return new PageInfo<>(list,5);
    }

    @Override
    public boolean findIfFavority(Integer id,Integer userid) {
        return favorityMapper.findByRoomId(id,userid)== null? true:false;
    }

    @Override
    public void cancleFavorite(Integer roomId, Integer userId) {
        favorityMapper.deleteByRoomIdAndUserId(roomId,userId);
    }

    @Override
    public void addFavorite(Integer roomId, Integer userId) {
        // 添加收藏之前可以进行判断，是否收藏
        Favority favority = favorityMapper.findByRoomId(roomId, userId);
        if(favority==null){
            favorityMapper.addFavorite(roomId,userId,new Date());
        }
    }
}
