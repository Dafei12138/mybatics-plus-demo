package com.mybatis.plus.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mybatis.plus.system.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/30 16:50 
 */
public interface IUserService  extends IService<User> {

    List selectByCondition();

    List selectAll();

    List selectAll2();
}
