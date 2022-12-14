/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3307
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3307
 Source Schema         : abc

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 15/12/2022 01:05:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auctions
-- ----------------------------
DROP TABLE IF EXISTS `auctions`;
CREATE TABLE `auctions`  (
  `AuID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProID` int NOT NULL,
  `Price` int NOT NULL,
  `Paid` int NOT NULL,
  `Date` datetime NULL DEFAULT NULL,
  `StrDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`AuID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auctions
-- ----------------------------
INSERT INTO `auctions` VALUES (117, 104, 51, 10100000, 1, '2022-12-12 04:01:38', '2022-12-12 04:01:38');
INSERT INTO `auctions` VALUES (118, 103, 51, 10200000, 1, '2022-12-12 04:01:49', '2022-12-12 04:01:49');
INSERT INTO `auctions` VALUES (119, 103, 54, 10100000, 1, '2022-12-12 05:11:02', '2022-12-12 05:11:02');
INSERT INTO `auctions` VALUES (120, 104, 54, 10200000, 1, '2022-12-12 05:11:20', '2022-12-12 05:11:20');
INSERT INTO `auctions` VALUES (121, 104, 55, 10100000, 1, '2022-12-12 05:54:07', '2022-12-12 05:54:07');
INSERT INTO `auctions` VALUES (122, 103, 55, 10200000, 1, '2022-12-12 05:54:22', '2022-12-12 05:54:22');
INSERT INTO `auctions` VALUES (123, 103, 56, 10100000, 1, '2022-12-12 06:08:09', '2022-12-12 06:08:09');
INSERT INTO `auctions` VALUES (124, 104, 56, 10200000, 1, '2022-12-12 06:08:23', '2022-12-12 06:08:23');
INSERT INTO `auctions` VALUES (125, 103, 57, 10400000, 1, '2022-12-12 16:55:58', '2022-12-12 16:55:58');
INSERT INTO `auctions` VALUES (126, 104, 57, 10200000, 1, '2022-12-12 16:55:47', '2022-12-12 16:55:47');
INSERT INTO `auctions` VALUES (127, 103, 58, 10100000, 1, '2022-12-12 18:10:19', '2022-12-12 18:10:19');
INSERT INTO `auctions` VALUES (128, 104, 52, 11700000, 1, '2022-12-13 00:59:05', '2022-12-13 00:59:05');
INSERT INTO `auctions` VALUES (129, 103, 52, 12000000, 1, '2022-12-13 01:11:25', '2022-12-13 01:11:25');
INSERT INTO `auctions` VALUES (130, 104, 53, 10400000, 0, '2022-12-13 14:47:18', '2022-12-13 14:47:18');
INSERT INTO `auctions` VALUES (131, 103, 59, 10100000, 1, '2022-12-13 15:21:27', '2022-12-13 15:21:27');
INSERT INTO `auctions` VALUES (132, 104, 59, 10300000, 1, '2022-12-13 15:22:32', '2022-12-13 15:22:32');
INSERT INTO `auctions` VALUES (133, 104, 60, 10100000, 1, '2022-12-13 15:34:48', '2022-12-13 15:34:48');
INSERT INTO `auctions` VALUES (134, 103, 60, 10200000, 1, '2022-12-13 15:35:12', '2022-12-13 15:35:12');
INSERT INTO `auctions` VALUES (135, 104, 62, 10100000, 1, '2022-12-13 15:58:50', '2022-12-13 15:58:50');
INSERT INTO `auctions` VALUES (136, 103, 62, 10200000, 1, '2022-12-13 15:59:55', '2022-12-13 15:59:55');
INSERT INTO `auctions` VALUES (137, 103, 63, 10100000, 1, '2022-12-13 16:14:23', '2022-12-13 16:14:23');
INSERT INTO `auctions` VALUES (138, 104, 64, 10100000, 1, '2022-12-13 16:45:56', '2022-12-13 16:45:56');
INSERT INTO `auctions` VALUES (139, 103, 53, 546545312, 0, '2022-12-14 06:14:05', '14-12-2022 06:14:05');
INSERT INTO `auctions` VALUES (140, 104, 69, 20000000, 0, '2022-12-14 20:59:39', '14-12-2022 20:59:39');

-- ----------------------------
-- Table structure for banks
-- ----------------------------
DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks`  (
  `idUser` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idBank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banks
-- ----------------------------
INSERT INTO `banks` VALUES (41, 15, 'VietcomBank', '41546531');
INSERT INTO `banks` VALUES (99, 16, 'Agribank', '123456798');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `CatID` int NOT NULL AUTO_INCREMENT,
  `CatName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GrCatID` int NOT NULL,
  PRIMARY KEY (`CatID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (27, 'Laptop', 15);
INSERT INTO `categories` VALUES (28, 'Điện thoại ', 15);
INSERT INTO `categories` VALUES (29, 'PC', 15);
INSERT INTO `categories` VALUES (30, 'Nón & Mắt kính', 17);
INSERT INTO `categories` VALUES (31, 'Đồng hồ', 17);
INSERT INTO `categories` VALUES (33, 'Playstation', 18);
INSERT INTO `categories` VALUES (34, 'Nintendo Switch', 18);
INSERT INTO `categories` VALUES (35, 'Xbox', 18);

-- ----------------------------
-- Table structure for favourites
-- ----------------------------
DROP TABLE IF EXISTS `favourites`;
CREATE TABLE `favourites`  (
  `FaID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProID` int NOT NULL,
  `Favourite` int NOT NULL,
  PRIMARY KEY (`FaID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favourites
-- ----------------------------
INSERT INTO `favourites` VALUES (0, 20, 60, 0);
INSERT INTO `favourites` VALUES (80, 20, 61, 1);
INSERT INTO `favourites` VALUES (81, 1, 61, 1);
INSERT INTO `favourites` VALUES (82, 1, 60, 0);
INSERT INTO `favourites` VALUES (83, 41, 60, 0);
INSERT INTO `favourites` VALUES (84, 41, 61, 0);
INSERT INTO `favourites` VALUES (85, 33, 60, 0);
INSERT INTO `favourites` VALUES (86, 33, 61, 0);
INSERT INTO `favourites` VALUES (87, 34, 61, 0);
INSERT INTO `favourites` VALUES (88, 34, 60, 0);
INSERT INTO `favourites` VALUES (89, 69, 61, 0);
INSERT INTO `favourites` VALUES (90, 69, 60, 0);
INSERT INTO `favourites` VALUES (91, 41, 64, 0);
INSERT INTO `favourites` VALUES (92, 41, 63, 0);
INSERT INTO `favourites` VALUES (93, 1, 65, 0);
INSERT INTO `favourites` VALUES (95, 20, 65, 0);
INSERT INTO `favourites` VALUES (96, 33, 65, 1);
INSERT INTO `favourites` VALUES (101, 41, 65, 1);
INSERT INTO `favourites` VALUES (102, 41, 66, 1);
INSERT INTO `favourites` VALUES (103, 41, 67, 1);
INSERT INTO `favourites` VALUES (104, 33, 66, 1);
INSERT INTO `favourites` VALUES (105, 33, 67, 1);
INSERT INTO `favourites` VALUES (106, 41, 68, 0);
INSERT INTO `favourites` VALUES (107, 41, 69, 1);
INSERT INTO `favourites` VALUES (108, 33, 68, 1);
INSERT INTO `favourites` VALUES (109, 33, 69, 1);
INSERT INTO `favourites` VALUES (126, 33, 70, 1);
INSERT INTO `favourites` VALUES (127, 99, 70, 1);
INSERT INTO `favourites` VALUES (128, 99, 72, 1);
INSERT INTO `favourites` VALUES (129, 99, 1, 0);
INSERT INTO `favourites` VALUES (130, 103, 3, 1);
INSERT INTO `favourites` VALUES (131, 99, 9, 1);
INSERT INTO `favourites` VALUES (132, 103, 32, 1);
INSERT INTO `favourites` VALUES (133, 103, 51, 1);
INSERT INTO `favourites` VALUES (134, 99, 51, 1);
INSERT INTO `favourites` VALUES (150, 99, 52, 1);
INSERT INTO `favourites` VALUES (151, 104, 52, 0);
INSERT INTO `favourites` VALUES (152, 104, 59, 0);
INSERT INTO `favourites` VALUES (153, 104, 53, 0);
INSERT INTO `favourites` VALUES (154, 99, 53, 0);
INSERT INTO `favourites` VALUES (155, 103, 61, 0);
INSERT INTO `favourites` VALUES (156, 103, 53, 0);
INSERT INTO `favourites` VALUES (157, 104, 69, 1);

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks`  (
  `FbID` int NOT NULL AUTO_INCREMENT,
  `ProID` int NOT NULL,
  `UserFbID` int NOT NULL,
  `UserSellID` int NOT NULL,
  `FeedBack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Happy` int NOT NULL,
  `Date` datetime NULL DEFAULT NULL,
  `StrDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`FbID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------
INSERT INTO `feedbacks` VALUES (12, 55, 103, 99, 'Bán ok đấy !', 1, '2022-12-14 18:42:49', '2022-12-14 18:42:49');
INSERT INTO `feedbacks` VALUES (13, 60, 103, 99, 'Giao hàng không như thông tin đã giới thiệu', 0, '2022-12-14 18:42:53', '2022-12-14 18:42:53');
INSERT INTO `feedbacks` VALUES (14, 54, 104, 99, 'Bán ok đấy !', 1, '2022-12-14 18:45:27', '14-12-2022 18:45:27');

-- ----------------------------
-- Table structure for groupcategories
-- ----------------------------
DROP TABLE IF EXISTS `groupcategories`;
CREATE TABLE `groupcategories`  (
  `GrCatID` int NOT NULL AUTO_INCREMENT,
  `GrCatName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`GrCatID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupcategories
-- ----------------------------
INSERT INTO `groupcategories` VALUES (15, 'Đồ công nghệ ');
INSERT INTO `groupcategories` VALUES (17, 'Thời trang');
INSERT INTO `groupcategories` VALUES (18, 'Máy game');
INSERT INTO `groupcategories` VALUES (19, 'Dịch vụ');

-- ----------------------------
-- Table structure for listbanks
-- ----------------------------
DROP TABLE IF EXISTS `listbanks`;
CREATE TABLE `listbanks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listbanks
-- ----------------------------
INSERT INTO `listbanks` VALUES (1, 'Agribank');
INSERT INTO `listbanks` VALUES (2, 'VietcomBank');
INSERT INTO `listbanks` VALUES (3, 'BIDV');
INSERT INTO `listbanks` VALUES (4, 'Vietinbank');
INSERT INTO `listbanks` VALUES (5, 'Techcombank');
INSERT INTO `listbanks` VALUES (6, 'HD Bank');
INSERT INTO `listbanks` VALUES (7, 'OCB');
INSERT INTO `listbanks` VALUES (8, 'SCB');
INSERT INTO `listbanks` VALUES (9, 'Sacombank');
INSERT INTO `listbanks` VALUES (10, 'Dong A bank');
INSERT INTO `listbanks` VALUES (11, 'ACB');
INSERT INTO `listbanks` VALUES (12, 'SaigonBank');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int NOT NULL,
  `idUser` int NOT NULL,
  `dateEnd` datetime NULL DEFAULT NULL,
  `price` int NOT NULL,
  `stt` int NULL DEFAULT NULL,
  `idPro` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (62, 'Đã nhận hàng', 0, 103, '2022-12-19 04:06:15', 10200000, 4, 51);
INSERT INTO `notices` VALUES (63, 'Đã nhận hàng', 0, 104, '2022-12-19 05:14:15', 10200000, 4, 54);
INSERT INTO `notices` VALUES (64, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-13 05:58:09', 0, 0, 55);
INSERT INTO `notices` VALUES (65, 'Đã nhận hàng', 0, 103, '2022-12-19 06:01:20', 10200000, 4, 55);
INSERT INTO `notices` VALUES (66, 'Bạn đã mất cộc', 1, 104, '2022-12-12 06:21:11', 8200000, -1, 56);
INSERT INTO `notices` VALUES (67, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-13 17:02:15', 0, 0, 57);
INSERT INTO `notices` VALUES (68, 'Chưa giao hàng', 1, 99, '2022-12-12 17:40:08', 10400000, -2, 57);
INSERT INTO `notices` VALUES (69, 'Người nhận chưa nhận được hàng', 1, 103, '2022-12-12 18:45:02', 10100000, -3, 58);
INSERT INTO `notices` VALUES (70, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-14 14:04:54', 0, 0, 52);
INSERT INTO `notices` VALUES (71, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-14 14:05:08', 0, 0, 52);
INSERT INTO `notices` VALUES (72, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-14 14:05:11', 0, 0, 52);
INSERT INTO `notices` VALUES (73, 'Bạn đã mất cộc', 1, 104, '2022-12-13 15:30:00', 8300000, -1, 59);
INSERT INTO `notices` VALUES (74, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-14 15:38:09', 0, 0, 60);
INSERT INTO `notices` VALUES (75, 'Đã nhận hàng', 0, 103, '2022-12-20 15:38:59', 10200000, 4, 60);
INSERT INTO `notices` VALUES (76, 'Bạn cần giao hàng cho khách', 0, 99, '2022-12-20 15:59:40', 12000000, 2, 52);
INSERT INTO `notices` VALUES (77, 'Bạn cần giao hàng cho khách', 0, 99, '2022-12-20 16:04:10', 10200000, 2, 62);
INSERT INTO `notices` VALUES (78, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-14 16:04:23', 0, 0, 62);
INSERT INTO `notices` VALUES (79, 'Bạn đã trả xong số tiền còn lại', 1, 103, '2022-12-14 16:04:26', 0, 0, 62);
INSERT INTO `notices` VALUES (80, 'Bạn cần giao hàng cho khách', 0, 99, '2022-12-20 16:12:40', 12000000, 2, 52);
INSERT INTO `notices` VALUES (81, 'Bạn cần giao hàng cho khách', 0, 99, '2022-12-20 16:13:11', 12000000, 2, 52);
INSERT INTO `notices` VALUES (82, 'Bạn cần giao hàng cho khách', 0, 99, '2022-12-20 16:14:22', 10200000, 2, 62);
INSERT INTO `notices` VALUES (83, 'Người nhận chưa nhận được hàng', 1, 103, '2022-12-13 16:23:02', 10100000, -3, 63);
INSERT INTO `notices` VALUES (84, 'Bạn cần giao hàng cho khách', 0, 99, '2022-12-20 16:23:23', 10200000, 2, 62);
INSERT INTO `notices` VALUES (85, 'Bạn đã trả xong số tiền còn lại', 1, 104, '2022-12-14 16:49:01', 0, 0, 64);
INSERT INTO `notices` VALUES (86, 'Chưa giao hàng', 1, 99, '2022-12-13 16:53:20', 10100000, -2, 64);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `ProID` int NOT NULL,
  `ProName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StartingPrice` int NOT NULL,
  `CatID` int NOT NULL,
  `TinyDes` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FullDes` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StepPrice` int NOT NULL,
  `HighestPaidPrice` int NOT NULL,
  `EndDay` datetime NULL DEFAULT NULL,
  `UserID` int NOT NULL,
  `Sell` int NOT NULL,
  `CountAuction` int NOT NULL,
  `UserSellID` int NOT NULL,
  `Top` int NOT NULL,
  `Ship` int NOT NULL,
  `Year` int NULL DEFAULT NULL,
  `Month` int NULL DEFAULT NULL,
  `Day` int NULL DEFAULT NULL,
  `Hour` int NULL DEFAULT NULL,
  `Minute` int NULL DEFAULT NULL,
  `Second` int NULL DEFAULT NULL,
  `Delete` int NOT NULL,
  `Paid` int NOT NULL,
  `StrDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  FULLTEXT INDEX `ProName`(`ProName`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Laptop MacBook Pro 14 M1 Pro 2021 8-core CPU/16GB/512GB/14-core GPU (MKGR3SA/A)', 42990000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 500000, 44490000, '2022-12-08 07:59:00', 104, 1, 2, 99, 44490000, 0, 2022, 12, 8, 7, 59, 0, 1, 1, '2022-12-08 07:59:00');
INSERT INTO `products` VALUES (2, 'Laptop Asus TUF Gaming FX506LHB i5 10300H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN188W)', 16690000, 27, 'Nếu bạn đang tìm kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức giá phải chăng thì laptop Asus TUF Gaming FX506LHB i5 (HN188W) sẽ là sự lựa chọn đáng cân nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ cùng phong cách thiết kế cứng cáp, độc đáo.', '• Chạy mượt mà các ứng dụng văn phòng trên Word, Excel, PowerPoint,... đến chiến những con game đình đám nhờ bộ vi xử lý Intel Core i5 10300H kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 4 GB mạnh mẽ.   • Laptop Asus đa nhiệm mượt mà trên nhiều cửa sổ Chrome cùng lúc nhờ bộ nhớ RAM 8 GB, bên cạnh đó còn mang đến tốc độ khởi động máy và ứng dụng nhanh chóng với ổ cứng SSD 512 GB.     • Laptop có kích thước màn hình 15.6 inch cùng tần số quét 144 Hz mang đến những trải nghiệm chiến game cực đỉnh, không bị giật lag hay xé hình khi chơi những tựa game có tốc độ cao.  • Laptop Asus TUF Gaming được bao bọc bởi lớp vỏ nhựa màu đen huyền bí, khối lượng 2.3 kg cho phép bạn chiến game ở mọi không gian.  • Máy được trang bị đèn bàn phím chuyển màu RGB độc đáo, tăng độ hăng hái cho game thủ mỗi khi chiến game.', 200000, 17090000, '2022-12-08 12:35:00', 104, 1, 2, 99, 17090000, 0, 2022, 12, 8, 12, 35, 0, 1, 1, '2022-12-08 12:35:00');
INSERT INTO `products` VALUES (3, 'Laptop HP Pavilion 14 dv0516TU i3 1125G4/4GB/256GB/Win11 (46L88PA) ', 10870000, 27, 'Kiểu dáng thanh lịch của chiếc laptop HP Pavilion 14 dv0516TU i3 1125G4 (46L88PA) cùng hiệu năng ổn định cho mọi tác vụ cơ bản là sự lựa chọn phù hợp cho bất kỳ ai.', '• Bộ vi xử lý Intel Core i3 Tiger Lake 1125G4 cùng card tích hợp Intel UHD Graphics hỗ trợ laptop HP Pavilion thao tác nhanh gọn các công việc văn phòng đơn giản cùng Word, Excel,... hay thiết kế cơ bản trên Canva, Figma,...  • RAM 4 GB và ổ cứng SSD 256 GB cùng hệ điều hành Windows 11 Home SL tân tiến được tích hợp sẵn, nâng cao năng suất cho laptop.  • Với khối lượng 1.41 kg và độ dày 17 mm, laptop HP sở hữu nắp lưng và chiếu nghỉ tay được làm từ kim loại thời thượng, sẵn sàng đồng hành cùng bạn trong mọi chuyến đi.  • Phiên bản laptop học tập - văn phòng trang bị các cổng kết nối như SuperSpeed USB Type-C, 2 cổng SuperSpeed USB A, HDMI và khe đọc thẻ nhớ Micro SD.  • Màn hình 14 inch, tấm nền IPS mang đến cho bạn khung hình rộng mở lên đến 178 độ. Công nghệ Anti Glare và độ sáng màn hình 250 nits hỗ trợ chống chói ở những nơi có điều kiện ánh sáng mạnh.', 200000, 11270000, '2022-12-08 12:10:00', 103, 1, 2, 99, 11270000, 0, 2022, 12, 8, 12, 10, 0, 1, 1, '2022-12-08 12:10:00');
INSERT INTO `products` VALUES (4, 'Điện thoại iPhone 11 64GB', 11690000, 28, 'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó. Nâng cấp mạnh mẽ về camera.', 'Nói về nâng cấp thì camera chính là điểm có nhiều cải tiến nhất trên thế hệ iPhone mới.Theo Apple thì việc chuyển đổi qua lại giữa hai ống kính thì sẽ không làm thay đổi màu sắc của bức ảnh.Đây là một điều được xem là bước ngoặt bởi những chiếc smartphone Android có nhiều camera hiện nay sẽ thường bị sai lệch về màu sắc khi chuyển đổi qua lại giữa các ống kính gây cảm giác khá khó chịu cho người dùng.Theo trải nghiệm thì tính năng này hoạt động rất hiệu quả đặc biệt trong những môi trường cực kỳ thiếu sáng.Năm nay Apple cũng đã nâng cấp độ phân giải camera trước nên 12 MP thay vì 7 MP như thế hệ trước đó.  Camera trước cũng có một tính năng thông minh, khi bạn xoay ngang điện thoại nó sẽ tự kích hoạt chế độ selfie góc rộng để bạn có thể chụp với nhiều người hơn.', 300000, 12290000, '2022-12-08 13:57:00', 104, 1, 2, 99, 12290000, 0, 2022, 12, 8, 13, 57, 0, 1, 1, '2022-12-08 13:57:00');
INSERT INTO `products` VALUES (5, 'Laptop Gaming MSI Katana GF66 11UC 676V', 36000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 500000, 36500000, '2022-12-08 23:50:00', 104, 1, 1, 99, 36500000, 0, 2022, 12, 8, 23, 50, 0, 1, 1, '2022-12-08 23:50:00');
INSERT INTO `products` VALUES (6, 'Laptop Gaming MSI Katana GF66 11UC 676V', 23000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 23200000, '2022-12-09 00:10:00', 103, 1, 2, 99, 23200000, 0, 2022, 12, 9, 0, 10, 0, 1, 1, '2022-12-09 00:10:00');
INSERT INTO `products` VALUES (7, 'Laptop asdhsahdkashdasdsad', 2000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 100000, 2200000, '2022-12-09 00:25:00', 103, 1, 2, 99, 2200000, 0, 2022, 12, 9, 0, 25, 0, 1, 1, '2022-12-09 00:25:00');
INSERT INTO `products` VALUES (8, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 500000, 12000000, '2022-12-09 01:10:00', 103, 1, 2, 99, 12000000, 0, 2022, 12, 9, 1, 10, 0, 1, 0, '2022-12-09 01:10:00');
INSERT INTO `products` VALUES (9, 'Laptop Gaming MSI Katana GF66 11UC 676V', 100000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 10000, 0, '2022-12-09 06:07:00', -1, 1, 0, 99, 100000, 0, 2022, 12, 9, 6, 7, 0, 1, 0, '2022-12-09 06:07:00');
INSERT INTO `products` VALUES (10, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHaRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHaRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 10300000, '2022-12-09 05:30:00', 103, 1, 2, 99, 10300000, 0, 2022, 12, 9, 5, 30, 0, 1, 0, '2022-12-09 05:30:00');
INSERT INTO `products` VALUES (11, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W', 200000, 10200000, '2022-12-10 04:03:00', 103, 1, 1, 99, 10200000, 0, 2022, 12, 10, 4, 3, 0, 1, 1, '2022-12-10 04:03:00');
INSERT INTO `products` VALUES (12, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W', 'rất đẹp', 100000, 10100000, '2022-12-10 04:48:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 10, 4, 48, 0, 1, 1, '2022-12-10 04:48:00');
INSERT INTO `products` VALUES (13, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W', 'rất đẹp', 100000, 10100000, '2022-12-10 10:34:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 10, 10, 34, 0, 1, 0, '2022-12-10 10:34:00');
INSERT INTO `products` VALUES (14, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 0, '2022-12-10 11:38:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 10, 11, 38, 0, 1, 0, '2022-12-10 11:38:00');
INSERT INTO `products` VALUES (15, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 0, '2022-12-10 11:39:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 10, 11, 39, 0, 1, 0, '2022-12-10 11:39:00');
INSERT INTO `products` VALUES (16, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 10100000, '2022-12-10 11:42:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 10, 11, 42, 0, 1, 0, '2022-12-10 11:42:00');
INSERT INTO `products` VALUES (17, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 10100000, '2022-12-10 11:48:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 10, 11, 48, 0, 1, 0, '2022-12-10 11:48:00');
INSERT INTO `products` VALUES (18, 'nón', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10100000, '2022-12-10 11:53:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 10, 11, 53, 0, 1, 0, '2022-12-10 11:53:00');
INSERT INTO `products` VALUES (19, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 10100000, '2022-12-11 02:25:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 11, 2, 25, 0, 1, 0, '2022-12-11 02:25:00');
INSERT INTO `products` VALUES (20, 'setup máy tinh đẹp', 10000000, 27, 'asas', 'rất đẹp', 100000, 10100000, '2022-12-11 02:30:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 11, 2, 30, 0, 1, 0, '2022-12-11 02:30:00');
INSERT INTO `products` VALUES (21, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 100000, 10100000, '2022-12-11 02:39:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 11, 2, 39, 0, 1, 0, '2022-12-11 02:39:00');
INSERT INTO `products` VALUES (22, 'setup máy tinh đẹp', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10100000, '2022-12-11 03:19:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 11, 3, 19, 0, 1, 0, '2022-12-11 03:19:00');
INSERT INTO `products` VALUES (23, 'nón', 10000000, 27, 'đẹp', 'rất đẹp', 100000, 10100000, '2022-12-11 11:55:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 11, 11, 55, 0, 1, 0, '2022-12-11 11:55:00');
INSERT INTO `products` VALUES (24, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10200000, '2022-12-11 12:25:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 12, 25, 0, 1, 0, '2022-12-11 12:25:00');
INSERT INTO `products` VALUES (25, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 0, '2022-12-11 12:30:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 11, 12, 30, 0, 1, 0, '2022-12-11 12:30:00');
INSERT INTO `products` VALUES (26, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 0, '2022-12-11 12:50:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 11, 12, 50, 0, 1, 0, '2022-12-11 12:50:00');
INSERT INTO `products` VALUES (27, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10100000, '2022-12-11 14:55:00', 104, 1, 1, 99, 10100000, 0, 2022, 12, 11, 14, 55, 0, 1, 0, '2022-12-11 14:55:00');
INSERT INTO `products` VALUES (28, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W', 'rất đẹp', 100000, 0, '2022-12-11 16:30:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 11, 16, 30, 0, 1, 0, '2022-12-11 16:30:00');
INSERT INTO `products` VALUES (29, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 0, '2022-12-11 16:40:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 11, 16, 40, 0, 1, 0, '2022-12-11 16:40:00');
INSERT INTO `products` VALUES (30, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10200000, '2022-12-12 16:49:00', 103, 1, 2, 99, 10200000, 0, 2022, 12, 12, 16, 49, 0, 1, 0, '2022-12-12 16:49:00');
INSERT INTO `products` VALUES (31, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'đẹp', 'rất đẹp', 100000, 10300000, '2022-12-11 17:30:00', 104, 1, 2, 99, 10300000, 0, 2022, 12, 11, 17, 30, 0, 1, 0, '2022-12-11 17:30:00');
INSERT INTO `products` VALUES (32, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10300000, '2022-12-12 17:12:00', 103, 1, 2, 99, 10300000, 0, 2022, 12, 12, 17, 12, 0, 1, 0, '2022-12-12 17:12:00');
INSERT INTO `products` VALUES (33, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10200000, '2022-12-12 17:17:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 12, 17, 17, 0, 1, 0, '2022-12-12 17:17:00');
INSERT INTO `products` VALUES (34, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10200000, '2022-12-11 19:08:00', 104, 1, 1, 99, 10200000, 0, 2022, 12, 11, 19, 8, 0, 1, 0, '2022-12-11 19:08:00');
INSERT INTO `products` VALUES (35, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10100000, '2022-12-12 18:17:00', 103, 1, 1, 99, 10100000, 0, 2022, 12, 12, 18, 17, 0, 1, 0, '2022-12-12 18:17:00');
INSERT INTO `products` VALUES (36, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10100000, '2022-12-12 18:23:00', 104, 1, 1, 99, 10100000, 0, 2022, 12, 12, 18, 23, 0, 1, 0, '2022-12-12 18:23:00');
INSERT INTO `products` VALUES (37, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'đẹp', 'rất đẹp', 100000, 10100000, '2022-12-12 18:30:00', 104, 1, 1, 99, 10100000, 0, 2022, 12, 12, 18, 30, 0, 1, 0, '2022-12-12 18:30:00');
INSERT INTO `products` VALUES (38, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'đẹp', 'rất đẹp', 100000, 10200000, '2022-12-11 18:40:00', 103, 1, 2, 99, 10200000, 0, 2022, 12, 11, 18, 40, 0, 1, 0, '2022-12-11 18:40:00');
INSERT INTO `products` VALUES (39, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10200000, '2022-12-11 18:51:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 18, 51, 0, 1, 0, '2022-12-11 18:51:00');
INSERT INTO `products` VALUES (40, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.', 'rất đẹp', 100000, 10200000, '2022-12-11 19:33:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 19, 33, 0, 1, 0, '2022-12-11 19:33:00');
INSERT INTO `products` VALUES (41, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'đẹp', 'rất đẹp', 100000, 10200000, '2022-12-11 19:51:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 19, 51, 0, 1, 0, '2022-12-11 19:51:00');
INSERT INTO `products` VALUES (42, 'Laptop Gaming MSI Katana GF66 11UC 676V', 10000000, 27, 'Laptop gaming ASUS TUF A15 FA506IHRB HN080W', 'rất đẹp', 100000, 10200000, '2022-12-11 20:03:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 20, 3, 0, 1, 0, '2022-12-11 20:03:00');
INSERT INTO `products` VALUES (43, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-11 23:06:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 23, 6, 0, 1, 0, '2022-12-11 23:06:00');
INSERT INTO `products` VALUES (44, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 100000, 10300000, '2022-12-11 23:14:00', 104, 1, 1, 99, 10300000, 0, 2022, 12, 11, 23, 14, 0, 1, 0, '2022-12-11 23:14:00');
INSERT INTO `products` VALUES (45, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 103000000, '2022-12-11 23:25:00', 104, 1, 2, 99, 103000000, 0, 2022, 12, 11, 23, 25, 0, 1, 0, '2022-12-11 23:25:00');
INSERT INTO `products` VALUES (46, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-11 23:45:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 23, 45, 0, 1, 1, '2022-12-11 23:45:00');
INSERT INTO `products` VALUES (47, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-11 23:55:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 11, 23, 55, 0, 1, 0, '2022-12-11 23:55:00');
INSERT INTO `products` VALUES (48, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 100000, 0, '2022-12-11 00:02:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 11, 0, 2, 0, 0, -1, '2022-12-11 00:02:00');
INSERT INTO `products` VALUES (49, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-12 00:05:00', 103, 1, 2, 99, 10200000, 0, 2022, 12, 12, 0, 5, 0, 0, 1, '2022-12-12 00:05:00');
INSERT INTO `products` VALUES (50, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-12 00:25:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 12, 0, 25, 0, 1, 0, '2022-12-12 00:25:00');
INSERT INTO `products` VALUES (51, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-12 04:06:00', 103, 1, 2, 99, 10200000, 2, 2022, 12, 12, 4, 6, 0, 0, 1, '2022-12-12 04:06:00');
INSERT INTO `products` VALUES (52, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 12000000, '2022-12-13 04:35:00', 103, 1, 2, 99, 12000000, 0, 2022, 12, 13, 4, 35, 0, 0, 1, '2022-12-13 04:35:00');
INSERT INTO `products` VALUES (53, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 546545312, '2023-02-12 05:08:00', 103, 0, 2, 99, 546545312, 0, 2023, 2, 12, 5, 8, 0, 1, 0, '2023-02-12 05:08:00');
INSERT INTO `products` VALUES (54, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-12 05:14:00', 104, 1, 2, 99, 10200000, 2, 2022, 12, 12, 5, 14, 0, 0, 1, '2022-12-12 05:14:00');
INSERT INTO `products` VALUES (55, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-12 05:58:00', 103, 1, 2, 99, 10200000, 2, 2022, 12, 12, 5, 58, 0, 0, 1, '2022-12-12 05:58:00');
INSERT INTO `products` VALUES (56, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-12 06:15:00', 104, 1, 2, 99, 10200000, 0, 2022, 12, 12, 6, 15, 0, 0, 0, '2022-12-12 06:15:00');
INSERT INTO `products` VALUES (57, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10400000, '2022-12-12 17:02:00', 103, 1, 2, 99, 10400000, -1, 2022, 12, 12, 17, 2, 0, 0, 1, '2022-12-12 17:02:00');
INSERT INTO `products` VALUES (58, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 0, '2022-12-13 15:22:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 13, 15, 22, 0, 0, -1, '2022-12-13 15:22:00');
INSERT INTO `products` VALUES (59, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10300000, '2022-12-13 15:25:00', 104, 1, 2, 99, 10300000, 0, 2022, 12, 13, 15, 25, 0, 0, 0, '2022-12-13 15:25:00');
INSERT INTO `products` VALUES (60, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-13 15:38:00', 103, 1, 2, 99, 10200000, 2, 2022, 12, 13, 15, 38, 0, 0, 1, '2022-12-13 15:38:00');
INSERT INTO `products` VALUES (61, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 0, '2022-12-20 16:04:00', -1, 0, 0, 99, 10000000, 0, 2022, 12, 20, 16, 4, 0, 0, 0, '2022-12-20 16:04:00');
INSERT INTO `products` VALUES (62, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10200000, '2022-12-13 16:04:00', 103, 1, 2, 99, 10200000, 0, 2022, 12, 13, 16, 4, 0, 0, 1, '2022-12-13 16:04:00');
INSERT INTO `products` VALUES (63, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10100000, '2022-12-13 16:16:00', 103, 1, 1, 99, 10100000, -2, 2022, 12, 13, 16, 16, 0, 0, 1, '2022-12-13 16:16:00');
INSERT INTO `products` VALUES (64, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 10100000, '2022-12-13 16:49:00', 104, 1, 1, 99, 10100000, -1, 2022, 12, 13, 16, 49, 0, 0, 1, '2022-12-13 16:49:00');
INSERT INTO `products` VALUES (65, 'Laptop asdhsahdkashdasdsad', 10000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 0, '2022-12-13 17:04:00', -1, 1, 0, 99, 10000000, 0, 2022, 12, 13, 17, 4, 0, 0, -1, '2022-12-13 17:04:00');
INSERT INTO `products` VALUES (66, '', 15000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 100000, 0, '2022-12-15 20:47:00', -1, 0, 0, 99, 15000000, 0, 2022, 12, 15, 20, 47, 0, 1, 0, '15-12-2022 20:47:00');
INSERT INTO `products` VALUES (67, 'Laptop MacBook Pro 14 M1 Pro 2021 8-core CPU/16GB/512GB/14-core GPU (MKGR3SA/A) ', 25000000, 27, 'Apple đã giới thiệu MacBook Pro 14 inch vào tháng 10/2021, mang một diện mạo mới cùng bộ vi xử lý do hãng tự phát triển, không chỉ cho hiệu năng vượt trội mà còn sở hữu màn hình với khả năng hiển thị thực sự ấn tượng, khiến mình mê mẩn khi cầm trên tay trải nghiệm.', 'MacBook Pro 14 inch mang trong mình bộ vi xử lý M1 Pro được sản xuất bằng tiến trình 5 nm hiện đại, tích hợp 8 lõi CPU với 6 lõi hiệu suất cao và 2 lõi tiết kiệm điện năng, hứa hẹn khả năng xử lý nhanh hơn tới 70% so với CPU của M1, đồng thời giảm điện năng tiêu thụ đáng kể để kéo dài thời lượng pin. M1 Pro sở hữu GPU 14 lõi cho tốc độ xử lý nhanh hơn tới 2 lần so với M1, từ đó mang đến cho mình trải nghiệm sáng tạo đồ hoạ thực sự chuyên nghiệp, vận hành trơn tru các tác vụ khắt khe nhất như chỉnh sửa hình ảnh với độ phân giải cao, render nhiều luồng video 4K cùng lúc trên Photoshop, Illustrator, Premiere,...', 500000, 0, '2022-12-24 20:50:00', -1, 0, 0, 99, 25000000, 0, 2022, 12, 24, 20, 50, 0, 0, 0, '24-12-2022 20:50:00');
INSERT INTO `products` VALUES (68, 'MacBook Air M1 2020 7-core GPU', 32000000, 27, 'Laptop Apple MacBook Air M1 2020 thuộc dòng laptop cao cấp sang trọng có cấu hình mạnh mẽ, chinh phục được các tính năng văn phòng lẫn đồ hoạ mà bạn mong muốn, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn.', 'Laptop Apple MacBook Air M1 2020 thuộc dòng laptop cao cấp sang trọng có cấu hình mạnh mẽ, chinh phục được các tính năng văn phòng lẫn đồ hoạ mà bạn mong muốn, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn. Chip Apple M1 tốc độ xử lý nhanh gấp 3.5 lần thế hệ trước Chiếc MacBook này được trang bị con chip Apple M1 được sản xuất độc quyền bởi Nhà Táo trên tiến trình 5 nm, 8 lõi bao gồm 4 lõi tiết kiệm điện và 4 lõi hiệu suất cao, mang đến một hiệu năng kinh ngạc, xử lý mọi tác vụ văn phòng một cách mượt mà như Word, Excel, Powerpoint,... thực hiện tốt các nhiệm vụ chỉnh sửa hình ảnh, kết xuất 2D trên các phần mềm Photoshop, AI,... máy còn hỗ trợ tiết kiệm được điện năng cao.  Đi cùng CPU là card đồ họa tích hợp 7 nhân GPU có hiệu năng vượt trội sau nhiều bài thử nghiệm hiệu năng đồ họa của benchmark, bạn có thể sử dụng nhiều phần mềm đồ họa chuyên nghiệp, thoả sức sáng tạo nội dung, render video ổn định với chất lượng hình ảnh cao.', 200000, 0, '2022-12-23 20:51:00', -1, 0, 0, 99, 32000000, 0, 2022, 12, 23, 20, 51, 0, 0, 0, '23-12-2022 20:51:00');
INSERT INTO `products` VALUES (69, 'Điện thoại iPhone 11 64GB', 18000000, 28, 'Thông tin sản phẩm Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', 'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó. Nâng cấp mạnh mẽ về camera Nói về nâng cấp thì camera chính là điểm có nhiều cải tiến nhất trên thế hệ iPhone mới.', 300000, 20000000, '2022-12-17 20:52:00', 104, 0, 1, 99, 20000000, 0, 2022, 12, 17, 20, 52, 0, 0, 0, '17-12-2022 20:52:00');
INSERT INTO `products` VALUES (70, 'Điện thoại Samsung Galaxy S22 Ultra 5G 128GB ', 32000000, 28, 'Thông tin sản phẩm Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng.', 'Thông tin sản phẩm Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng. Sở hữu một diện mạo đầy nổi bật Galaxy S22 Ultra 5G được kế thừa form thiết kế từ những dòng Note trước đây của hãng đem đến cho bạn có cảm giác vừa mới lạ vừa hoài niệm. Khối lượng của máy 228 g cho cảm giác cầm nắm đầm tay, khi cầm máy trần thì hơi có cảm giác dễ trượt.', 400000, 0, '2022-12-29 20:54:00', -1, 0, 0, 99, 32000000, 0, 2022, 12, 29, 20, 54, 0, 0, 0, '29-12-2022 20:54:00');
INSERT INTO `products` VALUES (71, 'Điện thoại OPPO Reno8 Pro 5G', 20000000, 28, 'Thông tin sản phẩm OPPO Reno8 Pro 5G là chiếc điện thoại cao cấp được nhà OPPO ra mắt vào thời điểm 09/2022, máy hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng.', 'OPPO Reno8 Pro 5G là chiếc điện thoại cao cấp được nhà OPPO ra mắt vào thời điểm 09/2022, máy hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng. Dáng vẻ cao cấp sang trọng Lần này nhà OPPO mang đến cho chúng ta một chiếc điện thoại có thiết kế đặc biệt, máy sở hữu một diện mạo khác hẳn với những chiếc điện thoại OPPO Reno trước đây, cách thiết kế này đã làm mình liên tưởng đến chiếc OPPO Find X5 Pro được ra mắt trước đó.', 600000, 0, '2022-12-24 20:55:00', -1, 0, 0, 99, 20000000, 0, 2022, 12, 24, 20, 55, 0, 0, 0, '24-12-2022 20:55:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dob` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int NOT NULL,
  `money` int NOT NULL,
  `moneyAu` int NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (99, 'dat333', '$2a$12$8Y1lqB9.xx55E9bKkVInU.KgoOX7sR1XQz9aMn7aCt7YvBn/92M1q', 'Thành Đạt Võ', '19110186@student.hcmute.edu.vn', '2022-09-20', '356/13 Nơ Trang Long', '0792384281', 1, 75600000, 0, '1');
INSERT INTO `users` VALUES (102, 'admin', '$2a$12$vGlM50Fzw7ZOdnLexH71.eMPNbqxGAVriHev4hBpPaiunkbZSrngi', 'Admin', '191101866@student.hcmute.edu.vn', '2001-03-28', 'aaaa', '0792384281', 0, 0, 0, '1');
INSERT INTO `users` VALUES (103, 'nguoimua', '$2a$12$MuSYK3jJIh8ynNeJiFNQYO7eWQ11zayD7ZpyrppugI/T3pSFeQVDq', 'Người mua 01', '191110186@student.hcmute.edu.vn', '2010-08-03', 'aaa', '0792384281', 1, 3600000, 2000000, '1');
INSERT INTO `users` VALUES (104, 'nguoimua02', '$2a$12$TZshXtCGp0nIqR02qTvvVuJR3OGLFrIAlYElIunljd5N21/O0w13O', 'nGUOI', 'vothanhdatbt123@gmail.com', '2022-04-13', '356/13 Nơ Trang Long', '2384281', 1, 108900000, 3600000, '1');
INSERT INTO `users` VALUES (105, 'vothanhdat', '$2a$12$Yv7RqbHqpbB/4JiwdueoXuh3398b9jTnIhfY2NiYE6q1XqVSpFn5K', 'Đạt Võ', '19110186@student.hcmute.edu.vn', '2023-02-24', '356/13 Nơ Trang Long', '2384281', 4, 0, 0, '264578');

-- ----------------------------
-- Event structure for test_01
-- ----------------------------
DROP EVENT IF EXISTS `test_01`;
delimiter ;;
CREATE EVENT `test_01`
ON SCHEDULE
EVERY '1' SECOND STARTS '2022-11-08 10:28:05' ENDS '2022-11-15 10:28:05'
DO UPDATE products SET products.Sell = 1 WHERE CURRENT_TIMESTAMP = products.EndDay
;;
delimiter ;

-- ----------------------------
-- Event structure for test_02
-- ----------------------------
DROP EVENT IF EXISTS `test_02`;
delimiter ;;
CREATE EVENT `test_02`
ON SCHEDULE
EVERY '1' SECOND STARTS '2022-12-11 23:45:26' ENDS '2022-12-18 23:45:26'
DO UPDATE products SET products.Sell = 1 WHERE CURRENT_TIMESTAMP >= products.EndDay
;;
delimiter ;

-- ----------------------------
-- Event structure for test_03
-- ----------------------------
DROP EVENT IF EXISTS `test_03`;
delimiter ;;
CREATE EVENT `test_03`
ON SCHEDULE
EVERY '1' SECOND STARTS '2022-12-08 15:00:17' ENDS '2022-12-15 15:00:17'
DO UPDATE notices SET notices.type = 1 WHERE CURRENT_TIMESTAMP >= notices.dateEnd
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
