-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2015 at 09:33 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
`admin_id` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`admin_id`, `email`, `password`) VALUES
(1, 'yosi0679@gmail.com', '9310679'),
(2, 'dov@gmail.com', '9310679');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` int(255) unsigned NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Games'),
(2, 'Books'),
(3, 'Movies'),
(4, 'Computers');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
`expenses_id` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `purchase_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expenses_id`, `product_id`, `product_name`, `price`, `purchase_date`) VALUES
(60, 47, 'The bible', 216, '2015-04-12 21:22:10'),
(61, 47, 'The bible', 0, '2015-04-12 21:22:49'),
(62, 48, 'The Agent', 1242, '2015-04-12 21:25:28'),
(63, 48, 'The Agent', 0, '2015-04-12 21:25:55'),
(64, 49, 'Closing Accounts', 1960, '2015-04-12 21:27:02'),
(65, 49, 'Closing Accounts', 0, '2015-04-12 21:27:16'),
(66, 21, 'Programming in ANSI C', 0, '2015-04-12 21:31:41'),
(67, 21, 'Road Less Traveled', 0, '2015-04-12 21:32:06'),
(68, 47, 'The bible', 0, '2015-04-12 21:32:39'),
(69, 47, 'The bible', 24462, '2015-04-12 21:41:30'),
(70, 50, 'Tanach Simanim ', 1870, '2015-04-12 21:43:03'),
(71, 50, 'Tanach Simanim ', 0, '2015-04-12 21:43:18'),
(72, 51, 'Siddur Tefillas Shai ', 4424, '2015-04-12 21:46:07'),
(73, 51, 'Siddur Tefillas Shai ', 0, '2015-04-12 21:52:49'),
(74, 52, 'Dell Laptop 10.5', 135000, '2015-04-13 07:40:31'),
(75, 52, 'Dell Laptop 10.5', 0, '2015-04-13 07:41:00'),
(76, 53, 'Efes Bwyachasey Enosh', 5376, '2015-04-13 07:42:21'),
(77, 53, 'Efes Bwyachasey Enosh', 0, '2015-04-13 07:42:47'),
(78, 54, 'rabbi Asher', 1760, '2015-04-13 07:44:18'),
(79, 54, 'rabbi Asher', 0, '2015-04-13 07:44:31'),
(80, 55, 'F&D audio experiance', 16500, '2015-04-13 07:46:07'),
(81, 55, 'F&D audio experiance', 0, '2015-04-13 07:46:18'),
(82, 56, 'Kipot Puzzle', 2925, '2015-04-13 22:55:04'),
(83, 56, 'Kipot Puzzle', 0, '2015-04-13 22:55:23'),
(84, 54, 'rabbi Asher', 110, '2015-04-19 09:55:52'),
(85, 54, 'rabbi Asher', 110, '2015-04-19 09:56:27'),
(86, 54, 'rabbi Asher', 110, '2015-04-19 09:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
`image-id` int(10) unsigned NOT NULL,
  `image-name` varchar(255) NOT NULL,
  `product-name` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image-id`, `image-name`, `product-name`) VALUES
(156, 'uploads/360895456688.jpg', 'Closing Accounts'),
(163, 'uploads/7726592063229554.jpg', 'rabbi Asher'),
(155, 'uploads/269759207142.jpg', 'The Agent'),
(6, 'uploads/675975633gta-iv-400x400-imad89f2pggtrfhk.jpeg', 'Grand Theft Auto IV'),
(153, 'uploads/6251789401OKH100SHOS.jpg', 'Java'),
(157, 'uploads/5667206205352_1.jpg', 'Tanach Simanim '),
(152, 'uploads/7080518255352_1.jpg', 'bible '),
(7, 'uploads/135277833grand-theft-auto-iv-complete-edition-400x400-imadf3y5vgqycf6h.jpeg', 'Grand Theft Auto IV'),
(8, 'uploads/586241535grand-theft-auto-iv-400x400-imadf3y5abwgr2gy.jpeg', 'Grand Theft Auto IV'),
(9, 'uploads/362646331grand-theft-auto-iv-400x400-imadf3y3exzgpr5k.jpeg', 'Grand Theft Auto IV'),
(20, 'uploads/164673361batman-arkham-city-400x400-imadyncrdzh462nr.jpeg', 'Batman Arkham City'),
(21, 'uploads/732734145batman-arkham-city-400x400-imacztghxwjjf8rb.jpeg', 'Batman Arkham City'),
(22, 'uploads/692175872batman-arkham-city-400x400-imacztggreq9rddz.jpeg', 'Batman Arkham City'),
(23, 'uploads/241494861batman-arkham-city-400x400-imacztggreq9rddz.jpeg', 'Batman Arkham City'),
(26, 'uploads/638923611spider-man-3-400x400-imad8n8zhmfy5yez.jpeg', 'The Amazing Spiderman (Game)'),
(25, 'uploads/208281828batman-arkham-city-400x400-imacztggp8ewjjah.jpeg', 'Batman Arkham City'),
(27, 'uploads/908729385spider-man-3-the-game-400x400-imadfn63smqtucyf.jpeg', 'The Amazing Spiderman (Game)'),
(28, 'uploads/583963674spider-man-3-the-game-400x400-imadfn6bykcymvjw.jpeg', 'The Amazing Spiderman (Game)'),
(29, 'uploads/890453695spider-man-3-the-game-400x400-imadfeezhvtke3bm.jpeg', 'The Amazing Spiderman (Game)'),
(30, 'uploads/497039085spider-man-3-the-game-400x400-imadfef2pfznfguh.jpeg', 'The Amazing Spiderman (Game)'),
(31, 'uploads/741250321prototype-2-400x400-imadf7saewdra6n9.jpeg', 'Prototype 2'),
(32, 'uploads/762492421prototype-2-400x400-imad7cp97dghj5hg.jpeg', 'Prototype 2'),
(33, 'uploads/596288188prototype-2-400x400-imad7cp9qxrf8zjk.jpeg', 'Prototype 2'),
(44, 'uploads/328205052need-for-speed-most-wanted-2012-limited-edition-400x400-imadf3ffvqfvkwvd.jpeg', 'Need For Speed Most Wanted 2012'),
(45, 'uploads/625670859need-for-speed-most-wanted-a-criterion-game-400x400-imadar2wgrjxwfze.jpeg', 'Need For Speed Most Wanted 2012'),
(46, 'uploads/916093997need-for-speed-most-wanted-a-criterion-game-400x400-imadar2wzcxavzhn.jpeg', 'Need For Speed Most Wanted 2012'),
(47, 'uploads/8286112need-for-speed-most-wanted-a-criterion-game-400x400-imadar2xf2tsghyb.jpeg', 'Need For Speed Most Wanted 2012'),
(48, 'uploads/327260730need-for-speed-most-wanted-a-criterion-game-400x400-imadar2xwfcssyjj.jpeg', 'Need For Speed Most Wanted 2012'),
(49, 'uploads/965082258need-for-speed-most-wanted-a-criterion-game-400x400-imadar2wszzfxeqg.jpeg', 'Need For Speed Most Wanted 2012'),
(50, 'uploads/986912565need-for-speed-most-wanted-a-criterion-game-400x400-imadar2wvghbe7s9.jpeg', 'Need For Speed Most Wanted 2012'),
(164, 'uploads/978137555RZFANDAA111.jpg', 'F&D audio experiance'),
(165, 'uploads/619164096YE0449982_wa.jpg', 'Kipot Puzzle'),
(64, 'uploads/20003219battlefield-bad-company-2-400x400-imad8gq4kgsy6zth.jpeg', 'Battlefield Bad Company II'),
(65, 'uploads/230875746battlefield-bad-company-2-400x400-imadf3y6wy9hrguj.jpeg', 'Battlefield Bad Company II'),
(66, 'uploads/136900122battlefield-bad-company-2-400x400-imadf3y6zq4jzwba.jpeg', 'Battlefield Bad Company II'),
(67, 'uploads/202160893battlefield-bad-company-2-400x400-imadf3y63btg9uqu.jpeg', 'Battlefield Bad Company II'),
(68, 'uploads/533521539battlefield-bad-company-2-400x400-imadf3y73m5dpccy.jpeg', 'Battlefield Bad Company II'),
(84, 'uploads/123434866fifa-13-400x400-imadbzgkaqmceeea.jpeg', 'Fifa Football 2013'),
(85, 'uploads/638678790fifa-13-400x400-imadachzenbnzbrx.jpeg', 'Fifa Football 2013'),
(86, 'uploads/515926559fifa-13-400x400-imadachzh7df9qj9.jpeg', 'Fifa Football 2013'),
(87, 'uploads/27185451fifa-13-400x400-imadachzdsy7heqd.jpeg', 'Fifa Football 2013'),
(92, 'uploads/831829466angry-birds-seasons-400x400-imadfy9sfgjabx74.jpeg', 'Angry Birds Seasons'),
(93, 'uploads/587642676angry-birds-seasons-400x400-imadfy9sk2m2s2nd.jpeg', 'Angry Birds Seasons'),
(94, 'uploads/928035668angry-birds-seasons-400x400-imadfy9sz4ubh2az.jpeg', 'Angry Birds Seasons'),
(97, 'uploads/616361545programming-with-java-a-primer-275x275-imadc9fxfeyj8cgs.jpeg', 'Java Primer E. Balgurusamy'),
(98, 'uploads/502531486programming-in-ansi-c-275x275-imadd3ghbzvzjshg.jpeg', 'Programming in ANSI C'),
(99, 'uploads/176900956data-communications-networking-sie-forouzan-275x275-imad8nertbuynbjr.jpeg', 'Data Communications And Networking Forouzan'),
(161, 'uploads/3369352141OKH100SHOS_6.jpg', 'Dell Laptop 10.5'),
(162, 'uploads/76130044$_35.JPG', 'Efes Bwyachasey Enosh'),
(101, 'uploads/24091257software-engineering-a-practioner-s-approach-275x275-imad96yhpzgnapyz.jpeg', 'Software Engineering A Practioners Approach'),
(102, 'uploads/75945225the-8051-microcontroller-and-embedded-systems-using-assembly-and-c-275x275-imadc9gva4sehqnt.jpeg', 'Microcontroller 8081 And Embedded Systems'),
(103, 'uploads/504165744safe-275x275-imadduf8yqeeejza.jpeg', 'Safe 2012'),
(104, 'uploads/814032181the-expendables-2-275x275-imadfyjthgv4m7g2.jpeg', 'The Expandibles II'),
(114, 'uploads/506707599hp-v-210-w-8-gb-275x275-imad4dyv5g7qf23m.jpeg', 'HP Mini 8GB Pen Drive'),
(115, 'uploads/688273727hp-v-210-w-16-gb-400x400-imad4dyvrxathfez.jpeg', 'HP Mini 8GB Pen Drive'),
(116, 'uploads/470190521hp-v-250-w-8-gb-400x400-imadyhgfakuszf9a.jpeg', 'HP Mini 8GB Pen Drive'),
(117, 'uploads/79670617sandisk-cruzer-blade-16-gb-275x275-imad4dyuqtgh4dgc.jpeg', 'Sandisk 8GB Pendrive'),
(118, 'uploads/235311148sandisk-cruzer-blade-16-gb-275x275-imad4dyumyqy3b4y.jpeg', 'Sandisk 8GB Pendrive'),
(119, 'uploads/834464688sandisk-cruzer-blade-16-gb-275x275-imad4dyu2b9dpgpm.jpeg', 'Sandisk 8GB Pendrive'),
(124, 'uploads/660377764sennheiser-hd-180-275x275-imad55rghzpnx9mz.jpeg', 'Sennheiser Gaming Headphones'),
(125, 'uploads/126573845philips-shp2000-275x275-imad5sy2f56bmazs.jpeg', 'Sennheiser Gaming Headphones'),
(126, 'uploads/868547847philips-shs3800-275x275-imad5psfdjdep3rm (1).jpeg', 'Philips Jogs Headsets '),
(127, 'uploads/75637929philips-shs3800-275x275-imad5psfjgmh68kx.jpeg', 'Philips Jogs Headsets '),
(128, 'uploads/599016474philips-shs3800-275x275-imad5psfvh6sdmmf.jpeg', 'Philips Jogs Headsets '),
(160, 'uploads/1019531021OKH100SHOS_3.jpg', 'Dell Laptop 10.5'),
(159, 'uploads/6891931641OKH100SHOS.jpg', 'Dell Laptop 10.5'),
(158, 'uploads/1086316214154.jpg', 'Siddur Tefillas Shai '),
(132, 'uploads/563050073angry-birds-stmm040713-ab-275x275-imad8kwpcupw2a65.jpeg', 'Angry Birds Oil Pastels'),
(133, 'uploads/151585377disney-hmsoop-02830-cr-275x275-imad7qztg6ny4uu9.jpeg', 'Cars Oil Pastels'),
(135, 'uploads/98696948parker-9000015535-400x400-imad8qsxs7nhfgyj.jpeg', 'Parker 52SkS'),
(149, 'uploads/956749855352_1.jpg', 'Ã?ÂªÃ?Â Ã?Â?'),
(150, 'uploads/630467075352_1.jpg', 'baible');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
`order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('pending','approved','delivered') NOT NULL,
  `shippers_name` varchar(30) NOT NULL,
  `address` varchar(120) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `shippers_email` varchar(45) NOT NULL,
  `ordered_On` datetime NOT NULL,
  `total_order_price` double(10,2) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `status`, `shippers_name`, `address`, `mobile_number`, `shippers_email`, `ordered_On`, `total_order_price`) VALUES
(26, 24, 'pending', 'bluma', 'rotshild 27', '0526459595', 'bluma0679@gmail.com', '2015-04-09 12:04:27', 1650.00),
(27, 24, 'approved', 'bluma', 'rotshild 27', '0526459595', 'bluma0679@gmail.com', '2015-04-09 12:05:43', 910.00),
(28, 1, 'pending', 'Yossi Shwartz', 'Nordao 29 ', '0545306461', 'yosi0679@gmail.com', '2015-04-09 12:55:52', 560.00),
(29, 1, 'pending', 'Yossi Shwartz', 'Nordao 29 ', '0545306461', 'yosi0679@gmail.com', '2015-04-15 00:23:19', 35.00),
(30, 29, 'pending', 'te', 'te', '0545626565', 'test4@test.com', '2015-04-16 19:31:33', 27.00),
(31, 29, 'delivered', 'te', 'te', '0545626565', 'test4@test.com', '2015-04-16 21:38:52', 55.00),
(32, 29, 'pending', 'te', 'te', '0545626565', 'test4@test.com', '2015-04-16 21:42:54', 0.00),
(33, 1, 'pending', 'Yossi Shwartz', 'Nordao 29 ', '0545306461', 'yosi0679@gmail.com', '2015-04-16 23:06:00', 55.00),
(34, 1, 'pending', 'Yossi Shwartz', 'Nordao 29 ', '0545306461', 'yosi0679@gmail.com', '2015-04-19 09:28:33', 35.00);

-- --------------------------------------------------------

--
-- Table structure for table `product-company`
--

CREATE TABLE IF NOT EXISTS `product-company` (
`company-id` int(10) unsigned NOT NULL,
  `company-name` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product-company`
--

INSERT INTO `product-company` (`company-id`, `company-name`) VALUES
(1, 'Rockstar'),
(2, 'Ubisoft'),
(3, 'Eidos'),
(4, 'Activision'),
(5, 'EA Electronic Arts'),
(6, 'Squarc Enix'),
(7, 'Rovio'),
(8, 'Dreggone'),
(9, 'Tata Mc Graw Hill'),
(10, 'Willian Stalling International'),
(11, 'Warner Bros.'),
(12, 'Village Roadshow Studios'),
(14, 'HP'),
(15, 'Sandisk'),
(16, 'Transend'),
(17, 'Dell'),
(18, 'Sennheiser'),
(19, 'Philips'),
(20, 'Disney'),
(21, 'Parker England'),
(26, 'keter');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`product_id` int(10) unsigned NOT NULL,
  `product-name` varchar(60) NOT NULL,
  `sub-category-name` varchar(40) NOT NULL,
  `category-name` varchar(40) NOT NULL,
  `company-name` varchar(40) NOT NULL,
  `price` double(10,2) unsigned NOT NULL,
  `summary` text,
  `tags` varchar(255) NOT NULL,
  `product_qty` int(11) unsigned NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `hits` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product-name`, `sub-category-name`, `category-name`, `company-name`, `price`, `summary`, `tags`, `product_qty`, `lastUpdated`, `hits`) VALUES
(6, 'Marine Sharpshooter II', 'Action', 'Games', 'Activision', 300.00, 'test test', 'Marine Sharpshooter II', 18, '2015-04-09 14:16:44', 6),
(20, 'Java Primer E. Balgurusamy', 'Academic', 'Books', 'Tata Mc Graw Hill', 520.00, 'test test', 'Java Primer E. Balgurusamy', 45, '2015-04-01 01:20:40', 1),
(24, 'Software Engineering A Practioners Approach', 'Academic', 'Books', 'Willian Stalling International', 300.00, 'test', 'Software Engineering A Practioners Approach', 500, '2015-02-05 14:55:22', 1),
(51, 'Siddur Tefillas Shai ', 'Academic', 'Books', 'Activision', 79.00, 'Siddur', 'Siddur Tefillas Shai ', 56, '2015-04-12 21:52:49', 0),
(52, 'Dell Laptop 10.5', 'laptop', 'Computers', 'Dell', 3000.00, 'new brand of laptops from Dell', 'Dell Laptop 10.5', 45, '2015-04-13 07:41:00', 0),
(53, 'Efes Bwyachasey Enosh', 'Action (Movies)', 'Movies', 'Squarc Enix', 96.00, 'the best Israeli movie ever', 'Efes Bwyachasey Enosh', 56, '2015-04-13 07:42:47', 0),
(54, 'rabbi Asher', 'Academic', 'Books', 'Ubisoft', 55.00, 'Rabbi Asher Melamed ', 'rabbi Asher', 33, '2015-04-19 09:56:49', 6),
(55, 'F&D audio experiance', 'Sound', 'Computers', 'Dell', 250.00, 'a new audio experiance', 'F&D audio experiance', 66, '2015-04-13 07:46:18', 0),
(56, 'Kipot Puzzle', 'Puzzle', 'Games', 'Activision', 65.00, 'Kiput puzzle for Kids', 'Kipot Puzzle', 45, '2015-04-13 22:55:23', 0),
(36, 'Cars Oil Pastel', 'Colors', 'Stationaries', 'Disney', 30.00, 'test 2', 'Cars Oil Pastels', 11, '2015-04-09 14:40:48', 13),
(50, 'Tanach Simanim ', 'Academic', 'Books', 'Activision', 55.00, 'A complete Hebrew Tanach, produced in conjunction with the famed Machon Simanim.\r\nIncludes these features:\r\nClear easy-to-read format, using a specially designed font and large, easy-to-read cantillation symbols (', 'Tanach Simanim ', 33, '2015-04-12 21:43:18', 4),
(48, 'The Agent', 'First Person', 'Games', 'Activision', 27.00, 'A young French boy living with his elderly grandmother in Eretz Yisrael stumbles upon top-secret intelligence hidden in a cookie tin and becomes the only witness to a nefarious string of crimes. Running for his life, he returns to France, only to be pursued by the GSS who seek to discover the whereabouts of this cookie tin - the safety of every deep-cover Mossad agent hanging in the balance - and by evil members of The Black Hand, dangerous gang intent on reaching the boy first and eliminating him. \r\n\r\nMeanwhile, in London, Russian FSB agents plot to abduct a senior chemist and his Mossad contact but their shocking failure inspires the top brass to concoct a scheme that will topple and unveil covert Mossad agent s in Europe. Only a long-ago promise that one young agent pledged to his father on his deathbed has the power to save them all! \r\n\r\nA mother abandoned for her pursuit of truth, a boy who craves Torah, cunning agents and dangerous criminals all converge in this fast-paced novel of suspense and intrigue. Based on real people, facts and missions, The Agent will keep you turning pages until the very end!', 'The Agent', 45, '2015-04-12 21:25:55', 16),
(49, 'Closing Accounts', 'Action', 'Games', 'Activision', 35.00, 'While attending an international conference in Paris, political leader and Palestinian sympathizer, Dan Marom, is mysteriously kidnapped by a radical Moslem cell and released with a warning. Mossad agents rush to uncover the facts, but no one understands why Marom was released unharmed; never has such a group freed a live Jew! \r\n\r\nMeet the mysterious Elyakim Hochberg, a prominent Neturai Karta figure and resident of MeÃ?Â¢??ah SheÃ?Â¢??arim, and IsraelÃ?Â¢??s multi-billionaire benefactor, Fred Bitter, with a secret Nazi past. With whom does he plan to close accounts and what nefarious plans does he have brewing for the Jewish state?\r\n\r\nClosing Accounts is a riveting novel of hair-raising hashgacha pratis and nail-biting suspense. The dynamic, complex plot spans continents and eras, and will propel you, nonstop, toward the staggering conclusion. ', 'Closing Accounts', 54, '2015-04-12 21:27:16', 32);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`sales_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL,
  `sold_on` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `sold_on`, `user_id`) VALUES
(68, 28, 7, 'Prototype 2', 260.00, 1, '2015-04-09 12:55:52', 1),
(69, 29, 49, 'Closing Accounts', 35.00, 1, '2015-04-15 00:23:19', 1),
(70, 30, 48, 'The Agent', 27.00, 1, '2015-04-16 19:31:33', 29),
(71, 31, 50, 'Tanach Simanim ', 55.00, 1, '2015-04-16 21:38:52', 29),
(72, 33, 54, 'rabbi Asher', 55.00, 1, '2015-04-16 23:06:00', 1),
(73, 34, 49, 'Closing Accounts', 35.00, 1, '2015-04-19 09:28:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub-category`
--

CREATE TABLE IF NOT EXISTS `sub-category` (
`subcategory_id` int(10) unsigned NOT NULL,
  `sub-category_name` varchar(30) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub-category`
--

INSERT INTO `sub-category` (`subcategory_id`, `sub-category_name`, `category_name`) VALUES
(1, 'Sandbox', 'Games'),
(2, 'Adventure', 'Games'),
(3, 'Action', 'Games'),
(4, 'Racing', 'Games'),
(5, 'First Person', 'Games'),
(6, 'Sports', 'Games'),
(7, 'Puzzle', 'Games'),
(8, 'Academic', 'Books'),
(9, 'Action (Movies)', 'Movies'),
(10, 'Storage', 'Computers'),
(11, 'Sound', 'Computers'),
(12, 'Colors', 'Stationaries'),
(19, 'laptop', 'Computers'),
(18, 'kodesh', 'Books');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(10) unsigned NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `registeredOn` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `pass`, `registeredOn`) VALUES
(1, 'yosi0679@gmail.com', '9310679', '2015-01-05 12:21:06'),
(2, 'yael1234@gmail.com', '9310679', '2015-01-11 20:32:15'),
(9, 'dov@gmail.com', '9310679', '2015-01-25 18:47:48'),
(26, 'test@test.com', '123456789', '2015-04-15 15:54:53'),
(27, 'test2@test.com', '12345678', '2015-04-15 17:18:21'),
(28, 'test3@gmail.com', '12345678', '2015-04-15 17:20:49'),
(29, 'test4@test.com', '123456789', '2015-04-16 19:15:24'),
(24, 'bluma0679@gmail.com', '12345678', '2015-04-09 11:39:39'),
(25, 'yosi123@qwer.com', '123456789', '2015-04-13 23:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `user-details`
--

CREATE TABLE IF NOT EXISTS `user-details` (
`userDetail_Id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `userImage` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user-details`
--

INSERT INTO `user-details` (`userDetail_Id`, `user_id`, `username`, `mobile_no`, `address`, `gender`, `userImage`) VALUES
(3, 1, 'Yossi Shwartz', '0545306461', 'Nordao 29 ', 'male', ''),
(5, 2, 'Yael', '0582662244', 'Rotshild 25 ', 'female', ''),
(21, 24, 'bluma', '0526459595', 'rotshild 27', 'female', ''),
(25, 29, 'te', '0545626565', 'te', 'female', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
 ADD PRIMARY KEY (`admin_id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`), ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
 ADD PRIMARY KEY (`expenses_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
 ADD PRIMARY KEY (`image-id`), ADD UNIQUE KEY `image-name` (`image-name`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
 ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product-company`
--
ALTER TABLE `product-company`
 ADD PRIMARY KEY (`company-id`), ADD UNIQUE KEY `company-name` (`company-name`), ADD UNIQUE KEY `company-name_2` (`company-name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`product_id`), ADD UNIQUE KEY `product-name` (`product-name`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sub-category`
--
ALTER TABLE `sub-category`
 ADD PRIMARY KEY (`subcategory_id`), ADD UNIQUE KEY `sub-category_name` (`sub-category_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user-details`
--
ALTER TABLE `user-details`
 ADD PRIMARY KEY (`userDetail_Id`), ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_pwd`
--
ALTER TABLE `user_pwd`
 ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
MODIFY `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `category_id` int(255) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
MODIFY `expenses_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
MODIFY `image-id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `product-company`
--
ALTER TABLE `product-company`
MODIFY `company-id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
MODIFY `sales_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `sub-category`
--
ALTER TABLE `sub-category`
MODIFY `subcategory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user-details`
--
ALTER TABLE `user-details`
MODIFY `userDetail_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
