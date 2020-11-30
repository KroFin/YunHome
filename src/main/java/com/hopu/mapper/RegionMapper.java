package com.hopu.mapper;

import com.hopu.domain.Region;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RegionMapper {

    @Select("SELECT * FROM t_region")
    List<Region> findAll();

    @Select("SELECT * FROM t_region WHERE id =#{regionId}")
    Region findById(Integer regionId);
}
