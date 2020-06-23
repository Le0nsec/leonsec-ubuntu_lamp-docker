/*Author:Leon*/
/*Date:2020年6月19日 14:34:31*/
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `message_board`
--
CREATE DATABASE IF NOT EXISTS `message_board` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `message_board`;

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID，主键，自增',
  `message_content` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `id` int(11) NOT NULL COMMENT '留言用户id',
  `message_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '留言用户',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`message_id`, `message_content`, `create_time`, `id`, `message_name`) VALUES
(1, '只有admin才能看到flag', '2020-06-19 14:13:31', 2, 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复id，主键，自增',
  `reply_content` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '回复内容',
  `message_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '留言的用户',
  `create_time` datetime NOT NULL COMMENT '回复时间',
  `message_id` int(11) NOT NULL COMMENT '评论id',
  `id` int(11) NOT NULL COMMENT '回复用户id',
  `reply_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '回复的用户',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;


-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键，自增',
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名，字符串',
  `u5erp4s5` varchar(35) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户创建时间',
  `imgpath` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `u5erp4s5`, `create_time`, `imgpath`) VALUES
(1, 'root', '6bde6cd3b0dfd769bb9ad158ac39eca3', '1534597686', '15922358084039.jpg'),
(2, 'admin', 'd8cc5abb35a63ec0daf013e6e6d59375', '1534598404', '15922359653774.jpg');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*创建管理用户*/
CREATE USER 'message'@'localhost' IDENTIFIED BY 'message';
GRANT ALL ON message_board.* TO 'message'@'localhost';