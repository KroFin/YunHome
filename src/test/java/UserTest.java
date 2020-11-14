import com.hopu.domain.User;
import com.hopu.mapper.UserMapper;
import com.hopu.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

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
}
