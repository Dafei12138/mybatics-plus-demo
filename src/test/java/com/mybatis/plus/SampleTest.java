package com.mybatis.plus;

import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import com.mybatis.plus.system.service.IUserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/30 17:01 
 */
@SpringBootTest
class SampleTest {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private IUserService userService;

    @Test
    void testMapper(){
        List<User> userList = userMapper.selectList(null);
        userList.forEach(System.out::println);
    }

    @Test
    void testService(){
        List<User> userList = userService.list();
        userList.forEach(System.out::println);
    }
}
