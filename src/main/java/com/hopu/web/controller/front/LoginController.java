package com.hopu.web.controller.front;

import com.hopu.domain.User;
import com.hopu.service.UserService;
import com.hopu.utils.MailUtil;
import com.hopu.utils.RedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("/toPasswordChange")
    public String toPasswordChange(){
        return "passwordchange";
    }

    @RequestMapping("/toChangUPassword")
    public String changUPassword(HttpServletRequest request , HttpSession session){
        String mail = String.valueOf(request.getParameter("email"));
        session.setAttribute("email",mail);
//        userService.ChangePasswordBackByMail(mail,password);
        return "changUPassword";
    }

    @RequestMapping("/passwordChange")
    public String passwordChange(@RequestParam("password") String password , HttpSession session , HttpServletResponse response){
        String email = String.valueOf(session.getAttribute("email"));
        userService.ChangePasswordBackByMail(email,password);
        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.flush();
            out.println("<script>");
            out.println("alert('修改密码成功，可以正常登陆');");
            out.println("history.back();");
            out.println("</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        session.removeAttribute("email");
        return "login";
    }

    @RequestMapping("/findPasswordBack")
    public String findPasswordBack(@RequestParam("email") String email , HttpServletResponse response){

        User user = userService.selectUserByMail(email);

        if (user == null){
            response.setContentType("text/html; charset=UTF-8"); //转码
            PrintWriter out;
            try {
                out = response.getWriter();
                out.flush();
                out.println("<script>");
                out.println("alert('验证邮箱不存在，请注册');");
                out.println("history.back();");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "login";
        }

        MailUtil mailUtil = new MailUtil();

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("请点击下方链接重置您的密码");
        stringBuilder.append("\n");
        stringBuilder.append("http://localhost:8080/user/toChangUPassword?email="+email);

        if (email != null){
            try {
                mailUtil.sendMail(email,stringBuilder.toString());
                response.setContentType("text/html; charset=UTF-8"); //转码
                PrintWriter out = response.getWriter();
                out.flush();
                out.println("<script>");
                out.println("alert('邮件发送成功，请查阅您的邮箱');");
                out.println("history.back();");
                out.println("</script>");
                return "login";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/login";
    }

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
            userService.add(user);
            return "login";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg","用户注册失败："+e.getMessage());
            return "register";
        }
    }

    // 发送手机短信验证码
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


    /**
     * 手机验证码校验
     */
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


    // 跳转到用户登录
    @RequestMapping("/toLoginPage")
    public String toLoginPage(){
        // 响应到用户列表页面
        return "login";
    }

    // 用户登录
    @RequestMapping("/login")
    public String login(User user, Model model,HttpServletRequest request){
        User user1 =userService.login(user);
        if(user1!=null){
            request.getSession().setAttribute("loginUser",user1);
            return "redirect:/index.jsp";
        }else{
            model.addAttribute("loginError_msg","用户名或密码错误！");
            return "login";
        }
    }

    // 用户异步登录
    @RequestMapping("/asyncLogin")
    @ResponseBody
    public String asyncLogin(User user, Model model,HttpServletRequest request){
        User user1 =userService.login(user);
        if(user1!=null){
            request.getSession().setAttribute("loginUser",user1);
            return user1.getUsername();
        }else{
            return "-1";
        }
    }

    // 用户退出
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("loginUser");
        return "redirect:/index.jsp";
    }

}
