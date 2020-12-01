package com.hopu.web.controller.front;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hopu.domain.*;
import com.hopu.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/front/room")
public class RoomController {
    @Autowired
    private RoomService roomService;
    @Autowired
    private RegionService regionService;
    @Autowired
    private RoomImgService roomImgService;
    @Autowired
    private UserService userService;
    @Autowired
    private FavorityService favorityService;

    @RequestMapping(value = "/deleteHistory")
    public String deleteHistory(@RequestParam("hhId")Long hhId){
        roomService.deleteHistory(hhId);
        return "front/room_history";
    }

    /**
     * 前台分页显示房屋信息
     */

    @RequestMapping(value = "/historyList",name="分页查询浏览记录")
    public String showHistoryList(@RequestParam(defaultValue = "1") Integer pageNum,
                                  @RequestParam(defaultValue = "5") Integer pageSize,
                                  HttpSession session,
                                  HttpServletRequest request){
        User user =(User) session.getAttribute("loginUser");
        List<Room> roomHistoryList = roomService.findRoomByHistoryUser(user.getId());

//        List<Date> historyTime = new ArrayList<>();
//

        List<History> historyList = roomService.findHistoryByUserId(user.getId());

        PageHelper.startPage(pageNum,pageSize);

        for (Room room : roomHistoryList){
            room.setHistoryList(historyList);
        }

        try {
            PageInfo<Room> pageInfo = new PageInfo<>(roomHistoryList,pageSize);
            request.setAttribute("page",pageInfo);
        }finally {
            PageHelper.clearPage();
        }
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("pageSize",pageSize);
        return "front/room_history";
    }

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

    @RequestMapping("/toRoomDetails")
    public String toRoomDetailsPage(@RequestParam("id")Integer id, HttpServletRequest request, HttpSession session){
        // 查询房源信息
        Room room = roomService.findById(id);

        System.out.println(room);

        // 根据前端页面需要，还可以查询房源对应的图片信息、以及房东信息、区域信息
        List<RoomImg> roomImgList= roomImgService.findByRoomId(room.getId());
        room.setRoomImgList(roomImgList);

        User user = userService.findById(room.getUserId());
        room.setUser(user);

        Object loginUser = session.getAttribute("loginUser");

        if (loginUser instanceof User){
            userService.insertHistory(((User) loginUser).getId(),room.getId());
        }

        Region region = regionService.findById(room.getRegionId());
        room.setRegion(region);

        // 存储在域对象中
        request.setAttribute("room",room);

        return "front/room_details";
    }


    // 房源详情页面初始化加载判断房源收藏状态
    @RequestMapping("/ifFavorite")
    @ResponseBody
    public String ifFavorite(Integer roomId,HttpServletRequest request){
        Object loginUser = request.getSession().getAttribute("loginUser");
        if(loginUser==null){
            return "-1";  // 未登录
        }else{
            User user =(User)loginUser;
            boolean ifFavority = favorityService.findIfFavority(roomId, user.getId());
            if(ifFavority){
                // 表示已经收藏
                return "1";
            }else {
                return "0"; // 表示登录，但未收藏
            }
        }
    }

    // 取消收藏
    @RequestMapping("/cancleFavorite")
    @ResponseBody
    public String cancleFavorite(Integer roomId,HttpServletRequest request){
        try {
            User loginUser = (User) request.getSession().getAttribute("loginUser");
            favorityService.cancleFavorite(roomId,loginUser.getId());
            return "0";
        } catch (Exception e) {
            e.printStackTrace();
            return "-1";
        }
    }
    // 添加收藏
    @RequestMapping("/addFavorite")
    @ResponseBody
    public String addFavorite(Integer roomId,HttpServletRequest request){
        try {
            User loginUser = (User) request.getSession().getAttribute("loginUser");
            favorityService.addFavorite(roomId,loginUser.getId());
            return "0";
        } catch (Exception e) {
            e.printStackTrace();
            return "-1";
        }
    }
}

