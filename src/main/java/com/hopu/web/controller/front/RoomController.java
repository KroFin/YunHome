package com.hopu.web.controller.front;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.Room;
import com.hopu.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/admin/room")
public class RoomController {
    @Autowired
    private RoomService roomService;

    /**
     * 前台分页显示房屋信息
     */
    @RequestMapping(value="/list" ,name="分页查询所有房屋信息页面")
    public String findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                            @RequestParam(defaultValue = "10") Integer pageSize,
                            HttpServletRequest request){
        PageInfo<Room> pageInfo = roomService.findPage(pageNum,pageSize);
        request.setAttribute("page",pageInfo);
        return "admin/system/room/room-list";
    }

    @RequestMapping("/toAddPage")
    public String toAddPage(){
        return "admin/system/room/room-add";
    }
    /**
     * 添加房源信息
     */
    @RequestMapping("/add")
    public String add(Room room, MultipartFile[] roomImgs) throws IOException {
        // 设置发布房源的当前登录用户
        room.setUserId(3);  // todo 后续需要修改为从session域中获取当前登录用户信息
        room.setRentStatus(-1);
        roomService.add(room,roomImgs);
        return "redirect:/admin/room/list";
    }

    @RequestMapping("/toUpdatePage")
    public String toUpdatePage(Integer id,HttpServletRequest request){
        Room room=roomService.findById(id);
        request.setAttribute("room",room);
        return "admin/system/room/room-update";
    }
    /**
     * 修改房源信息
     */
    @RequestMapping("/update")
    public String update(Room room) {
        roomService.update(room);
        return "redirect:/admin/room/list";
    }

    /**
     * 删除房源信息
     */
    @RequestMapping("/delete")
    public String delete(Integer id) {
        roomService.delete(id);
        return "redirect:/admin/room/list";
    }

    /**
     * 房源上架
     */
    @RequestMapping("/up")
    public String up(Integer id) {
        roomService.updateRoomRentStatus(id,0);
        return "redirect:/admin/room/list";
    }
    /**
     * 房源下架
     */
    @RequestMapping("/down")
    public String down(Integer id) {
        roomService.updateRoomRentStatus(id,-1);
        return "redirect:/admin/room/list";
    }
}
