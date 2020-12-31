package com.mybatis.plus.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/***
 * @version 1.0
 * @author augurit
 * @date 2020/12/22 17:06 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
//    @TableId(type=IdType.AUTO)
    private Long id;
    private String name;
    private Integer age;
    private String email;

//    @TableField(fill = FieldFill.INSERT)
//    private LocalDateTime gmtCreate;
//    @TableField(fill = FieldFill.UPDATE)
//    private LocalDateTime gmtModified;
//    @Version //乐观锁Version注解，数据库类型为int，设默认值为配置的值
//    private Integer version;
//    @TableLogic //逻辑删除，数据库类型为int，设置默认值为0
//    private Integer deleted;
}
