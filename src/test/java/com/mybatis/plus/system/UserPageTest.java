package com.mybatis.plus.system;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/***
 * @version 1.0
 * @author augurit
 * @date 2021/1/5 17:55 
 */
@SpringBootTest
class UserPageTest {

    @Autowired
    private UserMapper userMapper;

    // 测试分页查询
    @Test
    void testPage(){
        // 参数一：当前页
        // 参数二：页面大小
        Page<User> page = new Page<>(2,5);
        userMapper.selectPage(page,new QueryWrapper<User>().lambda().eq(User::getEmail,"test2@baomidou.com"));
        page.getRecords().forEach(System.out::println);
        System.out.println(page.getTotal());
    }

    // 自定义方法分页
    @Test
    void testPage2(){
        // 参数一：当前页
        // 参数二：页面大小
        Page<User> page = new Page<>(2,5);
        List<User> list = userMapper.iPageSelect(page);
        list.forEach(System.out::println);
    }

    /**
     * 使用pagehelper
     */
    @Test
    void testIn() {
        List<Long> ids = Arrays.asList(1L, 2L,3L,4L,5L,6L,7L,8L,9L,10L);
        Page<User> mpPage = userMapper.selectPage(new Page<>(1, 5), Wrappers.<User>query().in("id", ids));
        List<User> records = mpPage.getRecords();
        records.forEach(System.out::println);

        // pagehelper
        PageInfo<User> info = PageHelper.startPage(1, 5)
                .doSelectPageInfo(() -> userMapper.selectList(Wrappers.<User>query().in("id", ids)));
        List<User> list = info.getList();
        list.forEach(System.out::println);
    }

}
