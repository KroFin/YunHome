package com.hopu.web.controller.front;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Room;
import com.hopu.domain.User;
import com.hopu.service.FavorityService;
import com.hopu.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/front/")
public class FavorityController {
    @Autowired
    private FavorityService favorityService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value="/list" ,name="分页查询所有收藏的房屋信息页面")
    public String findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          HttpServletRequest request){

        // 获取当前登录用户
        User user = (User) request.getSession().getAttribute("loginUser");
        PageInfo<Room> pageInfo = roomService.findFavorityByPage(pageNum,pageSize,user.getId());

        request.setAttribute("page",pageInfo);
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("pageSize",pageSize);
        return "front/room_favorite";
    }

}
