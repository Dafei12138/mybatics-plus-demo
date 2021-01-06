package com.mybatis.plus.system.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import com.mybatis.plus.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/30 16:51 
 */
@Service
@DS("master")
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements IUserService{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List selectAll2() {
        return  jdbcTemplate.queryForList("select * from user");
    }

    @Override
    @DS("slave_2")
    public List selectAll() {
        return  jdbcTemplate.queryForList("select * from user");
    }

    @Override
    @DS("slave_1")
    public List selectByCondition() {
        return  jdbcTemplate.queryForList("select * from user where age >10");
    }
}
