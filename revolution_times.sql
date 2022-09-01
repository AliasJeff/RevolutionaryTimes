/*
 Navicat Premium Data Transfer

 Source Server         : conn-localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : revolution_times

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 01/09/2022 15:32:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `articleid` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `uid` int NULL DEFAULT NULL COMMENT '上传者id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `view` int NULL DEFAULT 0 COMMENT '阅读次数',
  `like` int NULL DEFAULT 0 COMMENT '点赞个数',
  `collect` int NULL DEFAULT 0 COMMENT '收藏个数',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布时间',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面id',
  PRIMARY KEY (`articleid`) USING BTREE,
  INDEX `article_ibfk_1`(`uid`) USING BTREE,
  INDEX `article_ibfk_2`(`uname`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (5, 2, 'test', 0, 0, 0, '第一篇文章', '测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章测试第一篇文章', '2022-08-12 10:43:57', NULL);
INSERT INTO `article` VALUES (29, 2, 'test', 0, 0, 0, '发布时间', '测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间测试发布时间', '2022-8-12 11:25:11', NULL);
INSERT INTO `article` VALUES (35, 2, 'test', 0, 0, 0, '“空中神炮手”鲍寿根', '位于浙江金华兰溪的石渠村，拥有悠久的历史，其村中最大姓氏为鲍氏，还有吕，徐，王，方等50余个姓氏。鲍氏始祖鲍含，在宋代年间宦游兰溪，在石渠村定居。在滚滚的历史长河里，这片土地上涌现了许许多多的历史人物。而今天我们要讲的主人公，就是出生在兰溪石渠村的鲍寿根烈士。', '2022-8-13 11:10:57', NULL);
INSERT INTO `article` VALUES (39, 2, 'test', 0, 0, 0, '新文章发布', '新文章发布新文章发布新文章发布新文章发布新文章发布新文章发布新文章发布新文章发布新文章发布新文章发布新文章发布', '2022-8-23 22:7:28', NULL);
INSERT INTO `article` VALUES (40, 4, 'zhexun', 0, 0, 0, '7月22日拜访张尚启烈士后人', '曹宅镇，坐落于金华市金东区东北部，临近山区。1945年5月2日，抗日战争末期，潘村伏击战在曹宅镇潘村附近打响，新四军浙东游击纵队金萧支队第八大队成功击败日军黑旗小分队，打得敌人落花流水，阻止了日军次日到潘村抢粮的计划，保护了村民生命财产安全，为取得抗日战争全面胜利大大提振了士气。\r\n曹宅镇白渡村的张尚启同志，生前担任八大队便衣组组长，潜伏在村民之中与当地日军势力斗争。张尚启的小儿子张宝成常被带在他身边，作为伪装，迷惑敌人。抗日战争爆发前，村子周边有土匪出没，日军侵占此地后，土匪转而投日，成为汉奸，继续欺压百姓，张尚启等八大队的新四军们便与这些势力做着斗争。\r\n在1945年夏的某天，张尚启的一位熟人敲开了他家的房门，熟人声称潘村有变故，急需张尚启帮助。然而张尚启的妻子察觉情况不对，劝说他不要贸然前往。张尚启不管那么多，救急心切，扛上家中的洋枪便独自一人前往了潘村，谁知这一去，他便再也没有回来。实际上那个熟人早已经叛变，在潘村等待张尚启的只有五花大绑以及日本人和土匪汉奸的严刑逼供。次日，张尚启被押上街游行，他的亲人中，只有张尚启妻子和小儿子张宝成在场，张尚启被敌人从家人面前押送过，随后惨遭枪决，英勇牺牲。\r\n我们此次采访到的，正是张宝成的小儿子，也就是张尚启烈士的孙子张有记先生。采访中我们得知在张尚启烈士后代中，只有他的大儿子张宝荣有红色基因相关传承，曾经亲历过抗美援朝，参加过上甘岭等战役。我们通过张有记联系到张宝荣儿子张卫，了解了他父亲的相关事迹，瞻仰了张国荣战士的兵役证等遗物。我们了解到张宝荣受父亲英勇事迹鼓舞，参加志愿军入朝作战。经过九死一生回国后，先去军校进修，后又回乡成家生子。\r\n本次采访让我们发现了很多红色文化传承方面的痛点：\r\n1.金华本土许多红色人物的事迹缺少详细记载，很多故事只能凭借后代的口口相传或者零星的记忆碎片进行记述。故事细节易丢失，甚至出现故事前后逻辑相矛盾的情况，许多红色人物的光荣事迹在慢慢被遗忘。\r\n在书记介绍完当潘村伏击战之后，我们想通过一些当时的旧物或者照片或者相关村志记载来记录，但是书记却遗憾地说道这些事情全凭口头记述，没有相关实物的记载。而在我们寻找采访对象时，也发现这些红色故事只有老一辈人了解。如果再没有人去做相关事情的记录与宣传，可能慢慢的，这些故事将最终被遗忘。\r\n2.红色基因传承淡化。例如我们采访到的张尚启后代当兵或入党的只有他的大儿子张宝荣，而张有记表示家族成员中入党的意愿非常强，但是由于种种原因并没有相关机会和途径。而张有记表示，相比其他一些烈士家属后代的有待，他更希望烈士后代能有更方便的入党途径。\r\n', '2022-8-25 0:4:12', NULL);

-- ----------------------------
-- Table structure for articlemsg
-- ----------------------------
DROP TABLE IF EXISTS `articlemsg`;
CREATE TABLE `articlemsg`  (
  `msgid` int NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `articleid` int NULL DEFAULT NULL COMMENT '文章id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息内容',
  `idread` int NULL DEFAULT NULL COMMENT '已读',
  PRIMARY KEY (`msgid`) USING BTREE,
  INDEX `articlemsg_ibfk_1`(`uid`) USING BTREE,
  INDEX `articlemsg_ibfk_2`(`articleid`) USING BTREE,
  CONSTRAINT `articlemsg_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `articlemsg_ibfk_2` FOREIGN KEY (`articleid`) REFERENCES `article` (`articleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articlemsg
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentid` int NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `articleid` int NULL DEFAULT NULL COMMENT '文章id',
  `articletitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题',
  `uid` int NULL DEFAULT NULL COMMENT '评论用户id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论用户名',
  `uoid` int NULL DEFAULT NULL COMMENT '被评论用户id',
  `uoname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被评论用户名',
  `commentContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`commentid`) USING BTREE,
  INDEX `uid`(`uid`, `uoid`) USING BTREE,
  INDEX `uid_2`(`uid`) USING BTREE,
  INDEX `comment_ibfk_1`(`articleid`) USING BTREE,
  INDEX `comment_ibfk_3`(`uoid`) USING BTREE,
  INDEX `uname`(`uname`) USING BTREE,
  INDEX `uoname`(`uoname`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`articleid`) REFERENCES `article` (`articleid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`uoid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_5` FOREIGN KEY (`uoname`) REFERENCES `user` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (5, 40, '7月22日拜访张尚启烈士后人', 2, 'test', NULL, NULL, '333', '2022-8-25 21:58:33');
INSERT INTO `comment` VALUES (7, 40, '7月22日拜访张尚启烈士后人', 2, 'test', 2, 'test', '嘿嘿嘿', '2022-8-25 22:31:37');
INSERT INTO `comment` VALUES (18, 35, '“空中神炮手”鲍寿根', 3, 'admin', NULL, NULL, 'hello', '2022-8-26 19:58:52');
INSERT INTO `comment` VALUES (20, 35, '“空中神炮手”鲍寿根', 3, 'admin', 3, 'admin', 'null？？？', '2022-8-26 19:59:32');
INSERT INTO `comment` VALUES (21, 35, '“空中神炮手”鲍寿根', 3, 'admin', 3, 'admin', 'ok', '2022-8-26 20:0:1');
INSERT INTO `comment` VALUES (22, 35, '“空中神炮手”鲍寿根', 3, 'admin', NULL, NULL, 'new', '2022-8-26 20:0:36');
INSERT INTO `comment` VALUES (24, 35, '“空中神炮手”鲍寿根', 3, 'admin', 3, 'admin', 'new comment', '2022-8-26 20:0:54');
INSERT INTO `comment` VALUES (25, 29, '发布时间', 3, 'admin', NULL, NULL, 'first comment', '2022-8-26 20:3:3');
INSERT INTO `comment` VALUES (27, 5, '第一篇文章', 4, 'zhexun', NULL, NULL, '1 comment', '2022-8-26 20:6:20');
INSERT INTO `comment` VALUES (30, 5, '第一篇文章', 4, 'zhexun', 4, 'zhexun', 'not null now?', '2022-8-26 20:7:12');
INSERT INTO `comment` VALUES (31, 5, '第一篇文章', 4, 'zhexun', NULL, NULL, 'try', '2022-8-26 20:7:29');
INSERT INTO `comment` VALUES (32, 5, '第一篇文章', 4, 'zhexun', NULL, NULL, 'try again', '2022-8-26 20:7:46');
INSERT INTO `comment` VALUES (36, 39, '新文章发布', 3, 'admin', NULL, NULL, 'hello', '2022-8-28 23:8:58');
INSERT INTO `comment` VALUES (37, 39, '新文章发布', 3, 'admin', NULL, NULL, 'HI!', '2022-8-28 23:16:52');
INSERT INTO `comment` VALUES (38, 39, '新文章发布', 3, 'admin', NULL, NULL, '6666', '2022-8-28 23:18:20');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseid` int NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名',
  `uid` int NULL DEFAULT NULL COMMENT '上传者id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传者用户名',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`courseid`) USING BTREE,
  INDEX `course_ibfk_1`(`uid`) USING BTREE,
  INDEX `course_ibfk_2`(`uname`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '上课视频.MTS', 4, 'zhexun', NULL);

-- ----------------------------
-- Table structure for oparticle
-- ----------------------------
DROP TABLE IF EXISTS `oparticle`;
CREATE TABLE `oparticle`  (
  `articleid` int NOT NULL COMMENT '文章id',
  `likeuid` int NULL DEFAULT NULL COMMENT '点赞用户',
  `collectuid` int NULL DEFAULT NULL COMMENT '收藏用户',
  `commentuid` int NULL DEFAULT NULL COMMENT '评论用户',
  PRIMARY KEY (`articleid`) USING BTREE,
  INDEX `oparticle_ibfk_2`(`likeuid`) USING BTREE,
  INDEX `oparticle_ibfk_3`(`collectuid`) USING BTREE,
  INDEX `oparticle_ibfk_4`(`commentuid`) USING BTREE,
  CONSTRAINT `oparticle_ibfk_1` FOREIGN KEY (`articleid`) REFERENCES `article` (`articleid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oparticle_ibfk_2` FOREIGN KEY (`likeuid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oparticle_ibfk_3` FOREIGN KEY (`collectuid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oparticle_ibfk_4` FOREIGN KEY (`commentuid`) REFERENCES `comment` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oparticle
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `pictureid` int NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `pname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片名称',
  `uid` int NULL DEFAULT NULL COMMENT '上传者id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传者名字',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`pictureid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `uname`(`uname`) USING BTREE,
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, 'icon.JPG', 2, 'test', NULL);
INSERT INTO `picture` VALUES (2, 'MOSHED-2021-6-8-18-30-10.jpg', 4, 'zhexun', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户姓名',
  `upassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `uintroduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户简介',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `birthday` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户生日',
  `collectarticleid` int NULL DEFAULT NULL COMMENT '收藏文章id',
  `access` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户权限',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'test', '123456', '这里空空如也~', NULL, 'email@zjnu.edu.cn', 'YYMMDD', NULL, '0');
INSERT INTO `user` VALUES (3, 'admin', 'admin', NULL, NULL, 'admin@admin.com', NULL, NULL, '1');
INSERT INTO `user` VALUES (4, 'zhexun', '123456', 'lalalala', NULL, NULL, NULL, NULL, '0');
INSERT INTO `user` VALUES (5, '游客', '11223344', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `user` VALUES (6, 'chen', '11223344', NULL, NULL, NULL, NULL, NULL, '0');

SET FOREIGN_KEY_CHECKS = 1;
