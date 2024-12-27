SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for delivery_order
-- ----------------------------
DROP TABLE IF EXISTS `delivery_order`;
CREATE TABLE `delivery_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_num` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `concrete_mark` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `construction_site` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `production_date` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `purchase_unit` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `plan_cubic_meter` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `contract_number` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `anti_seepage_level` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `other_technical` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `concrete_strengh` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `design_ratio` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `required_slab_fall` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `mixing_plant` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `transport_distance` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `actual_cubic_meter` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `is_checkout` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '为NULL或0比表示还未检验 为-1表示验收不合格',
  `is_accept` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '为NUll或0表示还未验收',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4  ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for driver_list
-- ----------------------------
DROP TABLE IF EXISTS `driver_list`;
CREATE TABLE `driver_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `id_number` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `contact_info` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `vehicle_type` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `license_expiry` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `is_working` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT 'NULL或0代表空闲\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for raw_materials_list
-- ----------------------------
DROP TABLE IF EXISTS `raw_materials_list`;
CREATE TABLE `raw_materials_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `odernum` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `vehicle_num` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `specifications` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `supplier` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `roleId` int NULL DEFAULT NULL,
  `commit` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '超级管理员', 1, '所有页面都能看');
INSERT INTO `users` VALUES (2, '监管人员', 2, '原材料清单、出料单、驾驶人员、路线');
INSERT INTO `users` VALUES (3, '实验员', 3, '查出料单、提供报告');
INSERT INTO `users` VALUES (4, '验收人员', 4, '验收出料单');

-- ----------------------------
-- Table structure for vehicle_list
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_list`;
CREATE TABLE `vehicle_list`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicle_num` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '车牌号码',
  `registeration_date` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '注册日期',
  `model` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '车辆型号',
  `internal_num` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '内部编号',
  `curb_weight` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT '' COMMENT '整备质量（空车质量）',
  `total_weight` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '总质量',
  `mixer_volume` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT '搅拌容积',
  `is_working` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL COMMENT 'Null或0代表空闲中，可以出任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
