package com.mybatis.plus.system;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.mapper.UserMapper;
import com.mybatis.plus.system.service.IUserService;
import com.sun.corba.se.spi.ior.ObjectKey;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/22 17:08 
 */
@SpringBootTest
class UserServiceTest {
    @Autowired
    private IUserService userService;

    /**
     * 保存单条记录
     */
    @Test
    void testSave(){
        User user = new User();
        user.setEmail("test@qq.com");
//        user.setId(2L); // 不会忽略id，报重复id错误
        user.setAge(23);
        user.setName("Tom345");
        boolean res = userService.save(user);
        System.out.println(res);
    }

    /**
     * 批量插入
     */
    @Test
    void testSaveBatch(){
        List<User> userList = new ArrayList<>();
        for(int i = 0 ; i < 10 ; i++){
            User user = new User();
            user.setEmail("test@qq.com" + i);
//        user.setId(2L); // 不会忽略id，报重复id错误
            user.setAge(23 + i);
            user.setName("Tom"+i);
            userList.add(user);
        }
        boolean res = userService.saveBatch(userList);
        System.out.println(res);
    }

    /**
     * 保存或更新单条记录
     * INSERT INTO user ( id, name, age, email ) VALUES ( ?, ?, ?, ? )
     * UPDATE user SET name=?, age=?, email=? WHERE id=?
     */
    @Test
    void testSaveOrUpdate(){
        User user = new User();
        user.setEmail("test@qq.com123");
//        user.setId(2L);
        user.setAge(23);
        user.setName("Jim");
        boolean res = userService.saveOrUpdate(user);
        System.out.println(res);
    }

    /**
     * 批量插入或更新
     * INSERT INTO user ( id, name, age, email ) VALUES ( ?, ?, ?, ? )
     */
    @Test
    void testSaveOrUpdateBatch(){
        List<User> userList = new ArrayList<>();
        for(int i = 0 ; i < 10 ; i++){
            User user = new User();
            user.setEmail("jim@qq.com" + i);
            if(i < 5){
                // SELECT id,name,age,email FROM user WHERE id=?
                // UPDATE user SET name=?, age=?, email=? WHERE id=?
                user.setId(4L);
            }
            user.setAge(40 + i);
            user.setName("Jim"+i);
            userList.add(user);
        }
        boolean res = userService.saveOrUpdateBatch(userList);
        System.out.println(res);
    }

    /**
     * 根据id删除记录
     * DELETE FROM user WHERE id=?
     */
    @Test
    void testDeleteById(){
        boolean res = userService.removeById(1346284970614591490L);// id不存在则返回false
        System.out.println(res);
    }

    /**
     * 根据多个id批量删除
     * DELETE FROM user WHERE id IN ( ? , ? , ? )
     * // 没有符合条件的记录可删除，返回false
     */
    @Test
    void testDeleteBatchIds(){
        boolean res = userService.removeByIds(Arrays.asList(1346284970614591490L,1346284970606202882L,1346284970606202882L));
        System.out.println(res);
    }

    /**
     * 根据map条件删除记录
     * DELETE FROM user WHERE name = ?
     */
    @Test
    void testDeleteByMap(){
        Map<String,Object> columnMap = new HashMap<>();
        columnMap.put("name","Jim822"); //"name"为数据库字段名，而不是实体属性名
        boolean res = userService.removeByMap(columnMap); // 没有符合条件的记录可删除，返回false
        System.out.println(res);
    }

    /**
     * 根据queryWrapper条件删除
     */
    @Test
    void testDelete(){
        Wrapper<User> queryWrapper= new QueryWrapper<User>()
                .lambda().eq(User::getName, "Billie");
        boolean res = userService.remove(queryWrapper);
        System.out.println(res);
    }

    /**
     * 测试根据ID更新记录
     * UPDATE user SET name=? WHERE id=?
     */
    @Test
    void testUpdateById(){
        User user = new User();
        user.setName("cat");
        user.setId(3777L); // id不存在则返回false
        boolean res = userService.updateById(user);
        System.out.println(res);
    }

    /**
     * 测试批量更新
     * UPDATE user SET name=?, age=?, email=? WHERE id=?
     */
    @Test
    void testUpdateBatch(){
        List<User> userList = new ArrayList<>();
        for(int i = 0 ; i < 10 ; i++){
            User user = new User();
            user.setEmail("tom@qq.com" + i);
            if(i < 8){
                user.setId((long) i);
            }
            user.setAge(40 + i);
            user.setName("Tom"+i);
            userList.add(user);
        }
        boolean res = userService.updateBatchById(userList);// 不存在的id忽略
        System.out.println(res);
    }

    /**
     * 根据lambdaUpdate更新数据
     * UPDATE user SET email=? WHERE (id = ?)
     */
    @Test
    void testUpdateWrapper(){
        boolean res = userService.update(Wrappers.<User>lambdaUpdate().set(User::getEmail, "testupdatewrapper").eq(User::getId, 3)
        );
        System.out.println(res);
    }

    /**
     * 根据entity和updateWrapper更新记录
     * UPDATE user SET name=?, email=? WHERE (id = ?)
     */
    @Test
    void teatUpdate(){
        User user = new User();
        user.setName("xiaohong");
        boolean res = userService.update(
                user,
                Wrappers.<User>lambdaUpdate().set(User::getEmail, "testupdatewrapper").eq(User::getId, 3)
        );
        System.out.println(res);
    }

    /**
     * 测试查询全部记录
     * SELECT id,name,age,email FROM user
     */
    @Test
    void testList(){
        List<User> userList = userService.list();
        userList.forEach(System.out::println);
    }

    /**
     * 测试查询全部记录
     * SELECT id,name,age,email FROM user WHERE (email = ?)
     */
    @Test
    void testListWrapper(){
        List<User> userList = userService.list(new QueryWrapper<User>().lambda().eq(User::getEmail,"tom@qq.com7"));
        userList.forEach(System.out::println);
    }

    /**
     * 根据id列表获取数据
     * SELECT id,name,age,email FROM user WHERE id IN ( ? , ? , ? )
     */
    @Test
    void testListByIds(){
        List<User> userList = userService.listByIds(Arrays.asList(1346284970589425665L,1346284970576842753L,1346284970606202882L));
        userList.forEach(System.out::println);
    }

    /**
     * 根据map条件查询
     * SELECT id,name,age,email FROM user WHERE name = ?
     */
    @Test
    void testListByMap(){
        Map<String,Object> map = new HashMap<>();
        map.put("name","Tom");
        List<User> userList = userService.listByMap(map);
        userList.forEach(System.out::println);
    }

    /**
     * 查询所有记录
     * SELECT id,name,age,email FROM user
     * {name=Sandy, id=14, age=35, email=test4@baomidou.com}
     * 返回map列表
     */
    @Test
    void testListMaps(){
        List<Map<String, Object>> userList = userService.listMaps();
        userList.forEach(System.out::println);
    }

    /**
     * 根据Wrapper条件查询所有记录
     * SELECT id,name,age,email FROM user WHERE (name = ?)
     * {name=Sandy, id=14, age=35, email=test4@baomidou.com}
     * 返回map列表
     */
    @Test
    void testListMapsWrapper(){
        List<Map<String, Object>> userList = userService.listMaps(new QueryWrapper<User>().lambda().eq(User::getName,"Tom"));
        userList.forEach(System.out::println);
    }

    /**
     * 根据QueryWrapper获取数据
     * SELECT id,name,age,email FROM user WHERE (name = ?)
     */
    @Test
    void testGetOne(){
        // 不加false,如果结果集多于1则抛出异常
        User user = userService.getOne(new QueryWrapper<User>().lambda().eq(User::getName,"Jim6"),false);
        System.out.println(user);
    }

    /**
     * 根据id获取一条记录
     * SELECT id,name,age,email FROM user WHERE id=?
     */
    @Test
    void testFetById(){
        // 没有则返回null
        User user = userService.getById(1346283816505819137L);
        System.out.println(user);
    }

    /**
     * 根据QueryWrapper获取数据
     * SELECT id,name,age,email FROM user WHERE (name = ?)
     */
    @Test
    void testGetMap(){
        // 结果集是多条，只返回一条
        Map<String ,Object> user = userService.getMap(new QueryWrapper<User>().lambda().eq(User::getName,"Jim6"));
        System.out.println(user);
    }

    /**
     * 根据QueryWrapper获取数据条数
     * SELECT COUNT( * ) FROM user WHERE (name = ?)
     */
    @Test
    void testCountWrapper(){
        int count = userService.count(new QueryWrapper<User>().lambda().eq(User::getName,"Jim6"));
        System.out.println(count);
    }

    /**
     * 获取所有数据条数
     * SELECT COUNT( * ) FROM user
     */
    @Test
    void testCount(){
        int count = userService.count();
        System.out.println(count);
    }

    /**
     * 无条件查询分页数据
     * SELECT COUNT(1) FROM user
     * SELECT id,name,age,email FROM user LIMIT ?,?
     */
    @Test
    void testPage(){
        Page<User> page = new Page<>(2,5);
        userService.page(page);
        page.getRecords().forEach(System.out::println);
    }

    /**
     * wrapper条件查询分页数据
     * SELECT COUNT(1) FROM user WHERE (email LIKE ?)
     * SELECT id,name,age,email FROM user WHERE (email LIKE ?) LIMIT ?,?
     */
    @Test
    void testPageWrapper(){
        Page<User> page = new Page<>(2,5);
        userService.page(page,new QueryWrapper<User>().lambda().likeLeft(User::getEmail,"@baomidou.com"));
        page.getRecords().forEach(System.out::println);
    }

    /**
     * 无条件查询分页数据
     * SELECT COUNT(1) FROM user
     * SELECT id,name,age,email FROM user LIMIT ?,?
     * {name=Tom6, id=6, age=46, email=tom@qq.com6}
     */
    @Test
    void testPageMaps(){
        Page<Map<String, Object>> page = new Page<>(2,5);
        userService.pageMaps(page);
        page.getRecords().forEach(System.out::println);
    }

    /**
     * wrapper条件查询分页数据
     * SELECT COUNT(1) FROM user WHERE (email LIKE ?)
     * SELECT id,name,age,email FROM user WHERE (email LIKE ?) LIMIT ?,?
     */
    @Test
    void testPageMapsWrapper(){
        Page<Map<String, Object>> page = new Page<>(2,5);
        userService.pageMaps(page,new QueryWrapper<User>().lambda().likeLeft(User::getEmail,"@baomidou.com"));
        page.getRecords().forEach(System.out::println);
    }

}
