/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.26 : Database - book
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `book`;

/*Table structure for table `t_book` */

DROP TABLE IF EXISTS `t_book`;

CREATE TABLE `t_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `sales` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `img_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_book` */

insert  into `t_book`(`id`,`name`,`price`,`author`,`sales`,`stock`,`img_path`) values (1,'皮囊','99.00','蔡崇达',16,99,'static/uploads/pinang.jpg'),(2,'看见','79.00','柴静',11,49,'static/uploads/kanjian.jpg'),(3,'为奴十二年','99.00','鸠摩智',15,100,'static/uploads/weinushiernian.jpg'),(4,'悟空传','99.00','唐僧',15,100,'static/uploads/wukongzhuan.jpg'),(5,'小王子','99.00','周星驰',15,100,'static/uploads/xiaowangzi.jpg'),(6,'硬派健身','99.00','阿朱',15,100,'static/uploads/yingpaijianshen.jpg'),(7,'中国哲学史','99.00','冯友兰',15,100,'static/uploads/zhongguozhexueshi.jpg'),(8,'书','12.00','不知道',12,13,'static/img/default.jpg');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `order_id` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_order` */

insert  into `t_order`(`order_id`,`create_time`,`price`,`status`,`user_id`) values ('16521837734831','2022-05-10 19:56:13','178.00',2,1);

/*Table structure for table `t_order_item` */

DROP TABLE IF EXISTS `t_order_item`;

CREATE TABLE `t_order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `total_price` decimal(11,2) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `t_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_order_item` */

insert  into `t_order_item`(`id`,`name`,`count`,`price`,`total_price`,`order_id`) values (1,'皮囊',1,'99.00','99.00','16521837734831'),(2,'看见',1,'79.00','79.00','16521837734831');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`email`) values (1,'admin','admin','jack@163.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
