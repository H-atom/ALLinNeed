/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : movie_ticket_sell

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 28/02/2024 11:53:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_data
-- ----------------------------
DROP TABLE IF EXISTS `chat_data`;
CREATE TABLE `chat_data`  (
  `from_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发送方',
  `to_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收方',
  `chat_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `html` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`from_phone`, `to_phone`, `timestamp`) USING BTREE,
  INDEX `sellerPhone`(`to_phone`) USING BTREE,
  CONSTRAINT `buyerPhone` FOREIGN KEY (`from_phone`) REFERENCES `user_information` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sellerPhone` FOREIGN KEY (`to_phone`) REFERENCES `user_information` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_data
-- ----------------------------
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', '你好', NULL, '2022-09-05 03:35:50');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', 'hello', NULL, '2022-09-05 05:13:46');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', '你有什么问题吗', NULL, '2022-09-05 05:54:23');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', '需要我帮助你什么', NULL, '2022-09-05 05:56:04');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', '嗯', NULL, '2022-09-05 06:01:16');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', 'hello', NULL, '2022-09-05 06:02:59');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', '对', NULL, '2022-09-05 06:04:42');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', '怎么啦', NULL, '2022-09-05 07:56:09');
INSERT INTO `chat_data` VALUES ('05376801235', '15628788968', 'hiuidajisdhjasjdbasjbdf', NULL, '2022-09-08 02:48:06');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '123456', NULL, '2022-09-03 09:22:38');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '456', NULL, '2022-09-03 09:23:24');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '456789', NULL, '2022-09-03 09:24:55');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '4586', NULL, '2022-09-03 09:30:49');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '10', NULL, '2022-09-03 09:32:20');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '1542665', NULL, '2022-09-03 13:16:18');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '1524336', NULL, '2022-09-03 13:50:17');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '155788', NULL, '2022-09-03 13:50:43');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '456687565522', NULL, '2022-09-03 13:56:13');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '545656', NULL, '2022-09-03 14:07:15');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '125485999', NULL, '2022-09-03 14:14:22');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '123456', NULL, '2022-09-04 09:57:14');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '789423555', NULL, '2022-09-04 10:06:13');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '2548999', NULL, '2022-09-04 10:33:01');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '123', NULL, '2022-09-04 10:36:39');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '4579863252', NULL, '2022-09-04 10:37:35');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '458962', NULL, '2022-09-04 10:38:17');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '554566852', NULL, '2022-09-04 10:39:50');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '122555566655', NULL, '2022-09-04 12:11:27');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '123', NULL, '2022-09-04 12:14:32');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '466125', NULL, '2022-09-04 12:15:42');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '你好', NULL, '2022-09-04 14:13:37');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:19:17');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '你好', NULL, '2022-09-04 14:22:14');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:23:25');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:24:28');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:25:50');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:27:17');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:29:14');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:31:59');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-04 14:35:29');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-05 06:03:33');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '这个', NULL, '2022-09-05 07:41:43');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'en', NULL, '2022-09-05 07:51:01');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"独行月球\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"二号放映厅\",\"startTime\":\"15:00:00\",\"seat\":\"3排4列\",\"startDate\":\"2022-09-08\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-05 09:21:41');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"独行月球\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"二号放映厅\",\"startTime\":\"15:00:00\",\"seat\":\"3排4列\",\"startDate\":\"2022-09-08\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-05 09:43:41');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"独行月球\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"二号放映厅\",\"startTime\":\"15:00:00\",\"seat\":\"3排4列\",\"startDate\":\"2022-09-08\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-05 09:43:54');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"独行月球\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"二号放映厅\",\"startTime\":\"15:00:00\",\"seat\":\"3排4列\",\"startDate\":\"2022-09-08\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-05 09:44:42');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"明日战机\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"一号放映厅\",\"startTime\":\"15:00:00\",\"seat\":\"3排5列\",\"startDate\":\"2022-09-11\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-08 02:47:06');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'hello', NULL, '2022-09-08 02:47:58');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"明日战机\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"一号放映厅\",\"startTime\":\"15:00:00\",\"seat\":\"3排6列\",\"startDate\":\"2022-09-11\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-08 02:48:14');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"独行月球\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"一号放映厅\",\"startTime\":\"07:48:49\",\"seat\":\"2排4列\",\"startDate\":\"2022-09-13\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-09 03:12:15');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', '123', NULL, '2022-09-09 03:12:21');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', 'jtvvbhgjhjkk', NULL, '2022-09-09 03:12:26');
INSERT INTO `chat_data` VALUES ('15628788968', '05376801235', NULL, '{\"movie\":\"独行月球\",\"cinema\":\"万达影院\",\"address\":\"山东省济宁市嘉祥县\",\"buyer\":\"15628788968\",\"screeningRoom\":\"一号放映厅\",\"startTime\":\"07:48:49\",\"seat\":\"2排6列\",\"startDate\":\"2022-09-13\",\"ticketValue\":30,\"state\":2,\"seatNumber\":0,\"phone\":\"05376801235\"}', '2022-09-09 03:43:04');

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manager` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '经理电话',
  `rate` double NULL DEFAULT NULL,
  `cinema_details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`, `phone`, `address`, `manager`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `address`(`address`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `manager`(`manager`) USING BTREE,
  CONSTRAINT `manager` FOREIGN KEY (`manager`) REFERENCES `user_information` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES ('万达影院', '05376801235', '山东省济宁市嘉祥县', '15628788969', 4, '嘉祥首家现代星级影院 鲁西南首家4K数字影院/顶级影城，华丽揭幕，奢华享受，视听盛宴，敬请光临！');
INSERT INTO `cinema` VALUES ('万达影院', '05377779999', '山东省济宁市太白楼东路55万达广场4层', '15628788966', 4, '完全按照流线型的现代化风格打造的开放式大堂尽显时尚大气；高效直观的售票系统为观众节省购票时间；智能电脑储物柜为小物品的存储带来极大的便利；专门配备了残疾人专用无障碍通道；专门为广大会员打造的会员休息区舒适而温馨；时尚而高雅的VIP休息区尽显尊贵气质。\r\n另外影城卖品部供应丰富的休闲食品：美国原装进口的爆米花、哈根达斯冰淇淋、以及各种流行的冷热饮品等，提供五星级的观影配套服务。');
INSERT INTO `cinema` VALUES ('唐宁国际影城', '05376801236', '山东省济宁市嘉祥县唐宁街·乐MALL4层', '15628788967', 4, '嘉祥首家现代星级影院 鲁西南首家4K数字影院/顶级影城，华丽揭幕，奢华享受，视听盛宴，敬请光临！');
INSERT INTO `cinema` VALUES ('盛视达影城', '05376801234', '嘉祥县呈祥街66银座购物广场嘉祥店4层', '15628788966', 4, '一座融合了电影数字科技和人性化服务的五星级标准多厅电影城——盛视达影城，坐落于嘉祥县银座购物广场四楼。影城共设4个专业化数字立体声影厅，总共可容纳近500名观众。影城按照国家五星级电影院标准设计建造，配备世界先进的电影专业音响，高保真还音系统和进口环绕立体声音响，效果细腻超凡、震撼无比，并在所有放映厅安装了先进的、最新的进口数字放映机。');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `movie_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `belong_to_cinema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `movie_time` double NULL DEFAULT NULL,
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `starring` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `show_time` date NULL DEFAULT NULL,
  `rate` double NULL DEFAULT NULL,
  `movie_details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_showing` int NOT NULL COMMENT '1为正在上映，0为已结束上映',
  PRIMARY KEY (`src`, `movie_name`, `belong_to_cinema`) USING BTREE,
  INDEX `belongToCinema`(`belong_to_cinema`) USING BTREE,
  INDEX `movieName`(`movie_name`) USING BTREE,
  CONSTRAINT `belongToCinema` FOREIGN KEY (`belong_to_cinema`) REFERENCES `cinema` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('https://img.zcool.cn/community/011d3855685d790000012716399ff2.jpg@1280w_1l_2o_100sh.jpg', '金刚狼', '万达影院', 107, '加文·胡德', '休·杰克曼 、列维·施瑞博尔 、瑞安·雷诺兹', '奇幻、科幻、动作', '2009-05-03', 4, '该片改编自漫威漫画，为《X战警》系列前传，故事发生在《X战警》首部曲之前。讲述了X战警的核心队员“金刚狼”的前世今生，探索金刚狼与哥哥“剑齿虎”、女朋友“银狐”、以及“X武器”计划关系的故事。', 1);
INSERT INTO `movie` VALUES ('https://img.zcool.cn/community/011d3855685d790000012716399ff2.jpg@1280w_1l_2o_100sh.jpg', '金刚狼', '唐宁国际影城', 107, '加文·胡德', '休·杰克曼 、列维·施瑞博尔 、瑞安·雷诺兹', '奇幻、科幻、动作', '2009-05-03', 4, '该片改编自漫威漫画，为《X战警》系列前传，故事发生在《X战警》首部曲之前。讲述了X战警的核心队员“金刚狼”的前世今生，探索金刚狼与哥哥“剑齿虎”、女朋友“银狐”、以及“X武器”计划关系的故事。', 1);
INSERT INTO `movie` VALUES ('https://img.zcool.cn/community/011d3855685d790000012716399ff2.jpg@1280w_1l_2o_100sh.jpg', '金刚狼', '盛视达影城', 107, '加文·胡德', '休·杰克曼 、列维·施瑞博尔 、瑞安·雷诺兹', '奇幻、科幻、动作', '2009-05-03', 4, '该片改编自漫威漫画，为《X战警》系列前传，故事发生在《X战警》首部曲之前。讲述了X战警的核心队员“金刚狼”的前世今生，探索金刚狼与哥哥“剑齿虎”、女朋友“银狐”、以及“X武器”计划关系的故事。', 1);
INSERT INTO `movie` VALUES ('https://n.sinaimg.cn/front20220816ac/56/w690h966/20220816/ab7c-430f07dbc58cba079a8d3a3ed6257b1d.jpg', '明日战机', '万达影院', 99, '吴炫辉', ' 古天乐 / 刘青云 / 刘嘉玲', '动作 / 科幻', '2022-08-05', 5, '未来世界，地球因环境污染而千疮百孔，人类家园破败萧条。一颗陨石突然撞击地球，并带来杀伤力极强的外星生物，560万人将因此失去生命。人类命运岌岌可危，总指挥李升（张家辉 饰）派出以军人泰来（古天乐 饰）为首的精英部队前往执行改造计划，部队却突遭暴力攻击，只有泰来和通讯兵光仔（万国鹏 饰）幸存。', 1);
INSERT INTO `movie` VALUES ('https://n.sinaimg.cn/front20220816ac/56/w690h966/20220816/ab7c-430f07dbc58cba079a8d3a3ed6257b1d.jpg', '明日战机', '唐宁国际影城', 99, '吴炫辉', ' 古天乐 / 刘青云 / 刘嘉玲', '动作 / 科幻', '2022-08-05', 5, '未来世界，地球因环境污染而千疮百孔，人类家园破败萧条。一颗陨石突然撞击地球，并带来杀伤力极强的外星生物，560万人将因此失去生命。人类命运岌岌可危，总指挥李升（张家辉 饰）派出以军人泰来（古天乐 饰）为首的精英部队前往执行改造计划，部队却突遭暴力攻击，只有泰来和通讯兵光仔（万国鹏 饰）幸存。', 1);
INSERT INTO `movie` VALUES ('https://n.sinaimg.cn/front20220816ac/56/w690h966/20220816/ab7c-430f07dbc58cba079a8d3a3ed6257b1d.jpg', '明日战机', '盛视达影城', 99, '吴炫辉', ' 古天乐 / 刘青云 / 刘嘉玲', '动作 / 科幻', '2022-08-05', 5, '未来世界，地球因环境污染而千疮百孔，人类家园破败萧条。一颗陨石突然撞击地球，并带来杀伤力极强的外星生物，560万人将因此失去生命。人类命运岌岌可危，总指挥李升（张家辉 饰）派出以军人泰来（古天乐 饰）为首的精英部队前往执行改造计划，部队却突遭暴力攻击，只有泰来和通讯兵光仔（万国鹏 饰）幸存。', 1);
INSERT INTO `movie` VALUES ('https://ts1.cn.mm.bing.net/th/id/R-C.c62b380cbec2812bc4ddbc0aeb89e0fa?rik=1qJbmuIA4dEgdQ&riu=http%3a%2f%2fwww.kulemi.com%2fdl%2fproject%2flogo%2f62332.png&ehk=6BC4gRb6RGJygp1re9N225SropbQXjDyC8OAIh9HQSA%3d&risl=&pid=ImgRaw&r=0', '独行月球', '万达影院', 122, '张吃鱼', '沈腾 / 马丽 / 常远', '喜剧 / 科幻', '2022-07-29', 4.5, '人类为抵御小行星的撞击，拯救地球，在月球部署了月盾计划。陨石提前来袭，全员紧急撤离时，维修工独孤月（沈腾 饰）因为意外，错过了领队马蓝星（马丽 饰）的撤离通知，一个人落在了月球。不料月盾计划失败，独孤月成为了“宇宙最后的人类”，开始了他在月球上破罐子破摔的生活……', 1);
INSERT INTO `movie` VALUES ('https://ts1.cn.mm.bing.net/th/id/R-C.c62b380cbec2812bc4ddbc0aeb89e0fa?rik=1qJbmuIA4dEgdQ&riu=http%3a%2f%2fwww.kulemi.com%2fdl%2fproject%2flogo%2f62332.png&ehk=6BC4gRb6RGJygp1re9N225SropbQXjDyC8OAIh9HQSA%3d&risl=&pid=ImgRaw&r=0', '独行月球', '唐宁国际影城', 122, '张吃鱼', '沈腾 / 马丽 / 常远', '喜剧 / 科幻', '2022-07-29', 4.5, '人类为抵御小行星的撞击，拯救地球，在月球部署了月盾计划。陨石提前来袭，全员紧急撤离时，维修工独孤月（沈腾 饰）因为意外，错过了领队马蓝星（马丽 饰）的撤离通知，一个人落在了月球。不料月盾计划失败，独孤月成为了“宇宙最后的人类”，开始了他在月球上破罐子破摔的生活……', 1);
INSERT INTO `movie` VALUES ('https://ts1.cn.mm.bing.net/th/id/R-C.c62b380cbec2812bc4ddbc0aeb89e0fa?rik=1qJbmuIA4dEgdQ&riu=http%3a%2f%2fwww.kulemi.com%2fdl%2fproject%2flogo%2f62332.png&ehk=6BC4gRb6RGJygp1re9N225SropbQXjDyC8OAIh9HQSA%3d&risl=&pid=ImgRaw&r=0', '独行月球', '盛视达影城', 122, '张吃鱼', '沈腾 / 马丽 / 常远', '喜剧 / 科幻', '2022-07-29', 4.5, '人类为抵御小行星的撞击，拯救地球，在月球部署了月盾计划。陨石提前来袭，全员紧急撤离时，维修工独孤月（沈腾 饰）因为意外，错过了领队马蓝星（马丽 饰）的撤离通知，一个人落在了月球。不料月盾计划失败，独孤月成为了“宇宙最后的人类”，开始了他在月球上破罐子破摔的生活……', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `movie` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cinema` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `buyer` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户电话号码',
  `screening_room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` time NOT NULL,
  `seat` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` date NOT NULL,
  `ticket_value` double NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`address`, `buyer`, `screening_room`, `start_time`, `cinema`, `movie`, `start_date`, `seat`) USING BTREE,
  INDEX `buyer`(`buyer`) USING BTREE,
  INDEX `movie`(`movie`) USING BTREE,
  INDEX `screeningRoom`(`screening_room`) USING BTREE,
  INDEX `startTime`(`start_time`) USING BTREE,
  INDEX `startDate`(`start_date`) USING BTREE,
  INDEX `cinema`(`cinema`) USING BTREE,
  CONSTRAINT `buyer` FOREIGN KEY (`buyer`) REFERENCES `user_information` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cinema` FOREIGN KEY (`cinema`) REFERENCES `cinema` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cinemaAddress` FOREIGN KEY (`address`) REFERENCES `cinema` (`address`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '2排4列', '2022-09-13', 30, -2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '2排6列', '2022-09-13', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '2排7列', '2022-09-13', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '2排8列', '2022-09-13', 30, -2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '3排4列', '2022-09-13', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '3排5列', '2022-09-13', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '07:48:49', '3排6列', '2022-09-13', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排1列', '2022-09-02', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排2列', '2022-09-02', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排3列', '2022-09-02', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '2排4列', '2022-09-02', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排1列', '2022-09-03', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排2列', '2022-09-03', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排1列', '2022-09-04', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:00:00', '1排2列', '2022-09-04', 30, 2);
INSERT INTO `orders` VALUES ('金刚狼', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '10:27:28', '3排5列', '2022-09-10', 30, 2);
INSERT INTO `orders` VALUES ('明日战机', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '15:00:00', '3排3列', '2022-09-10', 30, -2);
INSERT INTO `orders` VALUES ('明日战机', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '15:00:00', '3排4列', '2022-09-10', 30, -2);
INSERT INTO `orders` VALUES ('明日战机', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '15:00:00', '3排6列', '2022-09-10', 30, -2);
INSERT INTO `orders` VALUES ('明日战机', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '15:00:00', '3排5列', '2022-09-11', 30, 2);
INSERT INTO `orders` VALUES ('明日战机', '万达影院', '山东省济宁市嘉祥县', '15628788968', '一号放映厅', '15:00:00', '3排6列', '2022-09-11', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '3排5列', '2022-09-04', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '3排6列', '2022-09-04', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '5排4列', '2022-09-06', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '3排4列', '2022-09-08', 30, -2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '3排5列', '2022-09-08', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '4排4列', '2022-09-08', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '4排5列', '2022-09-08', 30, -2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '4排5列', '2022-09-09', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788968', '二号放映厅', '15:00:00', '5排6列', '2022-09-09', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788969', '一号放映厅', '22:16:02', '4排5列', '2022-09-22', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788969', '一号放映厅', '22:16:02', '4排6列', '2022-09-22', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788969', '一号放映厅', '22:16:02', '5排6列', '2022-09-22', 30, 2);
INSERT INTO `orders` VALUES ('独行月球', '万达影院', '山东省济宁市嘉祥县', '15628788969', '一号放映厅', '22:16:02', '5排7列', '2022-09-22', 30, 2);

-- ----------------------------
-- Table structure for screening_room
-- ----------------------------
DROP TABLE IF EXISTS `screening_room`;
CREATE TABLE `screening_room`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '影院的经理电话',
  `screening_room` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `play_movie` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ticket_value` double NOT NULL,
  `seat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` int NOT NULL COMMENT '0是未售出；1是已售出',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `screeningRoom`(`screening_room`) USING BTREE,
  INDEX `startTime`(`start_time`) USING BTREE,
  INDEX `playMovie`(`play_movie`) USING BTREE,
  INDEX `start_date`(`start_date`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  CONSTRAINT `phone` FOREIGN KEY (`phone`) REFERENCES `cinema` (`manager`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `play_movie` FOREIGN KEY (`play_movie`) REFERENCES `movie` (`movie_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130282 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of screening_room
-- ----------------------------
INSERT INTO `screening_room` VALUES (129275, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排1列', 1);
INSERT INTO `screening_room` VALUES (129276, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排2列', 1);
INSERT INTO `screening_room` VALUES (129277, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排3列', 1);
INSERT INTO `screening_room` VALUES (129278, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排4列', 1);
INSERT INTO `screening_room` VALUES (129279, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排5列', 1);
INSERT INTO `screening_room` VALUES (129280, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排6列', 1);
INSERT INTO `screening_room` VALUES (129281, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排7列', 1);
INSERT INTO `screening_room` VALUES (129282, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排8列', 1);
INSERT INTO `screening_room` VALUES (129283, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排9列', 1);
INSERT INTO `screening_room` VALUES (129284, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排10列', 1);
INSERT INTO `screening_room` VALUES (129285, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排11列', 1);
INSERT INTO `screening_room` VALUES (129286, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '1排12列', 1);
INSERT INTO `screening_room` VALUES (129287, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排1列', 1);
INSERT INTO `screening_room` VALUES (129288, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排2列', 1);
INSERT INTO `screening_room` VALUES (129289, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排3列', 1);
INSERT INTO `screening_room` VALUES (129290, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排4列', 1);
INSERT INTO `screening_room` VALUES (129291, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排5列', 1);
INSERT INTO `screening_room` VALUES (129292, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排6列', 1);
INSERT INTO `screening_room` VALUES (129293, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排7列', 1);
INSERT INTO `screening_room` VALUES (129294, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排8列', 1);
INSERT INTO `screening_room` VALUES (129295, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排9列', 1);
INSERT INTO `screening_room` VALUES (129296, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排10列', 1);
INSERT INTO `screening_room` VALUES (129297, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排11列', 1);
INSERT INTO `screening_room` VALUES (129298, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '2排12列', 1);
INSERT INTO `screening_room` VALUES (129299, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排1列', 1);
INSERT INTO `screening_room` VALUES (129300, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排2列', 1);
INSERT INTO `screening_room` VALUES (129301, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排3列', 1);
INSERT INTO `screening_room` VALUES (129302, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排4列', 1);
INSERT INTO `screening_room` VALUES (129303, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排5列', 1);
INSERT INTO `screening_room` VALUES (129304, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排6列', 1);
INSERT INTO `screening_room` VALUES (129305, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排7列', 1);
INSERT INTO `screening_room` VALUES (129306, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排8列', 1);
INSERT INTO `screening_room` VALUES (129307, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排9列', 1);
INSERT INTO `screening_room` VALUES (129308, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排10列', 1);
INSERT INTO `screening_room` VALUES (129309, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排11列', 1);
INSERT INTO `screening_room` VALUES (129310, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '3排12列', 1);
INSERT INTO `screening_room` VALUES (129311, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排1列', 1);
INSERT INTO `screening_room` VALUES (129312, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排2列', 1);
INSERT INTO `screening_room` VALUES (129313, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排3列', 1);
INSERT INTO `screening_room` VALUES (129314, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排4列', 1);
INSERT INTO `screening_room` VALUES (129315, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排5列', 1);
INSERT INTO `screening_room` VALUES (129316, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排6列', 1);
INSERT INTO `screening_room` VALUES (129317, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排7列', 1);
INSERT INTO `screening_room` VALUES (129318, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排8列', 1);
INSERT INTO `screening_room` VALUES (129319, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排9列', 1);
INSERT INTO `screening_room` VALUES (129320, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排10列', 1);
INSERT INTO `screening_room` VALUES (129321, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排11列', 1);
INSERT INTO `screening_room` VALUES (129322, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '4排12列', 1);
INSERT INTO `screening_room` VALUES (129323, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排1列', 1);
INSERT INTO `screening_room` VALUES (129324, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排2列', 1);
INSERT INTO `screening_room` VALUES (129325, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排3列', 1);
INSERT INTO `screening_room` VALUES (129326, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排4列', 1);
INSERT INTO `screening_room` VALUES (129327, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排5列', 1);
INSERT INTO `screening_room` VALUES (129328, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排6列', 1);
INSERT INTO `screening_room` VALUES (129329, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排7列', 1);
INSERT INTO `screening_room` VALUES (129330, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排8列', 1);
INSERT INTO `screening_room` VALUES (129331, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排9列', 1);
INSERT INTO `screening_room` VALUES (129332, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排10列', 1);
INSERT INTO `screening_room` VALUES (129333, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排11列', 1);
INSERT INTO `screening_room` VALUES (129334, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '5排12列', 1);
INSERT INTO `screening_room` VALUES (129335, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排1列', 1);
INSERT INTO `screening_room` VALUES (129336, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排2列', 1);
INSERT INTO `screening_room` VALUES (129337, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排3列', 1);
INSERT INTO `screening_room` VALUES (129338, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排4列', 1);
INSERT INTO `screening_room` VALUES (129339, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排5列', 1);
INSERT INTO `screening_room` VALUES (129340, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排6列', 1);
INSERT INTO `screening_room` VALUES (129341, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排7列', 1);
INSERT INTO `screening_room` VALUES (129342, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排8列', 1);
INSERT INTO `screening_room` VALUES (129343, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排9列', 1);
INSERT INTO `screening_room` VALUES (129344, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排10列', 1);
INSERT INTO `screening_room` VALUES (129345, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排11列', 1);
INSERT INTO `screening_room` VALUES (129346, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '6排12列', 1);
INSERT INTO `screening_room` VALUES (129347, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排1列', 1);
INSERT INTO `screening_room` VALUES (129348, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排2列', 1);
INSERT INTO `screening_room` VALUES (129349, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排3列', 1);
INSERT INTO `screening_room` VALUES (129350, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排4列', 1);
INSERT INTO `screening_room` VALUES (129351, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排5列', 1);
INSERT INTO `screening_room` VALUES (129352, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排6列', 1);
INSERT INTO `screening_room` VALUES (129353, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排7列', 1);
INSERT INTO `screening_room` VALUES (129354, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排8列', 1);
INSERT INTO `screening_room` VALUES (129355, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排9列', 1);
INSERT INTO `screening_room` VALUES (129356, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排10列', 1);
INSERT INTO `screening_room` VALUES (129357, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排11列', 1);
INSERT INTO `screening_room` VALUES (129358, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '7排12列', 1);
INSERT INTO `screening_room` VALUES (129359, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排1列', 1);
INSERT INTO `screening_room` VALUES (129360, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排2列', 1);
INSERT INTO `screening_room` VALUES (129361, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排3列', 1);
INSERT INTO `screening_room` VALUES (129362, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排4列', 1);
INSERT INTO `screening_room` VALUES (129363, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排5列', 1);
INSERT INTO `screening_room` VALUES (129364, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排6列', 1);
INSERT INTO `screening_room` VALUES (129365, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排7列', 1);
INSERT INTO `screening_room` VALUES (129366, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排8列', 1);
INSERT INTO `screening_room` VALUES (129367, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排9列', 1);
INSERT INTO `screening_room` VALUES (129368, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排10列', 1);
INSERT INTO `screening_room` VALUES (129369, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排11列', 1);
INSERT INTO `screening_room` VALUES (129370, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '8排12列', 1);
INSERT INTO `screening_room` VALUES (129371, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排1列', 1);
INSERT INTO `screening_room` VALUES (129372, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排2列', 1);
INSERT INTO `screening_room` VALUES (129373, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排3列', 1);
INSERT INTO `screening_room` VALUES (129374, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排4列', 1);
INSERT INTO `screening_room` VALUES (129375, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排5列', 1);
INSERT INTO `screening_room` VALUES (129376, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排6列', 1);
INSERT INTO `screening_room` VALUES (129377, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排7列', 1);
INSERT INTO `screening_room` VALUES (129378, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排8列', 1);
INSERT INTO `screening_room` VALUES (129379, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排9列', 1);
INSERT INTO `screening_room` VALUES (129380, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排10列', 1);
INSERT INTO `screening_room` VALUES (129381, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排11列', 1);
INSERT INTO `screening_room` VALUES (129382, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '9排12列', 1);
INSERT INTO `screening_room` VALUES (129383, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排1列', 1);
INSERT INTO `screening_room` VALUES (129384, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排2列', 1);
INSERT INTO `screening_room` VALUES (129385, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排3列', 1);
INSERT INTO `screening_room` VALUES (129386, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排4列', 1);
INSERT INTO `screening_room` VALUES (129387, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排5列', 1);
INSERT INTO `screening_room` VALUES (129388, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排6列', 1);
INSERT INTO `screening_room` VALUES (129389, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排7列', 1);
INSERT INTO `screening_room` VALUES (129390, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排8列', 1);
INSERT INTO `screening_room` VALUES (129391, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排9列', 1);
INSERT INTO `screening_room` VALUES (129392, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排10列', 1);
INSERT INTO `screening_room` VALUES (129393, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排11列', 1);
INSERT INTO `screening_room` VALUES (129394, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '10排12列', 1);
INSERT INTO `screening_room` VALUES (129395, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排1列', 1);
INSERT INTO `screening_room` VALUES (129396, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排2列', 1);
INSERT INTO `screening_room` VALUES (129397, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排3列', 1);
INSERT INTO `screening_room` VALUES (129398, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排4列', 1);
INSERT INTO `screening_room` VALUES (129399, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排5列', 1);
INSERT INTO `screening_room` VALUES (129400, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排6列', 1);
INSERT INTO `screening_room` VALUES (129401, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排7列', 1);
INSERT INTO `screening_room` VALUES (129402, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排8列', 1);
INSERT INTO `screening_room` VALUES (129403, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排9列', 1);
INSERT INTO `screening_room` VALUES (129404, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排10列', 1);
INSERT INTO `screening_room` VALUES (129405, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排11列', 1);
INSERT INTO `screening_room` VALUES (129406, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '11排12列', 1);
INSERT INTO `screening_room` VALUES (129407, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排1列', 1);
INSERT INTO `screening_room` VALUES (129408, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排2列', 1);
INSERT INTO `screening_room` VALUES (129409, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排3列', 1);
INSERT INTO `screening_room` VALUES (129410, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排4列', 1);
INSERT INTO `screening_room` VALUES (129411, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排5列', 1);
INSERT INTO `screening_room` VALUES (129412, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排6列', 1);
INSERT INTO `screening_room` VALUES (129413, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排7列', 1);
INSERT INTO `screening_room` VALUES (129414, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排8列', 1);
INSERT INTO `screening_room` VALUES (129415, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排9列', 1);
INSERT INTO `screening_room` VALUES (129416, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排10列', 1);
INSERT INTO `screening_room` VALUES (129417, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排11列', 1);
INSERT INTO `screening_room` VALUES (129418, '15628788969', '三号放映厅', '2022-09-01', '2022-10-25', '11:01:50', '18:02:00', '独行月球', 30, '12排12列', 1);
INSERT INTO `screening_room` VALUES (129851, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排1列', 1);
INSERT INTO `screening_room` VALUES (129852, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排2列', 1);
INSERT INTO `screening_room` VALUES (129853, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排3列', 1);
INSERT INTO `screening_room` VALUES (129854, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排4列', 1);
INSERT INTO `screening_room` VALUES (129855, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排5列', 1);
INSERT INTO `screening_room` VALUES (129856, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排6列', 1);
INSERT INTO `screening_room` VALUES (129857, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排7列', 1);
INSERT INTO `screening_room` VALUES (129858, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排8列', 1);
INSERT INTO `screening_room` VALUES (129859, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排9列', 1);
INSERT INTO `screening_room` VALUES (129860, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排10列', 1);
INSERT INTO `screening_room` VALUES (129861, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排11列', 1);
INSERT INTO `screening_room` VALUES (129862, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '1排12列', 1);
INSERT INTO `screening_room` VALUES (129863, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排1列', 1);
INSERT INTO `screening_room` VALUES (129864, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排2列', 1);
INSERT INTO `screening_room` VALUES (129865, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排3列', 1);
INSERT INTO `screening_room` VALUES (129866, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排4列', 1);
INSERT INTO `screening_room` VALUES (129867, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排5列', 1);
INSERT INTO `screening_room` VALUES (129868, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排6列', 1);
INSERT INTO `screening_room` VALUES (129869, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排7列', 1);
INSERT INTO `screening_room` VALUES (129870, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排8列', 1);
INSERT INTO `screening_room` VALUES (129871, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排9列', 1);
INSERT INTO `screening_room` VALUES (129872, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排10列', 1);
INSERT INTO `screening_room` VALUES (129873, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排11列', 1);
INSERT INTO `screening_room` VALUES (129874, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '2排12列', 1);
INSERT INTO `screening_room` VALUES (129875, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排1列', 1);
INSERT INTO `screening_room` VALUES (129876, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排2列', 1);
INSERT INTO `screening_room` VALUES (129877, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排3列', 1);
INSERT INTO `screening_room` VALUES (129878, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排4列', 1);
INSERT INTO `screening_room` VALUES (129879, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排5列', 1);
INSERT INTO `screening_room` VALUES (129880, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排6列', 1);
INSERT INTO `screening_room` VALUES (129881, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排7列', 1);
INSERT INTO `screening_room` VALUES (129882, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排8列', 1);
INSERT INTO `screening_room` VALUES (129883, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排9列', 1);
INSERT INTO `screening_room` VALUES (129884, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排10列', 1);
INSERT INTO `screening_room` VALUES (129885, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排11列', 1);
INSERT INTO `screening_room` VALUES (129886, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '3排12列', 1);
INSERT INTO `screening_room` VALUES (129887, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排1列', 1);
INSERT INTO `screening_room` VALUES (129888, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排2列', 1);
INSERT INTO `screening_room` VALUES (129889, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排3列', 1);
INSERT INTO `screening_room` VALUES (129890, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排4列', 1);
INSERT INTO `screening_room` VALUES (129891, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排5列', 1);
INSERT INTO `screening_room` VALUES (129892, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排6列', 1);
INSERT INTO `screening_room` VALUES (129893, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排7列', 1);
INSERT INTO `screening_room` VALUES (129894, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排8列', 1);
INSERT INTO `screening_room` VALUES (129895, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排9列', 1);
INSERT INTO `screening_room` VALUES (129896, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排10列', 1);
INSERT INTO `screening_room` VALUES (129897, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排11列', 1);
INSERT INTO `screening_room` VALUES (129898, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '4排12列', 1);
INSERT INTO `screening_room` VALUES (129899, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排1列', 1);
INSERT INTO `screening_room` VALUES (129900, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排2列', 1);
INSERT INTO `screening_room` VALUES (129901, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排3列', 1);
INSERT INTO `screening_room` VALUES (129902, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排4列', 1);
INSERT INTO `screening_room` VALUES (129903, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排5列', 1);
INSERT INTO `screening_room` VALUES (129904, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排6列', 1);
INSERT INTO `screening_room` VALUES (129905, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排7列', 1);
INSERT INTO `screening_room` VALUES (129906, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排8列', 1);
INSERT INTO `screening_room` VALUES (129907, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排9列', 1);
INSERT INTO `screening_room` VALUES (129908, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排10列', 1);
INSERT INTO `screening_room` VALUES (129909, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排11列', 1);
INSERT INTO `screening_room` VALUES (129910, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '5排12列', 1);
INSERT INTO `screening_room` VALUES (129911, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排1列', 1);
INSERT INTO `screening_room` VALUES (129912, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排2列', 1);
INSERT INTO `screening_room` VALUES (129913, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排3列', 1);
INSERT INTO `screening_room` VALUES (129914, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排4列', 1);
INSERT INTO `screening_room` VALUES (129915, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排5列', 1);
INSERT INTO `screening_room` VALUES (129916, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排6列', 1);
INSERT INTO `screening_room` VALUES (129917, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排7列', 1);
INSERT INTO `screening_room` VALUES (129918, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排8列', 1);
INSERT INTO `screening_room` VALUES (129919, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排9列', 1);
INSERT INTO `screening_room` VALUES (129920, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排10列', 1);
INSERT INTO `screening_room` VALUES (129921, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排11列', 1);
INSERT INTO `screening_room` VALUES (129922, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '6排12列', 1);
INSERT INTO `screening_room` VALUES (129923, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排1列', 1);
INSERT INTO `screening_room` VALUES (129924, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排2列', 1);
INSERT INTO `screening_room` VALUES (129925, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排3列', 1);
INSERT INTO `screening_room` VALUES (129926, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排4列', 1);
INSERT INTO `screening_room` VALUES (129927, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排5列', 1);
INSERT INTO `screening_room` VALUES (129928, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排6列', 1);
INSERT INTO `screening_room` VALUES (129929, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排7列', 1);
INSERT INTO `screening_room` VALUES (129930, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排8列', 1);
INSERT INTO `screening_room` VALUES (129931, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排9列', 1);
INSERT INTO `screening_room` VALUES (129932, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排10列', 1);
INSERT INTO `screening_room` VALUES (129933, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排11列', 1);
INSERT INTO `screening_room` VALUES (129934, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '7排12列', 1);
INSERT INTO `screening_room` VALUES (129935, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排1列', 1);
INSERT INTO `screening_room` VALUES (129936, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排2列', 1);
INSERT INTO `screening_room` VALUES (129937, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排3列', 1);
INSERT INTO `screening_room` VALUES (129938, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排4列', 1);
INSERT INTO `screening_room` VALUES (129939, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排5列', 1);
INSERT INTO `screening_room` VALUES (129940, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排6列', 1);
INSERT INTO `screening_room` VALUES (129941, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排7列', 1);
INSERT INTO `screening_room` VALUES (129942, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排8列', 1);
INSERT INTO `screening_room` VALUES (129943, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排9列', 1);
INSERT INTO `screening_room` VALUES (129944, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排10列', 1);
INSERT INTO `screening_room` VALUES (129945, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排11列', 1);
INSERT INTO `screening_room` VALUES (129946, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '8排12列', 1);
INSERT INTO `screening_room` VALUES (129947, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排1列', 1);
INSERT INTO `screening_room` VALUES (129948, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排2列', 1);
INSERT INTO `screening_room` VALUES (129949, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排3列', 1);
INSERT INTO `screening_room` VALUES (129950, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排4列', 1);
INSERT INTO `screening_room` VALUES (129951, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排5列', 1);
INSERT INTO `screening_room` VALUES (129952, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排6列', 1);
INSERT INTO `screening_room` VALUES (129953, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排7列', 1);
INSERT INTO `screening_room` VALUES (129954, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排8列', 1);
INSERT INTO `screening_room` VALUES (129955, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排9列', 1);
INSERT INTO `screening_room` VALUES (129956, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排10列', 1);
INSERT INTO `screening_room` VALUES (129957, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排11列', 1);
INSERT INTO `screening_room` VALUES (129958, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '9排12列', 1);
INSERT INTO `screening_room` VALUES (129959, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排1列', 1);
INSERT INTO `screening_room` VALUES (129960, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排2列', 1);
INSERT INTO `screening_room` VALUES (129961, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排3列', 1);
INSERT INTO `screening_room` VALUES (129962, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排4列', 1);
INSERT INTO `screening_room` VALUES (129963, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排5列', 1);
INSERT INTO `screening_room` VALUES (129964, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排6列', 1);
INSERT INTO `screening_room` VALUES (129965, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排7列', 1);
INSERT INTO `screening_room` VALUES (129966, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排8列', 1);
INSERT INTO `screening_room` VALUES (129967, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排9列', 1);
INSERT INTO `screening_room` VALUES (129968, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排10列', 1);
INSERT INTO `screening_room` VALUES (129969, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排11列', 1);
INSERT INTO `screening_room` VALUES (129970, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '10排12列', 1);
INSERT INTO `screening_room` VALUES (129971, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排1列', 1);
INSERT INTO `screening_room` VALUES (129972, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排2列', 1);
INSERT INTO `screening_room` VALUES (129973, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排3列', 1);
INSERT INTO `screening_room` VALUES (129974, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排4列', 1);
INSERT INTO `screening_room` VALUES (129975, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排5列', 1);
INSERT INTO `screening_room` VALUES (129976, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排6列', 1);
INSERT INTO `screening_room` VALUES (129977, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排7列', 1);
INSERT INTO `screening_room` VALUES (129978, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排8列', 1);
INSERT INTO `screening_room` VALUES (129979, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排9列', 1);
INSERT INTO `screening_room` VALUES (129980, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排10列', 1);
INSERT INTO `screening_room` VALUES (129981, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排11列', 1);
INSERT INTO `screening_room` VALUES (129982, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '11排12列', 1);
INSERT INTO `screening_room` VALUES (129983, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排1列', 1);
INSERT INTO `screening_room` VALUES (129984, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排2列', 1);
INSERT INTO `screening_room` VALUES (129985, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排3列', 1);
INSERT INTO `screening_room` VALUES (129986, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排4列', 1);
INSERT INTO `screening_room` VALUES (129987, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排5列', 1);
INSERT INTO `screening_room` VALUES (129988, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排6列', 1);
INSERT INTO `screening_room` VALUES (129989, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排7列', 1);
INSERT INTO `screening_room` VALUES (129990, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排8列', 1);
INSERT INTO `screening_room` VALUES (129991, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排9列', 1);
INSERT INTO `screening_room` VALUES (129992, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排10列', 1);
INSERT INTO `screening_room` VALUES (129993, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排11列', 1);
INSERT INTO `screening_room` VALUES (129994, '15628788969', '二号放映厅', '2022-09-01', '2022-10-25', '15:00:00', '17:02:00', '独行月球', 30, '12排12列', 1);
INSERT INTO `screening_room` VALUES (130139, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排1列', 1);
INSERT INTO `screening_room` VALUES (130140, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排2列', 1);
INSERT INTO `screening_room` VALUES (130141, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排3列', 1);
INSERT INTO `screening_room` VALUES (130142, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排4列', 1);
INSERT INTO `screening_room` VALUES (130143, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排5列', 1);
INSERT INTO `screening_room` VALUES (130144, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排6列', 1);
INSERT INTO `screening_room` VALUES (130145, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排7列', 1);
INSERT INTO `screening_room` VALUES (130146, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排8列', 1);
INSERT INTO `screening_room` VALUES (130147, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排9列', 1);
INSERT INTO `screening_room` VALUES (130148, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排10列', 1);
INSERT INTO `screening_room` VALUES (130149, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排11列', 1);
INSERT INTO `screening_room` VALUES (130150, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '1排12列', 1);
INSERT INTO `screening_room` VALUES (130151, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排1列', 1);
INSERT INTO `screening_room` VALUES (130152, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排2列', 1);
INSERT INTO `screening_room` VALUES (130153, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排3列', 1);
INSERT INTO `screening_room` VALUES (130154, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排4列', 1);
INSERT INTO `screening_room` VALUES (130155, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排5列', 1);
INSERT INTO `screening_room` VALUES (130156, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排6列', 1);
INSERT INTO `screening_room` VALUES (130157, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排7列', 1);
INSERT INTO `screening_room` VALUES (130158, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排8列', 1);
INSERT INTO `screening_room` VALUES (130159, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排9列', 1);
INSERT INTO `screening_room` VALUES (130160, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排10列', 1);
INSERT INTO `screening_room` VALUES (130161, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排11列', 1);
INSERT INTO `screening_room` VALUES (130162, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '2排12列', 1);
INSERT INTO `screening_room` VALUES (130163, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排1列', 1);
INSERT INTO `screening_room` VALUES (130164, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排2列', 1);
INSERT INTO `screening_room` VALUES (130165, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排3列', 1);
INSERT INTO `screening_room` VALUES (130166, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排4列', 1);
INSERT INTO `screening_room` VALUES (130167, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排5列', 1);
INSERT INTO `screening_room` VALUES (130168, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排6列', 1);
INSERT INTO `screening_room` VALUES (130169, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排7列', 1);
INSERT INTO `screening_room` VALUES (130170, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排8列', 1);
INSERT INTO `screening_room` VALUES (130171, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排9列', 1);
INSERT INTO `screening_room` VALUES (130172, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排10列', 1);
INSERT INTO `screening_room` VALUES (130173, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排11列', 1);
INSERT INTO `screening_room` VALUES (130174, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '3排12列', 1);
INSERT INTO `screening_room` VALUES (130175, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排1列', 1);
INSERT INTO `screening_room` VALUES (130176, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排2列', 1);
INSERT INTO `screening_room` VALUES (130177, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排3列', 1);
INSERT INTO `screening_room` VALUES (130178, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排4列', 1);
INSERT INTO `screening_room` VALUES (130179, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排5列', 1);
INSERT INTO `screening_room` VALUES (130180, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排6列', 1);
INSERT INTO `screening_room` VALUES (130181, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排7列', 1);
INSERT INTO `screening_room` VALUES (130182, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排8列', 1);
INSERT INTO `screening_room` VALUES (130183, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排9列', 1);
INSERT INTO `screening_room` VALUES (130184, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排10列', 1);
INSERT INTO `screening_room` VALUES (130185, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排11列', 1);
INSERT INTO `screening_room` VALUES (130186, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '4排12列', 1);
INSERT INTO `screening_room` VALUES (130187, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排1列', 1);
INSERT INTO `screening_room` VALUES (130188, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排2列', 1);
INSERT INTO `screening_room` VALUES (130189, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排3列', 1);
INSERT INTO `screening_room` VALUES (130190, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排4列', 1);
INSERT INTO `screening_room` VALUES (130191, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排5列', 1);
INSERT INTO `screening_room` VALUES (130192, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排6列', 1);
INSERT INTO `screening_room` VALUES (130193, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排7列', 1);
INSERT INTO `screening_room` VALUES (130194, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排8列', 1);
INSERT INTO `screening_room` VALUES (130195, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排9列', 1);
INSERT INTO `screening_room` VALUES (130196, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排10列', 1);
INSERT INTO `screening_room` VALUES (130197, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排11列', 1);
INSERT INTO `screening_room` VALUES (130198, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '5排12列', 1);
INSERT INTO `screening_room` VALUES (130199, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排1列', 1);
INSERT INTO `screening_room` VALUES (130200, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排2列', 1);
INSERT INTO `screening_room` VALUES (130201, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排3列', 1);
INSERT INTO `screening_room` VALUES (130202, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排4列', 1);
INSERT INTO `screening_room` VALUES (130203, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排5列', 1);
INSERT INTO `screening_room` VALUES (130204, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排6列', 1);
INSERT INTO `screening_room` VALUES (130205, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排7列', 1);
INSERT INTO `screening_room` VALUES (130206, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排8列', 1);
INSERT INTO `screening_room` VALUES (130207, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排9列', 1);
INSERT INTO `screening_room` VALUES (130208, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排10列', 1);
INSERT INTO `screening_room` VALUES (130209, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排11列', 1);
INSERT INTO `screening_room` VALUES (130210, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '6排12列', 1);
INSERT INTO `screening_room` VALUES (130211, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排1列', 1);
INSERT INTO `screening_room` VALUES (130212, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排2列', 1);
INSERT INTO `screening_room` VALUES (130213, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排3列', 1);
INSERT INTO `screening_room` VALUES (130214, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排4列', 1);
INSERT INTO `screening_room` VALUES (130215, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排5列', 1);
INSERT INTO `screening_room` VALUES (130216, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排6列', 1);
INSERT INTO `screening_room` VALUES (130217, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排7列', 1);
INSERT INTO `screening_room` VALUES (130218, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排8列', 1);
INSERT INTO `screening_room` VALUES (130219, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排9列', 1);
INSERT INTO `screening_room` VALUES (130220, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排10列', 1);
INSERT INTO `screening_room` VALUES (130221, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排11列', 1);
INSERT INTO `screening_room` VALUES (130222, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '7排12列', 1);
INSERT INTO `screening_room` VALUES (130223, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排1列', 1);
INSERT INTO `screening_room` VALUES (130224, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排2列', 1);
INSERT INTO `screening_room` VALUES (130225, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排3列', 1);
INSERT INTO `screening_room` VALUES (130226, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排4列', 1);
INSERT INTO `screening_room` VALUES (130227, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排5列', 1);
INSERT INTO `screening_room` VALUES (130228, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排6列', 1);
INSERT INTO `screening_room` VALUES (130229, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排7列', 1);
INSERT INTO `screening_room` VALUES (130230, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排8列', 1);
INSERT INTO `screening_room` VALUES (130231, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排9列', 1);
INSERT INTO `screening_room` VALUES (130232, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排10列', 1);
INSERT INTO `screening_room` VALUES (130233, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排11列', 1);
INSERT INTO `screening_room` VALUES (130234, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '8排12列', 1);
INSERT INTO `screening_room` VALUES (130235, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排1列', 1);
INSERT INTO `screening_room` VALUES (130236, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排2列', 1);
INSERT INTO `screening_room` VALUES (130237, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排3列', 1);
INSERT INTO `screening_room` VALUES (130238, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排4列', 1);
INSERT INTO `screening_room` VALUES (130239, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排5列', 1);
INSERT INTO `screening_room` VALUES (130240, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排6列', 1);
INSERT INTO `screening_room` VALUES (130241, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排7列', 1);
INSERT INTO `screening_room` VALUES (130242, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排8列', 1);
INSERT INTO `screening_room` VALUES (130243, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排9列', 1);
INSERT INTO `screening_room` VALUES (130244, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排10列', 1);
INSERT INTO `screening_room` VALUES (130245, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排11列', 1);
INSERT INTO `screening_room` VALUES (130246, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '9排12列', 1);
INSERT INTO `screening_room` VALUES (130247, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排1列', 1);
INSERT INTO `screening_room` VALUES (130248, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排2列', 1);
INSERT INTO `screening_room` VALUES (130249, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排3列', 1);
INSERT INTO `screening_room` VALUES (130250, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排4列', 1);
INSERT INTO `screening_room` VALUES (130251, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排5列', 1);
INSERT INTO `screening_room` VALUES (130252, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排6列', 1);
INSERT INTO `screening_room` VALUES (130253, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排7列', 1);
INSERT INTO `screening_room` VALUES (130254, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排8列', 1);
INSERT INTO `screening_room` VALUES (130255, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排9列', 1);
INSERT INTO `screening_room` VALUES (130256, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排10列', 1);
INSERT INTO `screening_room` VALUES (130257, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排11列', 1);
INSERT INTO `screening_room` VALUES (130258, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '10排12列', 1);
INSERT INTO `screening_room` VALUES (130259, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排1列', 1);
INSERT INTO `screening_room` VALUES (130260, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排2列', 1);
INSERT INTO `screening_room` VALUES (130261, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排3列', 1);
INSERT INTO `screening_room` VALUES (130262, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排4列', 1);
INSERT INTO `screening_room` VALUES (130263, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排5列', 1);
INSERT INTO `screening_room` VALUES (130264, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排6列', 1);
INSERT INTO `screening_room` VALUES (130265, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排7列', 1);
INSERT INTO `screening_room` VALUES (130266, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排8列', 1);
INSERT INTO `screening_room` VALUES (130267, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排9列', 1);
INSERT INTO `screening_room` VALUES (130268, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排10列', 1);
INSERT INTO `screening_room` VALUES (130269, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排11列', 1);
INSERT INTO `screening_room` VALUES (130270, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '11排12列', 1);
INSERT INTO `screening_room` VALUES (130271, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排1列', 1);
INSERT INTO `screening_room` VALUES (130272, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排2列', 1);
INSERT INTO `screening_room` VALUES (130273, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排3列', 1);
INSERT INTO `screening_room` VALUES (130274, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排4列', 1);
INSERT INTO `screening_room` VALUES (130275, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排5列', 1);
INSERT INTO `screening_room` VALUES (130276, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排6列', 1);
INSERT INTO `screening_room` VALUES (130277, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排7列', 1);
INSERT INTO `screening_room` VALUES (130278, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排8列', 1);
INSERT INTO `screening_room` VALUES (130279, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排9列', 1);
INSERT INTO `screening_room` VALUES (130280, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排10列', 1);
INSERT INTO `screening_room` VALUES (130281, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排11列', 1);
INSERT INTO `screening_room` VALUES (130282, '15628788969', '一号放映厅', '2022-09-21', '2022-10-24', '22:16:02', '23:16:02', '独行月球', 30, '12排12列', 1);

-- ----------------------------
-- Table structure for user_information
-- ----------------------------
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information`  (
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `permissions` int NOT NULL COMMENT '最低权限为0',
  `account_balance` double NOT NULL,
  PRIMARY KEY (`phone`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_information
-- ----------------------------
INSERT INTO `user_information` VALUES ('05376801234', '123456', '九七', 2, 0);
INSERT INTO `user_information` VALUES ('05376801235', '123456', '孙六', 2, -2880);
INSERT INTO `user_information` VALUES ('05376801236', '123456', '苏琪', 2, 0);
INSERT INTO `user_information` VALUES ('05377779999', '123456', '雯雯', 2, 0);
INSERT INTO `user_information` VALUES ('15628788965', '123456', '张琦', 1, 1000);
INSERT INTO `user_information` VALUES ('15628788966', '123456', '李四', 1, 1000);
INSERT INTO `user_information` VALUES ('15628788967', '123456', '王五', 1, 1000);
INSERT INTO `user_information` VALUES ('15628788968', '123456', '李光士', 0, 3940);
INSERT INTO `user_information` VALUES ('15628788969', '123456', '张三', 1, 1270);

SET FOREIGN_KEY_CHECKS = 1;
