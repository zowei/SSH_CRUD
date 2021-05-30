/*
 Navicat Premium Data Transfer

 Source Server         : zw
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : sshactivitidemo

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 30/05/2021 22:31:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ssh_department
-- ----------------------------
DROP TABLE IF EXISTS `ssh_department`;
CREATE TABLE `ssh_department`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ssh_department
-- ----------------------------
INSERT INTO `ssh_department` VALUES (1, '开发部');
INSERT INTO `ssh_department` VALUES (2, '事业部');
INSERT INTO `ssh_department` VALUES (3, '设计部');
INSERT INTO `ssh_department` VALUES (4, '需求部');
INSERT INTO `ssh_department` VALUES (5, '管理部');
INSERT INTO `ssh_department` VALUES (6, '财务部');
INSERT INTO `ssh_department` VALUES (7, '流程部');

-- ----------------------------
-- Table structure for ssh_employee
-- ----------------------------
DROP TABLE IF EXISTS `ssh_employee`;
CREATE TABLE `ssh_employee`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTH` datetime(0) NULL DEFAULT NULL,
  `CREAT_TIME` datetime(0) NULL DEFAULT NULL,
  `DEPARETMENT_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FKE5C207252C38E41`(`DEPARETMENT_ID`) USING BTREE,
  CONSTRAINT `FKE5C207252C38E41` FOREIGN KEY (`DEPARETMENT_ID`) REFERENCES `ssh_department` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ssh_employee
-- ----------------------------
INSERT INTO `ssh_employee` VALUES (9, 'AAA', '111111@163.com', '2012-01-02 00:09:00', '2021-05-30 19:48:49', 7);
INSERT INTO `ssh_employee` VALUES (12, 'BBB', '222222@163.com', '2018-01-06 00:05:00', '2021-05-30 19:54:34', 4);
INSERT INTO `ssh_employee` VALUES (13, 'CCC', '333333@163.com', '1998-01-03 00:02:00', '2021-05-30 20:21:37', 6);
INSERT INTO `ssh_employee` VALUES (15, 'DDD', '444444@163.com', '2002-01-06 00:05:00', '2021-05-30 20:48:08', 5);
INSERT INTO `ssh_employee` VALUES (18, 'EEE', '555555@163.com', '2021-01-03 00:02:00', '2021-05-30 21:15:14', 2);
INSERT INTO `ssh_employee` VALUES (19, 'FFF', '666666@163.com', '2018-01-06 00:05:00', '2021-05-30 22:30:49', 1);
INSERT INTO `ssh_employee` VALUES (21, 'GGG', '777777@qq.com', '2012-01-02 00:09:00', '2021-05-20 22:30:52', 3);

SET FOREIGN_KEY_CHECKS = 1;
