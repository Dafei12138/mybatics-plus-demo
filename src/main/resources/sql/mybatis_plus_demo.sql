/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : mybatis_plus_demo

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 26/06/2021 21:05:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '查看用户列表', 'sys:user:info');
INSERT INTO `sys_menu` VALUES (2, '查看角色列表', 'sys:role:info');
INSERT INTO `sys_menu` VALUES (3, '查看权限列表', 'sys:menu:info');
INSERT INTO `sys_menu` VALUES (4, '查看所有数据', 'sys:info:all');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ADMIN');
INSERT INTO `sys_role` VALUES (2, 'USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint(11) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(11) NULL DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3, 1, 3);
INSERT INTO `sys_role_menu` VALUES (4, 2, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐值',
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态:NORMAL正常  PROHIBIT禁用',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'a1bb09ad5dea12e0f94762cb116c447e80c784d8aa2c6625263f7f3436cdd583', 'RvP3UID2n30Q2sycZYvH', 'NORMAL');
INSERT INTO `sys_user` VALUES (2, 'user', '376eb5d2698c804ee83594fe8b0217f03ad138a046f7fa42b44c232c2e5e2b38', 'OVlrD37bDUKNcFRB10qG', 'NORMAL');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(11) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deleted` tinyint(255) NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `version` tinyint(255) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1346384232967041027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Tom1', 41, 'tom@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, 'Tom2', 42, 'tom@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 'xiaohong', 43, 'testupdatewrapper', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, 'Tom4', 44, 'tom@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (5, 'Tom5', 45, 'tom@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (6, 'Tom6', 46, 'tom@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (7, 'Tom7', 47, 'tom@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (8, 'Tom', 36, 'test3@baomidou.com', 1, NULL, NULL, NULL);
INSERT INTO `user` VALUES (9, 'Sandy', 30, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (10, 'Billie', 34, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (11, 'Jone', 29, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, 'Jack', 32, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, 'Tom', 41, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (14, 'Sandy', 35, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (15, 'Billie', 39, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (16, 'Jone', 34, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (17, 'Jack', 37, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (18, 'Tom', 46, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (19, 'Sandy', 40, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (20, 'Billie', 44, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (21, 'Jone', 39, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (22, 'Jack', 42, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (23, 'Tom', 51, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (24, 'Sandy', 45, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (25, 'Billie', 49, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (26, 'Jone', 44, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (27, 'Jack', 47, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (28, 'Tom', 56, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (29, 'Sandy', 50, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (30, 'Billie', 54, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (31, 'Jone', 49, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (32, 'Jack', 52, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (33, 'Tom', 61, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (34, 'Sandy', 55, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (35, 'Billie', 59, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (36, 'Jone', 54, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (37, 'Jack', 57, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (38, 'Tom', 66, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (39, 'Sandy', 60, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (40, 'Billie', 64, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (41, 'Jone', 59, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (42, 'Jack', 62, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (43, 'Tom', 71, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (44, 'Sandy', 65, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (45, 'Billie', 69, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (46, 'Jone', 64, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (47, 'Jack', 67, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (48, 'Tom', 76, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (49, 'Sandy', 70, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (50, 'Billie', 74, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (51, 'Jone', 69, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (52, 'Jack', 72, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (53, 'Tom', 81, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (54, 'Sandy', 75, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (55, 'Billie', 79, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (56, 'Jone', 74, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (57, 'Jack', 77, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (58, 'Tom', 86, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (59, 'Sandy', 80, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (60, 'Billie', 84, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (61, 'Jone', 79, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (62, 'Jack', 82, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (63, 'Tom', 91, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (64, 'Sandy', 85, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (65, 'Billie', 89, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (66, 'Jone', 84, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (67, 'Jack', 87, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (68, 'Tom', 96, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (69, 'Sandy', 90, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (70, 'Billie', 94, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (71, 'Jone', 89, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (72, 'Jack', 92, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (73, 'Tom', 101, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (74, 'Sandy', 95, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (75, 'Billie', 99, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (76, 'Jone', 94, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (77, 'Jack', 97, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (78, 'Tom', 106, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (79, 'Sandy', 100, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (80, 'Billie', 104, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (81, 'Jone', 99, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (82, 'Jack', 102, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (83, 'Tom', 111, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (84, 'Sandy', 105, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (85, 'Billie', 109, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (86, 'Jone', 104, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (87, 'Jack', 107, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (88, 'Tom', 116, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (89, 'Sandy', 110, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (90, 'Billie', 114, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (91, 'Jone', 109, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (92, 'Jack', 112, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (93, 'Tom', 121, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (94, 'Sandy', 115, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (95, 'Billie', 119, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (96, 'Jone', 114, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (97, 'Jack', 117, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (98, 'Tom', 126, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (99, 'Sandy', 120, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (100, 'Billie', 124, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (101, 'Jone', 119, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (102, 'Jack', 122, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (103, 'Tom', 131, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (104, 'Sandy', 125, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (105, 'Billie', 129, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (106, 'Jone', 124, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (107, 'Jack', 127, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (108, 'Tom', 136, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (109, 'Sandy', 130, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (110, 'Billie', 134, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1043, 'whf1312', 23, 'test_email123', 0, '2021-01-05 17:05:43.753000', NULL, 0);
INSERT INTO `user` VALUES (1346280649055444994, 'Tom345', 23, 'test@qq.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093263450114, 'Tom0', 23, 'test@qq.com0', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093733212161, 'Tom1', 24, 'test@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093733212162, 'Tom2', 25, 'test@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093741600769, 'Tom3', 26, 'test@qq.com3', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093741600770, 'Tom4', 27, 'test@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093749989378, 'Tom5', 28, 'test@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093749989379, 'Tom6', 29, 'test@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093749989380, 'Tom7', 30, 'test@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093766766594, 'Tom8', 31, 'test@qq.com8', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282093775155202, 'Tom9', 32, 'test@qq.com9', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346282828965261313, 'Jim', 23, 'test@qq.com123', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283815964753921, 'Jim0', 40, 'jim@qq.com0', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816472264706, 'Jim1', 41, 'jim@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816480653314, 'Jim2', 42, 'jim@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816480653315, 'Jim3', 43, 'jim@qq.com3', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816489041922, 'Jim4', 44, 'jim@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816497430530, 'Jim5', 45, 'jim@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816505819137, 'Jim6', 46, 'jim@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816505819138, 'Jim7', 47, 'jim@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346283816530984961, 'Jim9', 49, 'jim@qq.com9', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284477930692609, 'Jim0', 40, 'jim@qq.com0', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481139335169, 'Jim1', 41, 'jim@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481156112385, 'Jim2', 42, 'jim@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481172889601, 'Jim3', 43, 'jim@qq.com3', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481193861121, 'Jim4', 44, 'jim@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481235804161, 'Jim5', 45, 'jim@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481252581378, 'Jim6', 46, 'jim@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481277747201, 'Jim7', 47, 'jim@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284481336467458, 'Jim9', 49, 'jim@qq.com9', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284970576842753, 'Jim5', 45, 'jim@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346284970589425665, 'Jim6', 46, 'jim@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1346361708224851970, '自动1', 34, 'auto@qq.com1', 0, '2021-01-05 15:43:40.104000', '2021-01-05 15:46:55.015000', NULL);
INSERT INTO `user` VALUES (1346363747667537921, '自动', 45, 'auto@qq.com', 0, '2021-01-05 15:51:46.344000', '2021-01-05 15:54:35.422000', 3);
INSERT INTO `user` VALUES (1346384092990406657, 'whf1312', 23, 'test_email123', 0, '2021-01-05 17:12:37.048000', NULL, 0);
INSERT INTO `user` VALUES (1346384232967041026, 'whf1312', 23, 'test_email123', 0, '2021-01-05 17:13:10.418000', NULL, 0);

-- ----------------------------
-- Table structure for user_2018
-- ----------------------------
DROP TABLE IF EXISTS `user_2018`;
CREATE TABLE `user_2018`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deleted` tinyint(255) NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `version` tinyint(255) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1346384232967041027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_2018
-- ----------------------------
INSERT INTO `user_2018` VALUES (1, 'Tom1', 41, 'tom@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (2, 'Tom2', 42, 'tom@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (3, 'xiaohong', 43, 'testupdatewrapper', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (4, 'Tom4', 44, 'tom@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (5, 'Tom5', 45, 'tom@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (6, 'Tom6', 46, 'tom@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (7, 'Tom7', 47, 'tom@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (8, 'Tom', 36, 'test3@baomidou.com', 1, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (9, 'Sandy', 30, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (10, 'Billie', 34, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (11, 'Jone', 29, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (12, 'Jack', 32, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (13, 'Tom', 41, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (14, 'Sandy', 35, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (15, 'Billie', 39, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (16, 'Jone', 34, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (17, 'Jack', 37, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (18, 'Tom', 46, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (19, 'Sandy', 40, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (20, 'Billie', 44, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (21, 'Jone', 39, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (22, 'Jack', 42, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (23, 'Tom', 51, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (24, 'Sandy', 45, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (25, 'Billie', 49, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (26, 'Jone', 44, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (27, 'Jack', 47, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (28, 'Tom', 56, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (29, 'Sandy', 50, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (30, 'Billie', 54, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (31, 'Jone', 49, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (32, 'Jack', 52, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (33, 'Tom', 61, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (34, 'Sandy', 55, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (35, 'Billie', 59, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (36, 'Jone', 54, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (37, 'Jack', 57, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (38, 'Tom', 66, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (39, 'Sandy', 60, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (40, 'Billie', 64, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (41, 'Jone', 59, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (42, 'Jack', 62, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (43, 'Tom', 71, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (44, 'Sandy', 65, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (45, 'Billie', 69, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (46, 'Jone', 64, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (47, 'Jack', 67, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (48, 'Tom', 76, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (49, 'Sandy', 70, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (50, 'Billie', 74, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (51, 'Jone', 69, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (52, 'Jack', 72, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (53, 'Tom', 81, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (54, 'Sandy', 75, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (55, 'Billie', 79, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (56, 'Jone', 74, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (57, 'Jack', 77, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (58, 'Tom', 86, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (59, 'Sandy', 80, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (60, 'Billie', 84, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (61, 'Jone', 79, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (62, 'Jack', 82, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (63, 'Tom', 91, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (64, 'Sandy', 85, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (65, 'Billie', 89, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (66, 'Jone', 84, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (67, 'Jack', 87, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (68, 'Tom', 96, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (69, 'Sandy', 90, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (70, 'Billie', 94, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (71, 'Jone', 89, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (72, 'Jack', 92, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (73, 'Tom', 101, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (74, 'Sandy', 95, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (75, 'Billie', 99, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (76, 'Jone', 94, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (77, 'Jack', 97, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (78, 'Tom', 106, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (79, 'Sandy', 100, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (80, 'Billie', 104, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (81, 'Jone', 99, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (82, 'Jack', 102, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (83, 'Tom', 111, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (84, 'Sandy', 105, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (85, 'Billie', 109, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (86, 'Jone', 104, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (87, 'Jack', 107, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (88, 'Tom', 116, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (89, 'Sandy', 110, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (90, 'Billie', 114, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (91, 'Jone', 109, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (92, 'Jack', 112, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (93, 'Tom', 121, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (94, 'Sandy', 115, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (95, 'Billie', 119, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (96, 'Jone', 114, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (97, 'Jack', 117, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (98, 'Tom', 126, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (99, 'Sandy', 120, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (100, 'Billie', 124, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (101, 'Jone', 119, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (102, 'Jack', 122, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (103, 'Tom', 131, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (104, 'Sandy', 125, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (105, 'Billie', 129, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (106, 'Jone', 124, 'test1@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (107, 'Jack', 127, 'test2@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (108, 'Tom', 136, 'test3@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (109, 'Sandy', 130, 'test4@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (110, 'Billie', 134, 'test5@baomidou.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1020, '自动', 34, 'auto@qq.com', 0, '2021-06-26 20:44:20.151178', NULL, 0);
INSERT INTO `user_2018` VALUES (1043, 'whf1312', 23, 'test_email123', 0, '2021-01-05 17:05:43.753000', NULL, 0);
INSERT INTO `user_2018` VALUES (1346280649055444994, 'Tom345', 23, 'test@qq.com', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093263450114, 'Tom0', 23, 'test@qq.com0', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093733212161, 'Tom1', 24, 'test@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093733212162, 'Tom2', 25, 'test@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093741600769, 'Tom3', 26, 'test@qq.com3', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093741600770, 'Tom4', 27, 'test@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093749989378, 'Tom5', 28, 'test@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093749989379, 'Tom6', 29, 'test@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093749989380, 'Tom7', 30, 'test@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093766766594, 'Tom8', 31, 'test@qq.com8', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282093775155202, 'Tom9', 32, 'test@qq.com9', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346282828965261313, 'Jim', 23, 'test@qq.com123', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283815964753921, 'Jim0', 40, 'jim@qq.com0', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816472264706, 'Jim1', 41, 'jim@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816480653314, 'Jim2', 42, 'jim@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816480653315, 'Jim3', 43, 'jim@qq.com3', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816489041922, 'Jim4', 44, 'jim@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816497430530, 'Jim5', 45, 'jim@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816505819137, 'Jim6', 46, 'jim@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816505819138, 'Jim7', 47, 'jim@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346283816530984961, 'Jim9', 49, 'jim@qq.com9', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284477930692609, 'Jim0', 40, 'jim@qq.com0', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481139335169, 'Jim1', 41, 'jim@qq.com1', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481156112385, 'Jim2', 42, 'jim@qq.com2', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481172889601, 'Jim3', 43, 'jim@qq.com3', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481193861121, 'Jim4', 44, 'jim@qq.com4', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481235804161, 'Jim5', 45, 'jim@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481252581378, 'Jim6', 46, 'jim@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481277747201, 'Jim7', 47, 'jim@qq.com7', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284481336467458, 'Jim9', 49, 'jim@qq.com9', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284970576842753, 'Jim5', 45, 'jim@qq.com5', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346284970589425665, 'Jim6', 46, 'jim@qq.com6', 0, NULL, NULL, NULL);
INSERT INTO `user_2018` VALUES (1346361708224851970, '自动1', 34, 'auto@qq.com1', 0, '2021-01-05 15:43:40.104000', '2021-01-05 15:46:55.015000', NULL);
INSERT INTO `user_2018` VALUES (1346363747667537921, '自动', 45, 'auto@qq.com', 0, '2021-01-05 15:51:46.344000', '2021-01-05 15:54:35.422000', 3);
INSERT INTO `user_2018` VALUES (1346384092990406657, 'whf1312', 23, 'test_email123', 0, '2021-01-05 17:12:37.048000', NULL, 0);
INSERT INTO `user_2018` VALUES (1346384232967041026, 'whf1312', 23, 'test_email123', 0, '2021-01-05 17:13:10.418000', NULL, 0);

-- ----------------------------
-- Table structure for user_2019
-- ----------------------------
DROP TABLE IF EXISTS `user_2019`;
CREATE TABLE `user_2019`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deleted` tinyint(255) NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `version` tinyint(255) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1346384232967041027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_2019
-- ----------------------------
INSERT INTO `user_2019` VALUES (1, 'test_update', 41, 'tom@qq.com1', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (2, 'test_update', 42, 'tom@qq.com2', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (3, 'test_update', 43, 'testupdatewrapper', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (4, 'test_update', 44, 'tom@qq.com4', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (5, 'test_update', 45, 'tom@qq.com5', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (6, 'test_update', 46, 'tom@qq.com6', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (7, 'test_update', 47, 'tom@qq.com7', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (8, 'Tom', 36, 'test3@baomidou.com', 1, NULL, NULL, NULL);
INSERT INTO `user_2019` VALUES (9, 'test_update', 30, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (10, 'test_update', 34, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (11, 'test_update', 29, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (12, 'test_update', 32, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (13, 'test_update', 41, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (14, 'test_update', 35, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (15, 'test_update', 39, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (16, 'test_update', 34, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (17, 'test_update', 37, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (18, 'test_update', 46, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (19, 'test_update', 40, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (20, 'test_update', 44, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (21, 'test_update', 39, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (22, 'test_update', 42, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (23, 'test_update', 51, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (24, 'test_update', 45, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (25, 'test_update', 49, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (26, 'test_update', 44, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (27, 'test_update', 47, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (28, 'test_update', 56, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (29, 'test_update', 50, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (30, 'test_update', 54, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (31, 'test_update', 49, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (32, 'test_update', 52, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (33, 'test_update', 61, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (34, 'test_update', 55, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (35, 'test_update', 59, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (36, 'test_update', 54, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (37, 'test_update', 57, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (38, 'test_update', 66, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (39, 'test_update', 60, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (40, 'test_update', 64, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (41, 'test_update', 59, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (42, 'test_update', 62, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (43, 'test_update', 71, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (44, 'test_update', 65, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (45, 'test_update', 69, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (46, 'test_update', 64, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (47, 'test_update', 67, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (48, 'test_update', 76, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (49, 'test_update', 70, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (50, 'test_update', 74, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (51, 'test_update', 69, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (52, 'test_update', 72, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (53, 'test_update', 81, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (54, 'test_update', 75, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (55, 'test_update', 79, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (56, 'test_update', 74, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (57, 'test_update', 77, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (58, 'test_update', 86, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (59, 'test_update', 80, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (60, 'test_update', 84, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (61, 'test_update', 79, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (62, 'test_update', 82, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (63, 'test_update', 91, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (64, 'test_update', 85, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (65, 'test_update', 89, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (66, 'test_update', 84, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (67, 'test_update', 87, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (68, 'test_update', 96, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (69, 'test_update', 90, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (70, 'test_update', 94, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (71, 'test_update', 89, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (72, 'test_update', 92, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (73, 'test_update', 101, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (74, 'test_update', 95, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (75, 'test_update', 99, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (76, 'test_update', 94, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (77, 'test_update', 97, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (78, 'test_update', 106, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (79, 'test_update', 100, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (80, 'test_update', 104, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (81, 'test_update', 99, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (82, 'test_update', 102, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (83, 'test_update', 111, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (84, 'test_update', 105, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (85, 'test_update', 109, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (86, 'test_update', 104, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (87, 'test_update', 107, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (88, 'test_update', 116, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (89, 'test_update', 110, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (90, 'test_update', 114, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (91, 'test_update', 109, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (92, 'test_update', 112, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (93, 'test_update', 121, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (94, 'test_update', 115, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (95, 'test_update', 119, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (96, 'test_update', 114, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (97, 'test_update', 117, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (98, 'test_update', 126, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (99, 'test_update', 120, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (100, 'test_update', 124, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (101, 'test_update', 119, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (102, 'test_update', 122, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (103, 'test_update', 131, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (104, 'test_update', 125, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (105, 'test_update', 129, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (106, 'test_update', 124, 'test1@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (107, 'test_update', 127, 'test2@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (108, 'test_update', 136, 'test3@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (109, 'test_update', 130, 'test4@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (110, 'test_update', 134, 'test5@baomidou.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1043, 'test_update', 23, 'test_email123', 0, '2021-01-05 17:05:43.753000', '2021-01-06 11:21:27.800000', 0);
INSERT INTO `user_2019` VALUES (1346280649055444994, 'test_update', 23, 'test@qq.com', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093263450114, 'test_update', 23, 'test@qq.com0', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093733212161, 'test_update', 24, 'test@qq.com1', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093733212162, 'test_update', 25, 'test@qq.com2', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093741600769, 'test_update', 26, 'test@qq.com3', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093741600770, 'test_update', 27, 'test@qq.com4', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093749989378, 'test_update', 28, 'test@qq.com5', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093749989379, 'test_update', 29, 'test@qq.com6', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093749989380, 'test_update', 30, 'test@qq.com7', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093766766594, 'test_update', 31, 'test@qq.com8', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282093775155202, 'test_update', 32, 'test@qq.com9', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346282828965261313, 'test_update', 23, 'test@qq.com123', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283815964753921, 'test_update', 40, 'jim@qq.com0', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816472264706, 'test_update', 41, 'jim@qq.com1', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816480653314, 'test_update', 42, 'jim@qq.com2', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816480653315, 'test_update', 43, 'jim@qq.com3', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816489041922, 'test_update', 44, 'jim@qq.com4', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816497430530, 'test_update', 45, 'jim@qq.com5', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816505819137, 'test_update', 46, 'jim@qq.com6', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816505819138, 'test_update', 47, 'jim@qq.com7', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346283816530984961, 'test_update', 49, 'jim@qq.com9', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284477930692609, 'test_update', 40, 'jim@qq.com0', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481139335169, 'test_update', 41, 'jim@qq.com1', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481156112385, 'test_update', 42, 'jim@qq.com2', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481172889601, 'test_update', 43, 'jim@qq.com3', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481193861121, 'test_update', 44, 'jim@qq.com4', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481235804161, 'test_update', 45, 'jim@qq.com5', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481252581378, 'test_update', 46, 'jim@qq.com6', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481277747201, 'test_update', 47, 'jim@qq.com7', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284481336467458, 'test_update', 49, 'jim@qq.com9', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284970576842753, 'test_update', 45, 'jim@qq.com5', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346284970589425665, 'test_update', 46, 'jim@qq.com6', 0, NULL, '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346361708224851970, 'test_update', 34, 'auto@qq.com1', 0, '2021-01-05 15:43:40.104000', '2021-01-06 11:21:27.800000', NULL);
INSERT INTO `user_2019` VALUES (1346363747667537921, 'test_update', 45, 'auto@qq.com', 0, '2021-01-05 15:51:46.344000', '2021-01-06 11:21:27.800000', 3);
INSERT INTO `user_2019` VALUES (1346384092990406657, 'test_update', 23, 'test_email123', 0, '2021-01-05 17:12:37.048000', '2021-01-06 11:21:27.800000', 0);
INSERT INTO `user_2019` VALUES (1346384232967041026, 'test_update', 23, 'test_email123', 0, '2021-01-05 17:13:10.418000', '2021-01-06 11:21:27.800000', 0);

SET FOREIGN_KEY_CHECKS = 1;
