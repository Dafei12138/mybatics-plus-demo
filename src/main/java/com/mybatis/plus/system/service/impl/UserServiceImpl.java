package com.mybatis.plus.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import com.mybatis.plus.system.service.IUserService;
import org.springframework.stereotype.Service;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/30 16:51 
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements IUserService{
}
