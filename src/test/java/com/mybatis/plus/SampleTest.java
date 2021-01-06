package com.mybatis.plus;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import com.mybatis.plus.system.service.IUserService;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

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

    /**
     * 动态表名
     */
    @Test
    void test() {
        // 自己去观察打印 SQL 目前随机访问 user_2018  user_2019 表
        for (int i = 0; i < 6; i++) {
            userMapper.selectById(1);
        }
    }

    /**
     * 测试防止全局修改或删除
     */
    @Test
    void testFullTable() {
        userMapper.selectList(new QueryWrapper<>());
        User user = new User();
        user.setName("test_update");
        userMapper.update(user, new QueryWrapper<User>().eq("id", 1L));
        try {
            userMapper.update(user, new QueryWrapper<>());
        } catch (MyBatisSystemException e) {
            System.out.println("全表更新异常");
        }
        try {
            userMapper.delete(new QueryWrapper<>());
        } catch (MyBatisSystemException e) {
            System.out.println("全表删除异常");
        }
        List<User> userList = userMapper.selectList(new QueryWrapper<>());
        userList.forEach(System.out::println);
    }

    @Test
    void testMutiData(){
        List users = userService.selectAll();
        System.out.println(users);
        users = userService.selectAll2();
        System.out.println(users);
        users = userService.selectByCondition();
        System.out.println(users);
    }

}
