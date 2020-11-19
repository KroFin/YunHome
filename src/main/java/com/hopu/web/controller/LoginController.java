package com.hopu.web.controller;

import com.hopu.domain.User;
import com.hopu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private UserService userService;

    // 跳转到用户注册页面
    @RequestMapping("/toRegisterPage")
    public String toRegisterPage(){
        // 响应到用户列表页面
        return "register";
    }

    // 用户注册
    @RequestMapping("/register")
    public String register(User user, Model model){
        System.out.println(user);
        try {
            userService.addUser(user);
            return "login";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg","用户注册失败："+e.getMessage());
            return "register";
        }
    }
    // 用户名重名校验
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(String username){
        User user =userService.findByUserName(username);
        if(user==null){
            return "0";  // 代表当前用户名未被注册
        }else {
            return "1";  // 代表当前用户名已被注册
        }
    }
}
