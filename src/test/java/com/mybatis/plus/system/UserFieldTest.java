package com.mybatis.plus.system;

import com.mybatis.plus.system.entity.User;
import com.mybatis.plus.system.service.IUserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/***
 * @version 1.0
 * @author augurit
 * @date 2021/1/5 15:22 
 */
@SpringBootTest
class UserFieldTest {

    @Autowired
    private IUserService userService;

    /**
     * 逻辑删除
     * UPDATE user SET deleted=1 WHERE id=? AND deleted=0
     */
    @Test
    void testLogicDelete(){
        boolean res = userService.removeById(8L);
        System.out.println(res);
    }

    /**
     * 自动填充-插入
     * INSERT INTO user ( id, name, age, email, gmt_create ) VALUES ( ?, ?, ?, ?, ? )
     * 1346361708224851970(Long), 自动(String), 34(Integer), auto@qq.com(String), 2021-01-05T15:43:40.104(LocalDateTime)
     */
    @Test
    void testInsertFill(){
        User user = new User();
        user.setName("自动");
        user.setAge(34);
        user.setEmail("auto@qq.com");
        boolean res = userService.save(user);
        System.out.println(res);
    }

    /**
     * 自动填充-更新
     * UPDATE user SET name=?, age=?, email=?, gmt_modified=? WHERE id=? AND deleted=0
     * 自动1(String), 34(Integer), auto@qq.com1(String), 2021-01-05T15:46:55.015(LocalDateTime), 1346361708224851970(Long)
     */
    @Test
    void testUpdateFill(){
        User user = new User();
        user.setName("自动1");
        user.setAge(34);
        user.setEmail("auto@qq.com1");
        user.setId(1346361708224851970L);
        boolean res = userService.updateById(user);
        System.out.println(res);
    }

    /**
     * 测试乐观锁
     *
     */
    @Test
    void testOptimisticLocker(){
        // SELECT id,name,age,email,gmt_create,gmt_modified,version,deleted FROM user WHERE id=? AND deleted=0
        User user = userService.getById(1346363747667537921L);
        user.setAge(98);

        // SELECT id,name,age,email,gmt_create,gmt_modified,version,deleted FROM user WHERE id=? AND deleted=0
        User user2 = userService.getById(1346363747667537921L);
        user2.setAge(45);
        // UPDATE user SET name=?, age=?, email=?, gmt_create=?, gmt_modified=?, version=? WHERE id=? AND version=? AND deleted=0
        // 自动(String), 45(Integer), auto@qq.com(String), 2021-01-05T15:51:46.344(LocalDateTime), 2021-01-05T15:54:35.422(LocalDateTime), 1(Integer), 1346363747667537921(Long), 0(Integer)
        boolean res2 = userService.updateById(user2);
        System.out.println(res2); // true
        System.out.println(user2); // version = 1
        // UPDATE user SET name=?, age=?, email=?, gmt_create=?, gmt_modified=?, version=? WHERE id=? AND version=? AND deleted=0
        // 自动(String), 98(Integer), auto@qq.com(String), 2021-01-05T15:51:46.344(LocalDateTime), 2021-01-05T15:54:35.570(LocalDateTime), 1(Integer), 1346363747667537921(Long), 0(Integer)
        boolean res = userService.updateById(user);
        System.out.println(res); // false
        System.out.println(user);
    }
}
