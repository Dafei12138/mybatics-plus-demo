package com.mybatis.plus.system;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import com.mybatis.plus.system.service.IUserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/22 17:08 
 */
@SpringBootTest
class UserServiceTest {
    @Autowired
    private IUserService userService;


}
