package com.hopu.service;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Favority;

public interface FavorityService {
    PageInfo<Favority> findByPage(Integer pageNum , Integer pageSize , Integer userId);

    boolean findIfFavority(Integer id,Integer userid);

    void cancleFavorite(Integer roomId, Integer id);

    void addFavorite(Integer roomId, Integer userId);
}
