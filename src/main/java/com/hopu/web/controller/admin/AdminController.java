package com.hopu.web.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/toIndexPage")
    public String toIndexPage(){
        return "admin/home/main";
    }

    @RequestMapping("/toHomePage")
    public String toHomePage(){
        return "admin/home/home";
    }
}
