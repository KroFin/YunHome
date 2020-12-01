
import com.hopu.mapper.UserMapper;
import com.hopu.service.UserService;
import com.hopu.utils.MailUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.mail.MessagingException;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext*.xml"})
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

    @Test
    public void insertHistory(){
        userMapper.insertHistory(1,1);
    }
}
