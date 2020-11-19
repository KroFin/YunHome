package com.hopu.web.controller.user;

import com.github.pagehelper.PageInfo;
import com.hopu.domain.User;
import com.hopu.service.UserService;
import com.hopu.utils.RedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/user")
public class AUserController {

    @RequestMapping("/checkCode")
    @ResponseBody
    public String checkCode(String smsCode) {
        RedisTemplate redisTemplate = RedisClient.getRedisTemplate();
        Object o = redisTemplate.opsForValue().get("smscode");
        if(o==null){
            return "验证码过期";  // 表示验证码过期
        }else {
            if(smsCode.equals(o)){
                return "ok";  // 表示验证码没有问题
            }else {
                return "验证码错误";  // 表示验证码错误
            }
        }
    }

    @RequestMapping("/sendSMSCode")
    public void sendSMSCode(String telephone) {
        try {
            userService.sendSMSCode(telephone);
            // 暂时把生成的验证码放在sesion域对象,后期会使用redis
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("验证码发送失败！");
        }
    }

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list",name = "进入用户管理页面")
    public String findAll(@RequestParam(defaultValue = "1")Integer pageNum , @RequestParam(defaultValue = "5")Integer pageSize, HttpServletRequest request){
        PageInfo<User> pageInfo = userService.selectAll(pageNum,pageSize);
        request.setAttribute("page",pageInfo);
        return "admin/system/user/user-list";
    }

    @RequestMapping("/toAddPage")
    public String toAddPage(){
        return "admin/system/user/user-add";
    }

    @RequestMapping("/add")
    public String add(User user){
        user.setRole("管理员");
        userService.addUser(user);
        // 把请求数据放在域对象中
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/toUpdatePage")
    public String toUpdatePage(Integer userId,HttpServletRequest request){
        // 还需要查询用户信息
        User user=userService.findById(userId);
        request.setAttribute("user",user);
        return "admin/system/user/user-update";
    }

    @RequestMapping("/update")
    public String update(User user){
        userService.updateUser(user);
        // 把请求数据放在域对象中
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/delete")
    public String delete(Integer id){
        userService.deleteUser(id);
        // 把请求数据放在域对象中
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam String searchContent ,@RequestParam String searchKeywords){
        userService.userSearch(searchContent, searchKeywords);
        return "redirect:/admin/user/list";
    }
}
