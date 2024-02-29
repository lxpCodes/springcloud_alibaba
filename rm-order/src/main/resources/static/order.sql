SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS seata_order;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
                          `order_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
                          `goods_id` int(32) NOT NULL COMMENT '商品编号',
                          `member_id` int(32) NOT NULL COMMENT '会员编号',
                          `quantity` int(255) NOT NULL COMMENT '购买数量',
                          `points` int(255) NOT NULL COMMENT '增加会员积分',
                          PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
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
http://192.168.31.106:8002/create_order?orderId=6&memberId=1&goodsId=2&points=20&quantity=200

