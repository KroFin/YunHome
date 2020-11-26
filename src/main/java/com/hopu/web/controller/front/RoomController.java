package com.hopu.web.controller.front;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Region;
import com.hopu.domain.Room;
import com.hopu.service.RegionService;
import com.hopu.service.RoomService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/front/room")
public class RoomController {
    @Autowired
    private RoomService roomService;
    @Autowired
    private RegionService regionService;

    /**
     * 前台分页显示房屋信息
     */
    @RequestMapping(value="/list" ,name="分页查询所有房屋信息页面")
    public String findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "regionId",required = false) Integer regionId,
                          @RequestParam(value = "regionName",required = false) String regionName,
                          @RequestParam(value = "rent",required = false) String rent,
                          HttpServletRequest request){
        int rentStatus=0;
        PageInfo<Room> pageInfo = roomService.findPageFront(pageNum,pageSize,rentStatus,regionId,rent);
        request.setAttribute("page",pageInfo);
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("pageSize",pageSize);

        // 同步方式查询房源区域信息
        List<Region> regionList = regionService.findAll();
        request.setAttribute("regisons",regionList);
        request.setAttribute("regionId",regionId);
        request.setAttribute("regionName",regionName);

        // 需要对rent进行处理
        if(rent !=null){
            if("0_500".equals(rent)){
                request.setAttribute("rent","500元以下");
            }else if("4500_999999".equals(rent)){
                request.setAttribute("rent","4500元以上");
            }else if(StringUtils.isNotEmpty(rent)){
                request.setAttribute("rent",rent+"元");
            }
        }

        return "front/room_list";
    }
}

