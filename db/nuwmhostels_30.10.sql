/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : nuwmhostels

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-10-30 20:49:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `hostels`
-- ----------------------------
DROP TABLE IF EXISTS `hostels`;
CREATE TABLE `hostels` (
  `Id_hostel` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_manager` int(11) unsigned DEFAULT NULL,
  `number` int(2) unsigned NOT NULL DEFAULT 0,
  `adress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_hostel`),
  KEY `managers` (`Id_manager`),
  CONSTRAINT `managers` FOREIGN KEY (`Id_manager`) REFERENCES `managers` (`Id_manager`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hostels
-- ----------------------------
INSERT INTO `hostels` VALUES ('1', '1', '1', 'вул. Чорновола, 51');
INSERT INTO `hostels` VALUES ('2', '2', '2', 'вул. Чорновола, 55');
INSERT INTO `hostels` VALUES ('3', '3', '3', 'вул. Мірющенка, 62');
INSERT INTO `hostels` VALUES ('4', '4', '4', 'вул. Мірющенка, 60 ');
INSERT INTO `hostels` VALUES ('5', '5', '5', 'вул. Волинська, 24');
INSERT INTO `hostels` VALUES ('6', '6', '6', 'вул. Чорновола, 53');
INSERT INTO `hostels` VALUES ('7', '1', '7', '1');
INSERT INTO `hostels` VALUES ('8', '6', '10', '6666');
INSERT INTO `hostels` VALUES ('10', '1', '11', '');

-- ----------------------------
-- Table structure for `instruction_safety`
-- ----------------------------
DROP TABLE IF EXISTS `instruction_safety`;
CREATE TABLE `instruction_safety` (
  `Id_instruction` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_manager` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type_instruction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_instruction`),
  KEY `managerss` (`Id_manager`),
  CONSTRAINT `managerss` FOREIGN KEY (`Id_manager`) REFERENCES `managers` (`Id_manager`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of instruction_safety
-- ----------------------------
INSERT INTO `instruction_safety` VALUES ('1', '1', '2020-08-30', 'первинний');
INSERT INTO `instruction_safety` VALUES ('2', '2', '2020-08-29', 'первинний');
INSERT INTO `instruction_safety` VALUES ('3', '3', '2020-09-01', 'первинний');
INSERT INTO `instruction_safety` VALUES ('4', '4', '2020-08-30', 'первинний');
INSERT INTO `instruction_safety` VALUES ('5', '5', '2020-08-30', 'первинний');
INSERT INTO `instruction_safety` VALUES ('6', '6', '2020-09-01', 'первинний');
INSERT INTO `instruction_safety` VALUES ('7', '1', '2021-02-28', 'повторний');
INSERT INTO `instruction_safety` VALUES ('8', '2', '2021-02-27', 'повторний');
INSERT INTO `instruction_safety` VALUES ('9', '3', '2021-03-01', 'повторний');
INSERT INTO `instruction_safety` VALUES ('10', '4', '2021-03-05', 'повторний');
INSERT INTO `instruction_safety` VALUES ('11', '5', '2021-02-25', 'повторний');
INSERT INTO `instruction_safety` VALUES ('12', '6', '2021-02-25', 'повторний');
INSERT INTO `instruction_safety` VALUES ('13', '2', '2022-10-17', 'Первинний');
INSERT INTO `instruction_safety` VALUES ('14', '2', '2022-10-17', 'Первинний');

-- ----------------------------
-- Table structure for `managers`
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `Id_manager` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pib` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `parol` varchar(255) NOT NULL DEFAULT '',
  `prava` varchar(255) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`Id_manager`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of managers
-- ----------------------------
INSERT INTO `managers` VALUES ('1', 'Цімох Марія Карлівна', '0978866502', 'karlivna.manager@nuwm.edu.ua', '1', 'admin');
INSERT INTO `managers` VALUES ('2', 'Шарабура Людмила Миколаївна', '0978866740', 'sharabura.manager@nuwm.edu.ua', '2', 'admin');
INSERT INTO `managers` VALUES ('3', 'Черній Світлана Іванівна', '0738086674', 'chernii.manager@nuwm.edu.ua', '3', 'admin');
INSERT INTO `managers` VALUES ('4', 'Попельницька Галина Миколаївна', '0678563241', 'popelnytska.manager@nuwm.edu.ua', '4', 'admin');
INSERT INTO `managers` VALUES ('5', 'Якимів Ярослава Степанівна', '0671563248', 'yakymiv.manager@nuwm.edu.ua', '5', 'admin');
INSERT INTO `managers` VALUES ('6', 'Чемакіна Ольга Василівна', '0978563214', 'chemakina.manager@nuwm.edu.ua', '6', 'admin');
INSERT INTO `managers` VALUES ('7', 'ПІБ', '123123', 'Е-ее', '7', 'admin');

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `Id_payment` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_student` int(11) unsigned DEFAULT NULL,
  `date_payment` date DEFAULT NULL,
  `amount` float(6,0) DEFAULT NULL,
  `appointment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_payment`),
  KEY `payment` (`Id_student`),
  CONSTRAINT `payment` FOREIGN KEY (`Id_student`) REFERENCES `students` (`Id_student`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', '1', '2020-08-31', '7080', 'оплата за рік');
INSERT INTO `payment` VALUES ('2', '2', '2020-08-30', '3540', 'оплата за півроку');
INSERT INTO `payment` VALUES ('3', '3', '2020-08-30', '590', 'оплата за вересень');
INSERT INTO `payment` VALUES ('4', '4', '2020-08-31', '3540', 'оплата за півроку');
INSERT INTO `payment` VALUES ('5', '5', '2020-08-25', '7080', 'оплата за рік');
INSERT INTO `payment` VALUES ('6', '6', '2020-08-27', '590', 'оплата за вересень');
INSERT INTO `payment` VALUES ('7', '3', '2020-09-30', '590', 'оплата за жовтень');
INSERT INTO `payment` VALUES ('8', '6', '2020-09-27', '590', 'оплата за жовтень');
INSERT INTO `payment` VALUES ('9', '7', '2020-09-30', '200', 'майнове відшкодування');

-- ----------------------------
-- Table structure for `profit`
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit` (
  `Id_profit` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_student` int(11) unsigned DEFAULT NULL,
  `date_profit` date DEFAULT NULL,
  `amount` float(6,0) DEFAULT NULL,
  `type_profit` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_profit`),
  KEY `profit` (`Id_student`),
  CONSTRAINT `profit` FOREIGN KEY (`Id_student`) REFERENCES `students` (`Id_student`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of profit
-- ----------------------------
INSERT INTO `profit` VALUES ('1', '1', '2020-08-31', '7080', 'проживання');
INSERT INTO `profit` VALUES ('2', '2', '2020-08-30', '3540', 'проживання');
INSERT INTO `profit` VALUES ('3', '3', '2020-08-30', '590', 'проживання');
INSERT INTO `profit` VALUES ('4', '4', '2020-08-31', '3540', 'проживання');
INSERT INTO `profit` VALUES ('5', '1', '2022-10-04', '6000', 'ремонт');
INSERT INTO `profit` VALUES ('8', '1', '2022-10-05', '30000', 'ремонт');

-- ----------------------------
-- Table structure for `rooms`
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `Id_room` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_hostel` int(11) unsigned DEFAULT NULL,
  `number_room` varchar(10) DEFAULT NULL,
  `number_seats` int(11) unsigned DEFAULT NULL,
  `characteristic` varchar(255) DEFAULT NULL,
  `date_last_repair` date DEFAULT NULL,
  PRIMARY KEY (`Id_room`),
  KEY `hostels` (`Id_hostel`),
  CONSTRAINT `hostels` FOREIGN KEY (`Id_hostel`) REFERENCES `hostels` (`Id_hostel`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES ('1', '1', '1101', '3', '3 ліжка, 2 столи, 3 стільця', '2020-08-29');
INSERT INTO `rooms` VALUES ('2', '1', '1102', '3', '3 ліжка, 1 стіл, 3 стільця', '2019-08-30');
INSERT INTO `rooms` VALUES ('3', '1', '1103', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2017-08-17');
INSERT INTO `rooms` VALUES ('4', '1', '1201', '3', '3 ліжка, 2 столи, 3 стільця', '2020-08-29');
INSERT INTO `rooms` VALUES ('5', '1', '1202', '3', '3 ліжка, 1 стіл, 3 стільця', '2019-08-27');
INSERT INTO `rooms` VALUES ('6', '10', '6', '5', '3 ліжка, 1 стіл, 3 стільця,поличка aaaa', '2022-08-31');
INSERT INTO `rooms` VALUES ('7', '2', '2101', '3', '3 ліжка, 1 стіл, 3 стільця', '2018-09-02');
INSERT INTO `rooms` VALUES ('8', '2', '2102', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2020-08-01');
INSERT INTO `rooms` VALUES ('9', '2', '2103', '3', '3 ліжка, 2 столи, 3 стільця', '2019-09-02');
INSERT INTO `rooms` VALUES ('10', '2', '2201', '3', '3 ліжка, 2 столи, 3 стільця', '2019-08-27');
INSERT INTO `rooms` VALUES ('11', '2', '2202', '3', '3 ліжка, 1 стіл, 3 стільця', '2020-08-17');
INSERT INTO `rooms` VALUES ('12', '2', '2203', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2019-08-04');
INSERT INTO `rooms` VALUES ('13', '3', '3101', '3', '3 ліжка, 1 стіл, 3 стільця', '2019-08-28');
INSERT INTO `rooms` VALUES ('14', '3', '3102', '3', '3 ліжка, 1 стіл, 3 стільця', '2020-08-28');
INSERT INTO `rooms` VALUES ('15', '3', '3201', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2019-08-01');
INSERT INTO `rooms` VALUES ('16', '3', '3202', '3', '3 ліжка, 2 столи, 3 стільця', '2018-09-03');
INSERT INTO `rooms` VALUES ('17', '4', '4101', '3', '3 ліжка, 2 столи, 3 стільця', '2017-09-01');
INSERT INTO `rooms` VALUES ('18', '4', '4102', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2019-08-28');
INSERT INTO `rooms` VALUES ('19', '4', '4201', '3', '3 ліжка, 2 столи, 3 стільця', '2020-07-30');
INSERT INTO `rooms` VALUES ('20', '4', '4202', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2015-07-26');
INSERT INTO `rooms` VALUES ('21', '5', '5101', '3', '3 ліжка, 2 столи, 3 стільця', '2019-08-21');
INSERT INTO `rooms` VALUES ('22', '5', '5102', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2020-09-11');
INSERT INTO `rooms` VALUES ('23', '5', '5201', '3', '3 ліжка, 1 стіл, 3 стільця', '2020-09-18');
INSERT INTO `rooms` VALUES ('24', '5', '5202', '3', '3 ліжка, 1 стіл, 3 стільця,поличка', '2019-08-15');
INSERT INTO `rooms` VALUES ('25', '6', '6101', '4', '4 ліжка, 1 стіл, 3 стільця,поличка', '2018-08-14');
INSERT INTO `rooms` VALUES ('26', '6', '6102', '4', '3 ліжка, 1 стіл, 4 стільця,поличка', '2018-07-29');
INSERT INTO `rooms` VALUES ('27', '6', '6201', '4', '4 ліжка, 2 стіл, 3 стільця', '2016-09-01');
INSERT INTO `rooms` VALUES ('28', '6', '6202', '4', '4 ліжка, 1 стіл, 3 стільця,поличка', '2015-08-02');
INSERT INTO `rooms` VALUES ('30', '4', '111', '511', '-1', '2022-08-29');

-- ----------------------------
-- Table structure for `specialties`
-- ----------------------------
DROP TABLE IF EXISTS `specialties`;
CREATE TABLE `specialties` (
  `Id_specialty` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_specialty` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_specialty`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of specialties
-- ----------------------------
INSERT INTO `specialties` VALUES ('1', '051', 'Економіка');
INSERT INTO `specialties` VALUES ('2', '061', 'Журналістика');
INSERT INTO `specialties` VALUES ('3', '073', 'Менеджмент');
INSERT INTO `specialties` VALUES ('4', '075', 'Маркетинг');
INSERT INTO `specialties` VALUES ('5', '081', 'Право');
INSERT INTO `specialties` VALUES ('6', '101', 'Екологія');
INSERT INTO `specialties` VALUES ('7', '113', 'Прикладна математика');
INSERT INTO `specialties` VALUES ('9', '122', 'Комп\'ютерні науки');
INSERT INTO `specialties` VALUES ('10', '123', 'Компютерна інженерія');
INSERT INTO `specialties` VALUES ('11', '126', 'Інформаційні системи та технології');
INSERT INTO `specialties` VALUES ('12', '133', 'Галузеве машинобудування');
INSERT INTO `specialties` VALUES ('13', '141', 'Електроенергетика, електротехніка та електромеханіка');
INSERT INTO `specialties` VALUES ('14', '144', 'Теплоенергетика');
INSERT INTO `specialties` VALUES ('15', '151', 'Автоматизація та комп\'ютерно-інтегровані технології');
INSERT INTO `specialties` VALUES ('16', '171', 'Електроніка');
INSERT INTO `specialties` VALUES ('17', '184', 'Гірництво');
INSERT INTO `specialties` VALUES ('18', '227', 'Фізична терапія, ерготерапія');
INSERT INTO `specialties` VALUES ('19', '281', 'Публічне управління та адміністрування');
INSERT INTO `specialties` VALUES ('21', '015', 'Спеціальність');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `Id_student` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_room` int(11) unsigned DEFAULT NULL,
  `Id_specialty` int(11) unsigned DEFAULT NULL,
  `pib` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `foreigner` tinyint(1) DEFAULT NULL,
  `year_entry` varchar(4) DEFAULT NULL,
  `date_leave` date DEFAULT NULL,
  PRIMARY KEY (`Id_student`),
  KEY `specialty` (`Id_specialty`),
  KEY `rooms` (`Id_room`),
  CONSTRAINT `rooms` FOREIGN KEY (`Id_room`) REFERENCES `rooms` (`Id_room`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `specialty` FOREIGN KEY (`Id_specialty`) REFERENCES `specialties` (`Id_specialty`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', '1', '14', 'Мороченець  Петро Дмитрович', '0654789214', 'mischenko_bg17.nuwm.edu.ua', 'м. Нетішин вул. Соборна 31', '0', '2017', '2022-12-25');
INSERT INTO `students` VALUES ('2', '1', '14', 'Оніщук Олександр Леонідович', '0974789214', 'onischyk_bg17.nuwm.edu.ua', 'м. Славута вул. Київська 2', '0', '2017', '2022-10-02');
INSERT INTO `students` VALUES ('3', '1', '14', 'Петренко Леонід Володимирович', '0970789211', 'petrenko_bg17.nuwm.edu.ua', 'с. Білка вул. Спортивна 89', '0', '2017', '2022-10-02');
INSERT INTO `students` VALUES ('4', '2', '14', 'Дерун Олена Миколаївна', '0678541258', 'deryn_bg20.nuwm.edu.ua', 'м. Здолбунів вул. Миру 45', '0', '2020', '2022-12-24');
INSERT INTO `students` VALUES ('5', '2', '14', 'Змій Лариса Василівна', '0678541295', 'zmii_bg19.nuwm.edu.ua', 'м. Здолбунів вул. Дерев\'яна 31', '0', '2019', null);
INSERT INTO `students` VALUES ('6', '7', '1', 'Тагаєв Тагай Тигранович', '0987452143', 'tagaev_em18.nuwm.edu.ua', 'м. Стамбул ', '1', '2018', null);
INSERT INTO `students` VALUES ('7', '7', '1', 'Саргсян Михаель Мухамедович', '0963257400', 'sargsyan_em19.nuwm.edu.ua', 'м. Стамбул ', '1', '2017', null);
INSERT INTO `students` VALUES ('8', '8', '3', 'Кривко Ірина Федорівна', '0678514589', 'kruvko_em19.nuwm.edu.ua', 'c. Нетреба вул. Перемоги 4', '0', '2019', null);
INSERT INTO `students` VALUES ('9', '8', '4', 'Рівна Діана Тимофіївна', '0731102258', 'rivna_em17.nuwm.edu.ua', 'м. Львів вул. Нова 56', '0', '2017', null);
INSERT INTO `students` VALUES ('10', null, '1', null, null, 'holovko@ukr.net', 'klkjl', '0', '2020', '2022-10-04');
INSERT INTO `students` VALUES ('11', '1', '1', 'Наконечна Ю.А. ', '123123', 'email@mail', '1', '0', '2020', '2022-10-20');
INSERT INTO `students` VALUES ('12', '1', '2', 'Наконечна Ю.А. ', '123', 'email@mail', 'klkjl', null, '2020', '2022-10-21');

-- ----------------------------
-- Table structure for `students_instruction`
-- ----------------------------
DROP TABLE IF EXISTS `students_instruction`;
CREATE TABLE `students_instruction` (
  `Id_st_instruction` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_instruction` int(11) unsigned DEFAULT NULL,
  `Id_student` int(11) unsigned DEFAULT NULL,
  `additionally` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_st_instruction`),
  KEY `instruction` (`Id_instruction`),
  KEY `srudents` (`Id_student`),
  CONSTRAINT `instruction` FOREIGN KEY (`Id_instruction`) REFERENCES `instruction_safety` (`Id_instruction`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `srudents` FOREIGN KEY (`Id_student`) REFERENCES `students` (`Id_student`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of students_instruction
-- ----------------------------
INSERT INTO `students_instruction` VALUES ('1', '1', '1', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('2', '1', '2', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('3', '1', '3', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('4', '1', '4', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('5', '1', '5', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('6', '2', '6', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('7', '2', '7', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('8', '2', '10', '');
INSERT INTO `students_instruction` VALUES ('9', '1', '7', 'проінструктований');
INSERT INTO `students_instruction` VALUES ('12', '1', '4', 'проінструктований');

-- ----------------------------
-- Table structure for `visiting`
-- ----------------------------
DROP TABLE IF EXISTS `visiting`;
CREATE TABLE `visiting` (
  `Id_visiting` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_student` int(11) unsigned DEFAULT NULL,
  `data_visitor` varchar(100) DEFAULT NULL,
  `time_e` datetime DEFAULT NULL,
  `exit_entrance` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`Id_visiting`),
  KEY `students` (`Id_student`),
  CONSTRAINT `students` FOREIGN KEY (`Id_student`) REFERENCES `students` (`Id_student`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of visiting
-- ----------------------------
INSERT INTO `visiting` VALUES ('1', '1', null, '2021-02-01 10:20:56', '1');
INSERT INTO `visiting` VALUES ('2', '2', null, '2021-02-01 09:00:56', '1');
INSERT INTO `visiting` VALUES ('3', null, 'Електрик Олександр', '2021-02-01 08:00:00', '1');
INSERT INTO `visiting` VALUES ('4', '3', null, '2021-02-01 16:00:00', '0');
INSERT INTO `visiting` VALUES ('5', '4', null, '2021-03-04 13:24:13', '0');
INSERT INTO `visiting` VALUES ('6', null, 'Сантехнік Петро', '2021-04-08 18:26:15', '0');
INSERT INTO `visiting` VALUES ('7', '1', null, '2021-04-14 13:26:50', '0');
INSERT INTO `visiting` VALUES ('8', '7', null, '2021-04-15 01:57:29', '1');
INSERT INTO `visiting` VALUES ('9', '5', null, '2021-04-18 14:28:01', '1');
INSERT INTO `visiting` VALUES ('10', '1', '', '2022-10-16 15:50:00', '1');
INSERT INTO `visiting` VALUES ('11', '1', 'u', '2022-10-16 15:50:00', '0');
INSERT INTO `visiting` VALUES ('12', null, 'u', '2022-10-16 15:51:00', '0');
INSERT INTO `visiting` VALUES ('14', null, 'sbdjc kjndknc', '2022-10-16 15:53:00', '1');
INSERT INTO `visiting` VALUES ('16', null, 'сантехнік', '2022-10-16 18:19:08', null);
INSERT INTO `visiting` VALUES ('17', null, 'сантехнік Bohdan', '2022-10-17 18:27:07', null);
INSERT INTO `visiting` VALUES ('18', null, 'економка Юля', '2022-10-18 17:46:42', null);
INSERT INTO `visiting` VALUES ('19', null, 'електрик Федот', '2022-10-18 17:49:37', null);
INSERT INTO `visiting` VALUES ('20', null, 'сантехнік Іван', '2022-10-18 17:54:50', '1');
INSERT INTO `visiting` VALUES ('21', null, 'прибиральниця Дарина', '2022-10-18 17:55:09', '0');
INSERT INTO `visiting` VALUES ('22', '1', '', '2022-10-18 04:56:54', '1');
INSERT INTO `visiting` VALUES ('23', '1', '', '2022-10-18 17:57:08', '0');
INSERT INTO `visiting` VALUES ('24', '1', '', '2022-10-18 17:57:43', '1');
INSERT INTO `visiting` VALUES ('25', '2', '', '2022-10-18 03:57:55', '0');
INSERT INTO `visiting` VALUES ('28', null, 'електрик Федот', '2022-10-29 09:01:58', '1');
