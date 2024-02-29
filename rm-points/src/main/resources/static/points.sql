CREATE DATABASE IF NOT EXISTS seata_points;

DROP TABLE IF EXISTS `points`;
CREATE TABLE `points`  (
                           `member_id` int(255) NOT NULL COMMENT '会员编号',
                           `points` int(255) NOT NULL COMMENT '积分数量',
                           PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of points
-- ----------------------------
INSERT INTO `points` VALUES (1, 100);
INSERT INTO `points` VALUES (2, 100);
INSERT INTO `points` VALUES (3, 100);
INSERT INTO `points` VALUES (4, 100);
-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT,
                             `branch_id` bigint(20) NOT NULL,
                             `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             `rollback_info` longblob NOT NULL,
                             `log_status` int(11) NOT NULL,
                             `log_created` datetime(0) NOT NULL,
                             `log_modified` datetime(0) NOT NULL,
                             `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
SET FOREIGN_KEY_CHECKS = 1;

http://192.168.31.106:8003/add_points?memberId=1&points=20