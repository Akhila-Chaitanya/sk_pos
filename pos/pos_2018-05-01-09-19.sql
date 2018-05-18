-- MySQL dump 10.13  Distrib 5.7.11, for Win32 (AMD64)
--
-- Host: localhost    Database: pos
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ospos_app_config`
--

DROP TABLE IF EXISTS `ospos_app_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_app_config`
--

LOCK TABLES `ospos_app_config` WRITE;
/*!40000 ALTER TABLE `ospos_app_config` DISABLE KEYS */;
INSERT INTO `ospos_app_config` VALUES ('address','Main Road, Aswapuram'),('barcode_content','number'),('barcode_first_row','company_name'),('barcode_font','Arial.ttf'),('barcode_font_size','10'),('barcode_formats','[\"SAIKRP\"]'),('barcode_generate_if_empty','1'),('barcode_height','50'),('barcode_num_in_row','2'),('barcode_page_cellspacing','20'),('barcode_page_width','100'),('barcode_quality','100'),('barcode_second_row','item_code'),('barcode_third_row','unit_price'),('barcode_type','Code39'),('barcode_width','250'),('cash_decimals','2'),('cash_rounding_code','1'),('client_id','33f2384a-73ae-4b9d-a5f0-cd0d2d35d834'),('company','Sai Krupa Super Market'),('company_logo',''),('country_codes','en'),('currency_decimals','2'),('currency_symbol','₹'),('custom10_name',''),('custom1_name','Discount'),('custom2_name','Expiry'),('custom3_name','MRP'),('custom4_name',''),('custom5_name',''),('custom6_name',''),('custom7_name',''),('custom8_name',''),('custom9_name',''),('customer_reward_enable','1'),('customer_sales_tax_support','0'),('dateformat','d/m/Y'),('date_or_time_format','date_or_time_format'),('default_origin_tax_code',''),('default_register_mode','sale'),('default_sales_discount','0'),('default_tax_1_name',''),('default_tax_1_rate',''),('default_tax_2_name',''),('default_tax_2_rate',''),('default_tax_category','Standard'),('default_tax_rate','8'),('dinner_table_enable','0'),('email','sales@saikrupasupermarket.in'),('fax',''),('financial_year','4'),('gcaptcha_enable','0'),('gcaptcha_secret_key',''),('gcaptcha_site_key',''),('giftcard_number','series'),('invoice_default_comments','This is a default comment'),('invoice_email_message','Dear {CU}, In attachment the receipt for sale $INV'),('invoice_enable','1'),('language','english'),('language_code','en-GB'),('last_used_invoice_number','0'),('last_used_quote_number','0'),('lines_per_page','30'),('line_sequence','0'),('mailpath','/usr/sbin/sendmail'),('msg_msg',''),('msg_pwd',''),('msg_src',''),('msg_uid',''),('notify_horizontal_position','center'),('notify_vertical_position','bottom'),('number_locale','en_IN'),('payment_options_order','cashdebitcredit'),('phone','+91-9948726009'),('print_bottom_margin','0'),('print_footer','0'),('print_header','0'),('print_left_margin','0'),('print_right_margin','0'),('print_silently','1'),('print_top_margin','0'),('protocol','mail'),('quantity_decimals','0'),('receipt_font_size','12'),('receipt_show_company_name','1'),('receipt_show_description','1'),('receipt_show_serialnumber','1'),('receipt_show_taxes','0'),('receipt_show_total_discount','1'),('receipt_template','receipt_default'),('receiving_calculate_average_price','0'),('recv_invoice_format','{CO}'),('return_policy','One Day Return'),('sales_invoice_format','{CO}'),('sales_quote_format','Q%y{QSEQ:6}'),('smtp_crypto','ssl'),('smtp_host',''),('smtp_pass',''),('smtp_port','465'),('smtp_timeout','5'),('smtp_user',''),('statistics','1'),('tax_decimals','2'),('tax_included','1'),('theme','flatly'),('thousands_separator','thousands_separator'),('timeformat','h:i:s A'),('timezone','Asia/Kolkata'),('website','');
/*!40000 ALTER TABLE `ospos_app_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers`
--

DROP TABLE IF EXISTS `ospos_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `sales_tax_code` varchar(32) NOT NULL DEFAULT '1',
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers`
--

LOCK TABLES `ospos_customers` WRITE;
/*!40000 ALTER TABLE `ospos_customers` DISABLE KEYS */;
INSERT INTO `ospos_customers` VALUES (100000002,NULL,NULL,1,'',0.00,2,723,0,2,1,'2018-04-19 17:52:21');
/*!40000 ALTER TABLE `ospos_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers_packages`
--

DROP TABLE IF EXISTS `ospos_customers_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_customers_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers_packages`
--

LOCK TABLES `ospos_customers_packages` WRITE;
/*!40000 ALTER TABLE `ospos_customers_packages` DISABLE KEYS */;
INSERT INTO `ospos_customers_packages` VALUES (1,'Default',0,0,-1,0,'2018-04-13 01:21:38'),(2,'Bronze',10,0,-1,0,'2018-04-13 01:21:38'),(3,'Silver',20,0,-1,0,'2018-04-13 01:21:38'),(4,'Gold',30,0,-1,0,'2018-04-13 01:21:38'),(5,'Premium',50,0,-1,0,'2018-04-13 01:21:38');
/*!40000 ALTER TABLE `ospos_customers_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers_points`
--

DROP TABLE IF EXISTS `ospos_customers_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_customers_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `package_id` (`package_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  CONSTRAINT `ospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers_points`
--

LOCK TABLES `ospos_customers_points` WRITE;
/*!40000 ALTER TABLE `ospos_customers_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_customers_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_dinner_tables`
--

DROP TABLE IF EXISTS `ospos_dinner_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dinner_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_dinner_tables`
--

LOCK TABLES `ospos_dinner_tables` WRITE;
/*!40000 ALTER TABLE `ospos_dinner_tables` DISABLE KEYS */;
INSERT INTO `ospos_dinner_tables` VALUES (1,'Delivery',0,0,-1,0,'2018-04-13 01:21:38'),(2,'Take Away',0,0,-1,0,'2018-04-13 01:21:38');
/*!40000 ALTER TABLE `ospos_dinner_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_employees`
--

DROP TABLE IF EXISTS `ospos_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `hash_version` int(1) NOT NULL DEFAULT '2',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_employees`
--

LOCK TABLES `ospos_employees` WRITE;
/*!40000 ALTER TABLE `ospos_employees` DISABLE KEYS */;
INSERT INTO `ospos_employees` VALUES ('admin','$2y$10$M4j4.dZto2jM2vlUyeY7wersmFY9IPL2kYP7Dg6pa34CgnEwWpuju',1,0,2,-1,0,'2018-04-13 01:21:38');
/*!40000 ALTER TABLE `ospos_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_giftcards`
--

DROP TABLE IF EXISTS `ospos_giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_giftcards`
--

LOCK TABLES `ospos_giftcards` WRITE;
/*!40000 ALTER TABLE `ospos_giftcards` DISABLE KEYS */;
INSERT INTO `ospos_giftcards` VALUES ('2018-04-15 12:41:41',1,'12315',20.00,0,100000002,1,0,'2018-04-15 12:41:41');
/*!40000 ALTER TABLE `ospos_giftcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_grants`
--

DROP TABLE IF EXISTS `ospos_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_grants`
--

LOCK TABLES `ospos_grants` WRITE;
/*!40000 ALTER TABLE `ospos_grants` DISABLE KEYS */;
INSERT INTO `ospos_grants` VALUES ('config',1),('customers',1),('employees',1),('giftcards',1),('items',1),('items_Aswapuram',1),('items_Colony',1),('items_stock',1),('item_kits',1),('messages',1),('migrate',1),('receivings',1),('receivings_Aswapuram',1),('receivings_Colony',1),('receivings_stock',1),('reports',1),('reports_categories',1),('reports_customers',1),('reports_discounts',1),('reports_employees',1),('reports_inventory',1),('reports_items',1),('reports_payments',1),('reports_receivings',1),('reports_sales',1),('reports_suppliers',1),('reports_taxes',1),('sales',1),('sales_Aswapuram',1),('sales_Colony',1),('sales_stock',1),('suppliers',1),('taxes',1);
/*!40000 ALTER TABLE `ospos_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_inventory`
--

DROP TABLE IF EXISTS `ospos_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT '0.000',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000631 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_inventory`
--

LOCK TABLES `ospos_inventory` WRITE;
/*!40000 ALTER TABLE `ospos_inventory` DISABLE KEYS */;
INSERT INTO `ospos_inventory` VALUES (100000001,100000001,1,'2018-04-13 01:25:06','Manual Edit of Quantity',2,0.000,1,1,'2018-04-13 01:25:31'),(100000011,100000001,1,'2018-04-13 01:25:06','Manual Edit of Quantity',3,0.000,1,2,'2018-04-13 01:25:31'),(100000021,100000001,1,'2018-04-13 01:25:06','Manual Edit of Quantity',1,0.000,1,3,'2018-04-13 01:25:31'),(100000022,100000001,1,'2018-04-13 01:29:16','Manual Edit of Quantity',1,0.000,2,1,'2018-04-13 01:29:27'),(100000032,100000001,1,'2018-04-13 01:29:16','Manual Edit of Quantity',2,10.000,2,2,'2018-04-13 01:29:27'),(100000042,100000001,1,'2018-04-13 01:29:16','Manual Edit of Quantity',3,0.000,2,3,'2018-04-13 01:29:28'),(100000052,100000001,1,'2018-04-13 01:30:46','POS 100000002',2,-2.000,2,4,'2018-04-13 01:31:34'),(100000062,100000001,1,'2018-04-13 01:35:36','RECV 100000002',1,1.000,2,5,'2018-04-13 01:36:20'),(100000072,100000001,1,'2018-04-13 01:35:36','RECV 100000002',2,-1.000,2,6,'2018-04-13 01:36:20'),(100000082,100000001,1,'2018-04-13 02:14:00','POS 100000012',2,-2.000,2,7,'2018-04-13 02:14:16'),(100000091,100000001,1,'2018-04-14 02:09:02','RECV 100000011',2,10.000,1,0,'0000-00-00 00:00:00'),(100000101,100000001,1,'2018-04-14 02:16:49','POS 100000021',2,-2.000,1,0,'0000-00-00 00:00:00'),(100000111,100000001,1,'2018-04-14 12:43:02','Manual Edit of Quantity',2,-3.000,1,0,'0000-00-00 00:00:00'),(100000121,100000001,1,'2018-04-14 12:43:02','Manual Edit of Quantity',3,0.000,1,0,'0000-00-00 00:00:00'),(100000131,100000001,1,'2018-04-14 12:48:42','Manual Edit of Quantity',2,0.000,1,0,'0000-00-00 00:00:00'),(100000141,100000001,1,'2018-04-14 12:48:42','Manual Edit of Quantity',3,0.000,1,0,'0000-00-00 00:00:00'),(100000151,100000011,1,'2018-04-14 12:53:17','Manual Edit of Quantity',2,0.000,1,0,'0000-00-00 00:00:00'),(100000161,100000011,1,'2018-04-14 12:53:17','Manual Edit of Quantity',3,0.000,1,0,'0000-00-00 00:00:00'),(100000171,100000011,1,'2018-04-14 12:53:17','Manual Edit of Quantity',1,0.000,1,0,'0000-00-00 00:00:00'),(100000181,100000011,1,'2018-04-14 12:54:28','Manual Edit of Quantity',2,0.000,1,0,'0000-00-00 00:00:00'),(100000191,100000011,1,'2018-04-14 12:54:28','Manual Edit of Quantity',3,0.000,1,0,'0000-00-00 00:00:00'),(100000201,100000011,1,'2018-04-15 12:45:20','POS 100000031',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000211,100000011,1,'2018-04-15 12:47:05','POS 100000041',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000221,1,1,'2018-04-17 00:02:12','POS 100000051',1,-1.000,1,0,'0000-00-00 00:00:00'),(100000231,1,1,'2018-04-18 01:25:16','POS 100000061',1,-5.000,1,0,'0000-00-00 00:00:00'),(100000241,1,1,'2018-04-18 01:32:06','POS 100000071',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000251,1,1,'2018-04-18 01:35:25','POS 100000081',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000261,1,1,'2018-04-18 01:35:58','POS 100000091',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000271,1,1,'2018-04-18 01:37:01','POS 100000101',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000281,1,1,'2018-04-18 01:38:50','POS 100000111',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000291,1,1,'2018-04-18 01:39:23','POS 100000121',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000301,1,1,'2018-04-18 01:40:56','POS 100000131',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000311,1,1,'2018-04-18 01:47:20','POS 100000141',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000321,100000001,1,'2018-04-18 01:48:54','POS 100000151',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000331,1,1,'2018-04-18 01:49:29','POS 100000161',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000341,1,1,'2018-04-18 01:51:40','POS 100000171',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000351,1,1,'2018-04-18 02:00:13','POS 100000181',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000361,1,1,'2018-04-18 02:06:32','POS 100000191',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000371,1,1,'2018-04-18 02:15:33','POS 100000201',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000381,1,1,'2018-04-18 02:17:52','POS 100000211',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000391,1,1,'2018-04-18 02:21:46','POS 100000221',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000401,1,1,'2018-04-18 02:22:16','POS 100000231',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000411,1,1,'2018-04-18 02:23:49','POS 100000241',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000421,1,1,'2018-04-18 02:28:25','POS 100000251',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000431,1,1,'2018-04-18 02:34:14','POS 100000261',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000441,1,1,'2018-04-18 02:42:51','POS 100000271',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000451,1,1,'2018-04-18 02:44:35','POS 100000281',1,-1.000,1,0,'0000-00-00 00:00:00'),(100000461,1,1,'2018-04-18 02:45:47','POS 100000291',1,-1.000,1,0,'0000-00-00 00:00:00'),(100000471,1,1,'2018-04-18 02:54:12','POS 100000301',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000481,1,1,'2018-04-18 03:27:05','POS 100000311',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000491,1,1,'2018-04-18 03:33:02','POS 100000321',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000501,1,1,'2018-04-18 03:37:30','POS 100000331',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000511,1,1,'2018-04-18 04:08:13','POS 100000341',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000521,1,1,'2018-04-18 04:09:11','POS 100000351',1,-10.000,1,0,'0000-00-00 00:00:00'),(100000531,1,1,'2018-04-19 16:40:01','POS 100000361',1,-200.000,1,0,'0000-00-00 00:00:00'),(100000541,1,1,'2018-04-19 16:40:40','POS 100000371',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000551,1,1,'2018-04-19 16:58:43','POS 100000381',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000561,100000011,1,'2018-04-19 17:52:21','POS 100000391',1,-100.000,1,0,'0000-00-00 00:00:00'),(100000571,100000021,1,'2018-04-25 07:31:48','Manual Edit of Quantity',2,0.000,1,0,'0000-00-00 00:00:00'),(100000581,100000021,1,'2018-04-25 07:31:48','Manual Edit of Quantity',3,0.000,1,0,'0000-00-00 00:00:00'),(100000591,100000021,1,'2018-04-25 07:31:48','Manual Edit of Quantity',1,0.000,1,0,'0000-00-00 00:00:00'),(100000601,100000041,1,'2018-04-25 07:34:54','Manual Edit of Quantity',2,0.000,1,0,'0000-00-00 00:00:00'),(100000611,100000041,1,'2018-04-25 07:34:54','Manual Edit of Quantity',3,0.000,1,0,'0000-00-00 00:00:00'),(100000621,100000041,1,'2018-04-25 07:34:54','Manual Edit of Quantity',1,0.000,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_kit_items`
--

DROP TABLE IF EXISTS `ospos_item_kit_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`),
  CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_kit_items`
--

LOCK TABLES `ospos_item_kit_items` WRITE;
/*!40000 ALTER TABLE `ospos_item_kit_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_item_kit_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_kits`
--

DROP TABLE IF EXISTS `ospos_item_kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `kit_discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_option` tinyint(2) NOT NULL DEFAULT '0',
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_kits`
--

LOCK TABLES `ospos_item_kits` WRITE;
/*!40000 ALTER TABLE `ospos_item_kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_item_kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_quantities`
--

DROP TABLE IF EXISTS `ospos_item_quantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_quantities`
--

LOCK TABLES `ospos_item_quantities` WRITE;
/*!40000 ALTER TABLE `ospos_item_quantities` DISABLE KEYS */;
INSERT INTO `ospos_item_quantities` VALUES (1,1,-1118.000,1,0,'2018-04-19 16:58:43'),(100000001,1,-9.000,1,1,'2018-04-18 01:48:54'),(100000001,2,0.000,1,2,'2018-04-14 12:43:02'),(100000001,3,0.000,1,3,'2018-04-13 01:25:34'),(100000011,1,-120.000,1,0,'2018-04-19 17:52:21'),(100000011,2,0.000,1,0,'0000-00-00 00:00:00'),(100000011,3,0.000,1,0,'0000-00-00 00:00:00'),(100000021,1,0.000,1,0,'0000-00-00 00:00:00'),(100000021,2,0.000,1,0,'0000-00-00 00:00:00'),(100000021,3,0.000,1,0,'0000-00-00 00:00:00'),(100000041,1,0.000,1,0,'0000-00-00 00:00:00'),(100000041,2,0.000,1,0,'0000-00-00 00:00:00'),(100000041,3,0.000,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_item_quantities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_items`
--

DROP TABLE IF EXISTS `ospos_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_type` tinyint(2) NOT NULL DEFAULT '0',
  `tax_category_id` int(10) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(255) DEFAULT NULL,
  `custom2` varchar(255) DEFAULT NULL,
  `custom3` varchar(255) DEFAULT NULL,
  `custom4` varchar(255) DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` varchar(255) DEFAULT NULL,
  `custom8` varchar(255) DEFAULT NULL,
  `custom9` varchar(255) DEFAULT NULL,
  `custom10` varchar(255) DEFAULT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000051 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_items`
--

LOCK TABLES `ospos_items` WRITE;
/*!40000 ALTER TABLE `ospos_items` DISABLE KEYS */;
INSERT INTO `ospos_items` VALUES ('test1','test',NULL,'123456','',10.00,15.00,1.000,1.000,1,NULL,0,0,0,0,0,0,'0.0','2019-03-01','15','','','','','','','',1,1,'2018-05-01 04:48:30'),('test','123655',NULL,'100000001','',10.00,20.00,1.000,1.000,100000001,NULL,0,0,0,0,0,0,'20','1970-01-01','10','','','','','','','',1,2,'2018-04-14 12:48:15'),('test2','test',NULL,'saikrp10212','',10.00,25.00,1.000,1.000,100000011,NULL,0,0,0,0,0,0,'8.00','1970-01-01','26','','','','','','','',1,0,'2018-04-14 12:54:28'),('santoor 500gms','santoor',NULL,'145674','',15.00,14.00,1.000,1.000,100000021,NULL,0,0,0,0,0,0,'0.00','2019-04-25','34','','','','','','','',1,0,'2018-04-25 07:36:01'),('salt 1kg','salt',NULL,'123','',15.00,14.00,1.000,1.000,100000041,NULL,0,0,0,0,0,0,'0.00','2019-04-27','15','','','','','','','',1,0,'2018-04-25 07:36:01');
/*!40000 ALTER TABLE `ospos_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_items_taxes`
--

DROP TABLE IF EXISTS `ospos_items_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`,`name`,`percent`),
  CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_items_taxes`
--

LOCK TABLES `ospos_items_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_items_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_migrations`
--

DROP TABLE IF EXISTS `ospos_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_migrations`
--

LOCK TABLES `ospos_migrations` WRITE;
/*!40000 ALTER TABLE `ospos_migrations` DISABLE KEYS */;
INSERT INTO `ospos_migrations` VALUES (0);
/*!40000 ALTER TABLE `ospos_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_modules`
--

DROP TABLE IF EXISTS `ospos_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_modules`
--

LOCK TABLES `ospos_modules` WRITE;
/*!40000 ALTER TABLE `ospos_modules` DISABLE KEYS */;
INSERT INTO `ospos_modules` VALUES ('module_config','module_config_desc',110,'config'),('module_customers','module_customers_desc',10,'customers'),('module_employees','module_employees_desc',80,'employees'),('module_giftcards','module_giftcards_desc',90,'giftcards'),('module_items','module_items_desc',20,'items'),('module_item_kits','module_item_kits_desc',30,'item_kits'),('module_messages','module_messages_desc',100,'messages'),('module_migrate','module_migrate_desc',120,'migrate'),('module_receivings','module_receivings_desc',60,'receivings'),('module_reports','module_reports_desc',50,'reports'),('module_sales','module_sales_desc',70,'sales'),('module_suppliers','module_suppliers_desc',40,'suppliers'),('module_taxes','module_taxes_desc',105,'taxes');
/*!40000 ALTER TABLE `ospos_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_people`
--

DROP TABLE IF EXISTS `ospos_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=100000003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_people`
--

LOCK TABLES `ospos_people` WRITE;
/*!40000 ALTER TABLE `ospos_people` DISABLE KEYS */;
INSERT INTO `ospos_people` VALUES ('Allam','Akhila',0,'','akhilaallam80@gmail.com','','','','','','','',1,-1,0,'2018-04-13 01:21:39'),('Akhila','Allam',1,'8142590093','','','','','','','','',100000002,2,1,'2018-04-13 02:13:09');
/*!40000 ALTER TABLE `ospos_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_permissions`
--

DROP TABLE IF EXISTS `ospos_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_permissions`
--

LOCK TABLES `ospos_permissions` WRITE;
/*!40000 ALTER TABLE `ospos_permissions` DISABLE KEYS */;
INSERT INTO `ospos_permissions` VALUES ('config','config',NULL,-1,0,'2018-04-13 01:21:39'),('customers','customers',NULL,-1,0,'2018-04-13 01:21:39'),('employees','employees',NULL,-1,0,'2018-04-13 01:21:39'),('giftcards','giftcards',NULL,-1,0,'2018-04-13 01:21:39'),('items','items',NULL,-1,0,'2018-04-13 01:21:39'),('items_Aswapuram','items',2,-1,0,'2018-04-13 01:21:39'),('items_Colony','items',3,-1,0,'2018-04-13 01:21:39'),('items_stock','items',1,-1,0,'2018-04-13 01:21:39'),('item_kits','item_kits',NULL,-1,0,'2018-04-13 01:21:39'),('messages','messages',NULL,-1,0,'2018-04-13 01:21:39'),('migrate','migrate',NULL,-1,0,'2018-04-13 01:21:39'),('receivings','receivings',NULL,-1,0,'2018-04-13 01:21:39'),('receivings_Aswapuram','receivings',2,-1,0,'2018-04-13 01:21:39'),('receivings_Colony','receivings',3,-1,0,'2018-04-13 01:21:39'),('receivings_stock','receivings',1,-1,0,'2018-04-13 01:21:39'),('reports','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_categories','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_customers','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_discounts','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_employees','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_inventory','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_items','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_payments','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_receivings','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_sales','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_suppliers','reports',NULL,-1,0,'2018-04-13 01:21:39'),('reports_taxes','reports',NULL,-1,0,'2018-04-13 01:21:39'),('sales','sales',NULL,-1,0,'2018-04-13 01:21:39'),('sales_Aswapuram','sales',2,-1,0,'2018-04-13 01:21:39'),('sales_Colony','sales',3,-1,0,'2018-04-13 01:21:39'),('sales_stock','sales',1,-1,0,'2018-04-13 01:21:39'),('suppliers','suppliers',NULL,-1,0,'2018-04-13 01:21:39'),('taxes','taxes',NULL,-1,0,'2018-04-13 01:21:39');
/*!40000 ALTER TABLE `ospos_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_receivings`
--

DROP TABLE IF EXISTS `ospos_receivings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `reference` (`reference`),
  CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000021 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_receivings`
--

LOCK TABLES `ospos_receivings` WRITE;
/*!40000 ALTER TABLE `ospos_receivings` DISABLE KEYS */;
INSERT INTO `ospos_receivings` VALUES ('2018-04-13 01:35:35',NULL,1,'',100000002,NULL,NULL,2,1,'2018-04-13 01:36:25'),('2018-04-14 02:09:02',NULL,1,'',100000011,'Cash',NULL,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_receivings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_receivings_items`
--

DROP TABLE IF EXISTS `ospos_receivings_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_receivings_items`
--

LOCK TABLES `ospos_receivings_items` WRITE;
/*!40000 ALTER TABLE `ospos_receivings_items` DISABLE KEYS */;
INSERT INTO `ospos_receivings_items` VALUES (100000002,100000001,'','',1,1.000,10.00,10.00,0.00,1,1.000,2,1,'2018-04-13 01:36:26'),(100000002,100000001,'','',2,-1.000,10.00,10.00,0.00,2,1.000,2,2,'2018-04-13 01:36:26'),(100000011,100000001,'',NULL,1,10.000,10.00,10.00,0.00,2,1.000,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_receivings_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales`
--

DROP TABLE IF EXISTS `ospos_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `invoice_number` varchar(32) DEFAULT NULL,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(2) NOT NULL DEFAULT '0',
  `dinner_table_id` int(11) DEFAULT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`),
  KEY `dinner_table_id` (`dinner_table_id`),
  CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000401 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales`
--

LOCK TABLES `ospos_sales` WRITE;
/*!40000 ALTER TABLE `ospos_sales` DISABLE KEYS */;
INSERT INTO `ospos_sales` VALUES ('2018-04-13 01:30:46',NULL,1,'',NULL,NULL,100000002,0,NULL,2,1,'2018-04-13 01:31:41'),('2018-04-13 02:14:00',100000002,1,'',NULL,NULL,100000012,0,NULL,2,2,'2018-04-13 02:14:25'),('2018-04-14 02:16:49',NULL,1,'',NULL,NULL,100000021,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-15 12:45:19',100000002,1,'',NULL,NULL,100000031,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-15 12:47:05',100000002,1,'',NULL,NULL,100000041,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-17 00:02:12',100000002,1,'',NULL,NULL,100000051,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:25:16',NULL,1,'',NULL,NULL,100000061,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:32:06',NULL,1,'',NULL,NULL,100000071,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:35:25',NULL,1,'',NULL,NULL,100000081,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:35:58',NULL,1,'',NULL,NULL,100000091,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:37:01',NULL,1,'',NULL,NULL,100000101,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:38:50',NULL,1,'',NULL,NULL,100000111,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:39:23',NULL,1,'',NULL,NULL,100000121,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:40:55',100000002,1,'',NULL,NULL,100000131,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:47:20',100000002,1,'',NULL,NULL,100000141,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:48:54',NULL,1,'',NULL,NULL,100000151,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:49:29',100000002,1,'',NULL,NULL,100000161,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 01:51:40',100000002,1,'',NULL,NULL,100000171,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:00:13',100000002,1,'',NULL,NULL,100000181,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:06:32',NULL,1,'',NULL,NULL,100000191,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:15:32',NULL,1,'',NULL,NULL,100000201,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:17:52',100000002,1,'',NULL,NULL,100000211,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:21:46',100000002,1,'',NULL,NULL,100000221,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:22:15',100000002,1,'',NULL,NULL,100000231,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:23:49',100000002,1,'',NULL,NULL,100000241,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:28:25',100000002,1,'',NULL,NULL,100000251,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:34:14',100000002,1,'',NULL,NULL,100000261,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:42:51',100000002,1,'',NULL,NULL,100000271,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:44:35',100000002,1,'',NULL,NULL,100000281,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:45:47',100000002,1,'',NULL,NULL,100000291,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 02:54:12',100000002,1,'',NULL,NULL,100000301,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 03:27:05',100000002,1,'',NULL,NULL,100000311,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 03:33:02',100000002,1,'',NULL,NULL,100000321,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 03:37:30',100000002,1,'',NULL,NULL,100000331,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 04:08:13',100000002,1,'',NULL,NULL,100000341,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-18 04:09:11',100000002,1,'',NULL,NULL,100000351,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-19 16:40:00',NULL,1,'',NULL,NULL,100000361,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-19 16:40:40',100000002,1,'',NULL,NULL,100000371,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-19 16:58:43',100000002,1,'',NULL,NULL,100000381,0,NULL,1,0,'0000-00-00 00:00:00'),('2018-04-19 17:52:21',100000002,1,'',NULL,NULL,100000391,0,NULL,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_items`
--

DROP TABLE IF EXISTS `ospos_sales_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`),
  CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_items`
--

LOCK TABLES `ospos_sales_items` WRITE;
/*!40000 ALTER TABLE `ospos_sales_items` DISABLE KEYS */;
INSERT INTO `ospos_sales_items` VALUES (100000002,100000001,'','',1,2.000,10.00,20.00,20.00,2,0,2,1,'2018-04-13 01:31:42'),(100000012,100000001,'','',1,2.000,10.00,20.00,20.00,2,0,2,2,'2018-04-13 02:14:26'),(100000021,100000001,'','',1,2.000,10.00,20.00,20.00,2,0,1,0,'0000-00-00 00:00:00'),(100000031,100000011,'','',1,10.000,10.00,25.00,8.00,1,0,1,0,'0000-00-00 00:00:00'),(100000041,100000011,'','',1,10.000,10.00,25.00,8.00,1,0,1,0,'0000-00-00 00:00:00'),(100000051,1,'','',1,1.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000061,1,'','',1,5.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000071,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000081,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000091,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000101,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000111,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000121,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000131,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000141,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000151,100000001,'','',1,10.000,10.00,20.00,20.00,1,0,1,0,'0000-00-00 00:00:00'),(100000161,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000171,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000181,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000191,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000201,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000211,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000221,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000231,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000241,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000251,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000261,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000271,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000281,1,'','',1,1.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000291,1,'','',1,1.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000301,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000311,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000321,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000331,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000341,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000351,1,'','',1,10.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000361,1,'','',1,200.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000371,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000381,1,'','',1,100.000,10.00,20.00,10.00,1,0,1,0,'0000-00-00 00:00:00'),(100000391,100000011,'','',1,100.000,10.00,25.00,8.00,1,0,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_sales_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_items_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_type` tinyint(2) NOT NULL DEFAULT '0',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_tax` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_items_taxes`
--

LOCK TABLES `ospos_sales_items_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_payments`
--

DROP TABLE IF EXISTS `ospos_sales_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_payments`
--

LOCK TABLES `ospos_sales_payments` WRITE;
/*!40000 ALTER TABLE `ospos_sales_payments` DISABLE KEYS */;
INSERT INTO `ospos_sales_payments` VALUES (100000002,'Cash',32.00,2,1,'2018-04-13 01:31:43'),(100000012,'Cash',32.00,2,2,'2018-04-13 02:14:28'),(100000021,'Cash',32.00,1,0,'0000-00-00 00:00:00'),(100000031,'Cash',230.00,1,0,'0000-00-00 00:00:00'),(100000041,'Cash',230.00,1,0,'0000-00-00 00:00:00'),(100000051,'Reward Points',18.00,1,0,'0000-00-00 00:00:00'),(100000061,'Cash',90.00,1,0,'0000-00-00 00:00:00'),(100000071,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000081,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000091,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000101,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000111,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000121,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000131,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000141,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000151,'Cash',160.00,1,0,'0000-00-00 00:00:00'),(100000161,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000171,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000181,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000191,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000201,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000211,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000221,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000231,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000241,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000251,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000261,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000271,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000281,'Cash',18.00,1,0,'0000-00-00 00:00:00'),(100000291,'Cash',18.00,1,0,'0000-00-00 00:00:00'),(100000301,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000311,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000321,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000331,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000341,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000351,'Cash',180.00,1,0,'0000-00-00 00:00:00'),(100000361,'Cash',3600.00,1,0,'0000-00-00 00:00:00'),(100000371,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000381,'Cash',1800.00,1,0,'0000-00-00 00:00:00'),(100000391,'Cash',2300.00,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_sales_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_reward_points`
--

DROP TABLE IF EXISTS `ospos_sales_reward_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_reward_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_reward_points`
--

LOCK TABLES `ospos_sales_reward_points` WRITE;
/*!40000 ALTER TABLE `ospos_sales_reward_points` DISABLE KEYS */;
INSERT INTO `ospos_sales_reward_points` VALUES (1,100000031,0,0,1,0,'0000-00-00 00:00:00'),(11,100000041,23,0,1,0,'0000-00-00 00:00:00'),(21,100000051,1.8,18,1,0,'0000-00-00 00:00:00'),(31,100000131,0,0,1,0,'0000-00-00 00:00:00'),(41,100000141,0,0,1,0,'0000-00-00 00:00:00'),(51,100000161,0,0,1,0,'0000-00-00 00:00:00'),(61,100000171,0,0,1,0,'0000-00-00 00:00:00'),(71,100000181,0,0,1,0,'0000-00-00 00:00:00'),(81,100000211,0,0,1,0,'0000-00-00 00:00:00'),(91,100000221,0,0,1,0,'0000-00-00 00:00:00'),(101,100000231,0,0,1,0,'0000-00-00 00:00:00'),(111,100000241,180,0,1,0,'0000-00-00 00:00:00'),(121,100000251,0,0,1,0,'0000-00-00 00:00:00'),(131,100000261,0,0,1,0,'0000-00-00 00:00:00'),(141,100000271,0,0,1,0,'0000-00-00 00:00:00'),(151,100000281,8,0,1,0,'0000-00-00 00:00:00'),(161,100000291,8,0,1,0,'0000-00-00 00:00:00'),(171,100000301,0.8,0,1,0,'0000-00-00 00:00:00'),(181,100000311,0.8,0,1,0,'0000-00-00 00:00:00'),(191,100000321,0.8,0,1,0,'0000-00-00 00:00:00'),(201,100000331,0.8,0,1,0,'0000-00-00 00:00:00'),(211,100000341,18,0,1,0,'0000-00-00 00:00:00'),(221,100000351,8,0,1,0,'0000-00-00 00:00:00'),(231,100000371,180,0,1,0,'0000-00-00 00:00:00'),(241,100000381,180,0,1,0,'0000-00-00 00:00:00'),(251,100000391,130,0,1,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ospos_sales_reward_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_taxes` (
  `sale_id` int(10) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code` varchar(32) NOT NULL DEFAULT '',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`,`tax_type`,`tax_group`),
  KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_type`,`tax_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_taxes`
--

LOCK TABLES `ospos_sales_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_sales_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sessions`
--

DROP TABLE IF EXISTS `ospos_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sessions`
--

LOCK TABLES `ospos_sessions` WRITE;
/*!40000 ALTER TABLE `ospos_sessions` DISABLE KEYS */;
INSERT INTO `ospos_sessions` VALUES ('gkhgs05q6i9k68pfoc75aj1ed8ovfugf','::1',1524013195,'__ci_last_regenerate|i:1524013124;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:5;s:8:\"discount\";d:10;s:8:\"in_stock\";s:6:\"-1.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"100\";s:16:\"discounted_total\";s:7:\"90.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:8;}}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('bc3samm2kvfeo7boe7shidbucri1r012','::1',1524014716,'__ci_last_regenerate|i:1524014647;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;'),('neabu4acn445k89f8biils6ttrtanv58','::1',1524015153,'__ci_last_regenerate|i:1524014972;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;sales_customer|i:-1;sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:6:\"10.000\";s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:7:\"-16.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:8:\"200.0000\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:80;}}'),('s78ikdfog76il92houbo9adb2l1c8iu6','::1',1524015624,'__ci_last_regenerate|i:1524015324;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:10;s:8:\"discount\";d:10;s:8:\"in_stock\";s:7:\"-66.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"200\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:8;}}sales_customer|s:9:\"100000002\";sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('quh9l2u1q39dsq21pqkuqimp95db245q','::1',1524015709,'__ci_last_regenerate|i:1524015633;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('9v3evlk8dqqcd0anq0hl2dhplqmqd1nr','::1',1524016288,'__ci_last_regenerate|i:1524015988;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:10;s:8:\"discount\";d:10;s:8:\"in_stock\";s:7:\"-96.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"200\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:8;}}sales_customer|s:9:\"100000002\";sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('c7iji0bjqs7rnsgap85p0sp1f8c55rdn','::1',1524016310,'__ci_last_regenerate|i:1524016292;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('0ub0sdsopcit2hnnvsmgrrgb5lbn4e27','::1',1524016821,'__ci_last_regenerate|i:1524016780;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('eu6osm3cgtfu5molo8p8udrp6naoemgr','::1',1524017443,'__ci_last_regenerate|i:1524017165;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|i:-1;sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:6:\"10.000\";s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:8:\"-126.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:8:\"200.0000\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:80;}}'),('ve0lcehi86v3mehhk2g7lbudlr06k11s','::1',1524017810,'__ci_last_regenerate|i:1524017533;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:6:\"10.000\";s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:8:\"-136.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:8:\"200.0000\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:80;}}'),('au6ui3t28no37scdj0k9bohtch4rju9p','::1',1524018136,'__ci_last_regenerate|i:1524017846;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";s:9:\"1800.0000\";}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:7:\"100.000\";s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:8:\"-346.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:9:\"2000.0000\";s:16:\"discounted_total\";s:9:\"1800.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:800;}}'),('nr7utqu2q3k548f2cptbkj4g5ivuf5jr','::1',1524018238,'__ci_last_regenerate|i:1524018164;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";s:9:\"1800.0000\";}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:7:\"100.000\";s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:8:\"-446.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:9:\"2000.0000\";s:16:\"discounted_total\";s:9:\"1800.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:800;}}'),('i404p9mh30docg824elehf5lnrv7t7t6','::1',1524018806,'__ci_last_regenerate|i:1524018499;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_cart|a:0:{}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('ul72fm60fhua8cgvnsuba3r678dcfsij','::1',1524018861,'__ci_last_regenerate|i:1524018809;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('68vf0uc7srvlitqr5t1k0hcv30qfnmcs','::1',1524019555,'__ci_last_regenerate|i:1524019313;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('f0glkgdfor6ouo6eqp2cfucblj044ac2','::1',1524020059,'__ci_last_regenerate|i:1524020020;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('mfl5dui1hre7jfobumisaouho8gv9b5v','::1',1524022037,'__ci_last_regenerate|i:1524021986;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";'),('1uunpo14omov69a9fkriq7ht741uu8nq','::1',1524022638,'__ci_last_regenerate|i:1524022345;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:10;s:8:\"discount\";d:10;s:8:\"in_stock\";s:8:\"-688.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"200\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:8;}}sales_customer|s:9:\"100000002\";sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('qhb8o62itbtkltrcrn1a9hsbc9hke9e4','::1',1524022742,'__ci_last_regenerate|i:1524022646;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:11;s:8:\"discount\";d:10;s:8:\"in_stock\";s:8:\"-698.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"220\";s:16:\"discounted_total\";s:8:\"198.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:80;}}'),('j7910tur9uqrik49f62i0rj719dgkc58','::1',1524023506,'__ci_last_regenerate|i:1524023283;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:11;s:8:\"discount\";d:10;s:8:\"in_stock\";s:8:\"-698.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"220\";s:16:\"discounted_total\";s:8:\"198.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:10;}}'),('qu5m2juvcd7fl2ts44t20n6k30ih0g5a','::1',1524024214,'__ci_last_regenerate|i:1524023628;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:10;s:8:\"discount\";d:10;s:8:\"in_stock\";s:8:\"-698.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"200\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:8;}}'),('l8ju06enk70dp4gigs4ujoj9c0c1d3lb','::1',1524024561,'__ci_last_regenerate|i:1524024343;session_sha1|s:7:\"54cb810\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;item_location|s:1:\"1\";sales_customer|s:9:\"100000002\";sales_payments|a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:180;}}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:6:\"10.000\";s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:8:\"-718.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:8:\"200.0000\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";s:1:\"0\";s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:80;}}'),('8f9itcop30k084d26bqsq2i5m1b7tsn7','::1',1524024859,'__ci_last_regenerate|i:1524024852;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";'),('028p1v9ijoa7su0ofcge0e7ld38i6kum','::1',1524025025,'__ci_last_regenerate|i:1524025024;session_sha1|s:7:\"e489953\";'),('aco6h5igr39uloi4db2dn8fo5jsadpd9','::1',1524156104,'__ci_last_regenerate|i:1524155964;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;'),('29alo8hek12bbfu5pdb61s34a7u61d7r','::1',1524157376,'__ci_last_regenerate|i:1524157072;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('b567sc9mbdb5495cvpg7qkbu5c344de9','::1',1524157140,'__ci_last_regenerate|i:1524157140;'),('un070e1o12tgn7p0hb0bld79dviqiob9','::1',1524157141,'__ci_last_regenerate|i:1524157140;session_sha1|s:7:\"e489953\";'),('ojl78ia4el519u4ja4t8kivvbf9vlf9l','::1',1524157627,'__ci_last_regenerate|i:1524157377;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:1:{i:1;a:22:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:10;s:8:\"discount\";d:10;s:8:\"in_stock\";s:9:\"-1118.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"200\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:6:\"profit\";d:180;}}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('5663obl3fkgsfoqfl1l16q8qb8ot1l4g','::1',1524157440,'__ci_last_regenerate|i:1524157440;'),('9iemqouln6gccap2utpif74r0g01jli1','::1',1524157441,'__ci_last_regenerate|i:1524157440;session_sha1|s:7:\"177893d\";'),('i1q6qual3np549rqjp68pgi0g5skjqim','::1',1524158019,'__ci_last_regenerate|i:1524157820;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:1:{i:1;a:23:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:10;s:8:\"discount\";d:10;s:8:\"in_stock\";s:9:\"-1118.000\";s:5:\"price\";d:20;s:5:\"total\";s:3:\"200\";s:16:\"discounted_total\";s:8:\"180.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:4:\"cost\";s:5:\"10.00\";s:6:\"profit\";d:80;}}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('essn5r8li6i5phllvqssgi2q95ggmt3k','::1',1524158438,'__ci_last_regenerate|i:1524158258;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;item_location|s:1:\"1\";dinner_table|N;'),('bg22krdf5vld2cj2h79050nmhnq31u3o','::1',1524158867,'__ci_last_regenerate|i:1524158706;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"3\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:1:{i:1;a:23:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:6:\"Godown\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";s:9:\"-1118.000\";s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:5:\"20.00\";s:16:\"discounted_total\";s:7:\"18.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:4:\"cost\";s:5:\"10.00\";s:6:\"profit\";d:8;}}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;item_location|s:1:\"1\";dinner_table|N;'),('lkbau0j2365u72h3adjepsgn3fv77vp2','::1',1524159304,'__ci_last_regenerate|i:1524159010;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"2\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"3\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;item_location|s:1:\"1\";dinner_table|N;'),('aen54l5i1h49fh2ctbs6cipm27eef5va','::1',1524159680,'__ci_last_regenerate|i:1524159410;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"2\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"2\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:1:{i:1;a:23:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"2\";s:10:\"stock_name\";s:6:\"Colony\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:6:\"123456\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";s:5:\"10.00\";s:8:\"in_stock\";i:0;s:5:\"price\";s:5:\"20.00\";s:5:\"total\";s:5:\"20.00\";s:16:\"discounted_total\";s:7:\"18.0000\";s:12:\"print_option\";s:1:\"0\";s:10:\"stock_type\";i:0;s:15:\"tax_category_id\";s:1:\"0\";s:8:\"exp_date\";s:10:\"2019-03-01\";s:3:\"MRP\";s:2:\"22\";s:4:\"cost\";s:5:\"10.00\";s:6:\"profit\";d:8;}}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;item_location|s:1:\"1\";dinner_table|N;'),('3g8epo5fk54jfksk4ju1arddd92asdd2','::1',1524160141,'__ci_last_regenerate|i:1524159848;session_sha1|s:7:\"e489953\";person_id|s:1:\"1\";sales_mode|s:4:\"sale\";sales_location|s:1:\"2\";sales_invoice_number_enabled|b:0;recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"2\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;item_location|s:1:\"1\";dinner_table|N;'),('np5545urah71s9jcj4kul4ctq4sdg6hj','::1',1524160424,'__ci_last_regenerate|i:1524160423;session_sha1|s:7:\"60d8426\";'),('sft6e5dm06nh674fca129la7ql5gj1ud','::1',1524640774,'__ci_last_regenerate|i:1524640294;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;item_location|s:1:\"1\";'),('f5r49amlq0866fvmq1tsk5rn8s8ha2lj','::1',1524641762,'__ci_last_regenerate|i:1524640835;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;item_location|s:1:\"1\";'),('1oro5m6bhqiu226t8el1ppnp9l381llq','::1',1524642225,'__ci_last_regenerate|i:1524641920;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;item_location|s:1:\"1\";sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('r6df1i7rbms7rr4pe1jac410ul3vmi13','::1',1524642529,'__ci_last_regenerate|i:1524642231;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";recv_cart|a:0:{}recv_mode|s:7:\"receive\";recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";recv_supplier|i:-1;item_location|s:1:\"1\";sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:1;cash_rounding|i:0;sales_invoice_number|N;'),('k0f95q28ue4j1b3o7gkpn0u8fth9b729','::1',1524642621,'__ci_last_regenerate|i:1524642620;session_sha1|s:7:\"60d8426\";'),('5hl3nahgc0fglv90k6shuihoas6gf0rv','::1',1524975602,'__ci_last_regenerate|i:1524975537;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";'),('f71b59ltessm3gv62s8sgimo4htdbe14','::1',1524976084,'__ci_last_regenerate|i:1524975658;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('vnju7s454s6fmoq9tmrdeu76n5qrnjmg','::1',1524984477,'__ci_last_regenerate|i:1524976387;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('ae374ooua6f3f36ld1jnv5noij8vjg7j','::1',1524976646,'__ci_last_regenerate|i:1524976646;'),('fc1dtahdq8jam9c296riav24pqoco4i4','::1',1524976647,'__ci_last_regenerate|i:1524976646;session_sha1|s:7:\"60d8426\";'),('irit3ksoat5if6c12bidafqruqi1t47o','::1',1524986796,'__ci_last_regenerate|i:1524984485;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('tu532n240shhtgc0gcnggg2gafbuclr1','::1',1524987198,'__ci_last_regenerate|i:1524986804;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('5ikoju8gi342sprvj1tp5147s974jsp2','::1',1524988001,'__ci_last_regenerate|i:1524987645;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('7ql2gg25njhu1elgli9gv52larr47bl2','::1',1524988430,'__ci_last_regenerate|i:1524988089;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('vrlc2m87rpd3r39ss6ffn1a6uiq7mmt7','::1',1524990240,'__ci_last_regenerate|i:1524988477;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('65mnllelbbqmftqvlta3bj8t4trsp19j','::1',1524993029,'__ci_last_regenerate|i:1524990245;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('os122o2puo1v02o370b45dofceop6iuu','::1',1524993511,'__ci_last_regenerate|i:1524993044;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('92dr0u9419j99rtbip2igqmuo95nkca6','::1',1524997816,'__ci_last_regenerate|i:1524993568;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('hb9pas1lbv9thco35gllnah0njilnlbt','::1',1524998221,'__ci_last_regenerate|i:1524997844;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('uorjeclobjhs2dplun96t5bn0tequneb','::1',1524998741,'__ci_last_regenerate|i:1524998260;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('ofh1m9gqhcoj1g3espjq5v7bh1144dh2','::1',1525018824,'__ci_last_regenerate|i:1525017558;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('8q4lcpodrot19cp749v0ebao3926p4j6','::1',1525019305,'__ci_last_regenerate|i:1525018857;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('g2m3qbi2j6gad1ecv9n3j3uvuthfde5o','::1',1525021437,'__ci_last_regenerate|i:1525019355;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('7jc56s1l47v3og83nggm3setalml8tlg','::1',1525023182,'__ci_last_regenerate|i:1525021454;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('g6v0e0jaj1ccua7mchktr74em5c09ohb','::1',1525147872,'__ci_last_regenerate|i:1525146611;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('c7iqksno3rmhju4bb06p4kbe42mc14gg','::1',1525149960,'__ci_last_regenerate|i:1525147874;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";'),('0krh1ud12k26c7rinl9kd4m02mqv2dqd','::1',1525150111,'__ci_last_regenerate|i:1525150057;session_sha1|s:7:\"60d8426\";person_id|s:1:\"1\";item_location|s:1:\"1\";');
/*!40000 ALTER TABLE `ospos_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_stock_locations`
--

DROP TABLE IF EXISTS `ospos_stock_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_stock_locations`
--

LOCK TABLES `ospos_stock_locations` WRITE;
/*!40000 ALTER TABLE `ospos_stock_locations` DISABLE KEYS */;
INSERT INTO `ospos_stock_locations` VALUES (1,'Godown',0,-1,0,'2018-04-13 01:21:39'),(2,'Colony',0,-1,0,'2018-04-14 02:13:19'),(3,'Aswpm',0,-1,0,'2018-04-14 02:13:19');
/*!40000 ALTER TABLE `ospos_stock_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_suppliers`
--

DROP TABLE IF EXISTS `ospos_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_suppliers`
--

LOCK TABLES `ospos_suppliers` WRITE;
/*!40000 ALTER TABLE `ospos_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sync`
--

DROP TABLE IF EXISTS `ospos_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sync` (
  `eno` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sync`
--

LOCK TABLES `ospos_sync` WRITE;
/*!40000 ALTER TABLE `ospos_sync` DISABLE KEYS */;
INSERT INTO `ospos_sync` VALUES (34006,'2018-04-13 09:26:46');
/*!40000 ALTER TABLE `ospos_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_categories`
--

DROP TABLE IF EXISTS `ospos_tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_tax_categories` (
  `tax_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `tax_category` varchar(32) NOT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL,
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_categories`
--

LOCK TABLES `ospos_tax_categories` WRITE;
/*!40000 ALTER TABLE `ospos_tax_categories` DISABLE KEYS */;
INSERT INTO `ospos_tax_categories` VALUES (1,'Standard',10,-1,0,'2018-04-13 01:21:39'),(2,'Service',12,-1,0,'2018-04-13 01:21:39'),(3,'Alcohol',11,-1,0,'2018-04-13 01:21:39');
/*!40000 ALTER TABLE `ospos_tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_code_rates`
--

DROP TABLE IF EXISTS `ospos_tax_code_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_tax_code_rates` (
  `rate_tax_code` varchar(32) NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_tax_code`,`rate_tax_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_code_rates`
--

LOCK TABLES `ospos_tax_code_rates` WRITE;
/*!40000 ALTER TABLE `ospos_tax_code_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_code_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_codes`
--

DROP TABLE IF EXISTS `ospos_tax_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_tax_codes` (
  `tax_code` varchar(32) NOT NULL,
  `tax_code_name` varchar(255) NOT NULL DEFAULT '',
  `tax_code_type` tinyint(2) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_codes`
--

LOCK TABLES `ospos_tax_codes` WRITE;
/*!40000 ALTER TABLE `ospos_tax_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_xreq`
--

DROP TABLE IF EXISTS `ospos_xreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_xreq` (
  `loc_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ack` int(11) NOT NULL DEFAULT '0',
  `slid` int(11) NOT NULL DEFAULT '1',
  `seno` int(11) NOT NULL DEFAULT '0',
  `sts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_xreq`
--

LOCK TABLES `ospos_xreq` WRITE;
/*!40000 ALTER TABLE `ospos_xreq` DISABLE KEYS */;
INSERT INTO `ospos_xreq` VALUES (1,100000001,1,'2018-04-13 01:35:36',1,2,1,'2018-04-13 02:03:18'),(2,100000001,10,'2018-04-14 02:09:02',0,1,0,'2018-04-14 02:09:02');
/*!40000 ALTER TABLE `ospos_xreq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-01 14:49:32
