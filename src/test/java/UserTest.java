import com.hopu.domain.User;
import com.hopu.mapper.UserMapper;
import com.hopu.service.UserService;
import com.hopu.utils.MailUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.mail.MessagingException;
import java.awt.*;

public class UserTest {

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    @Test
    public void SelectAllUser(){
        System.out.println(userMapper.selectAll());
    }

    @Test
    public void sendMailTest(){
        MailUtil mailUtil = new MailUtil();
        try {
            mailUtil.sendMail("huangkefan233@gmail.com","Test");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
