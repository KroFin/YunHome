package com.hopu.web.controller.admin;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Room;
import com.hopu.domain.RoomImg;
import com.hopu.service.RoomImgService;
import com.hopu.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/roomImg")
public class RoomImgController {
    @Autowired
    private RoomService roomService;
    @Autowired
    private RoomImgService roomImgService;
    /**
     * 分页查询所有房屋信息
     */
    @RequestMapping(value="/list" ,name="进入房屋图片管理页面")
    public String findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "10") Integer pageSize,
                          HttpServletRequest request){
        PageInfo<RoomImg> pageInfo = roomImgService.findPage(pageNum,pageSize);
        request.setAttribute("page",pageInfo);
        return "admin/system/roomImg/roomImg-list";
    }


    @RequestMapping("/toAddPage")
    public String toAddPage(HttpServletRequest request){
        // 添加，需要知道给哪个房屋添加图片，所以可以同步或者异步方式加载当前房东的所有房屋
        // todo 只能查询自己发布的所有房源信息
        List<Room> roomList=roomService.findAll();
        request.setAttribute("rooms",roomList);
        return "admin/system/roomImg/roomImg-add";
    }
    /**
     * 添加房源信息
     */
    @RequestMapping("/add")
    public String add(RoomImg roomImg, MultipartFile roomImgs , HttpServletRequest httpServletRequest) throws IOException {
        // 设置发布房源的当前登录用户
        roomImgService.add(roomImg,roomImgs,httpServletRequest);
        return "redirect:/admin/roomImg/list";
    }


    /**
     * 删除房源图片信息
     */
    @RequestMapping("/delete")
    public String delete(Integer id) {
        roomImgService.delete(id);
        return "redirect:/admin/roomImg/list";
    }

}
