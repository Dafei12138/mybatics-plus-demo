package com.mybatis.plus.system;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/22 17:08 
 */
@SpringBootTest
class UserMapperTest {
    @Autowired
    private UserMapper userMapper;

    @Test
    void testInsert(){
        User user = new User();
        user.setAge(23);
        user.setEmail("test_email123");
        user.setName("whf1312");
        int res = userMapper.insert(user);
        System.out.println(res);
        System.out.println(user.toString());
    }

    @Test
    void testUpdateById(){
        User user = new User();
        user.setId(1L);
        user.setEmail("ab@c.c");
        int res = userMapper.updateById(user);
        System.out.println(res);
    }

    @Test
    void testUpdate(){
        User user = new User();
        user.setName("mp");
        user.setId(2L);
        int res = userMapper.update(user,
                Wrappers.<User>lambdaUpdate()
                        .set(User::getAge, 3)
                        .eq(User::getId, 2)
        );
        System.out.println(res);

        res = userMapper.update(
                null,
                Wrappers.<User>lambdaUpdate().set(User::getEmail, null).eq(User::getId, 3)
        );
        System.out.println(res);
        user = new User();
        user.setEmail("miemie@baomidou.com");
        res = userMapper.update(
                user,
                new QueryWrapper<User>()
                        .lambda().eq(User::getId, 4)
        );
        System.out.println(res);
    }

    @Test
    void testDeleteById(){
        int res = userMapper.deleteById(1);
        System.out.println(res);
    }

    @Test
    void testDeleteBatchIds(){
        int res = userMapper.deleteBatchIds(Arrays.asList(1,2,3));
        System.out.println(res);
    }

    @Test
    void testDeleteByMap(){
        Map<String,Object> columnMap = new HashMap<>();
        columnMap.put("name","Sandy"); //"name"为数据库字段名，而不是实体属性名
        int res = userMapper.deleteByMap(columnMap);
        System.out.println(res);
    }

    @Test
    void testDelete(){
        Wrapper<User> queryWrapper= new QueryWrapper<User>()
                .lambda().eq(User::getName, "Billie");
        int res = userMapper.delete(queryWrapper);
        System.out.println(res);
    }

    // 测试查询
    @Test
    void testSelectById(){
        User user = userMapper.selectById(1L);
        System.out.println(user);
    }

    // 测试批量查询！
    @Test
    void testSelectByBatchId(){
        List<User> users = userMapper.selectBatchIds(Arrays.asList(1, 2, 3));
        users.forEach(System.out::println);
    }

    @Test
    void testSelectOne(){
        User user = userMapper.selectOne(new QueryWrapper<User>().lambda().eq(User::getId, 2));
        System.out.println(user);
    }

    @Test
    void testSelectCount(){
        Integer count = userMapper.selectCount(new QueryWrapper<User>().lambda().eq(User::getEmail,"test2@baomidou.com"));
        System.out.println(count);
    }

    @Test
    void testSelectList(){
        List<User> userList = userMapper.selectList(new QueryWrapper<User>().lambda().eq(User::getEmail,"test2@baomidou.com"));
        userList.forEach(System.out::println);
    }

    @Test
    void testSelectMaps(){
        List<Map<String,Object>> userList = userMapper.selectMaps(new QueryWrapper<User>().lambda().eq(User::getEmail,"test2@baomidou.com"));
        userList.forEach(System.out::println);
    }

    @Test
    void testSelectObjs(){
        List<Object> userList = userMapper.selectObjs(new QueryWrapper<User>().lambda().eq(User::getEmail,"test2@baomidou.com"));
        userList.forEach(System.out::println);
    }

    // 按条件查询之一使用map操作
    @Test
    void testSelectByMap(){
        HashMap<String, Object> map = new HashMap<>();
        // 自定义要查询
        map.put("name","whf");
        map.put("age",112);

        List<User> users = userMapper.selectByMap(map);
        users.forEach(System.out::println);
    }



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

    @Test
    void selectMapsPage() {
        IPage<Map<String, Object>> page = userMapper.selectMapsPage(new Page<>(2, 5), Wrappers.<User>query().orderByAsc("age"));
        System.out.println(page.getRecords().get(0));
    }
}
