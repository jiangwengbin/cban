-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2014 年 09 月 03 日 01:57
-- 服务器版本: 5.0.51
-- PHP 版本: 5.2.6

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT=0;
START TRANSACTION;

-- 
-- 数据库: `cban`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_admin`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 03 日 09:34
-- 

DROP TABLE IF EXISTS `cban_admin`;
CREATE TABLE IF NOT EXISTS `cban_admin` (
  `userid` mediumint(6) unsigned NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `password` varchar(32) default NULL,
  `roleid` smallint(5) default '0',
  `encrypt` varchar(6) default NULL,
  `lastloginip` varchar(15) default NULL,
  `lastlogintime` int(10) unsigned default '0',
  `email` varchar(40) default NULL,
  `realname` varchar(50) NOT NULL default '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY  (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `cban_admin`
-- 

INSERT DELAYED IGNORE INTO `cban_admin` (`userid`, `username`, `password`, `roleid`, `encrypt`, `lastloginip`, `lastlogintime`, `email`, `realname`, `card`, `lang`) VALUES 
(1, 'admin', '9e4f7c2cb05d56ed0d33889e6dd8f216', 1, 'tMXppt', '127.0.0.1', 1409706632, '1@qq.com', '', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_admin_panel`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_admin_panel`;
CREATE TABLE IF NOT EXISTS `cban_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `name` char(32) default NULL,
  `url` char(255) default NULL,
  `datetime` int(10) unsigned default '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_admin_panel`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_admin_role`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_admin_role`;
CREATE TABLE IF NOT EXISTS `cban_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL auto_increment,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- 导出表中的数据 `cban_admin_role`
-- 

INSERT DELAYED IGNORE INTO `cban_admin_role` (`roleid`, `rolename`, `description`, `listorder`, `disabled`) VALUES 
(1, '超级管理员', '超级管理员', 0, 0),
(2, '站点管理员', '站点管理员', 0, 0),
(3, '运营总监', '运营总监', 1, 0),
(4, '总编', '总编', 5, 0),
(5, '编辑', '编辑', 1, 0),
(7, '发布人员', '发布人员', 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_admin_role_priv`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_admin_role_priv`;
CREATE TABLE IF NOT EXISTS `cban_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL default '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL default '',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_admin_role_priv`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_announce`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_announce`;
CREATE TABLE IF NOT EXISTS `cban_announce` (
  `aid` smallint(4) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL default '0000-00-00',
  `endtime` date NOT NULL default '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `hits` smallint(5) unsigned NOT NULL default '0',
  `passed` tinyint(1) unsigned NOT NULL default '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY  (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_announce`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_attachment`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 02 日 14:40
-- 

DROP TABLE IF EXISTS `cban_attachment`;
CREATE TABLE IF NOT EXISTS `cban_attachment` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL default '0',
  `isthumb` tinyint(1) unsigned NOT NULL default '0',
  `downloads` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `uploadtime` int(10) unsigned NOT NULL default '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- 
-- 导出表中的数据 `cban_attachment`
-- 

INSERT DELAYED IGNORE INTO `cban_attachment` (`aid`, `module`, `catid`, `filename`, `filepath`, `filesize`, `fileext`, `isimage`, `isthumb`, `downloads`, `userid`, `uploadtime`, `uploadip`, `status`, `authcode`, `siteid`) VALUES 
(15, 'supply_infor', 0, ']1F]~55~8JI0R1C(5VP_%L2.jpg', '2014/0804/20140804095425390.jpg', 29230, 'jpg', 1, 0, 0, 1, 1407117265, '127.0.0.1', 1, 'e98f877c9e4b8cc02f01eea6adf50936', 1),
(16, 'content', 10, 'psb.jpg', '2014/0805/20140805100108135.jpg', 77361, 'jpg', 1, 0, 0, 1, 1407204068, '127.0.0.1', 1, '400c21ff2321f59bb9249d2017319502', 1),
(17, 'content', 10, 'logo_haier.gif', '2014/0805/20140805101359656.gif', 2565, 'gif', 1, 0, 0, 1, 1407204839, '127.0.0.1', 1, '3b7155da15d23927e27b74e01ab42ef0', 1),
(19, 'content', 10, 'logo_gree.gif', '2014/0805/20140805025927232.gif', 2016, 'gif', 1, 0, 0, 1, 1407221967, '127.0.0.1', 1, 'b0a1bbe128963a03ce46eb732245b7e7', 1),
(20, 'content', 10, 'logo_gree.gif', '2014/0806/20140806044014207.gif', 2016, 'gif', 1, 0, 0, 3, 1407314414, '127.0.0.1', 1, 'e5bf6132366f000bb80a90775f7e86d4', 1),
(21, 'content', 10, 'logo_haier.gif', '2014/0806/20140806044014333.gif', 2565, 'gif', 1, 0, 0, 3, 1407314414, '127.0.0.1', 1, '78cb7600ded35776e5b3bd6c0c25a8d3', 1),
(22, 'content', 10, 'logo_tcl.gif', '2014/0806/20140806044015581.gif', 818, 'gif', 1, 0, 0, 3, 1407314415, '127.0.0.1', 1, 'c0988bdec3295bb7ebe06808fe6c9e24', 1),
(23, 'content', 41, ']1F]~55~8JI0R1C(5VP_%L2.jpg', '2014/0902/20140902024000706.jpg', 29230, 'jpg', 1, 0, 0, 1, 1409640000, '127.0.0.1', 1, '054db51835da9ec5805fd540f74343d5', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_attachment_index`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 02 日 14:40
-- 

DROP TABLE IF EXISTS `cban_attachment_index`;
CREATE TABLE IF NOT EXISTS `cban_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_attachment_index`
-- 

INSERT DELAYED IGNORE INTO `cban_attachment_index` (`keyid`, `aid`) VALUES 
('c-10-2', '16'),
('c-10-2', '17'),
('c-10-2', '15'),
('c-10-3', '19'),
('c-10-3', '20'),
('c-10-3', '21'),
('c-10-3', '22'),
('c-44-1', '15'),
('c-44-3', '16'),
('c-9-1', '15'),
('c-41-3', '23');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_badword`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_badword`;
CREATE TABLE IF NOT EXISTS `cban_badword` (
  `badid` smallint(5) unsigned NOT NULL auto_increment,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL default '1',
  `replaceword` char(20) NOT NULL default '0',
  `lastusetime` int(10) unsigned NOT NULL default '0',
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_badword`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_block`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_block`;
CREATE TABLE IF NOT EXISTS `cban_block` (
  `id` int(10) NOT NULL auto_increment,
  `siteid` smallint(5) unsigned default '0',
  `name` char(50) default NULL,
  `pos` char(30) default NULL,
  `type` tinyint(1) default '0',
  `data` text,
  `template` text,
  PRIMARY KEY  (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_block`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_block_history`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_block_history`;
CREATE TABLE IF NOT EXISTS `cban_block_history` (
  `id` int(10) NOT NULL auto_increment,
  `blockid` int(10) unsigned default '0',
  `data` text,
  `creat_at` int(10) unsigned default '0',
  `userid` mediumint(8) unsigned default '0',
  `username` char(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_block_history`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_block_priv`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_block_priv`;
CREATE TABLE IF NOT EXISTS `cban_block_priv` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `roleid` tinyint(3) unsigned default '0',
  `siteid` smallint(5) unsigned default '0',
  `blockid` int(10) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_block_priv`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_cache`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 03 日 09:56
-- 

DROP TABLE IF EXISTS `cban_cache`;
CREATE TABLE IF NOT EXISTS `cban_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY  (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_cache`
-- 

INSERT DELAYED IGNORE INTO `cban_cache` (`filename`, `path`, `data`) VALUES 
('mood_program.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''震惊'',\n      ''pic'' => ''mood/a1.gif'',\n    ),\n    2 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''不解'',\n      ''pic'' => ''mood/a2.gif'',\n    ),\n    3 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''愤怒'',\n      ''pic'' => ''mood/a3.gif'',\n    ),\n    4 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''杯具'',\n      ''pic'' => ''mood/a4.gif'',\n    ),\n    5 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''无聊'',\n      ''pic'' => ''mood/a5.gif'',\n    ),\n    6 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''高兴'',\n      ''pic'' => ''mood/a6.gif'',\n    ),\n    7 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''支持'',\n      ''pic'' => ''mood/a7.gif'',\n    ),\n    8 => \n    array (\n      ''use'' => ''1'',\n      ''name'' => ''超赞'',\n      ''pic'' => ''mood/a8.gif'',\n    ),\n    9 => \n    array (\n      ''use'' => NULL,\n      ''name'' => '''',\n      ''pic'' => '''',\n    ),\n    10 => \n    array (\n      ''use'' => NULL,\n      ''name'' => '''',\n      ''pic'' => '''',\n    ),\n  ),\n);\n?>'),
('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  41 => ''1'',\n  44 => ''1'',\n  11 => ''1'',\n  12 => ''1'',\n  46 => ''1'',\n  47 => ''1'',\n  48 => ''1'',\n  9 => ''1'',\n  10 => ''1'',\n);\n?>'),
('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  41 => \n  array (\n    ''catid'' => ''41'',\n    ''siteid'' => ''1'',\n    ''type'' => ''0'',\n    ''modelid'' => ''1'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => ''0'',\n    ''child'' => ''0'',\n    ''arrchildid'' => ''41'',\n    ''catname'' => ''行业资讯'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => ''hyzx'',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=41'',\n    ''items'' => ''3'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''workflowid\\'' => \\''\\'',\n  \\''ishtml\\'' => \\''0\\'',\n  \\''content_ishtml\\'' => \\''0\\'',\n  \\''create_to_html_root\\'' => \\''0\\'',\n  \\''template_list\\'' => \\''cban\\'',\n  \\''category_template\\'' => \\''category\\'',\n  \\''list_template\\'' => \\''list_hyzx\\'',\n  \\''show_template\\'' => \\''show\\'',\n  \\''meta_title\\'' => \\''\\'',\n  \\''meta_keywords\\'' => \\''\\'',\n  \\''meta_description\\'' => \\''\\'',\n  \\''presentpoint\\'' => \\''1\\'',\n  \\''defaultchargepoint\\'' => \\''0\\'',\n  \\''paytype\\'' => \\''0\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n  \\''category_ruleid\\'' => \\''6\\'',\n  \\''show_ruleid\\'' => \\''16\\'',\n)'',\n    ''listorder'' => ''1'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => ''xingyezixun'',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => ''0'',\n    ''ishtml'' => ''0'',\n    ''content_ishtml'' => ''0'',\n    ''category_ruleid'' => ''6'',\n    ''show_ruleid'' => ''16'',\n    ''workflowid'' => '''',\n    ''isdomain'' => ''0'',\n  ),\n  44 => \n  array (\n    ''catid'' => ''44'',\n    ''siteid'' => ''1'',\n    ''type'' => ''0'',\n    ''modelid'' => ''17'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => ''0'',\n    ''child'' => ''0'',\n    ''arrchildid'' => ''44'',\n    ''catname'' => ''展会信息'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => ''zhxx'',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=44'',\n    ''items'' => ''3'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''workflowid\\'' => \\''1\\'',\n  \\''ishtml\\'' => \\''0\\'',\n  \\''content_ishtml\\'' => \\''0\\'',\n  \\''create_to_html_root\\'' => \\''0\\'',\n  \\''template_list\\'' => \\''cban\\'',\n  \\''category_template\\'' => \\''category\\'',\n  \\''list_template\\'' => \\''list_zhxx\\'',\n  \\''show_template\\'' => \\''show_zhxx\\'',\n  \\''meta_title\\'' => \\''\\'',\n  \\''meta_keywords\\'' => \\''\\'',\n  \\''meta_description\\'' => \\''\\'',\n  \\''presentpoint\\'' => \\''1\\'',\n  \\''defaultchargepoint\\'' => \\''0\\'',\n  \\''paytype\\'' => \\''0\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n  \\''category_ruleid\\'' => \\''6\\'',\n  \\''show_ruleid\\'' => \\''16\\'',\n)'',\n    ''listorder'' => ''2'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => ''zhanhuixinxi'',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => ''0'',\n    ''ishtml'' => ''0'',\n    ''content_ishtml'' => ''0'',\n    ''category_ruleid'' => ''6'',\n    ''show_ruleid'' => ''16'',\n    ''workflowid'' => ''1'',\n    ''isdomain'' => ''0'',\n  ),\n  11 => \n  array (\n    ''catid'' => ''11'',\n    ''siteid'' => ''1'',\n    ''type'' => ''2'',\n    ''modelid'' => ''0'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => '''',\n    ''child'' => ''0'',\n    ''arrchildid'' => '''',\n    ''catname'' => ''千县万店'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => '''',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=cban&c=index&a=qxwd'',\n    ''items'' => ''0'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''show_ruleid\\'' => \\''\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n)'',\n    ''listorder'' => ''4'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => '''',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => NULL,\n    ''ishtml'' => NULL,\n    ''content_ishtml'' => NULL,\n    ''category_ruleid'' => NULL,\n    ''show_ruleid'' => '''',\n    ''workflowid'' => NULL,\n    ''isdomain'' => ''0'',\n  ),\n  12 => \n  array (\n    ''catid'' => ''12'',\n    ''siteid'' => ''1'',\n    ''type'' => ''2'',\n    ''modelid'' => ''0'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => '''',\n    ''child'' => ''0'',\n    ''arrchildid'' => '''',\n    ''catname'' => ''家电名企'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => '''',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=cban&c=index&a=jdmq'',\n    ''items'' => ''0'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''show_ruleid\\'' => \\''\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n)'',\n    ''listorder'' => ''6'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => '''',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => NULL,\n    ''ishtml'' => NULL,\n    ''content_ishtml'' => NULL,\n    ''category_ruleid'' => NULL,\n    ''show_ruleid'' => '''',\n    ''workflowid'' => NULL,\n    ''isdomain'' => ''0'',\n  ),\n  46 => \n  array (\n    ''catid'' => ''46'',\n    ''siteid'' => ''1'',\n    ''type'' => ''2'',\n    ''modelid'' => ''0'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => '''',\n    ''child'' => ''0'',\n    ''arrchildid'' => '''',\n    ''catname'' => ''商机资讯'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => '''',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=cban&c=index&a=supply'',\n    ''items'' => ''0'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''show_ruleid\\'' => \\''\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n)'',\n    ''listorder'' => ''7'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => '''',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => NULL,\n    ''ishtml'' => NULL,\n    ''content_ishtml'' => NULL,\n    ''category_ruleid'' => NULL,\n    ''show_ruleid'' => '''',\n    ''workflowid'' => NULL,\n    ''isdomain'' => ''0'',\n  ),\n  47 => \n  array (\n    ''catid'' => ''47'',\n    ''siteid'' => ''1'',\n    ''type'' => ''2'',\n    ''modelid'' => ''0'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => '''',\n    ''child'' => ''0'',\n    ''arrchildid'' => '''',\n    ''catname'' => ''家电维修'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => '''',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=cban&c=index&a=jdwx'',\n    ''items'' => ''0'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''show_ruleid\\'' => \\''\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n)'',\n    ''listorder'' => ''8'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => '''',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => NULL,\n    ''ishtml'' => NULL,\n    ''content_ishtml'' => NULL,\n    ''category_ruleid'' => NULL,\n    ''show_ruleid'' => '''',\n    ''workflowid'' => NULL,\n    ''isdomain'' => ''0'',\n  ),\n  48 => \n  array (\n    ''catid'' => ''48'',\n    ''siteid'' => ''1'',\n    ''type'' => ''2'',\n    ''modelid'' => ''0'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => '''',\n    ''child'' => ''0'',\n    ''arrchildid'' => '''',\n    ''catname'' => ''会员中心'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => '''',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=member&c=index'',\n    ''items'' => ''0'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''show_ruleid\\'' => \\''\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n)'',\n    ''listorder'' => ''10'',\n    ''ismenu'' => ''1'',\n    ''sethtml'' => ''0'',\n    ''letter'' => '''',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => NULL,\n    ''ishtml'' => NULL,\n    ''content_ishtml'' => NULL,\n    ''category_ruleid'' => NULL,\n    ''show_ruleid'' => '''',\n    ''workflowid'' => NULL,\n    ''isdomain'' => ''0'',\n  ),\n  9 => \n  array (\n    ''catid'' => ''9'',\n    ''siteid'' => ''1'',\n    ''type'' => ''0'',\n    ''modelid'' => ''15'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => ''0'',\n    ''child'' => ''0'',\n    ''arrchildid'' => ''9'',\n    ''catname'' => ''门店信息发布'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => ''mdxxfb'',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=9'',\n    ''items'' => ''1'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''workflowid\\'' => \\''1\\'',\n  \\''ishtml\\'' => \\''0\\'',\n  \\''content_ishtml\\'' => \\''0\\'',\n  \\''create_to_html_root\\'' => \\''0\\'',\n  \\''template_list\\'' => \\''cban\\'',\n  \\''category_template\\'' => \\''category\\'',\n  \\''list_template\\'' => \\''\\'',\n  \\''show_template\\'' => \\''show\\'',\n  \\''meta_title\\'' => \\''\\'',\n  \\''meta_keywords\\'' => \\''\\'',\n  \\''meta_description\\'' => \\''\\'',\n  \\''presentpoint\\'' => \\''1\\'',\n  \\''defaultchargepoint\\'' => \\''0\\'',\n  \\''paytype\\'' => \\''0\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n  \\''category_ruleid\\'' => \\''6\\'',\n  \\''show_ruleid\\'' => \\''16\\'',\n)'',\n    ''listorder'' => ''19'',\n    ''ismenu'' => ''0'',\n    ''sethtml'' => ''0'',\n    ''letter'' => ''mendianxinxifabu'',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => ''0'',\n    ''ishtml'' => ''0'',\n    ''content_ishtml'' => ''0'',\n    ''category_ruleid'' => ''6'',\n    ''show_ruleid'' => ''16'',\n    ''workflowid'' => ''1'',\n    ''isdomain'' => ''0'',\n  ),\n  10 => \n  array (\n    ''catid'' => ''10'',\n    ''siteid'' => ''1'',\n    ''type'' => ''0'',\n    ''modelid'' => ''16'',\n    ''parentid'' => ''0'',\n    ''arrparentid'' => ''0'',\n    ''child'' => ''0'',\n    ''arrchildid'' => ''10'',\n    ''catname'' => ''企业信息发布'',\n    ''style'' => '''',\n    ''image'' => '''',\n    ''description'' => '''',\n    ''parentdir'' => '''',\n    ''catdir'' => ''qyxxfb'',\n    ''url'' => ''http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=10'',\n    ''items'' => ''2'',\n    ''hits'' => ''0'',\n    ''setting'' => ''array (\n  \\''workflowid\\'' => \\''1\\'',\n  \\''ishtml\\'' => \\''0\\'',\n  \\''content_ishtml\\'' => \\''0\\'',\n  \\''create_to_html_root\\'' => \\''0\\'',\n  \\''template_list\\'' => \\''cban\\'',\n  \\''category_template\\'' => \\''category\\'',\n  \\''list_template\\'' => \\''list\\'',\n  \\''show_template\\'' => \\''show\\'',\n  \\''meta_title\\'' => \\''\\'',\n  \\''meta_keywords\\'' => \\''\\'',\n  \\''meta_description\\'' => \\''\\'',\n  \\''presentpoint\\'' => \\''1\\'',\n  \\''defaultchargepoint\\'' => \\''0\\'',\n  \\''paytype\\'' => \\''0\\'',\n  \\''repeatchargedays\\'' => \\''1\\'',\n  \\''category_ruleid\\'' => \\''6\\'',\n  \\''show_ruleid\\'' => \\''16\\'',\n)'',\n    ''listorder'' => ''20'',\n    ''ismenu'' => ''0'',\n    ''sethtml'' => ''0'',\n    ''letter'' => ''qiyexinxifabu'',\n    ''usable_type'' => '''',\n    ''create_to_html_root'' => ''0'',\n    ''ishtml'' => ''0'',\n    ''content_ishtml'' => ''0'',\n    ''category_ruleid'' => ''6'',\n    ''show_ruleid'' => ''16'',\n    ''workflowid'' => ''1'',\n    ''isdomain'' => ''0'',\n  ),\n);\n?>'),
('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''siteid'' => ''1'',\n    ''name'' => ''默认站点'',\n    ''dirname'' => '''',\n    ''domain'' => ''http://127.0.0.1:8080/cban/'',\n    ''site_title'' => ''CBAN中国家电品牌门户网站'',\n    ''keywords'' => ''中国家电品牌,家电门户网站,各种家电'',\n    ''description'' => ''CBAN是中国第一家家电品牌门户网站，其中包含各种品牌家电，维修，销售等'',\n    ''release_point'' => '''',\n    ''default_style'' => ''cban'',\n    ''template'' => ''cban'',\n    ''setting'' => ''array (\n  \\''upload_maxsize\\'' => \\''2048\\'',\n  \\''upload_allowext\\'' => \\''jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\'',\n  \\''watermark_enable\\'' => \\''1\\'',\n  \\''watermark_minwidth\\'' => \\''300\\'',\n  \\''watermark_minheight\\'' => \\''300\\'',\n  \\''watermark_img\\'' => \\''statics/images/water//mark.png\\'',\n  \\''watermark_pct\\'' => \\''85\\'',\n  \\''watermark_quality\\'' => \\''80\\'',\n  \\''watermark_pos\\'' => \\''9\\'',\n)'',\n    ''uuid'' => ''66e1d6e9-6219-1032-ab4c-ef7167b14131'',\n    ''url'' => ''http://127.0.0.1:8080/cban/'',\n  ),\n);\n?>'),
('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>'),
('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''posid'' => ''1'',\n    ''modelid'' => ''0'',\n    ''catid'' => ''0'',\n    ''name'' => ''首页焦点图推荐'',\n    ''maxnum'' => ''20'',\n    ''extention'' => NULL,\n    ''listorder'' => ''99'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  2 => \n  array (\n    ''posid'' => ''2'',\n    ''modelid'' => ''0'',\n    ''catid'' => ''0'',\n    ''name'' => ''首页头条推荐'',\n    ''maxnum'' => ''20'',\n    ''extention'' => NULL,\n    ''listorder'' => ''99'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  9 => \n  array (\n    ''posid'' => ''9'',\n    ''modelid'' => ''0'',\n    ''catid'' => ''0'',\n    ''name'' => ''网站顶部推荐'',\n    ''maxnum'' => ''20'',\n    ''extention'' => NULL,\n    ''listorder'' => ''99'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  12 => \n  array (\n    ''posid'' => ''12'',\n    ''modelid'' => ''0'',\n    ''catid'' => ''0'',\n    ''name'' => ''首页图片推荐'',\n    ''maxnum'' => ''20'',\n    ''extention'' => NULL,\n    ''listorder'' => ''99'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  29 => \n  array (\n    ''posid'' => ''29'',\n    ''modelid'' => ''1'',\n    ''catid'' => ''41'',\n    ''name'' => ''行业资讯_推荐图片新闻'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''11'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  28 => \n  array (\n    ''posid'' => ''28'',\n    ''modelid'' => ''1'',\n    ''catid'' => ''41'',\n    ''name'' => ''行业资讯_综合排行'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''10'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  27 => \n  array (\n    ''posid'' => ''27'',\n    ''modelid'' => ''1'',\n    ''catid'' => ''41'',\n    ''name'' => ''行业资讯_新闻点击排行'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''9'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  26 => \n  array (\n    ''posid'' => ''26'',\n    ''modelid'' => ''15'',\n    ''catid'' => ''0'',\n    ''name'' => ''家电维修_维修网点图片'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''8'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  25 => \n  array (\n    ''posid'' => ''25'',\n    ''modelid'' => ''15'',\n    ''catid'' => ''0'',\n    ''name'' => ''家电维修_新加维修网点'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''7'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  24 => \n  array (\n    ''posid'' => ''24'',\n    ''modelid'' => ''15'',\n    ''catid'' => ''9'',\n    ''name'' => ''千县万店_门店图片'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''6'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  23 => \n  array (\n    ''posid'' => ''23'',\n    ''modelid'' => ''15'',\n    ''catid'' => ''9'',\n    ''name'' => ''千县万店_新加门店'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''5'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  22 => \n  array (\n    ''posid'' => ''22'',\n    ''modelid'' => ''17'',\n    ''catid'' => ''44'',\n    ''name'' => ''展会信息_展会图片资讯'',\n    ''maxnum'' => ''4'',\n    ''extention'' => '''',\n    ''listorder'' => ''4'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  21 => \n  array (\n    ''posid'' => ''21'',\n    ''modelid'' => ''17'',\n    ''catid'' => ''44'',\n    ''name'' => ''展会信息_热点展会排行'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''3'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  20 => \n  array (\n    ''posid'' => ''20'',\n    ''modelid'' => ''16'',\n    ''catid'' => ''10'',\n    ''name'' => ''家电名企_最新入驻家电企业'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''2'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n  19 => \n  array (\n    ''posid'' => ''19'',\n    ''modelid'' => ''16'',\n    ''catid'' => ''10'',\n    ''name'' => ''家电名企_本月热门家电厂商'',\n    ''maxnum'' => ''20'',\n    ''extention'' => '''',\n    ''listorder'' => ''1'',\n    ''siteid'' => ''1'',\n    ''thumb'' => '''',\n  ),\n);\n?>'),
('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => ''超级管理员'',\n  2 => ''站点管理员'',\n  3 => ''运营总监'',\n  4 => ''总编'',\n  5 => ''编辑'',\n  7 => ''发布人员'',\n);\n?>'),
('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''urlruleid'' => ''1'',\n    ''module'' => ''content'',\n    ''file'' => ''category'',\n    ''ishtml'' => ''1'',\n    ''urlrule'' => ''{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html'',\n    ''example'' => ''news/china/1000.html'',\n  ),\n  6 => \n  array (\n    ''urlruleid'' => ''6'',\n    ''module'' => ''content'',\n    ''file'' => ''category'',\n    ''ishtml'' => ''0'',\n    ''urlrule'' => ''index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}'',\n    ''example'' => ''index.php?m=content&c=index&a=lists&catid=1&page=1'',\n  ),\n  11 => \n  array (\n    ''urlruleid'' => ''11'',\n    ''module'' => ''content'',\n    ''file'' => ''show'',\n    ''ishtml'' => ''1'',\n    ''urlrule'' => ''{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html'',\n    ''example'' => ''2010/catdir_0720/1_2.html'',\n  ),\n  12 => \n  array (\n    ''urlruleid'' => ''12'',\n    ''module'' => ''content'',\n    ''file'' => ''show'',\n    ''ishtml'' => ''1'',\n    ''urlrule'' => ''{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html'',\n    ''example'' => ''it/product/2010/0720/1_2.html'',\n  ),\n  16 => \n  array (\n    ''urlruleid'' => ''16'',\n    ''module'' => ''content'',\n    ''file'' => ''show'',\n    ''ishtml'' => ''0'',\n    ''urlrule'' => ''index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}'',\n    ''example'' => ''index.php?m=content&c=index&a=show&catid=1&id=1'',\n  ),\n  17 => \n  array (\n    ''urlruleid'' => ''17'',\n    ''module'' => ''content'',\n    ''file'' => ''show'',\n    ''ishtml'' => ''0'',\n    ''urlrule'' => ''show-{$catid}-{$id}-{$page}.html'',\n    ''example'' => ''show-1-2-1.html'',\n  ),\n  18 => \n  array (\n    ''urlruleid'' => ''18'',\n    ''module'' => ''content'',\n    ''file'' => ''show'',\n    ''ishtml'' => ''0'',\n    ''urlrule'' => ''content-{$catid}-{$id}-{$page}.html'',\n    ''example'' => ''content-1-2-1.html'',\n  ),\n  30 => \n  array (\n    ''urlruleid'' => ''30'',\n    ''module'' => ''content'',\n    ''file'' => ''category'',\n    ''ishtml'' => ''0'',\n    ''urlrule'' => ''list-{$catid}-{$page}.html'',\n    ''example'' => ''list-1-1.html'',\n  ),\n);\n?>'),
('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => ''{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html'',\n  6 => ''index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}'',\n  11 => ''{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html'',\n  12 => ''{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html'',\n  16 => ''index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}'',\n  17 => ''show-{$catid}-{$id}-{$page}.html'',\n  18 => ''content-{$catid}-{$id}-{$page}.html'',\n  30 => ''list-{$catid}-{$page}.html'',\n);\n?>'),
('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  ''admin'' => \n  array (\n    ''module'' => ''admin'',\n    ''name'' => ''admin'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => ''array (\n  \\''admin_email\\'' => \\''phpcms@phpcms.cn\\'',\n  \\''maxloginfailedtimes\\'' => \\''8\\'',\n  \\''minrefreshtime\\'' => \\''2\\'',\n  \\''mail_type\\'' => \\''1\\'',\n  \\''mail_server\\'' => \\''smtp.qq.com\\'',\n  \\''mail_port\\'' => \\''25\\'',\n  \\''category_ajax\\'' => \\''0\\'',\n  \\''mail_user\\'' => \\''phpcms.cn@foxmail.com\\'',\n  \\''mail_auth\\'' => \\''1\\'',\n  \\''mail_from\\'' => \\''phpcms.cn@foxmail.com\\'',\n  \\''mail_password\\'' => \\''123456\\'',\n  \\''errorlog_size\\'' => \\''20\\'',\n)'',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-10-18'',\n    ''updatedate'' => ''2010-10-18'',\n  ),\n  ''member'' => \n  array (\n    ''module'' => ''member'',\n    ''name'' => ''会员'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => ''array (\n  \\''allowregister\\'' => \\''1\\'',\n  \\''choosemodel\\'' => \\''1\\'',\n  \\''enablemailcheck\\'' => \\''0\\'',\n  \\''enablcodecheck\\'' => \\''0\\'',\n  \\''mobile_checktype\\'' => \\''0\\'',\n  \\''user_sendsms_title\\'' => \\''\\'',\n  \\''registerverify\\'' => \\''1\\'',\n  \\''showapppoint\\'' => \\''0\\'',\n  \\''rmb_point_rate\\'' => \\''10\\'',\n  \\''defualtpoint\\'' => \\''0\\'',\n  \\''defualtamount\\'' => \\''0\\'',\n  \\''showregprotocol\\'' => \\''0\\'',\n  \\''regprotocol\\'' => \\''		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\'',\n  \\''registerverifymessage\\'' => \\'' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\'',\n  \\''forgetpassword\\'' => \\'' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\'',\n)'',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''pay'' => \n  array (\n    ''module'' => ''pay'',\n    ''name'' => ''支付'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''digg'' => \n  array (\n    ''module'' => ''digg'',\n    ''name'' => ''顶一下'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''special'' => \n  array (\n    ''module'' => ''special'',\n    ''name'' => ''专题'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''content'' => \n  array (\n    ''module'' => ''content'',\n    ''name'' => ''内容模块'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''search'' => \n  array (\n    ''module'' => ''search'',\n    ''name'' => ''全站搜索'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => ''array (\n  \\''fulltextenble\\'' => \\''1\\'',\n  \\''relationenble\\'' => \\''1\\'',\n  \\''suggestenable\\'' => \\''1\\'',\n  \\''sphinxenable\\'' => \\''0\\'',\n  \\''sphinxhost\\'' => \\''10.228.134.102\\'',\n  \\''sphinxport\\'' => \\''9312\\'',\n)'',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''scan'' => \n  array (\n    ''module'' => ''scan'',\n    ''name'' => ''木马扫描'',\n    ''url'' => ''scan'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''attachment'' => \n  array (\n    ''module'' => ''attachment'',\n    ''name'' => ''附件'',\n    ''url'' => ''attachment'',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''block'' => \n  array (\n    ''module'' => ''block'',\n    ''name'' => ''碎片'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''collection'' => \n  array (\n    ''module'' => ''collection'',\n    ''name'' => ''采集模块'',\n    ''url'' => ''collection'',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''dbsource'' => \n  array (\n    ''module'' => ''dbsource'',\n    ''name'' => ''数据源'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => '''',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''template'' => \n  array (\n    ''module'' => ''template'',\n    ''name'' => ''模板风格'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''release'' => \n  array (\n    ''module'' => ''release'',\n    ''name'' => ''发布点'',\n    ''url'' => '''',\n    ''iscore'' => ''1'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-01'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''video'' => \n  array (\n    ''module'' => ''video'',\n    ''name'' => ''视频库'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2012-09-28'',\n    ''updatedate'' => ''2012-09-28'',\n  ),\n  ''announce'' => \n  array (\n    ''module'' => ''announce'',\n    ''name'' => ''公告'',\n    ''url'' => ''announce/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''公告'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-21'',\n    ''updatedate'' => ''2014-07-21'',\n  ),\n  ''comment'' => \n  array (\n    ''module'' => ''comment'',\n    ''name'' => ''评论'',\n    ''url'' => ''comment/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''评论'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-21'',\n    ''updatedate'' => ''2014-07-21'',\n  ),\n  ''link'' => \n  array (\n    ''module'' => ''link'',\n    ''name'' => ''友情链接'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => ''array (\n  1 => \n  array (\n    \\''is_post\\'' => \\''1\\'',\n    \\''enablecheckcode\\'' => \\''0\\'',\n  ),\n)'',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''vote'' => \n  array (\n    ''module'' => ''vote'',\n    ''name'' => ''投票'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => ''array (\r\n  1 => \r\n  array (\r\n    \\''default_style\\'' => \\''default\\'',\r\n    \\''vote_tp_template\\'' => \\''vote_tp\\'',\r\n    \\''allowguest\\'' => \\''1\\'',\r\n    \\''enabled\\'' => \\''1\\'',\r\n    \\''interval\\'' => \\''1\\'',\r\n    \\''credit\\'' => \\''1\\'',\r\n  ),\r\n)'',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''message'' => \n  array (\n    ''module'' => ''message'',\n    ''name'' => ''短消息'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-09-06'',\n    ''updatedate'' => ''2010-09-06'',\n  ),\n  ''mood'' => \n  array (\n    ''module'' => ''mood'',\n    ''name'' => ''新闻心情'',\n    ''url'' => ''mood/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''新闻心情'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-21'',\n    ''updatedate'' => ''2014-07-21'',\n  ),\n  ''poster'' => \n  array (\n    ''module'' => ''poster'',\n    ''name'' => ''广告模块'',\n    ''url'' => ''poster/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''广告模块'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-21'',\n    ''updatedate'' => ''2014-07-21'',\n  ),\n  ''formguide'' => \n  array (\n    ''module'' => ''formguide'',\n    ''name'' => ''表单向导'',\n    ''url'' => ''formguide/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''formguide'',\n    ''setting'' => ''array (\n  \\''allowmultisubmit\\'' => \\''1\\'',\n  \\''interval\\'' => \\''30\\'',\n  \\''allowunreg\\'' => \\''0\\'',\n  \\''mailmessage\\'' => \\''用户向我们提交了表单数据，赶快去看看吧。\\'',\n)'',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2010-10-20'',\n    ''updatedate'' => ''2010-10-20'',\n  ),\n  ''wap'' => \n  array (\n    ''module'' => ''wap'',\n    ''name'' => ''手机门户'',\n    ''url'' => ''wap/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''手机门户'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-21'',\n    ''updatedate'' => ''2014-07-21'',\n  ),\n  ''upgrade'' => \n  array (\n    ''module'' => ''upgrade'',\n    ''name'' => ''在线升级'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2011-05-18'',\n    ''updatedate'' => ''2011-05-18'',\n  ),\n  ''tag'' => \n  array (\n    ''module'' => ''tag'',\n    ''name'' => ''标签向导'',\n    ''url'' => ''tag/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''标签向导'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-21'',\n    ''updatedate'' => ''2014-07-21'',\n  ),\n  ''sms'' => \n  array (\n    ''module'' => ''sms'',\n    ''name'' => ''短信平台'',\n    ''url'' => ''sms/'',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => ''短信平台'',\n    ''setting'' => '''',\n    ''listorder'' => ''0'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2011-09-02'',\n    ''updatedate'' => ''2011-09-02'',\n  ),\n  ''supply_infor'' => \n  array (\n    ''module'' => ''supply_infor'',\n    ''name'' => ''商机信息'',\n    ''url'' => '''',\n    ''iscore'' => ''0'',\n    ''version'' => ''1.0'',\n    ''description'' => '''',\n    ''setting'' => '''',\n    ''listorder'' => ''1'',\n    ''disabled'' => ''0'',\n    ''installdate'' => ''2014-07-29'',\n    ''updatedate'' => ''2014-07-29'',\n  ),\n);\n?>'),
('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''modelid'' => ''1'',\n    ''siteid'' => ''1'',\n    ''name'' => ''文章模型'',\n    ''description'' => '''',\n    ''tablename'' => ''news'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => ''default'',\n    ''category_template'' => ''category'',\n    ''list_template'' => ''list'',\n    ''show_template'' => ''show'',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n  2 => \n  array (\n    ''modelid'' => ''2'',\n    ''siteid'' => ''1'',\n    ''name'' => ''下载模型'',\n    ''description'' => '''',\n    ''tablename'' => ''download'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => ''default'',\n    ''category_template'' => ''category_download'',\n    ''list_template'' => ''list_download'',\n    ''show_template'' => ''show_download'',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n  3 => \n  array (\n    ''modelid'' => ''3'',\n    ''siteid'' => ''1'',\n    ''name'' => ''图片模型'',\n    ''description'' => '''',\n    ''tablename'' => ''picture'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => ''default'',\n    ''category_template'' => ''category_picture'',\n    ''list_template'' => ''list_picture'',\n    ''show_template'' => ''show_picture'',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n  11 => \n  array (\n    ''modelid'' => ''11'',\n    ''siteid'' => ''1'',\n    ''name'' => ''视频模型'',\n    ''description'' => '''',\n    ''tablename'' => ''video'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => ''default'',\n    ''category_template'' => ''category_video'',\n    ''list_template'' => ''list_video'',\n    ''show_template'' => ''show_video'',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n  15 => \n  array (\n    ''modelid'' => ''15'',\n    ''siteid'' => ''1'',\n    ''name'' => ''门店信息模型'',\n    ''description'' => ''用户发布门店信息'',\n    ''tablename'' => ''news_md'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => ''cban'',\n    ''category_template'' => ''category'',\n    ''list_template'' => ''list'',\n    ''show_template'' => ''show'',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n  16 => \n  array (\n    ''modelid'' => ''16'',\n    ''siteid'' => ''1'',\n    ''name'' => ''企业信息模型'',\n    ''description'' => ''用户发布企业信息'',\n    ''tablename'' => ''news_qy'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => ''cban'',\n    ''category_template'' => ''category'',\n    ''list_template'' => ''list'',\n    ''show_template'' => ''show'',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n  17 => \n  array (\n    ''modelid'' => ''17'',\n    ''siteid'' => ''1'',\n    ''name'' => ''展会信息模型'',\n    ''description'' => '''',\n    ''tablename'' => ''news_zhxx'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => '''',\n    ''category_template'' => '''',\n    ''list_template'' => '''',\n    ''show_template'' => '''',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''0'',\n    ''type'' => ''0'',\n  ),\n);\n?>'),
('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''workflowid'' => ''1'',\n    ''siteid'' => ''1'',\n    ''steps'' => ''1'',\n    ''workname'' => ''一级审核'',\n    ''description'' => ''审核一次'',\n    ''setting'' => '''',\n    ''flag'' => ''0'',\n  ),\n  2 => \n  array (\n    ''workflowid'' => ''2'',\n    ''siteid'' => ''1'',\n    ''steps'' => ''2'',\n    ''workname'' => ''二级审核'',\n    ''description'' => ''审核两次'',\n    ''setting'' => '''',\n    ''flag'' => ''0'',\n  ),\n  3 => \n  array (\n    ''workflowid'' => ''3'',\n    ''siteid'' => ''1'',\n    ''steps'' => ''3'',\n    ''workname'' => ''三级审核'',\n    ''description'' => ''审核三次'',\n    ''setting'' => '''',\n    ''flag'' => ''0'',\n  ),\n  4 => \n  array (\n    ''workflowid'' => ''4'',\n    ''siteid'' => ''1'',\n    ''steps'' => ''4'',\n    ''workname'' => ''四级审核'',\n    ''description'' => ''四级审核'',\n    ''setting'' => '''',\n    ''flag'' => ''0'',\n  ),\n);\n?>');
INSERT DELAYED IGNORE INTO `cban_cache` (`filename`, `path`, `data`) VALUES 
('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    ''modelid'' => ''10'',\n    ''siteid'' => ''1'',\n    ''name'' => ''普通会员'',\n    ''description'' => ''普通会员'',\n    ''tablename'' => ''member_detail'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => '''',\n    ''category_template'' => '''',\n    ''list_template'' => '''',\n    ''show_template'' => '''',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''1'',\n    ''type'' => ''2'',\n  ),\n  12 => \n  array (\n    ''modelid'' => ''12'',\n    ''siteid'' => ''1'',\n    ''name'' => ''门店会员'',\n    ''description'' => ''门店会员'',\n    ''tablename'' => ''member_md'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => '''',\n    ''category_template'' => '''',\n    ''list_template'' => '''',\n    ''show_template'' => '''',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''2'',\n    ''type'' => ''2'',\n  ),\n  13 => \n  array (\n    ''modelid'' => ''13'',\n    ''siteid'' => ''1'',\n    ''name'' => ''企业会员'',\n    ''description'' => ''企业会员'',\n    ''tablename'' => ''member_qy'',\n    ''setting'' => '''',\n    ''addtime'' => ''0'',\n    ''items'' => ''0'',\n    ''enablesearch'' => ''1'',\n    ''disabled'' => ''0'',\n    ''default_style'' => '''',\n    ''category_template'' => '''',\n    ''list_template'' => '''',\n    ''show_template'' => '''',\n    ''js_template'' => '''',\n    ''admin_list_template'' => '''',\n    ''member_add_template'' => '''',\n    ''member_list_template'' => '''',\n    ''sort'' => ''3'',\n    ''type'' => ''2'',\n  ),\n);\n?>'),
('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  ''admin_email'' => ''phpcms@phpcms.cn'',\n  ''maxloginfailedtimes'' => ''8'',\n  ''minrefreshtime'' => ''2'',\n  ''mail_type'' => ''1'',\n  ''mail_server'' => ''smtp.qq.com'',\n  ''mail_port'' => ''25'',\n  ''category_ajax'' => ''0'',\n  ''mail_user'' => ''phpcms.cn@foxmail.com'',\n  ''mail_auth'' => ''1'',\n  ''mail_from'' => ''phpcms.cn@foxmail.com'',\n  ''mail_password'' => ''123456'',\n  ''errorlog_size'' => ''20'',\n);\n?>'),
('category_items_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  41 => ''3'',\n);\n?>'),
('category_items_2.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('category_items_3.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('category_items_11.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('type_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('vote.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''default_style'' => ''default'',\n    ''vote_tp_template'' => ''vote_tp'',\n    ''allowguest'' => ''1'',\n    ''enabled'' => ''1'',\n    ''interval'' => ''1'',\n    ''credit'' => ''1'',\n  ),\n);\n?>'),
('link.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    ''is_post'' => ''1'',\n    ''enablecheckcode'' => ''0'',\n  ),\n);\n?>'),
('type_.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('category_items_15.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  9 => ''1'',\n);\n?>'),
('category_items_16.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => ''2'',\n);\n?>'),
('type_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>'),
('category_items_17.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  44 => ''3'',\n);\n?>');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_category`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 02 日 15:06
-- 

DROP TABLE IF EXISTS `cban_category`;
CREATE TABLE IF NOT EXISTS `cban_category` (
  `catid` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `modelid` smallint(5) unsigned NOT NULL default '0',
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL default '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `ismenu` tinyint(1) unsigned NOT NULL default '1',
  `sethtml` tinyint(1) unsigned NOT NULL default '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY  (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- 
-- 导出表中的数据 `cban_category`
-- 

INSERT DELAYED IGNORE INTO `cban_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES 
(41, 1, 'content', 0, 1, 0, '0', 0, '41', '行业资讯', '', '', '', '', 'hyzx', 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=41', 3, 0, 'array (\n  ''workflowid'' => '''',\n  ''ishtml'' => ''0'',\n  ''content_ishtml'' => ''0'',\n  ''create_to_html_root'' => ''0'',\n  ''template_list'' => ''cban'',\n  ''category_template'' => ''category'',\n  ''list_template'' => ''list_hyzx'',\n  ''show_template'' => ''show'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''presentpoint'' => ''1'',\n  ''defaultchargepoint'' => ''0'',\n  ''paytype'' => ''0'',\n  ''repeatchargedays'' => ''1'',\n  ''category_ruleid'' => ''6'',\n  ''show_ruleid'' => ''16'',\n)', 1, 1, 0, 'xingyezixun', ''),
(9, 1, 'content', 0, 15, 0, '0', 0, '9', '门店信息发布', '', '', '', '', 'mdxxfb', 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=9', 1, 0, 'array (\n  ''workflowid'' => ''1'',\n  ''ishtml'' => ''0'',\n  ''content_ishtml'' => ''0'',\n  ''create_to_html_root'' => ''0'',\n  ''template_list'' => ''cban'',\n  ''category_template'' => ''category'',\n  ''list_template'' => '''',\n  ''show_template'' => ''show'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''presentpoint'' => ''1'',\n  ''defaultchargepoint'' => ''0'',\n  ''paytype'' => ''0'',\n  ''repeatchargedays'' => ''1'',\n  ''category_ruleid'' => ''6'',\n  ''show_ruleid'' => ''16'',\n)', 19, 0, 0, 'mendianxinxifabu', ''),
(10, 1, 'content', 0, 16, 0, '0', 0, '10', '企业信息发布', '', '', '', '', 'qyxxfb', 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=10', 2, 0, 'array (\n  ''workflowid'' => ''1'',\n  ''ishtml'' => ''0'',\n  ''content_ishtml'' => ''0'',\n  ''create_to_html_root'' => ''0'',\n  ''template_list'' => ''cban'',\n  ''category_template'' => ''category'',\n  ''list_template'' => ''list'',\n  ''show_template'' => ''show'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''presentpoint'' => ''1'',\n  ''defaultchargepoint'' => ''0'',\n  ''paytype'' => ''0'',\n  ''repeatchargedays'' => ''1'',\n  ''category_ruleid'' => ''6'',\n  ''show_ruleid'' => ''16'',\n)', 20, 0, 0, 'qiyexinxifabu', ''),
(11, 1, 'content', 2, 0, 0, '', 0, '', '千县万店', '', '', '', '', '', '/index.php?m=cban&c=index&a=qxwd', 0, 0, 'array (\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 4, 1, 0, '', ''),
(12, 1, 'content', 2, 0, 0, '', 0, '', '家电名企', '', '', '', '', '', '/index.php?m=cban&c=index&a=jdmq', 0, 0, 'array (\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 6, 1, 0, '', ''),
(44, 1, 'content', 0, 17, 0, '0', 0, '44', '展会信息', '', '', '', '', 'zhxx', 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=lists&catid=44', 3, 0, 'array (\n  ''workflowid'' => ''1'',\n  ''ishtml'' => ''0'',\n  ''content_ishtml'' => ''0'',\n  ''create_to_html_root'' => ''0'',\n  ''template_list'' => ''cban'',\n  ''category_template'' => ''category'',\n  ''list_template'' => ''list_zhxx'',\n  ''show_template'' => ''show_zhxx'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''presentpoint'' => ''1'',\n  ''defaultchargepoint'' => ''0'',\n  ''paytype'' => ''0'',\n  ''repeatchargedays'' => ''1'',\n  ''category_ruleid'' => ''6'',\n  ''show_ruleid'' => ''16'',\n)', 2, 1, 0, 'zhanhuixinxi', ''),
(46, 1, 'content', 2, 0, 0, '', 0, '', '商机资讯', '', '', '', '', '', '/index.php?m=cban&c=index&a=supply', 0, 0, 'array (\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 7, 1, 0, '', ''),
(47, 1, 'content', 2, 0, 0, '', 0, '', '家电维修', '', '', '', '', '', '/index.php?m=cban&c=index&a=jdwx', 0, 0, 'array (\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 8, 1, 0, '', ''),
(48, 1, 'content', 2, 0, 0, '', 0, '', '会员中心', '', '', '', '', '', '/index.php?m=member&c=index', 0, 0, 'array (\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 10, 1, 0, '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_category_priv`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:26
-- 

DROP TABLE IF EXISTS `cban_category_priv`;
CREATE TABLE IF NOT EXISTS `cban_category_priv` (
  `catid` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `roleid` smallint(5) unsigned NOT NULL default '0',
  `is_admin` tinyint(1) unsigned NOT NULL default '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_category_priv`
-- 

INSERT DELAYED IGNORE INTO `cban_category_priv` (`catid`, `siteid`, `roleid`, `is_admin`, `action`) VALUES 
(10, 1, 7, 0, 'add'),
(10, 1, 5, 0, 'add'),
(10, 1, 4, 0, 'add'),
(10, 1, 6, 0, 'add'),
(10, 1, 2, 0, 'add'),
(10, 1, 8, 0, 'add'),
(9, 1, 8, 0, 'add'),
(9, 1, 2, 0, 'add'),
(9, 1, 6, 0, 'add'),
(9, 1, 4, 0, 'add'),
(9, 1, 5, 0, 'add'),
(9, 1, 7, 0, 'add');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_collection_content`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_collection_content`;
CREATE TABLE IF NOT EXISTS `cban_collection_content` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nodeid` int(10) unsigned NOT NULL default '0',
  `siteid` mediumint(5) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_collection_content`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_collection_history`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_collection_history`;
CREATE TABLE IF NOT EXISTS `cban_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_collection_history`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_collection_node`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_collection_node`;
CREATE TABLE IF NOT EXISTS `cban_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL default '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL default '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL default '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL default '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL default '',
  `url_end` char(100) NOT NULL default '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL default '0',
  `content_page` tinyint(1) unsigned NOT NULL default '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL default '0',
  `watermark` tinyint(1) unsigned NOT NULL default '0',
  `coll_order` tinyint(3) unsigned NOT NULL default '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY  (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_collection_node`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_collection_program`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_collection_program`;
CREATE TABLE IF NOT EXISTS `cban_collection_program` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `nodeid` int(10) unsigned NOT NULL default '0',
  `modelid` mediumint(6) unsigned NOT NULL default '0',
  `catid` int(10) unsigned NOT NULL default '0',
  `config` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_collection_program`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_comment`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_comment`;
CREATE TABLE IF NOT EXISTS `cban_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL default '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned default '0',
  `square` mediumint(8) unsigned default '0',
  `anti` mediumint(8) unsigned default '0',
  `neutral` mediumint(8) unsigned default '0',
  `display_type` tinyint(1) default '0',
  `tableid` mediumint(8) unsigned default '0',
  `lastupdate` int(10) unsigned default '0',
  PRIMARY KEY  (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_comment_check`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_comment_check`;
CREATE TABLE IF NOT EXISTS `cban_comment_check` (
  `id` int(10) NOT NULL auto_increment,
  `comment_data_id` int(10) default '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL default '0' COMMENT '站点ID',
  `tableid` mediumint(8) default '0' COMMENT '数据存储表ID',
  PRIMARY KEY  (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_comment_check`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_comment_data_1`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_comment_data_1`;
CREATE TABLE IF NOT EXISTS `cban_comment_data_1` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '评论ID',
  `commentid` char(30) NOT NULL default '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL default '0' COMMENT '站点ID',
  `userid` int(10) unsigned default '0' COMMENT '用户ID',
  `username` varchar(20) default NULL COMMENT '用户名',
  `creat_at` int(10) default NULL COMMENT '发布时间',
  `ip` varchar(15) default NULL COMMENT '用户IP地址',
  `status` tinyint(1) default '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) default '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned default '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL default '0' COMMENT '是否为回复',
  PRIMARY KEY  (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_comment_data_1`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_comment_setting`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_comment_setting`;
CREATE TABLE IF NOT EXISTS `cban_comment_setting` (
  `siteid` smallint(5) NOT NULL default '0' COMMENT '站点ID',
  `guest` tinyint(1) default '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) default '0' COMMENT '是否需要审核',
  `code` tinyint(1) default '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned default '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned default '0' COMMENT '扣除的积分数',
  PRIMARY KEY  (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_comment_setting`
-- 

INSERT DELAYED IGNORE INTO `cban_comment_setting` (`siteid`, `guest`, `check`, `code`, `add_point`, `del_point`) VALUES 
(1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_comment_table`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_comment_table`;
CREATE TABLE IF NOT EXISTS `cban_comment_table` (
  `tableid` mediumint(8) NOT NULL auto_increment COMMENT '表ID号',
  `total` int(10) unsigned default '0' COMMENT '数据总量',
  `creat_at` int(10) default '0' COMMENT '创建时间',
  PRIMARY KEY  (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `cban_comment_table`
-- 

INSERT DELAYED IGNORE INTO `cban_comment_table` (`tableid`, `total`, `creat_at`) VALUES 
(1, 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_content_check`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:26
-- 

DROP TABLE IF EXISTS `cban_content_check`;
CREATE TABLE IF NOT EXISTS `cban_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_content_check`
-- 

INSERT DELAYED IGNORE INTO `cban_content_check` (`checkid`, `catid`, `siteid`, `title`, `username`, `inputtime`, `status`) VALUES 
('c-1-15', 9, 1, '1234567', 'nima', 1406033659, 99),
('c-2-16', 10, 1, '企业信息发布111', 'hehe', 1406106315, 99),
('c-3-16', 10, 1, 'haha家电集团', 'haha', 1407221818, 99);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_copyfrom`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_copyfrom`;
CREATE TABLE IF NOT EXISTS `cban_copyfrom` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_copyfrom`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_datacall`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_datacall`;
CREATE TABLE IF NOT EXISTS `cban_datacall` (
  `id` int(10) NOT NULL auto_increment,
  `name` char(40) default NULL,
  `dis_type` tinyint(1) unsigned default '0',
  `type` tinyint(1) default '0',
  `module` char(20) default NULL,
  `action` char(20) default NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) default NULL,
  `num` smallint(6) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_datacall`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_dbsource`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_dbsource`;
CREATE TABLE IF NOT EXISTS `cban_dbsource` (
  `id` int(10) NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL default '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_dbsource`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_download`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_download`;
CREATE TABLE IF NOT EXISTS `cban_download` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` varchar(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` char(255) NOT NULL default '',
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `systems` varchar(100) NOT NULL default 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL default '',
  `language` varchar(10) NOT NULL default '',
  `classtype` varchar(20) NOT NULL default '',
  `version` varchar(20) NOT NULL default '',
  `filesize` varchar(10) NOT NULL default 'Unkown',
  `stars` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_download`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_download_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_download_data`;
CREATE TABLE IF NOT EXISTS `cban_download_data` (
  `id` mediumint(8) unsigned default '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `relation` varchar(255) NOT NULL default '',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL default '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_download_data`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_downservers`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_downservers`;
CREATE TABLE IF NOT EXISTS `cban_downservers` (
  `id` mediumint(8) NOT NULL auto_increment,
  `sitename` varchar(100) default NULL,
  `siteurl` varchar(255) default NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_downservers`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_extend_setting`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_extend_setting`;
CREATE TABLE IF NOT EXISTS `cban_extend_setting` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY  (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_extend_setting`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_favorite`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_favorite`;
CREATE TABLE IF NOT EXISTS `cban_favorite` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_favorite`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_hits`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 03 日 09:04
-- 

DROP TABLE IF EXISTS `cban_hits`;
CREATE TABLE IF NOT EXISTS `cban_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  `yesterdayviews` int(10) unsigned NOT NULL default '0',
  `dayviews` int(10) unsigned NOT NULL default '0',
  `weekviews` int(10) unsigned NOT NULL default '0',
  `monthviews` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_hits`
-- 

INSERT DELAYED IGNORE INTO `cban_hits` (`hitsid`, `catid`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `updatetime`) VALUES 
('c-15-1', 9, 9, 0, 7, 7, 8, 1407826724),
('c-16-2', 10, 0, 0, 0, 0, 0, 1406106315),
('c-16-3', 10, 0, 0, 0, 0, 0, 1407221818),
('c-17-1', 44, 0, 0, 0, 0, 0, 1407411283),
('c-17-2', 44, 0, 0, 0, 0, 0, 1407411838),
('c-17-3', 44, 1, 0, 1, 1, 1, 1407417845),
('c-1-1', 41, 0, 0, 0, 0, 0, 1409639868),
('c-1-2', 41, 0, 0, 0, 0, 0, 1409639907),
('c-1-3', 41, 1, 0, 1, 1, 1, 1409705878);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_ipbanned`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_ipbanned`;
CREATE TABLE IF NOT EXISTS `cban_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL auto_increment,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_ipbanned`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_keylink`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_keylink`;
CREATE TABLE IF NOT EXISTS `cban_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL auto_increment,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY  (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_keylink`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_keyword`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 02 日 14:40
-- 

DROP TABLE IF EXISTS `cban_keyword`;
CREATE TABLE IF NOT EXISTS `cban_keyword` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL default '0',
  `searchnums` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- 导出表中的数据 `cban_keyword`
-- 

INSERT DELAYED IGNORE INTO `cban_keyword` (`id`, `siteid`, `keyword`, `pinyin`, `videonum`, `searchnums`) VALUES 
(1, 1, 'dfsadfasdf', 'dfsadfasdf', 14, 0),
(2, 1, '1234567', '1234567', 7, 0),
(3, 1, '企业信息发布', 'qiyexinxifabu', 14, 0),
(4, 1, '哈哈哈集团', 'hahahajituan', 5, 0),
(5, 1, '111afas', '111afas', 1, 0),
(6, 1, 'sdaf2222222222', 'sdaf2222222222', 1, 0),
(7, 1, '33333333333', '33333333333', 1, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_keyword_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 02 日 15:06
-- 

DROP TABLE IF EXISTS `cban_keyword_data`;
CREATE TABLE IF NOT EXISTS `cban_keyword_data` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tagid` int(10) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- 导出表中的数据 `cban_keyword_data`
-- 

INSERT DELAYED IGNORE INTO `cban_keyword_data` (`id`, `tagid`, `siteid`, `contentid`) VALUES 
(1, 1, 1, '1-15'),
(2, 2, 1, '1-15'),
(3, 3, 1, '1-16'),
(4, 3, 1, '2-16'),
(5, 4, 1, '3-16'),
(6, 5, 1, '1-1'),
(7, 6, 1, '2-1'),
(8, 7, 1, '3-1');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_link`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_link`;
CREATE TABLE IF NOT EXISTS `cban_link` (
  `linkid` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `linktype` tinyint(1) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `logo` varchar(255) NOT NULL default '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL default '',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `elite` tinyint(1) unsigned NOT NULL default '0',
  `passed` tinyint(1) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `cban_link`
-- 

INSERT DELAYED IGNORE INTO `cban_link` (`linkid`, `siteid`, `typeid`, `linktype`, `name`, `url`, `logo`, `introduce`, `username`, `listorder`, `elite`, `passed`, `addtime`) VALUES 
(1, 1, 0, 1, 'PHPCMS', 'http://www.phpcms.cn', 'http://www.phpcms.cn/images/logo_88_31.gif', '', '', 0, 0, 1, 1405941700),
(2, 1, 0, 1, '盛大在线', 'http://www.sdo.com', 'http://www.snda.com/cn/logo/comp_logo_sdo.gif', '', '', 0, 0, 1, 1405941700);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_linkage`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:26
-- 

DROP TABLE IF EXISTS `cban_linkage`;
CREATE TABLE IF NOT EXISTS `cban_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `description` varchar(255) default NULL,
  `setting` varchar(255) default NULL,
  `siteid` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3394 ;

-- 
-- 导出表中的数据 `cban_linkage`
-- 

INSERT DELAYED IGNORE INTO `cban_linkage` (`linkageid`, `name`, `style`, `parentid`, `child`, `arrchildid`, `keyid`, `listorder`, `description`, `setting`, `siteid`) VALUES 
(1, '中国', '2', 0, 0, '', 0, 0, '', 'array (\n  ''level'' => ''2'',\n)', 0),
(2, '北京市', '0', 0, 1, '2,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52', 1, 0, '', NULL, 0),
(3, '上海市', '0', 0, 1, '3,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71', 1, 0, '', NULL, 0),
(4, '天津市', '0', 0, 1, '4,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89', 1, 0, '', NULL, 0),
(5, '重庆市', '0', 0, 1, '5,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129', 1, 0, '', NULL, 0),
(6, '河北省', '0', 0, 1, '6,130,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,131,563,564,565,566,567,568,569,570,571,572,573,574,575,576,132,577,578,579,580,581,582,583,133,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,134,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,135,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,136,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,137,664,665,666,667,668,669,670,671,672,673,674,138,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,139,691,692,693,694,695,696,697,698,699,700,140,701,702,703,704,705,706,707,708,709,710,711', 1, 0, '', NULL, 0),
(7, '山西省', '0', 0, 1, '7,141,712,713,714,715,716,717,718,719,720,721,142,722,723,724,725,726,727,728,729,730,731,732,143,733,734,735,736,737,144,738,739,740,741,742,743,744,745,746,747,748,749,750,145,751,752,753,754,755,756,146,757,758,759,760,761,762,147,763,764,765,766,767,768,769,770,771,772,773,148,774,775,776,777,778,779,780,781,782,783,784,785,786,149,787,788,789,790,791,792,793,794,795,796,797,798,799,800,150,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,151,818,819,820,821,822,823,824,825,826,827,828,829,830', 1, 0, '', NULL, 0),
(8, '内蒙古', '0', 0, 1, '8,152,831,832,833,834,835,836,837,838,839,153,840,841,842,843,844,845,846,847,848,154,849,850,851,155,852,853,854,855,856,857,858,859,860,861,862,863,156,864,865,866,867,868,869,870,871,157,872,873,874,875,876,877,878,879,158,880,881,882,883,884,885,886,887,888,889,890,891,892,159,893,894,895,896,897,898,899,160,900,901,902,903,904,905,906,907,908,909,910,161,911,912,913,914,915,916,162,917,918,919,920,921,922,923,924,925,926,927,928,163,929,930,931', 1, 0, '', NULL, 0),
(9, '辽宁省', '0', 0, 1, '9,164,932,933,934,935,936,937,938,939,940,941,942,943,944,165,945,946,947,948,949,950,951,952,953,954,166,955,956,957,958,959,960,961,167,962,963,964,965,966,967,968,168,969,970,971,972,973,974,169,975,976,977,978,979,980,170,981,982,983,984,985,986,987,171,988,989,990,991,992,993,172,994,995,996,997,998,999,1000,173,1001,1002,1003,1004,1005,1006,1007,174,1008,1009,1010,1011,175,1012,1013,1014,1015,1016,1017,1018,176,1019,1020,1021,1022,1023,1024,1025,177,1026,1027,1028,1029,1030,1031', 1, 0, '', NULL, 0),
(10, '吉林省', '0', 0, 1, '10,178,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,179,1042,1043,1044,1045,1046,1047,1048,1049,1050,180,1051,1052,1053,1054,1055,1056,181,1057,1058,1059,1060,182,1061,1062,1063,1064,1065,1066,1067,183,1068,1069,1070,1071,1072,1073,184,1074,1075,1076,1077,1078,185,1079,1080,1081,1082,1083,186,1084,1085,1086,1087,1088,1089,1090,1091', 1, 0, '', NULL, 0),
(11, '黑龙江省', '0', 0, 1, '11,187,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,188,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,189,1127,1128,1129,1130,1131,1132,1133,1134,1135,190,1136,1137,1138,1139,1140,1141,1142,1143,191,1144,1145,1146,1147,1148,1149,1150,1151,192,1152,1153,1154,1155,1156,1157,1158,1159,1160,193,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,194,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,195,1189,1190,1191,1192,196,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,197,1203,1204,1205,1206,1207,1208,198,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,199,1219,1220,1221', 1, 0, '', NULL, 0),
(12, '江苏省', '0', 0, 1, '12,200,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,201,1235,1236,1237,1238,1239,1240,1241,1242,202,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,203,1254,1255,1256,1257,1258,1259,1260,204,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,205,1272,1273,1274,1275,1276,1277,1278,1279,206,1280,1281,1282,1283,1284,1285,1286,207,1287,1288,1289,1290,1291,1292,1293,1294,208,1295,1296,1297,1298,1299,1300,1301,1302,1303,209,1304,1305,1306,1307,1308,1309,1310,210,1311,1312,1313,1314,1315,1316,211,1317,1318,1319,1320,1321,1322,212,1323,1324,1325,1326,1327', 1, 0, '', NULL, 0),
(13, '浙江省', '0', 0, 1, '13,213,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,214,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,215,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,216,1363,1364,1365,1366,1367,1368,1369,217,1370,1371,1372,1373,1374,218,1375,1376,1377,1378,1379,1380,219,1381,1382,1383,1384,1385,1386,1387,1388,1389,220,1390,1391,1392,1393,1394,1395,221,1396,1397,1398,1399,222,1400,1401,1402,1403,1404,1405,1406,1407,1408,223,1409,1410,1411,1412,1413,1414,1415,1416,1417', 1, 0, '', NULL, 0),
(14, '安徽省', '0', 0, 1, '14,224,1418,1419,1420,1421,1422,1423,1424,225,1425,1426,1427,1428,1429,1430,1431,226,1432,1433,1434,1435,1436,1437,1438,227,1439,1440,1441,1442,1443,1444,228,1445,1446,1447,1448,229,1449,1450,1451,1452,230,1453,1454,1455,1456,231,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,232,1468,1469,1470,1471,1472,1473,1474,233,1475,1476,1477,1478,1479,1480,1481,1482,234,1483,1484,1485,1486,1487,1488,1489,1490,235,1491,1492,1493,1494,1495,236,1496,1497,1498,1499,1500,237,1501,1502,1503,1504,1505,1506,1507,238,1508,1509,1510,1511,239,1512,1513,1514,1515,240,1516,1517,1518,1519,1520,1521,1522', 1, 0, '', NULL, 0),
(15, '福建省', '0', 0, 1, '15,241,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,242,1536,1537,1538,1539,1540,1541,243,1542,1543,1544,1545,1546,244,1547,1548,1549,1550,1551,1552,1553,1554,1555,1556,1557,1558,245,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570,246,1571,1572,1573,1574,1575,1576,1577,1578,1579,1580,1581,247,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,248,1592,1593,1594,1595,1596,1597,1598,249,1599,1600,1601,1602,1603,1604,1605,1606,1607', 1, 0, '', NULL, 0),
(16, '江西省', '0', 0, 1, '16,250,1608,1609,1610,1611,1612,1613,1614,1615,1616,251,1617,1618,1619,1620,252,1621,1622,1623,1624,1625,253,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,254,1638,1639,255,1640,1641,1642,256,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660,257,1661,1662,1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,258,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683,259,1684,1685,1686,1687,1688,1689,1690,1691,1692,1693,1694,260,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706', 1, 0, '', NULL, 0),
(17, '山东省', '0', 0, 1, '17,261,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,262,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,263,1729,1730,1731,1732,1733,1734,1735,1736,264,1737,1738,1739,1740,1741,1742,265,1743,1744,1745,1746,1747,266,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,267,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,268,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,269,1784,1785,1786,1787,1788,1789,270,1790,1791,1792,1793,271,1794,1795,1796,1797,272,1798,1799,273,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,274,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,275,1823,1824,1825,1826,1827,1828,1829,1830,276,1831,1832,1833,1834,1835,1836,1837,277,1838,1839,1840,1841,1842,1843,1844,1845,1846', 1, 0, '', NULL, 0),
(18, '河南省', '0', 0, 1, '18,278,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,279,1859,1860,1861,1862,1863,1864,1865,1866,1867,1868,280,1869,1870,1871,1872,1873,1874,1875,1876,1877,1878,1879,1880,1881,1882,1883,281,1884,1885,1886,1887,1888,1889,1890,1891,1892,1893,282,1894,1895,1896,1897,1898,1899,1900,1901,1902,283,1903,1904,1905,1906,1907,284,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,285,1920,1921,1922,1923,1924,1925,1926,1927,1928,1929,1930,286,1931,1932,1933,1934,1935,1936,287,1937,1938,1939,1940,1941,1942,288,1943,1944,1945,1946,1947,289,1948,1949,1950,1951,1952,1953,290,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,291,1967,1968,1969,1970,1971,1972,1973,1974,1975,292,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,293,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,294,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005', 1, 0, '', NULL, 0),
(19, '湖北省', '0', 0, 1, '19,295,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,296,2019,2020,2021,2022,2023,2024,297,2025,2026,2027,2028,2029,2030,2031,2032,298,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,299,2046,2047,2048,2049,2050,2051,2052,2053,2054,300,2055,2056,2057,301,2058,2059,2060,2061,2062,302,2063,2064,2065,2066,2067,2068,2069,303,2070,2071,2072,2073,2074,2075,2076,2077,304,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,305,2088,2089,2090,2091,2092,2093,306,2094,2095,307,2096,2097,2098,2099,2100,2101,2102,2103,308,309,310,311', 1, 0, '', NULL, 0),
(20, '湖南省', '0', 0, 1, '20,312,2104,2105,2106,2107,2108,2109,2110,2111,2112,313,2113,2114,2115,2116,2117,2118,2119,2120,2121,314,2122,2123,2124,2125,2126,315,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,316,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,317,2151,2152,2153,2154,2155,2156,2157,2158,2159,318,2160,2161,2162,2163,2164,2165,2166,2167,2168,319,2169,2170,2171,2172,320,2173,2174,2175,2176,2177,2178,321,2179,2180,2181,2182,2183,2184,2185,2186,2187,2188,2189,322,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2200,323,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,324,2213,2214,2215,2216,2217,325,2218,2219,2220,2221,2222,2223,2224,2225', 1, 0, '', NULL, 0),
(21, '广东省', '0', 0, 1, '21,326,2226,2227,2228,2229,2230,2231,2232,2233,2234,2235,2236,2237,327,2238,2239,2240,2241,2242,2243,2244,2245,2246,2247,328,2248,2249,2250,2251,2252,2253,329,2254,2255,2256,330,2257,2258,2259,2260,2261,2262,2263,331,2264,2265,2266,2267,2268,332,2269,2270,2271,2272,2273,2274,2275,333,2276,2277,2278,2279,2280,2281,2282,2283,2284,334,2285,2286,2287,2288,2289,2290,335,2291,2292,2293,2294,2295,2296,2297,2298,336,2299,2300,2301,2302,2303,337,2304,2305,2306,2307,2308,2309,2310,2311,338,2312,2313,2314,2315,339,2316,2317,2318,2319,2320,2321,340,2322,2323,2324,2325,341,2326,2327,2328,2329,2330,2331,2332,2333,342,343,344,2334,2335,2336,345,2337,2338,2339,2340,2341,346,2342,2343,2344,2345,2346', 1, 0, '', NULL, 0),
(22, '广西', '0', 0, 1, '22,347,2347,2348,2349,2350,2351,2352,2353,2354,2355,2356,2357,2358,348,2359,2360,2361,2362,2363,2364,2365,2366,2367,2368,349,2369,2370,2371,2372,2373,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385,350,2386,2387,2388,2389,2390,2391,2392,351,2393,2394,2395,2396,352,2397,2398,2399,2400,353,2401,2402,2403,2404,354,2405,2406,2407,2408,2409,355,2410,2411,2412,2413,2414,2415,356,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,357,2428,2429,2430,2431,358,2432,2433,2434,2435,2436,2437,2438,2439,2440,2441,2442,359,2443,2444,2445,2446,2447,2448,360,2449,2450,2451,2452,2453,2454,2455', 1, 0, '', NULL, 0),
(23, '海南省', '0', 0, 1, '23,361,2456,2457,2458,2459,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381', 1, 0, '', NULL, 0),
(24, '四川省', '0', 0, 1, '24,382,2460,2461,2462,2463,2464,2465,2466,2467,2468,2469,2470,2471,2472,2473,2474,2475,2476,2477,2478,383,2479,2480,2481,2482,2483,2484,384,2485,2486,2487,2488,2489,385,2490,2491,2492,2493,2494,2495,2496,386,2497,2498,2499,2500,2501,2502,387,2503,2504,2505,2506,2507,2508,2509,2510,2511,388,2512,2513,2514,2515,2516,2517,2518,389,2519,2520,2521,2522,2523,390,2524,2525,2526,2527,2528,391,2529,2530,2531,2532,2533,2534,2535,2536,2537,2538,2539,392,2540,2541,2542,2543,2544,2545,2546,2547,2548,393,2549,2550,2551,2552,2553,2554,394,2555,2556,2557,2558,2559,2560,2561,2562,2563,2564,395,2565,2566,2567,2568,2569,396,2570,2571,2572,2573,2574,2575,2576,397,2577,2578,2579,2580,2581,2582,2583,2584,398,2585,2586,2587,2588,399,2589,2590,2591,2592,400,2593,2594,2595,2596,2597,2598,2599,2600,2601,2602,2603,2604,2605,401,2606,2607,2608,2609,2610,2611,2612,2613,2614,2615,2616,2617,2618,2619,2620,2621,2622,2623,402,2624,2625,2626,2627,2628,2629,2630,2631,2632,2633,2634,2635,2636,2637,2638,2639,2640', 1, 0, '', NULL, 0),
(25, '贵州省', '0', 0, 1, '25,403,2641,2642,2643,2644,2645,2646,2647,2648,2649,2650,404,2651,2652,2653,2654,405,2655,2656,2657,2658,2659,2660,2661,2662,2663,2664,2665,2666,2667,2668,406,2669,2670,2671,2672,2673,2674,407,2675,2676,2677,2678,2679,2680,2681,2682,2683,2684,408,2685,2686,2687,2688,2689,2690,2691,2692,409,2693,2694,2695,2696,2697,2698,2699,2700,410,2701,2702,2703,2704,2705,2706,2707,2708,2709,2710,2711,2712,2713,2714,2715,2716,411,2717,2718,2719,2720,2721,2722,2723,2724,2725,2726,2727,2728', 1, 0, '', NULL, 0),
(26, '云南省', '0', 0, 1, '26,412,2729,2730,2731,2732,2733,2734,2735,2736,2737,2738,2739,2740,2741,2742,413,2743,2744,2745,2746,2747,2748,2749,2750,2751,414,2752,2753,2754,2755,2756,2757,2758,2759,2760,415,2761,2762,2763,2764,2765,416,2766,2767,2768,2769,2770,2771,2772,2773,2774,2775,2776,417,2777,2778,2779,2780,2781,418,2782,2783,2784,2785,2786,2787,2788,2789,2790,2791,419,2792,2793,2794,2795,2796,2797,2798,420,2799,2800,2801,2802,2803,2804,2805,2806,2807,2808,2809,421,2810,2811,2812,2813,2814,2815,2816,2817,2818,2819,2820,2821,2822,422,2823,2824,2825,2826,2827,2828,2829,2830,423,2831,2832,2833,424,2834,2835,2836,2837,2838,2839,2840,2841,2842,2843,2844,2845,425,2846,2847,2848,2849,2850,426,2851,2852,2853,2854,427,2855,2856,2857', 1, 0, '', NULL, 0),
(27, '西藏', '0', 0, 1, '27,428,2858,2859,2860,2861,2862,2863,2864,2865,429,2866,2867,2868,2869,2870,2871,2872,2873,2874,2875,2876,430,2877,2878,2879,2880,2881,2882,2883,2884,2885,2886,2887,2888,431,2889,2890,2891,2892,2893,2894,2895,2896,2897,2898,2899,2900,2901,2902,2903,2904,2905,2906,432,2907,2908,2909,2910,2911,2912,2913,2914,2915,2916,433,2917,2918,2919,2920,2921,2922,2923,434,2924,2925,2926,2927,2928,2929,2930', 1, 0, '', NULL, 0),
(28, '陕西省', '0', 0, 1, '28,435,2931,2932,2933,2934,2935,2936,2937,2938,2939,2940,2941,2942,2943,436,2944,2945,2946,2947,437,2948,2949,2950,2951,2952,2953,2954,2955,2956,2957,2958,2959,438,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,439,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,440,2985,2986,2987,2988,2989,2990,2991,2992,2993,2994,2995,2996,2997,441,2998,2999,3000,3001,3002,3003,3004,3005,3006,3007,3008,442,3009,3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020,443,3021,3022,3023,3024,3025,3026,3027,3028,3029,3030,444,3031,3032,3033,3034,3035,3036,3037', 1, 0, '', NULL, 0),
(29, '甘肃省', '0', 0, 1, '29,445,3038,3039,3040,3041,3042,3043,3044,3045,446,447,3046,3047,448,3048,3049,3050,3051,3052,449,3053,3054,3055,3056,3057,3058,3059,450,3060,3061,3062,3063,451,3064,3065,3066,3067,3068,3069,452,3070,3071,3072,3073,3074,3075,3076,453,3077,3078,3079,3080,3081,3082,3083,454,3084,3085,3086,3087,3088,3089,3090,3091,455,3092,3093,3094,3095,3096,3097,3098,456,3099,3100,3101,3102,3103,3104,3105,3106,3107,457,3108,3109,3110,3111,3112,3113,3114,3115,458,3116,3117,3118,3119,3120,3121,3122,3123', 1, 0, '', NULL, 0),
(30, '青海省', '0', 0, 1, '30,459,3124,3125,3126,3127,3128,3129,3130,460,3131,3132,3133,3134,3135,3136,461,3137,3138,3139,3140,462,3141,3142,3143,3144,463,3145,3146,3147,3148,3149,464,3150,3151,3152,3153,3154,3155,465,3156,3157,3158,3159,3160,3161,466,3162,3163,3164,3165,3166', 1, 0, '', NULL, 0),
(31, '宁夏', '0', 0, 1, '31,467,3167,3168,3169,3170,3171,3172,468,3173,3174,3175,469,3176,3177,3178,3179,470,3180,3181,3182,3183,3184,471,3185,3186,3187', 1, 0, '', NULL, 0),
(32, '新疆', '0', 0, 1, '32,472,3188,3189,3190,3191,3192,3193,3194,3195,473,3196,3197,3198,3199,474,3200,3201,3202,475,3203,3204,3205,476,3206,3207,3208,3209,3210,3211,3212,3213,477,3214,3215,3216,478,3217,3218,3219,3220,3221,3222,3223,3224,3225,479,3226,3227,3228,3229,3230,3231,3232,3233,3234,480,3235,3236,3237,3238,481,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250,482,3251,3252,3253,3254,3255,3256,3257,3258,483,3259,3260,3261,3262,3263,3264,3265,3266,3267,3268,484,3269,3270,3271,3272,3273,3274,3275,485,3276,3277,3278,3279,3280,3281,3282,486,487,488,489', 1, 0, '', NULL, 0),
(33, '台湾省', '0', 0, 1, '33,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514', 1, 0, '', NULL, 0),
(34, '香港', '0', 0, 1, '34,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532', 1, 0, '', NULL, 0),
(35, '澳门', '0', 0, 1, '35,533,534,535,536,537,538,539', 1, 0, '', NULL, 0),
(36, '东城区', '0', 2, 0, '36', 1, 0, '', NULL, 0),
(37, '西城区', '0', 2, 0, '37', 1, 0, '', NULL, 0),
(38, '崇文区', '0', 2, 0, '38', 1, 0, '', NULL, 0),
(39, '宣武区', '0', 2, 0, '39', 1, 0, '', NULL, 0),
(40, '朝阳区', '0', 2, 0, '40', 1, 0, '', NULL, 0),
(41, '石景山区', '0', 2, 0, '41', 1, 0, '', NULL, 0),
(42, '海淀区', '0', 2, 0, '42', 1, 0, '', NULL, 0),
(43, '门头沟区', '0', 2, 0, '43', 1, 0, '', NULL, 0),
(44, '房山区', '0', 2, 0, '44', 1, 0, '', NULL, 0),
(45, '通州区', '0', 2, 0, '45', 1, 0, '', NULL, 0),
(46, '顺义区', '0', 2, 0, '46', 1, 0, '', NULL, 0),
(47, '昌平区', '0', 2, 0, '47', 1, 0, '', NULL, 0),
(48, '大兴区', '0', 2, 0, '48', 1, 0, '', NULL, 0),
(49, '怀柔区', '0', 2, 0, '49', 1, 0, '', NULL, 0),
(50, '平谷区', '0', 2, 0, '50', 1, 0, '', NULL, 0),
(51, '密云县', '0', 2, 0, '51', 1, 0, '', NULL, 0),
(52, '延庆县', '0', 2, 0, '52', 1, 0, '', NULL, 0),
(53, '黄浦区', '0', 3, 0, '53', 1, 0, '', NULL, 0),
(54, '卢湾区', '0', 3, 0, '54', 1, 0, '', NULL, 0),
(55, '徐汇区', '0', 3, 0, '55', 1, 0, '', NULL, 0),
(56, '长宁区', '0', 3, 0, '56', 1, 0, '', NULL, 0),
(57, '静安区', '0', 3, 0, '57', 1, 0, '', NULL, 0),
(58, '普陀区', '0', 3, 0, '58', 1, 0, '', NULL, 0),
(59, '闸北区', '0', 3, 0, '59', 1, 0, '', NULL, 0),
(60, '虹口区', '0', 3, 0, '60', 1, 0, '', NULL, 0),
(61, '杨浦区', '0', 3, 0, '61', 1, 0, '', NULL, 0),
(62, '闵行区', '0', 3, 0, '62', 1, 0, '', NULL, 0),
(63, '宝山区', '0', 3, 0, '63', 1, 0, '', NULL, 0),
(64, '嘉定区', '0', 3, 0, '64', 1, 0, '', NULL, 0),
(65, '浦东新区', '0', 3, 0, '65', 1, 0, '', NULL, 0),
(66, '金山区', '0', 3, 0, '66', 1, 0, '', NULL, 0),
(67, '松江区', '0', 3, 0, '67', 1, 0, '', NULL, 0),
(68, '青浦区', '0', 3, 0, '68', 1, 0, '', NULL, 0),
(69, '南汇区', '0', 3, 0, '69', 1, 0, '', NULL, 0),
(70, '奉贤区', '0', 3, 0, '70', 1, 0, '', NULL, 0),
(71, '崇明县', '0', 3, 0, '71', 1, 0, '', NULL, 0),
(72, '和平区', '0', 4, 0, '72', 1, 0, '', NULL, 0),
(73, '河东区', '0', 4, 0, '73', 1, 0, '', NULL, 0),
(74, '河西区', '0', 4, 0, '74', 1, 0, '', NULL, 0),
(75, '南开区', '0', 4, 0, '75', 1, 0, '', NULL, 0),
(76, '河北区', '0', 4, 0, '76', 1, 0, '', NULL, 0),
(77, '红桥区', '0', 4, 0, '77', 1, 0, '', NULL, 0),
(78, '塘沽区', '0', 4, 0, '78', 1, 0, '', NULL, 0),
(79, '汉沽区', '0', 4, 0, '79', 1, 0, '', NULL, 0),
(80, '大港区', '0', 4, 0, '80', 1, 0, '', NULL, 0),
(81, '东丽区', '0', 4, 0, '81', 1, 0, '', NULL, 0),
(82, '西青区', '0', 4, 0, '82', 1, 0, '', NULL, 0),
(83, '津南区', '0', 4, 0, '83', 1, 0, '', NULL, 0),
(84, '北辰区', '0', 4, 0, '84', 1, 0, '', NULL, 0),
(85, '武清区', '0', 4, 0, '85', 1, 0, '', NULL, 0),
(86, '宝坻区', '0', 4, 0, '86', 1, 0, '', NULL, 0),
(87, '宁河县', '0', 4, 0, '87', 1, 0, '', NULL, 0),
(88, '静海县', '0', 4, 0, '88', 1, 0, '', NULL, 0),
(89, '蓟县', '0', 4, 0, '89', 1, 0, '', NULL, 0),
(90, '万州区', '0', 5, 0, '90', 1, 0, '', NULL, 0),
(91, '涪陵区', '0', 5, 0, '91', 1, 0, '', NULL, 0),
(92, '渝中区', '0', 5, 0, '92', 1, 0, '', NULL, 0),
(93, '大渡口区', '0', 5, 0, '93', 1, 0, '', NULL, 0),
(94, '江北区', '0', 5, 0, '94', 1, 0, '', NULL, 0),
(95, '沙坪坝区', '0', 5, 0, '95', 1, 0, '', NULL, 0),
(96, '九龙坡区', '0', 5, 0, '96', 1, 0, '', NULL, 0),
(97, '南岸区', '0', 5, 0, '97', 1, 0, '', NULL, 0),
(98, '北碚区', '0', 5, 0, '98', 1, 0, '', NULL, 0),
(99, '万盛区', '0', 5, 0, '99', 1, 0, '', NULL, 0),
(100, '双桥区', '0', 5, 0, '100', 1, 0, '', NULL, 0),
(101, '渝北区', '0', 5, 0, '101', 1, 0, '', NULL, 0),
(102, '巴南区', '0', 5, 0, '102', 1, 0, '', NULL, 0),
(103, '黔江区', '0', 5, 0, '103', 1, 0, '', NULL, 0),
(104, '长寿区', '0', 5, 0, '104', 1, 0, '', NULL, 0),
(105, '綦江县', '0', 5, 0, '105', 1, 0, '', NULL, 0),
(106, '潼南县', '0', 5, 0, '106', 1, 0, '', NULL, 0),
(107, '铜梁县', '0', 5, 0, '107', 1, 0, '', NULL, 0),
(108, '大足县', '0', 5, 0, '108', 1, 0, '', NULL, 0),
(109, '荣昌县', '0', 5, 0, '109', 1, 0, '', NULL, 0),
(110, '璧山县', '0', 5, 0, '110', 1, 0, '', NULL, 0),
(111, '梁平县', '0', 5, 0, '111', 1, 0, '', NULL, 0),
(112, '城口县', '0', 5, 0, '112', 1, 0, '', NULL, 0),
(113, '丰都县', '0', 5, 0, '113', 1, 0, '', NULL, 0),
(114, '垫江县', '0', 5, 0, '114', 1, 0, '', NULL, 0),
(115, '武隆县', '0', 5, 0, '115', 1, 0, '', NULL, 0),
(116, '忠县', '0', 5, 0, '116', 1, 0, '', NULL, 0),
(117, '开县', '0', 5, 0, '117', 1, 0, '', NULL, 0),
(118, '云阳县', '0', 5, 0, '118', 1, 0, '', NULL, 0),
(119, '奉节县', '0', 5, 0, '119', 1, 0, '', NULL, 0),
(120, '巫山县', '0', 5, 0, '120', 1, 0, '', NULL, 0),
(121, '巫溪县', '0', 5, 0, '121', 1, 0, '', NULL, 0),
(122, '石柱县', '0', 5, 0, '122', 1, 0, '', NULL, 0),
(123, '秀山县', '0', 5, 0, '123', 1, 0, '', NULL, 0),
(124, '酉阳县', '0', 5, 0, '124', 1, 0, '', NULL, 0),
(125, '彭水县', '0', 5, 0, '125', 1, 0, '', NULL, 0),
(126, '江津区', '0', 5, 0, '126', 1, 0, '', NULL, 0),
(127, '合川区', '0', 5, 0, '127', 1, 0, '', NULL, 0),
(128, '永川区', '0', 5, 0, '128', 1, 0, '', NULL, 0),
(129, '南川区', '0', 5, 0, '129', 1, 0, '', NULL, 0),
(130, '石家庄市', '0', 6, 1, '130,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562', 1, 0, '', NULL, 0),
(131, '唐山市', '0', 6, 1, '131,563,564,565,566,567,568,569,570,571,572,573,574,575,576', 1, 0, '', NULL, 0),
(132, '秦皇岛市', '0', 6, 1, '132,577,578,579,580,581,582,583', 1, 0, '', NULL, 0),
(133, '邯郸市', '0', 6, 1, '133,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602', 1, 0, '', NULL, 0),
(134, '邢台市', '0', 6, 1, '134,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621', 1, 0, '', NULL, 0),
(135, '保定市', '0', 6, 1, '135,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646', 1, 0, '', NULL, 0),
(136, '张家口市', '0', 6, 1, '136,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663', 1, 0, '', NULL, 0),
(137, '承德市', '0', 6, 1, '137,664,665,666,667,668,669,670,671,672,673,674', 1, 0, '', NULL, 0),
(138, '沧州市', '0', 6, 1, '138,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690', 1, 0, '', NULL, 0),
(139, '廊坊市', '0', 6, 1, '139,691,692,693,694,695,696,697,698,699,700', 1, 0, '', NULL, 0),
(140, '衡水市', '0', 6, 1, '140,701,702,703,704,705,706,707,708,709,710,711', 1, 0, '', NULL, 0),
(141, '太原市', '0', 7, 1, '141,712,713,714,715,716,717,718,719,720,721', 1, 0, '', NULL, 0),
(142, '大同市', '0', 7, 1, '142,722,723,724,725,726,727,728,729,730,731,732', 1, 0, '', NULL, 0),
(143, '阳泉市', '0', 7, 1, '143,733,734,735,736,737', 1, 0, '', NULL, 0),
(144, '长治市', '0', 7, 1, '144,738,739,740,741,742,743,744,745,746,747,748,749,750', 1, 0, '', NULL, 0),
(145, '晋城市', '0', 7, 1, '145,751,752,753,754,755,756', 1, 0, '', NULL, 0),
(146, '朔州市', '0', 7, 1, '146,757,758,759,760,761,762', 1, 0, '', NULL, 0),
(147, '晋中市', '0', 7, 1, '147,763,764,765,766,767,768,769,770,771,772,773', 1, 0, '', NULL, 0),
(148, '运城市', '0', 7, 1, '148,774,775,776,777,778,779,780,781,782,783,784,785,786', 1, 0, '', NULL, 0),
(149, '忻州市', '0', 7, 1, '149,787,788,789,790,791,792,793,794,795,796,797,798,799,800', 1, 0, '', NULL, 0),
(150, '临汾市', '0', 7, 1, '150,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817', 1, 0, '', NULL, 0),
(151, '吕梁市', '0', 7, 1, '151,818,819,820,821,822,823,824,825,826,827,828,829,830', 1, 0, '', NULL, 0),
(152, '呼和浩特市', '0', 8, 1, '152,831,832,833,834,835,836,837,838,839', 1, 0, '', NULL, 0),
(153, '包头市', '0', 8, 1, '153,840,841,842,843,844,845,846,847,848', 1, 0, '', NULL, 0),
(154, '乌海市', '0', 8, 1, '154,849,850,851', 1, 0, '', NULL, 0),
(155, '赤峰市', '0', 8, 1, '155,852,853,854,855,856,857,858,859,860,861,862,863', 1, 0, '', NULL, 0),
(156, '通辽市', '0', 8, 1, '156,864,865,866,867,868,869,870,871', 1, 0, '', NULL, 0),
(157, '鄂尔多斯市', '0', 8, 1, '157,872,873,874,875,876,877,878,879', 1, 0, '', NULL, 0),
(158, '呼伦贝尔市', '0', 8, 1, '158,880,881,882,883,884,885,886,887,888,889,890,891,892', 1, 0, '', NULL, 0),
(159, '巴彦淖尔市', '0', 8, 1, '159,893,894,895,896,897,898,899', 1, 0, '', NULL, 0),
(160, '乌兰察布市', '0', 8, 1, '160,900,901,902,903,904,905,906,907,908,909,910', 1, 0, '', NULL, 0),
(161, '兴安盟', '0', 8, 1, '161,911,912,913,914,915,916', 1, 0, '', NULL, 0),
(162, '锡林郭勒盟', '0', 8, 1, '162,917,918,919,920,921,922,923,924,925,926,927,928', 1, 0, '', NULL, 0),
(163, '阿拉善盟', '0', 8, 1, '163,929,930,931', 1, 0, '', NULL, 0),
(164, '沈阳市', '0', 9, 1, '164,932,933,934,935,936,937,938,939,940,941,942,943,944', 1, 0, '', NULL, 0),
(165, '大连市', '0', 9, 1, '165,945,946,947,948,949,950,951,952,953,954', 1, 0, '', NULL, 0),
(166, '鞍山市', '0', 9, 1, '166,955,956,957,958,959,960,961', 1, 0, '', NULL, 0),
(167, '抚顺市', '0', 9, 1, '167,962,963,964,965,966,967,968', 1, 0, '', NULL, 0),
(168, '本溪市', '0', 9, 1, '168,969,970,971,972,973,974', 1, 0, '', NULL, 0),
(169, '丹东市', '0', 9, 1, '169,975,976,977,978,979,980', 1, 0, '', NULL, 0),
(170, '锦州市', '0', 9, 1, '170,981,982,983,984,985,986,987', 1, 0, '', NULL, 0),
(171, '营口市', '0', 9, 1, '171,988,989,990,991,992,993', 1, 0, '', NULL, 0),
(172, '阜新市', '0', 9, 1, '172,994,995,996,997,998,999,1000', 1, 0, '', NULL, 0),
(173, '辽阳市', '0', 9, 1, '173,1001,1002,1003,1004,1005,1006,1007', 1, 0, '', NULL, 0),
(174, '盘锦市', '0', 9, 1, '174,1008,1009,1010,1011', 1, 0, '', NULL, 0),
(175, '铁岭市', '0', 9, 1, '175,1012,1013,1014,1015,1016,1017,1018', 1, 0, '', NULL, 0),
(176, '朝阳市', '0', 9, 1, '176,1019,1020,1021,1022,1023,1024,1025', 1, 0, '', NULL, 0),
(177, '葫芦岛市', '0', 9, 1, '177,1026,1027,1028,1029,1030,1031', 1, 0, '', NULL, 0),
(178, '长春市', '0', 10, 1, '178,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041', 1, 0, '', NULL, 0),
(179, '吉林市', '0', 10, 1, '179,1042,1043,1044,1045,1046,1047,1048,1049,1050', 1, 0, '', NULL, 0),
(180, '四平市', '0', 10, 1, '180,1051,1052,1053,1054,1055,1056', 1, 0, '', NULL, 0),
(181, '辽源市', '0', 10, 1, '181,1057,1058,1059,1060', 1, 0, '', NULL, 0),
(182, '通化市', '0', 10, 1, '182,1061,1062,1063,1064,1065,1066,1067', 1, 0, '', NULL, 0),
(183, '白山市', '0', 10, 1, '183,1068,1069,1070,1071,1072,1073', 1, 0, '', NULL, 0),
(184, '松原市', '0', 10, 1, '184,1074,1075,1076,1077,1078', 1, 0, '', NULL, 0),
(185, '白城市', '0', 10, 1, '185,1079,1080,1081,1082,1083', 1, 0, '', NULL, 0),
(186, '延边', '0', 10, 1, '186,1084,1085,1086,1087,1088,1089,1090,1091', 1, 0, '', NULL, 0),
(187, '哈尔滨市', '0', 11, 1, '187,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110', 1, 0, '', NULL, 0),
(188, '齐齐哈尔市', '0', 11, 1, '188,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126', 1, 0, '', NULL, 0),
(189, '鸡西市', '0', 11, 1, '189,1127,1128,1129,1130,1131,1132,1133,1134,1135', 1, 0, '', NULL, 0),
(190, '鹤岗市', '0', 11, 1, '190,1136,1137,1138,1139,1140,1141,1142,1143', 1, 0, '', NULL, 0),
(191, '双鸭山市', '0', 11, 1, '191,1144,1145,1146,1147,1148,1149,1150,1151', 1, 0, '', NULL, 0),
(192, '大庆市', '0', 11, 1, '192,1152,1153,1154,1155,1156,1157,1158,1159,1160', 1, 0, '', NULL, 0),
(193, '伊春市', '0', 11, 1, '193,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177', 1, 0, '', NULL, 0),
(194, '佳木斯市', '0', 11, 1, '194,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188', 1, 0, '', NULL, 0),
(195, '七台河市', '0', 11, 1, '195,1189,1190,1191,1192', 1, 0, '', NULL, 0),
(196, '牡丹江市', '0', 11, 1, '196,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202', 1, 0, '', NULL, 0),
(197, '黑河市', '0', 11, 1, '197,1203,1204,1205,1206,1207,1208', 1, 0, '', NULL, 0),
(198, '绥化市', '0', 11, 1, '198,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218', 1, 0, '', NULL, 0),
(199, '大兴安岭地区', '0', 11, 1, '199,1219,1220,1221', 1, 0, '', NULL, 0),
(200, '南京市', '0', 12, 1, '200,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234', 1, 0, '', NULL, 0),
(201, '无锡市', '0', 12, 1, '201,1235,1236,1237,1238,1239,1240,1241,1242', 1, 0, '', NULL, 0),
(202, '徐州市', '0', 12, 1, '202,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253', 1, 0, '', NULL, 0),
(203, '常州市', '0', 12, 1, '203,1254,1255,1256,1257,1258,1259,1260', 1, 0, '', NULL, 0),
(204, '苏州市', '0', 12, 1, '204,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271', 1, 0, '', NULL, 0),
(205, '南通市', '0', 12, 1, '205,1272,1273,1274,1275,1276,1277,1278,1279', 1, 0, '', NULL, 0),
(206, '连云港市', '0', 12, 1, '206,1280,1281,1282,1283,1284,1285,1286', 1, 0, '', NULL, 0),
(207, '淮安市', '0', 12, 1, '207,1287,1288,1289,1290,1291,1292,1293,1294', 1, 0, '', NULL, 0),
(208, '盐城市', '0', 12, 1, '208,1295,1296,1297,1298,1299,1300,1301,1302,1303', 1, 0, '', NULL, 0),
(209, '扬州市', '0', 12, 1, '209,1304,1305,1306,1307,1308,1309,1310', 1, 0, '', NULL, 0),
(210, '镇江市', '0', 12, 1, '210,1311,1312,1313,1314,1315,1316', 1, 0, '', NULL, 0),
(211, '泰州市', '0', 12, 1, '211,1317,1318,1319,1320,1321,1322', 1, 0, '', NULL, 0),
(212, '宿迁市', '0', 12, 1, '212,1323,1324,1325,1326,1327', 1, 0, '', NULL, 0),
(213, '杭州市', '0', 13, 1, '213,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340', 1, 0, '', NULL, 0),
(214, '宁波市', '0', 13, 1, '214,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351', 1, 0, '', NULL, 0),
(215, '温州市', '0', 13, 1, '215,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362', 1, 0, '', NULL, 0),
(216, '嘉兴市', '0', 13, 1, '216,1363,1364,1365,1366,1367,1368,1369', 1, 0, '', NULL, 0),
(217, '湖州市', '0', 13, 1, '217,1370,1371,1372,1373,1374', 1, 0, '', NULL, 0),
(218, '绍兴市', '0', 13, 1, '218,1375,1376,1377,1378,1379,1380', 1, 0, '', NULL, 0),
(219, '金华市', '0', 13, 1, '219,1381,1382,1383,1384,1385,1386,1387,1388,1389', 1, 0, '', NULL, 0),
(220, '衢州市', '0', 13, 1, '220,1390,1391,1392,1393,1394,1395', 1, 0, '', NULL, 0),
(221, '舟山市', '0', 13, 1, '221,1396,1397,1398,1399', 1, 0, '', NULL, 0),
(222, '台州市', '0', 13, 1, '222,1400,1401,1402,1403,1404,1405,1406,1407,1408', 1, 0, '', NULL, 0),
(223, '丽水市', '0', 13, 1, '223,1409,1410,1411,1412,1413,1414,1415,1416,1417', 1, 0, '', NULL, 0),
(224, '合肥市', '0', 14, 1, '224,1418,1419,1420,1421,1422,1423,1424', 1, 0, '', NULL, 0),
(225, '芜湖市', '0', 14, 1, '225,1425,1426,1427,1428,1429,1430,1431', 1, 0, '', NULL, 0),
(226, '蚌埠市', '0', 14, 1, '226,1432,1433,1434,1435,1436,1437,1438', 1, 0, '', NULL, 0),
(227, '淮南市', '0', 14, 1, '227,1439,1440,1441,1442,1443,1444', 1, 0, '', NULL, 0),
(228, '马鞍山市', '0', 14, 1, '228,1445,1446,1447,1448', 1, 0, '', NULL, 0),
(229, '淮北市', '0', 14, 1, '229,1449,1450,1451,1452', 1, 0, '', NULL, 0),
(230, '铜陵市', '0', 14, 1, '230,1453,1454,1455,1456', 1, 0, '', NULL, 0),
(231, '安庆市', '0', 14, 1, '231,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467', 1, 0, '', NULL, 0),
(232, '黄山市', '0', 14, 1, '232,1468,1469,1470,1471,1472,1473,1474', 1, 0, '', NULL, 0),
(233, '滁州市', '0', 14, 1, '233,1475,1476,1477,1478,1479,1480,1481,1482', 1, 0, '', NULL, 0),
(234, '阜阳市', '0', 14, 1, '234,1483,1484,1485,1486,1487,1488,1489,1490', 1, 0, '', NULL, 0),
(235, '宿州市', '0', 14, 1, '235,1491,1492,1493,1494,1495', 1, 0, '', NULL, 0),
(236, '巢湖市', '0', 14, 1, '236,1496,1497,1498,1499,1500', 1, 0, '', NULL, 0),
(237, '六安市', '0', 14, 1, '237,1501,1502,1503,1504,1505,1506,1507', 1, 0, '', NULL, 0),
(238, '亳州市', '0', 14, 1, '238,1508,1509,1510,1511', 1, 0, '', NULL, 0),
(239, '池州市', '0', 14, 1, '239,1512,1513,1514,1515', 1, 0, '', NULL, 0),
(240, '宣城市', '0', 14, 1, '240,1516,1517,1518,1519,1520,1521,1522', 1, 0, '', NULL, 0),
(241, '福州市', '0', 15, 1, '241,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535', 1, 0, '', NULL, 0),
(242, '厦门市', '0', 15, 1, '242,1536,1537,1538,1539,1540,1541', 1, 0, '', NULL, 0),
(243, '莆田市', '0', 15, 1, '243,1542,1543,1544,1545,1546', 1, 0, '', NULL, 0),
(244, '三明市', '0', 15, 1, '244,1547,1548,1549,1550,1551,1552,1553,1554,1555,1556,1557,1558', 1, 0, '', NULL, 0),
(245, '泉州市', '0', 15, 1, '245,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570', 1, 0, '', NULL, 0),
(246, '漳州市', '0', 15, 1, '246,1571,1572,1573,1574,1575,1576,1577,1578,1579,1580,1581', 1, 0, '', NULL, 0),
(247, '南平市', '0', 15, 1, '247,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591', 1, 0, '', NULL, 0),
(248, '龙岩市', '0', 15, 1, '248,1592,1593,1594,1595,1596,1597,1598', 1, 0, '', NULL, 0),
(249, '宁德市', '0', 15, 1, '249,1599,1600,1601,1602,1603,1604,1605,1606,1607', 1, 0, '', NULL, 0),
(250, '南昌市', '0', 16, 1, '250,1608,1609,1610,1611,1612,1613,1614,1615,1616', 1, 0, '', NULL, 0),
(251, '景德镇市', '0', 16, 1, '251,1617,1618,1619,1620', 1, 0, '', NULL, 0),
(252, '萍乡市', '0', 16, 1, '252,1621,1622,1623,1624,1625', 1, 0, '', NULL, 0),
(253, '九江市', '0', 16, 1, '253,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637', 1, 0, '', NULL, 0),
(254, '新余市', '0', 16, 1, '254,1638,1639', 1, 0, '', NULL, 0),
(255, '鹰潭市', '0', 16, 1, '255,1640,1641,1642', 1, 0, '', NULL, 0),
(256, '赣州市', '0', 16, 1, '256,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660', 1, 0, '', NULL, 0),
(257, '吉安市', '0', 16, 1, '257,1661,1662,1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673', 1, 0, '', NULL, 0),
(258, '宜春市', '0', 16, 1, '258,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683', 1, 0, '', NULL, 0),
(259, '抚州市', '0', 16, 1, '259,1684,1685,1686,1687,1688,1689,1690,1691,1692,1693,1694', 1, 0, '', NULL, 0),
(260, '上饶市', '0', 16, 1, '260,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706', 1, 0, '', NULL, 0),
(261, '济南市', '0', 17, 1, '261,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716', 1, 0, '', NULL, 0),
(262, '青岛市', '0', 17, 1, '262,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728', 1, 0, '', NULL, 0),
(263, '淄博市', '0', 17, 1, '263,1729,1730,1731,1732,1733,1734,1735,1736', 1, 0, '', NULL, 0),
(264, '枣庄市', '0', 17, 1, '264,1737,1738,1739,1740,1741,1742', 1, 0, '', NULL, 0),
(265, '东营市', '0', 17, 1, '265,1743,1744,1745,1746,1747', 1, 0, '', NULL, 0),
(266, '烟台市', '0', 17, 1, '266,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759', 1, 0, '', NULL, 0),
(267, '潍坊市', '0', 17, 1, '267,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771', 1, 0, '', NULL, 0),
(268, '济宁市', '0', 17, 1, '268,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783', 1, 0, '', NULL, 0),
(269, '泰安市', '0', 17, 1, '269,1784,1785,1786,1787,1788,1789', 1, 0, '', NULL, 0),
(270, '威海市', '0', 17, 1, '270,1790,1791,1792,1793', 1, 0, '', NULL, 0),
(271, '日照市', '0', 17, 1, '271,1794,1795,1796,1797', 1, 0, '', NULL, 0),
(272, '莱芜市', '0', 17, 1, '272,1798,1799', 1, 0, '', NULL, 0),
(273, '临沂市', '0', 17, 1, '273,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811', 1, 0, '', NULL, 0),
(274, '德州市', '0', 17, 1, '274,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822', 1, 0, '', NULL, 0),
(275, '聊城市', '0', 17, 1, '275,1823,1824,1825,1826,1827,1828,1829,1830', 1, 0, '', NULL, 0),
(276, '滨州市', '0', 17, 1, '276,1831,1832,1833,1834,1835,1836,1837', 1, 0, '', NULL, 0),
(277, '荷泽市', '0', 17, 1, '277,1838,1839,1840,1841,1842,1843,1844,1845,1846', 1, 0, '', NULL, 0),
(278, '郑州市', '0', 18, 1, '278,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858', 1, 0, '', NULL, 0),
(279, '开封市', '0', 18, 1, '279,1859,1860,1861,1862,1863,1864,1865,1866,1867,1868', 1, 0, '', NULL, 0),
(280, '洛阳市', '0', 18, 1, '280,1869,1870,1871,1872,1873,1874,1875,1876,1877,1878,1879,1880,1881,1882,1883', 1, 0, '', NULL, 0),
(281, '平顶山市', '0', 18, 1, '281,1884,1885,1886,1887,1888,1889,1890,1891,1892,1893', 1, 0, '', NULL, 0),
(282, '安阳市', '0', 18, 1, '282,1894,1895,1896,1897,1898,1899,1900,1901,1902', 1, 0, '', NULL, 0),
(283, '鹤壁市', '0', 18, 1, '283,1903,1904,1905,1906,1907', 1, 0, '', NULL, 0),
(284, '新乡市', '0', 18, 1, '284,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919', 1, 0, '', NULL, 0),
(285, '焦作市', '0', 18, 1, '285,1920,1921,1922,1923,1924,1925,1926,1927,1928,1929,1930', 1, 0, '', NULL, 0),
(286, '濮阳市', '0', 18, 1, '286,1931,1932,1933,1934,1935,1936', 1, 0, '', NULL, 0),
(287, '许昌市', '0', 18, 1, '287,1937,1938,1939,1940,1941,1942', 1, 0, '', NULL, 0),
(288, '漯河市', '0', 18, 1, '288,1943,1944,1945,1946,1947', 1, 0, '', NULL, 0),
(289, '三门峡市', '0', 18, 1, '289,1948,1949,1950,1951,1952,1953', 1, 0, '', NULL, 0),
(290, '南阳市', '0', 18, 1, '290,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966', 1, 0, '', NULL, 0),
(291, '商丘市', '0', 18, 1, '291,1967,1968,1969,1970,1971,1972,1973,1974,1975', 1, 0, '', NULL, 0),
(292, '信阳市', '0', 18, 1, '292,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985', 1, 0, '', NULL, 0),
(293, '周口市', '0', 18, 1, '293,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995', 1, 0, '', NULL, 0),
(294, '驻马店市', '0', 18, 1, '294,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005', 1, 0, '', NULL, 0),
(295, '武汉市', '0', 19, 1, '295,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018', 1, 0, '', NULL, 0),
(296, '黄石市', '0', 19, 1, '296,2019,2020,2021,2022,2023,2024', 1, 0, '', NULL, 0),
(297, '十堰市', '0', 19, 1, '297,2025,2026,2027,2028,2029,2030,2031,2032', 1, 0, '', NULL, 0),
(298, '宜昌市', '0', 19, 1, '298,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045', 1, 0, '', NULL, 0),
(299, '襄樊市', '0', 19, 1, '299,2046,2047,2048,2049,2050,2051,2052,2053,2054', 1, 0, '', NULL, 0),
(300, '鄂州市', '0', 19, 1, '300,2055,2056,2057', 1, 0, '', NULL, 0),
(301, '荆门市', '0', 19, 1, '301,2058,2059,2060,2061,2062', 1, 0, '', NULL, 0),
(302, '孝感市', '0', 19, 1, '302,2063,2064,2065,2066,2067,2068,2069', 1, 0, '', NULL, 0),
(303, '荆州市', '0', 19, 1, '303,2070,2071,2072,2073,2074,2075,2076,2077', 1, 0, '', NULL, 0),
(304, '黄冈市', '0', 19, 1, '304,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087', 1, 0, '', NULL, 0),
(305, '咸宁市', '0', 19, 1, '305,2088,2089,2090,2091,2092,2093', 1, 0, '', NULL, 0),
(306, '随州市', '0', 19, 1, '306,2094,2095', 1, 0, '', NULL, 0),
(307, '恩施土家族苗族自治州', '0', 19, 1, '307,2096,2097,2098,2099,2100,2101,2102,2103', 1, 0, '', NULL, 0),
(308, '仙桃市', '0', 19, 0, '308', 1, 0, '', NULL, 0),
(309, '潜江市', '0', 19, 0, '309', 1, 0, '', NULL, 0),
(310, '天门市', '0', 19, 0, '310', 1, 0, '', NULL, 0),
(311, '神农架林区', '0', 19, 0, '311', 1, 0, '', NULL, 0),
(312, '长沙市', '0', 20, 1, '312,2104,2105,2106,2107,2108,2109,2110,2111,2112', 1, 0, '', NULL, 0),
(313, '株洲市', '0', 20, 1, '313,2113,2114,2115,2116,2117,2118,2119,2120,2121', 1, 0, '', NULL, 0),
(314, '湘潭市', '0', 20, 1, '314,2122,2123,2124,2125,2126', 1, 0, '', NULL, 0),
(315, '衡阳市', '0', 20, 1, '315,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138', 1, 0, '', NULL, 0),
(316, '邵阳市', '0', 20, 1, '316,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150', 1, 0, '', NULL, 0),
(317, '岳阳市', '0', 20, 1, '317,2151,2152,2153,2154,2155,2156,2157,2158,2159', 1, 0, '', NULL, 0),
(318, '常德市', '0', 20, 1, '318,2160,2161,2162,2163,2164,2165,2166,2167,2168', 1, 0, '', NULL, 0),
(319, '张家界市', '0', 20, 1, '319,2169,2170,2171,2172', 1, 0, '', NULL, 0),
(320, '益阳市', '0', 20, 1, '320,2173,2174,2175,2176,2177,2178', 1, 0, '', NULL, 0),
(321, '郴州市', '0', 20, 1, '321,2179,2180,2181,2182,2183,2184,2185,2186,2187,2188,2189', 1, 0, '', NULL, 0),
(322, '永州市', '0', 20, 1, '322,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2200', 1, 0, '', NULL, 0),
(323, '怀化市', '0', 20, 1, '323,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212', 1, 0, '', NULL, 0),
(324, '娄底市', '0', 20, 1, '324,2213,2214,2215,2216,2217', 1, 0, '', NULL, 0),
(325, '湘西土家族苗族自治州', '0', 20, 1, '325,2218,2219,2220,2221,2222,2223,2224,2225', 1, 0, '', NULL, 0),
(326, '广州市', '0', 21, 1, '326,2226,2227,2228,2229,2230,2231,2232,2233,2234,2235,2236,2237', 1, 0, '', NULL, 0),
(327, '韶关市', '0', 21, 1, '327,2238,2239,2240,2241,2242,2243,2244,2245,2246,2247', 1, 0, '', NULL, 0),
(328, '深圳市', '0', 21, 1, '328,2248,2249,2250,2251,2252,2253', 1, 0, '', NULL, 0),
(329, '珠海市', '0', 21, 1, '329,2254,2255,2256', 1, 0, '', NULL, 0),
(330, '汕头市', '0', 21, 1, '330,2257,2258,2259,2260,2261,2262,2263', 1, 0, '', NULL, 0),
(331, '佛山市', '0', 21, 1, '331,2264,2265,2266,2267,2268', 1, 0, '', NULL, 0),
(332, '江门市', '0', 21, 1, '332,2269,2270,2271,2272,2273,2274,2275', 1, 0, '', NULL, 0),
(333, '湛江市', '0', 21, 1, '333,2276,2277,2278,2279,2280,2281,2282,2283,2284', 1, 0, '', NULL, 0),
(334, '茂名市', '0', 21, 1, '334,2285,2286,2287,2288,2289,2290', 1, 0, '', NULL, 0),
(335, '肇庆市', '0', 21, 1, '335,2291,2292,2293,2294,2295,2296,2297,2298', 1, 0, '', NULL, 0),
(336, '惠州市', '0', 21, 1, '336,2299,2300,2301,2302,2303', 1, 0, '', NULL, 0),
(337, '梅州市', '0', 21, 1, '337,2304,2305,2306,2307,2308,2309,2310,2311', 1, 0, '', NULL, 0),
(338, '汕尾市', '0', 21, 1, '338,2312,2313,2314,2315', 1, 0, '', NULL, 0),
(339, '河源市', '0', 21, 1, '339,2316,2317,2318,2319,2320,2321', 1, 0, '', NULL, 0),
(340, '阳江市', '0', 21, 1, '340,2322,2323,2324,2325', 1, 0, '', NULL, 0),
(341, '清远市', '0', 21, 1, '341,2326,2327,2328,2329,2330,2331,2332,2333', 1, 0, '', NULL, 0),
(342, '东莞市', '0', 21, 0, '342', 1, 0, '', NULL, 0),
(343, '中山市', '0', 21, 0, '343', 1, 0, '', NULL, 0),
(344, '潮州市', '0', 21, 1, '344,2334,2335,2336', 1, 0, '', NULL, 0),
(345, '揭阳市', '0', 21, 1, '345,2337,2338,2339,2340,2341', 1, 0, '', NULL, 0),
(346, '云浮市', '0', 21, 1, '346,2342,2343,2344,2345,2346', 1, 0, '', NULL, 0),
(347, '南宁市', '0', 22, 1, '347,2347,2348,2349,2350,2351,2352,2353,2354,2355,2356,2357,2358', 1, 0, '', NULL, 0),
(348, '柳州市', '0', 22, 1, '348,2359,2360,2361,2362,2363,2364,2365,2366,2367,2368', 1, 0, '', NULL, 0),
(349, '桂林市', '0', 22, 1, '349,2369,2370,2371,2372,2373,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385', 1, 0, '', NULL, 0),
(350, '梧州市', '0', 22, 1, '350,2386,2387,2388,2389,2390,2391,2392', 1, 0, '', NULL, 0),
(351, '北海市', '0', 22, 1, '351,2393,2394,2395,2396', 1, 0, '', NULL, 0),
(352, '防城港市', '0', 22, 1, '352,2397,2398,2399,2400', 1, 0, '', NULL, 0),
(353, '钦州市', '0', 22, 1, '353,2401,2402,2403,2404', 1, 0, '', NULL, 0),
(354, '贵港市', '0', 22, 1, '354,2405,2406,2407,2408,2409', 1, 0, '', NULL, 0),
(355, '玉林市', '0', 22, 1, '355,2410,2411,2412,2413,2414,2415', 1, 0, '', NULL, 0),
(356, '百色市', '0', 22, 1, '356,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427', 1, 0, '', NULL, 0),
(357, '贺州市', '0', 22, 1, '357,2428,2429,2430,2431', 1, 0, '', NULL, 0),
(358, '河池市', '0', 22, 1, '358,2432,2433,2434,2435,2436,2437,2438,2439,2440,2441,2442', 1, 0, '', NULL, 0),
(359, '来宾市', '0', 22, 1, '359,2443,2444,2445,2446,2447,2448', 1, 0, '', NULL, 0),
(360, '崇左市', '0', 22, 1, '360,2449,2450,2451,2452,2453,2454,2455', 1, 0, '', NULL, 0),
(361, '海口市', '0', 23, 1, '361,2456,2457,2458,2459', 1, 0, '', NULL, 0),
(362, '三亚市', '0', 23, 0, '362', 1, 0, '', NULL, 0),
(363, '五指山市', '0', 23, 0, '363', 1, 0, '', NULL, 0),
(364, '琼海市', '0', 23, 0, '364', 1, 0, '', NULL, 0),
(365, '儋州市', '0', 23, 0, '365', 1, 0, '', NULL, 0),
(366, '文昌市', '0', 23, 0, '366', 1, 0, '', NULL, 0),
(367, '万宁市', '0', 23, 0, '367', 1, 0, '', NULL, 0),
(368, '东方市', '0', 23, 0, '368', 1, 0, '', NULL, 0),
(369, '定安县', '0', 23, 0, '369', 1, 0, '', NULL, 0),
(370, '屯昌县', '0', 23, 0, '370', 1, 0, '', NULL, 0),
(371, '澄迈县', '0', 23, 0, '371', 1, 0, '', NULL, 0),
(372, '临高县', '0', 23, 0, '372', 1, 0, '', NULL, 0),
(373, '白沙黎族自治县', '0', 23, 0, '373', 1, 0, '', NULL, 0),
(374, '昌江黎族自治县', '0', 23, 0, '374', 1, 0, '', NULL, 0),
(375, '乐东黎族自治县', '0', 23, 0, '375', 1, 0, '', NULL, 0),
(376, '陵水黎族自治县', '0', 23, 0, '376', 1, 0, '', NULL, 0),
(377, '保亭黎族苗族自治县', '0', 23, 0, '377', 1, 0, '', NULL, 0),
(378, '琼中黎族苗族自治县', '0', 23, 0, '378', 1, 0, '', NULL, 0),
(379, '西沙群岛', '0', 23, 0, '379', 1, 0, '', NULL, 0),
(380, '南沙群岛', '0', 23, 0, '380', 1, 0, '', NULL, 0),
(381, '中沙群岛的岛礁及其海域', '0', 23, 0, '381', 1, 0, '', NULL, 0),
(382, '成都市', '0', 24, 1, '382,2460,2461,2462,2463,2464,2465,2466,2467,2468,2469,2470,2471,2472,2473,2474,2475,2476,2477,2478', 1, 0, '', NULL, 0),
(383, '自贡市', '0', 24, 1, '383,2479,2480,2481,2482,2483,2484', 1, 0, '', NULL, 0),
(384, '攀枝花市', '0', 24, 1, '384,2485,2486,2487,2488,2489', 1, 0, '', NULL, 0),
(385, '泸州市', '0', 24, 1, '385,2490,2491,2492,2493,2494,2495,2496', 1, 0, '', NULL, 0),
(386, '德阳市', '0', 24, 1, '386,2497,2498,2499,2500,2501,2502', 1, 0, '', NULL, 0),
(387, '绵阳市', '0', 24, 1, '387,2503,2504,2505,2506,2507,2508,2509,2510,2511', 1, 0, '', NULL, 0),
(388, '广元市', '0', 24, 1, '388,2512,2513,2514,2515,2516,2517,2518', 1, 0, '', NULL, 0),
(389, '遂宁市', '0', 24, 1, '389,2519,2520,2521,2522,2523', 1, 0, '', NULL, 0),
(390, '内江市', '0', 24, 1, '390,2524,2525,2526,2527,2528', 1, 0, '', NULL, 0),
(391, '乐山市', '0', 24, 1, '391,2529,2530,2531,2532,2533,2534,2535,2536,2537,2538,2539', 1, 0, '', NULL, 0),
(392, '南充市', '0', 24, 1, '392,2540,2541,2542,2543,2544,2545,2546,2547,2548', 1, 0, '', NULL, 0),
(393, '眉山市', '0', 24, 1, '393,2549,2550,2551,2552,2553,2554', 1, 0, '', NULL, 0),
(394, '宜宾市', '0', 24, 1, '394,2555,2556,2557,2558,2559,2560,2561,2562,2563,2564', 1, 0, '', NULL, 0),
(395, '广安市', '0', 24, 1, '395,2565,2566,2567,2568,2569', 1, 0, '', NULL, 0),
(396, '达州市', '0', 24, 1, '396,2570,2571,2572,2573,2574,2575,2576', 1, 0, '', NULL, 0),
(397, '雅安市', '0', 24, 1, '397,2577,2578,2579,2580,2581,2582,2583,2584', 1, 0, '', NULL, 0),
(398, '巴中市', '0', 24, 1, '398,2585,2586,2587,2588', 1, 0, '', NULL, 0),
(399, '资阳市', '0', 24, 1, '399,2589,2590,2591,2592', 1, 0, '', NULL, 0),
(400, '阿坝州', '0', 24, 1, '400,2593,2594,2595,2596,2597,2598,2599,2600,2601,2602,2603,2604,2605', 1, 0, '', NULL, 0),
(401, '甘孜州', '0', 24, 1, '401,2606,2607,2608,2609,2610,2611,2612,2613,2614,2615,2616,2617,2618,2619,2620,2621,2622,2623', 1, 0, '', NULL, 0),
(402, '凉山州', '0', 24, 1, '402,2624,2625,2626,2627,2628,2629,2630,2631,2632,2633,2634,2635,2636,2637,2638,2639,2640', 1, 0, '', NULL, 0),
(403, '贵阳市', '0', 25, 1, '403,2641,2642,2643,2644,2645,2646,2647,2648,2649,2650', 1, 0, '', NULL, 0),
(404, '六盘水市', '0', 25, 1, '404,2651,2652,2653,2654', 1, 0, '', NULL, 0),
(405, '遵义市', '0', 25, 1, '405,2655,2656,2657,2658,2659,2660,2661,2662,2663,2664,2665,2666,2667,2668', 1, 0, '', NULL, 0),
(406, '安顺市', '0', 25, 1, '406,2669,2670,2671,2672,2673,2674', 1, 0, '', NULL, 0),
(407, '铜仁地区', '0', 25, 1, '407,2675,2676,2677,2678,2679,2680,2681,2682,2683,2684', 1, 0, '', NULL, 0),
(408, '黔西南州', '0', 25, 1, '408,2685,2686,2687,2688,2689,2690,2691,2692', 1, 0, '', NULL, 0),
(409, '毕节地区', '0', 25, 1, '409,2693,2694,2695,2696,2697,2698,2699,2700', 1, 0, '', NULL, 0),
(410, '黔东南州', '0', 25, 1, '410,2701,2702,2703,2704,2705,2706,2707,2708,2709,2710,2711,2712,2713,2714,2715,2716', 1, 0, '', NULL, 0),
(411, '黔南州', '0', 25, 1, '411,2717,2718,2719,2720,2721,2722,2723,2724,2725,2726,2727,2728', 1, 0, '', NULL, 0),
(412, '昆明市', '0', 26, 1, '412,2729,2730,2731,2732,2733,2734,2735,2736,2737,2738,2739,2740,2741,2742', 1, 0, '', NULL, 0),
(413, '曲靖市', '0', 26, 1, '413,2743,2744,2745,2746,2747,2748,2749,2750,2751', 1, 0, '', NULL, 0),
(414, '玉溪市', '0', 26, 1, '414,2752,2753,2754,2755,2756,2757,2758,2759,2760', 1, 0, '', NULL, 0),
(415, '保山市', '0', 26, 1, '415,2761,2762,2763,2764,2765', 1, 0, '', NULL, 0),
(416, '昭通市', '0', 26, 1, '416,2766,2767,2768,2769,2770,2771,2772,2773,2774,2775,2776', 1, 0, '', NULL, 0),
(417, '丽江市', '0', 26, 1, '417,2777,2778,2779,2780,2781', 1, 0, '', NULL, 0),
(418, '思茅市', '0', 26, 1, '418,2782,2783,2784,2785,2786,2787,2788,2789,2790,2791', 1, 0, '', NULL, 0),
(419, '临沧市', '0', 26, 1, '419,2792,2793,2794,2795,2796,2797,2798', 1, 0, '', NULL, 0),
(420, '楚雄州', '0', 26, 1, '420,2799,2800,2801,2802,2803,2804,2805,2806,2807,2808,2809', 1, 0, '', NULL, 0),
(421, '红河州', '0', 26, 1, '421,2810,2811,2812,2813,2814,2815,2816,2817,2818,2819,2820,2821,2822', 1, 0, '', NULL, 0),
(422, '文山州', '0', 26, 1, '422,2823,2824,2825,2826,2827,2828,2829,2830', 1, 0, '', NULL, 0),
(423, '西双版纳', '0', 26, 1, '423,2831,2832,2833', 1, 0, '', NULL, 0);
INSERT DELAYED IGNORE INTO `cban_linkage` (`linkageid`, `name`, `style`, `parentid`, `child`, `arrchildid`, `keyid`, `listorder`, `description`, `setting`, `siteid`) VALUES 
(424, '大理', '0', 26, 1, '424,2834,2835,2836,2837,2838,2839,2840,2841,2842,2843,2844,2845', 1, 0, '', NULL, 0),
(425, '德宏', '0', 26, 1, '425,2846,2847,2848,2849,2850', 1, 0, '', NULL, 0),
(426, '怒江', '0', 26, 1, '426,2851,2852,2853,2854', 1, 0, '', NULL, 0),
(427, '迪庆', '0', 26, 1, '427,2855,2856,2857', 1, 0, '', NULL, 0),
(428, '拉萨市', '0', 27, 1, '428,2858,2859,2860,2861,2862,2863,2864,2865', 1, 0, '', NULL, 0),
(429, '昌都', '0', 27, 1, '429,2866,2867,2868,2869,2870,2871,2872,2873,2874,2875,2876', 1, 0, '', NULL, 0),
(430, '山南', '0', 27, 1, '430,2877,2878,2879,2880,2881,2882,2883,2884,2885,2886,2887,2888', 1, 0, '', NULL, 0),
(431, '日喀则', '0', 27, 1, '431,2889,2890,2891,2892,2893,2894,2895,2896,2897,2898,2899,2900,2901,2902,2903,2904,2905,2906', 1, 0, '', NULL, 0),
(432, '那曲', '0', 27, 1, '432,2907,2908,2909,2910,2911,2912,2913,2914,2915,2916', 1, 0, '', NULL, 0),
(433, '阿里', '0', 27, 1, '433,2917,2918,2919,2920,2921,2922,2923', 1, 0, '', NULL, 0),
(434, '林芝', '0', 27, 1, '434,2924,2925,2926,2927,2928,2929,2930', 1, 0, '', NULL, 0),
(435, '西安市', '0', 28, 1, '435,2931,2932,2933,2934,2935,2936,2937,2938,2939,2940,2941,2942,2943', 1, 0, '', NULL, 0),
(436, '铜川市', '0', 28, 1, '436,2944,2945,2946,2947', 1, 0, '', NULL, 0),
(437, '宝鸡市', '0', 28, 1, '437,2948,2949,2950,2951,2952,2953,2954,2955,2956,2957,2958,2959', 1, 0, '', NULL, 0),
(438, '咸阳市', '0', 28, 1, '438,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973', 1, 0, '', NULL, 0),
(439, '渭南市', '0', 28, 1, '439,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984', 1, 0, '', NULL, 0),
(440, '延安市', '0', 28, 1, '440,2985,2986,2987,2988,2989,2990,2991,2992,2993,2994,2995,2996,2997', 1, 0, '', NULL, 0),
(441, '汉中市', '0', 28, 1, '441,2998,2999,3000,3001,3002,3003,3004,3005,3006,3007,3008', 1, 0, '', NULL, 0),
(442, '榆林市', '0', 28, 1, '442,3009,3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020', 1, 0, '', NULL, 0),
(443, '安康市', '0', 28, 1, '443,3021,3022,3023,3024,3025,3026,3027,3028,3029,3030', 1, 0, '', NULL, 0),
(444, '商洛市', '0', 28, 1, '444,3031,3032,3033,3034,3035,3036,3037', 1, 0, '', NULL, 0),
(445, '兰州市', '0', 29, 1, '445,3038,3039,3040,3041,3042,3043,3044,3045', 1, 0, '', NULL, 0),
(446, '嘉峪关市', '0', 29, 0, '446', 1, 0, '', NULL, 0),
(447, '金昌市', '0', 29, 1, '447,3046,3047', 1, 0, '', NULL, 0),
(448, '白银市', '0', 29, 1, '448,3048,3049,3050,3051,3052', 1, 0, '', NULL, 0),
(449, '天水市', '0', 29, 1, '449,3053,3054,3055,3056,3057,3058,3059', 1, 0, '', NULL, 0),
(450, '武威市', '0', 29, 1, '450,3060,3061,3062,3063', 1, 0, '', NULL, 0),
(451, '张掖市', '0', 29, 1, '451,3064,3065,3066,3067,3068,3069', 1, 0, '', NULL, 0),
(452, '平凉市', '0', 29, 1, '452,3070,3071,3072,3073,3074,3075,3076', 1, 0, '', NULL, 0),
(453, '酒泉市', '0', 29, 1, '453,3077,3078,3079,3080,3081,3082,3083', 1, 0, '', NULL, 0),
(454, '庆阳市', '0', 29, 1, '454,3084,3085,3086,3087,3088,3089,3090,3091', 1, 0, '', NULL, 0),
(455, '定西市', '0', 29, 1, '455,3092,3093,3094,3095,3096,3097,3098', 1, 0, '', NULL, 0),
(456, '陇南市', '0', 29, 1, '456,3099,3100,3101,3102,3103,3104,3105,3106,3107', 1, 0, '', NULL, 0),
(457, '临夏州', '0', 29, 1, '457,3108,3109,3110,3111,3112,3113,3114,3115', 1, 0, '', NULL, 0),
(458, '甘州', '0', 29, 1, '458,3116,3117,3118,3119,3120,3121,3122,3123', 1, 0, '', NULL, 0),
(459, '西宁市', '0', 30, 1, '459,3124,3125,3126,3127,3128,3129,3130', 1, 0, '', NULL, 0),
(460, '海东地区', '0', 30, 1, '460,3131,3132,3133,3134,3135,3136', 1, 0, '', NULL, 0),
(461, '海州', '0', 30, 1, '461,3137,3138,3139,3140', 1, 0, '', NULL, 0),
(462, '黄南州', '0', 30, 1, '462,3141,3142,3143,3144', 1, 0, '', NULL, 0),
(463, '海南州', '0', 30, 1, '463,3145,3146,3147,3148,3149', 1, 0, '', NULL, 0),
(464, '果洛州', '0', 30, 1, '464,3150,3151,3152,3153,3154,3155', 1, 0, '', NULL, 0),
(465, '玉树州', '0', 30, 1, '465,3156,3157,3158,3159,3160,3161', 1, 0, '', NULL, 0),
(466, '海西州', '0', 30, 1, '466,3162,3163,3164,3165,3166', 1, 0, '', NULL, 0),
(467, '银川市', '0', 31, 1, '467,3167,3168,3169,3170,3171,3172', 1, 0, '', NULL, 0),
(468, '石嘴山市', '0', 31, 1, '468,3173,3174,3175', 1, 0, '', NULL, 0),
(469, '吴忠市', '0', 31, 1, '469,3176,3177,3178,3179', 1, 0, '', NULL, 0),
(470, '固原市', '0', 31, 1, '470,3180,3181,3182,3183,3184', 1, 0, '', NULL, 0),
(471, '中卫市', '0', 31, 1, '471,3185,3186,3187', 1, 0, '', NULL, 0),
(472, '乌鲁木齐市', '0', 32, 1, '472,3188,3189,3190,3191,3192,3193,3194,3195', 1, 0, '', NULL, 0),
(473, '克拉玛依市', '0', 32, 1, '473,3196,3197,3198,3199', 1, 0, '', NULL, 0),
(474, '吐鲁番地区', '0', 32, 1, '474,3200,3201,3202', 1, 0, '', NULL, 0),
(475, '哈密地区', '0', 32, 1, '475,3203,3204,3205', 1, 0, '', NULL, 0),
(476, '昌吉州', '0', 32, 1, '476,3206,3207,3208,3209,3210,3211,3212,3213', 1, 0, '', NULL, 0),
(477, '博尔州', '0', 32, 1, '477,3214,3215,3216', 1, 0, '', NULL, 0),
(478, '巴音郭楞州', '0', 32, 1, '478,3217,3218,3219,3220,3221,3222,3223,3224,3225', 1, 0, '', NULL, 0),
(479, '阿克苏地区', '0', 32, 1, '479,3226,3227,3228,3229,3230,3231,3232,3233,3234', 1, 0, '', NULL, 0),
(480, '克孜勒苏柯尔克孜自治州', '0', 32, 1, '480,3235,3236,3237,3238', 1, 0, '', NULL, 0),
(481, '喀什地区', '0', 32, 1, '481,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250', 1, 0, '', NULL, 0),
(482, '和田地区', '0', 32, 1, '482,3251,3252,3253,3254,3255,3256,3257,3258', 1, 0, '', NULL, 0),
(483, '伊犁州', '0', 32, 1, '483,3259,3260,3261,3262,3263,3264,3265,3266,3267,3268', 1, 0, '', NULL, 0),
(484, '塔城地区', '0', 32, 1, '484,3269,3270,3271,3272,3273,3274,3275', 1, 0, '', NULL, 0),
(485, '阿勒泰地区', '0', 32, 1, '485,3276,3277,3278,3279,3280,3281,3282', 1, 0, '', NULL, 0),
(486, '石河子市', '0', 32, 0, '486', 1, 0, '', NULL, 0),
(487, '阿拉尔市', '0', 32, 0, '487', 1, 0, '', NULL, 0),
(488, '图木舒克市', '0', 32, 0, '488', 1, 0, '', NULL, 0),
(489, '五家渠市', '0', 32, 0, '489', 1, 0, '', NULL, 0),
(490, '台北市', '0', 33, 0, '490', 1, 0, '', NULL, 0),
(491, '高雄市', '0', 33, 0, '491', 1, 0, '', NULL, 0),
(492, '基隆市', '0', 33, 0, '492', 1, 0, '', NULL, 0),
(493, '新竹市', '0', 33, 0, '493', 1, 0, '', NULL, 0),
(494, '台中市', '0', 33, 0, '494', 1, 0, '', NULL, 0),
(495, '嘉义市', '0', 33, 0, '495', 1, 0, '', NULL, 0),
(496, '台南市', '0', 33, 0, '496', 1, 0, '', NULL, 0),
(497, '台北县', '0', 33, 0, '497', 1, 0, '', NULL, 0),
(498, '桃园县', '0', 33, 0, '498', 1, 0, '', NULL, 0),
(499, '新竹县', '0', 33, 0, '499', 1, 0, '', NULL, 0),
(500, '苗栗县', '0', 33, 0, '500', 1, 0, '', NULL, 0),
(501, '台中县', '0', 33, 0, '501', 1, 0, '', NULL, 0),
(502, '彰化县', '0', 33, 0, '502', 1, 0, '', NULL, 0),
(503, '南投县', '0', 33, 0, '503', 1, 0, '', NULL, 0),
(504, '云林县', '0', 33, 0, '504', 1, 0, '', NULL, 0),
(505, '嘉义县', '0', 33, 0, '505', 1, 0, '', NULL, 0),
(506, '台南县', '0', 33, 0, '506', 1, 0, '', NULL, 0),
(507, '高雄县', '0', 33, 0, '507', 1, 0, '', NULL, 0),
(508, '屏东县', '0', 33, 0, '508', 1, 0, '', NULL, 0),
(509, '宜兰县', '0', 33, 0, '509', 1, 0, '', NULL, 0),
(510, '花莲县', '0', 33, 0, '510', 1, 0, '', NULL, 0),
(511, '台东县', '0', 33, 0, '511', 1, 0, '', NULL, 0),
(512, '澎湖县', '0', 33, 0, '512', 1, 0, '', NULL, 0),
(513, '金门县', '0', 33, 0, '513', 1, 0, '', NULL, 0),
(514, '连江县', '0', 33, 0, '514', 1, 0, '', NULL, 0),
(515, '中西区', '0', 34, 0, '515', 1, 0, '', NULL, 0),
(516, '东区', '0', 34, 0, '516', 1, 0, '', NULL, 0),
(517, '南区', '0', 34, 0, '517', 1, 0, '', NULL, 0),
(518, '湾仔区', '0', 34, 0, '518', 1, 0, '', NULL, 0),
(519, '九龙城区', '0', 34, 0, '519', 1, 0, '', NULL, 0),
(520, '观塘区', '0', 34, 0, '520', 1, 0, '', NULL, 0),
(521, '深水埗区', '0', 34, 0, '521', 1, 0, '', NULL, 0),
(522, '黄大仙区', '0', 34, 0, '522', 1, 0, '', NULL, 0),
(523, '油尖旺区', '0', 34, 0, '523', 1, 0, '', NULL, 0),
(524, '离岛区', '0', 34, 0, '524', 1, 0, '', NULL, 0),
(525, '葵青区', '0', 34, 0, '525', 1, 0, '', NULL, 0),
(526, '北区', '0', 34, 0, '526', 1, 0, '', NULL, 0),
(527, '西贡区', '0', 34, 0, '527', 1, 0, '', NULL, 0),
(528, '沙田区', '0', 34, 0, '528', 1, 0, '', NULL, 0),
(529, '大埔区', '0', 34, 0, '529', 1, 0, '', NULL, 0),
(530, '荃湾区', '0', 34, 0, '530', 1, 0, '', NULL, 0),
(531, '屯门区', '0', 34, 0, '531', 1, 0, '', NULL, 0),
(532, '元朗区', '0', 34, 0, '532', 1, 0, '', NULL, 0),
(533, '花地玛堂区', '0', 35, 0, '533', 1, 0, '', NULL, 0),
(534, '市圣安多尼堂区', '0', 35, 0, '534', 1, 0, '', NULL, 0),
(535, '大堂区', '0', 35, 0, '535', 1, 0, '', NULL, 0),
(536, '望德堂区', '0', 35, 0, '536', 1, 0, '', NULL, 0),
(537, '风顺堂区', '0', 35, 0, '537', 1, 0, '', NULL, 0),
(538, '嘉模堂区', '0', 35, 0, '538', 1, 0, '', NULL, 0),
(539, '圣方济各堂区', '0', 35, 0, '539', 1, 0, '', NULL, 0),
(540, '长安区', '0', 130, 0, '540', 1, 0, '', NULL, 0),
(541, '桥东区', '0', 130, 0, '541', 1, 0, '', NULL, 0),
(542, '桥西区', '0', 130, 0, '542', 1, 0, '', NULL, 0),
(543, '新华区', '0', 130, 0, '543', 1, 0, '', NULL, 0),
(544, '井陉矿区', '0', 130, 0, '544', 1, 0, '', NULL, 0),
(545, '裕华区', '0', 130, 0, '545', 1, 0, '', NULL, 0),
(546, '井陉县', '0', 130, 0, '546', 1, 0, '', NULL, 0),
(547, '正定县', '0', 130, 0, '547', 1, 0, '', NULL, 0),
(548, '栾城县', '0', 130, 0, '548', 1, 0, '', NULL, 0),
(549, '行唐县', '0', 130, 0, '549', 1, 0, '', NULL, 0),
(550, '灵寿县', '0', 130, 0, '550', 1, 0, '', NULL, 0),
(551, '高邑县', '0', 130, 0, '551', 1, 0, '', NULL, 0),
(552, '深泽县', '0', 130, 0, '552', 1, 0, '', NULL, 0),
(553, '赞皇县', '0', 130, 0, '553', 1, 0, '', NULL, 0),
(554, '无极县', '0', 130, 0, '554', 1, 0, '', NULL, 0),
(555, '平山县', '0', 130, 0, '555', 1, 0, '', NULL, 0),
(556, '元氏县', '0', 130, 0, '556', 1, 0, '', NULL, 0),
(557, '赵县', '0', 130, 0, '557', 1, 0, '', NULL, 0),
(558, '辛集市', '0', 130, 0, '558', 1, 0, '', NULL, 0),
(559, '藁城市', '0', 130, 0, '559', 1, 0, '', NULL, 0),
(560, '晋州市', '0', 130, 0, '560', 1, 0, '', NULL, 0),
(561, '新乐市', '0', 130, 0, '561', 1, 0, '', NULL, 0),
(562, '鹿泉市', '0', 130, 0, '562', 1, 0, '', NULL, 0),
(563, '路南区', '0', 131, 0, '563', 1, 0, '', NULL, 0),
(564, '路北区', '0', 131, 0, '564', 1, 0, '', NULL, 0),
(565, '古冶区', '0', 131, 0, '565', 1, 0, '', NULL, 0),
(566, '开平区', '0', 131, 0, '566', 1, 0, '', NULL, 0),
(567, '丰南区', '0', 131, 0, '567', 1, 0, '', NULL, 0),
(568, '丰润区', '0', 131, 0, '568', 1, 0, '', NULL, 0),
(569, '滦县', '0', 131, 0, '569', 1, 0, '', NULL, 0),
(570, '滦南县', '0', 131, 0, '570', 1, 0, '', NULL, 0),
(571, '乐亭县', '0', 131, 0, '571', 1, 0, '', NULL, 0),
(572, '迁西县', '0', 131, 0, '572', 1, 0, '', NULL, 0),
(573, '玉田县', '0', 131, 0, '573', 1, 0, '', NULL, 0),
(574, '唐海县', '0', 131, 0, '574', 1, 0, '', NULL, 0),
(575, '遵化市', '0', 131, 0, '575', 1, 0, '', NULL, 0),
(576, '迁安市', '0', 131, 0, '576', 1, 0, '', NULL, 0),
(577, '海港区', '0', 132, 0, '577', 1, 0, '', NULL, 0),
(578, '山海关区', '0', 132, 0, '578', 1, 0, '', NULL, 0),
(579, '北戴河区', '0', 132, 0, '579', 1, 0, '', NULL, 0),
(580, '青龙县', '0', 132, 0, '580', 1, 0, '', NULL, 0),
(581, '昌黎县', '0', 132, 0, '581', 1, 0, '', NULL, 0),
(582, '抚宁县', '0', 132, 0, '582', 1, 0, '', NULL, 0),
(583, '卢龙县', '0', 132, 0, '583', 1, 0, '', NULL, 0),
(584, '邯山区', '0', 133, 0, '584', 1, 0, '', NULL, 0),
(585, '丛台区', '0', 133, 0, '585', 1, 0, '', NULL, 0),
(586, '复兴区', '0', 133, 0, '586', 1, 0, '', NULL, 0),
(587, '峰峰矿区', '0', 133, 0, '587', 1, 0, '', NULL, 0),
(588, '邯郸县', '0', 133, 0, '588', 1, 0, '', NULL, 0),
(589, '临漳县', '0', 133, 0, '589', 1, 0, '', NULL, 0),
(590, '成安县', '0', 133, 0, '590', 1, 0, '', NULL, 0),
(591, '大名县', '0', 133, 0, '591', 1, 0, '', NULL, 0),
(592, '涉县', '0', 133, 0, '592', 1, 0, '', NULL, 0),
(593, '磁县', '0', 133, 0, '593', 1, 0, '', NULL, 0),
(594, '肥乡县', '0', 133, 0, '594', 1, 0, '', NULL, 0),
(595, '永年县', '0', 133, 0, '595', 1, 0, '', NULL, 0),
(596, '邱县', '0', 133, 0, '596', 1, 0, '', NULL, 0),
(597, '鸡泽县', '0', 133, 0, '597', 1, 0, '', NULL, 0),
(598, '广平县', '0', 133, 0, '598', 1, 0, '', NULL, 0),
(599, '馆陶县', '0', 133, 0, '599', 1, 0, '', NULL, 0),
(600, '魏县', '0', 133, 0, '600', 1, 0, '', NULL, 0),
(601, '曲周县', '0', 133, 0, '601', 1, 0, '', NULL, 0),
(602, '武安市', '0', 133, 0, '602', 1, 0, '', NULL, 0),
(603, '桥东区', '0', 134, 0, '603', 1, 0, '', NULL, 0),
(604, '桥西区', '0', 134, 0, '604', 1, 0, '', NULL, 0),
(605, '邢台县', '0', 134, 0, '605', 1, 0, '', NULL, 0),
(606, '临城县', '0', 134, 0, '606', 1, 0, '', NULL, 0),
(607, '内丘县', '0', 134, 0, '607', 1, 0, '', NULL, 0),
(608, '柏乡县', '0', 134, 0, '608', 1, 0, '', NULL, 0),
(609, '隆尧县', '0', 134, 0, '609', 1, 0, '', NULL, 0),
(610, '任县', '0', 134, 0, '610', 1, 0, '', NULL, 0),
(611, '南和县', '0', 134, 0, '611', 1, 0, '', NULL, 0),
(612, '宁晋县', '0', 134, 0, '612', 1, 0, '', NULL, 0),
(613, '巨鹿县', '0', 134, 0, '613', 1, 0, '', NULL, 0),
(614, '新河县', '0', 134, 0, '614', 1, 0, '', NULL, 0),
(615, '广宗县', '0', 134, 0, '615', 1, 0, '', NULL, 0),
(616, '平乡县', '0', 134, 0, '616', 1, 0, '', NULL, 0),
(617, '威县', '0', 134, 0, '617', 1, 0, '', NULL, 0),
(618, '清河县', '0', 134, 0, '618', 1, 0, '', NULL, 0),
(619, '临西县', '0', 134, 0, '619', 1, 0, '', NULL, 0),
(620, '南宫市', '0', 134, 0, '620', 1, 0, '', NULL, 0),
(621, '沙河市', '0', 134, 0, '621', 1, 0, '', NULL, 0),
(622, '新市区', '0', 135, 0, '622', 1, 0, '', NULL, 0),
(623, '北市区', '0', 135, 0, '623', 1, 0, '', NULL, 0),
(624, '南市区', '0', 135, 0, '624', 1, 0, '', NULL, 0),
(625, '满城县', '0', 135, 0, '625', 1, 0, '', NULL, 0),
(626, '清苑县', '0', 135, 0, '626', 1, 0, '', NULL, 0),
(627, '涞水县', '0', 135, 0, '627', 1, 0, '', NULL, 0),
(628, '阜平县', '0', 135, 0, '628', 1, 0, '', NULL, 0),
(629, '徐水县', '0', 135, 0, '629', 1, 0, '', NULL, 0),
(630, '定兴县', '0', 135, 0, '630', 1, 0, '', NULL, 0),
(631, '唐县', '0', 135, 0, '631', 1, 0, '', NULL, 0),
(632, '高阳县', '0', 135, 0, '632', 1, 0, '', NULL, 0),
(633, '容城县', '0', 135, 0, '633', 1, 0, '', NULL, 0),
(634, '涞源县', '0', 135, 0, '634', 1, 0, '', NULL, 0),
(635, '望都县', '0', 135, 0, '635', 1, 0, '', NULL, 0),
(636, '安新县', '0', 135, 0, '636', 1, 0, '', NULL, 0),
(637, '易县', '0', 135, 0, '637', 1, 0, '', NULL, 0),
(638, '曲阳县', '0', 135, 0, '638', 1, 0, '', NULL, 0),
(639, '蠡县', '0', 135, 0, '639', 1, 0, '', NULL, 0),
(640, '顺平县', '0', 135, 0, '640', 1, 0, '', NULL, 0),
(641, '博野县', '0', 135, 0, '641', 1, 0, '', NULL, 0),
(642, '雄县', '0', 135, 0, '642', 1, 0, '', NULL, 0),
(643, '涿州市', '0', 135, 0, '643', 1, 0, '', NULL, 0),
(644, '定州市', '0', 135, 0, '644', 1, 0, '', NULL, 0),
(645, '安国市', '0', 135, 0, '645', 1, 0, '', NULL, 0),
(646, '高碑店市', '0', 135, 0, '646', 1, 0, '', NULL, 0),
(647, '桥东区', '0', 136, 0, '647', 1, 0, '', NULL, 0),
(648, '桥西区', '0', 136, 0, '648', 1, 0, '', NULL, 0),
(649, '宣化区', '0', 136, 0, '649', 1, 0, '', NULL, 0),
(650, '下花园区', '0', 136, 0, '650', 1, 0, '', NULL, 0),
(651, '宣化县', '0', 136, 0, '651', 1, 0, '', NULL, 0),
(652, '张北县', '0', 136, 0, '652', 1, 0, '', NULL, 0),
(653, '康保县', '0', 136, 0, '653', 1, 0, '', NULL, 0),
(654, '沽源县', '0', 136, 0, '654', 1, 0, '', NULL, 0),
(655, '尚义县', '0', 136, 0, '655', 1, 0, '', NULL, 0),
(656, '蔚县', '0', 136, 0, '656', 1, 0, '', NULL, 0),
(657, '阳原县', '0', 136, 0, '657', 1, 0, '', NULL, 0),
(658, '怀安县', '0', 136, 0, '658', 1, 0, '', NULL, 0),
(659, '万全县', '0', 136, 0, '659', 1, 0, '', NULL, 0),
(660, '怀来县', '0', 136, 0, '660', 1, 0, '', NULL, 0),
(661, '涿鹿县', '0', 136, 0, '661', 1, 0, '', NULL, 0),
(662, '赤城县', '0', 136, 0, '662', 1, 0, '', NULL, 0),
(663, '崇礼县', '0', 136, 0, '663', 1, 0, '', NULL, 0),
(664, '双桥区', '0', 137, 0, '664', 1, 0, '', NULL, 0),
(665, '双滦区', '0', 137, 0, '665', 1, 0, '', NULL, 0),
(666, '鹰手营子矿区', '0', 137, 0, '666', 1, 0, '', NULL, 0),
(667, '承德县', '0', 137, 0, '667', 1, 0, '', NULL, 0),
(668, '兴隆县', '0', 137, 0, '668', 1, 0, '', NULL, 0),
(669, '平泉县', '0', 137, 0, '669', 1, 0, '', NULL, 0),
(670, '滦平县', '0', 137, 0, '670', 1, 0, '', NULL, 0),
(671, '隆化县', '0', 137, 0, '671', 1, 0, '', NULL, 0),
(672, '丰宁县', '0', 137, 0, '672', 1, 0, '', NULL, 0),
(673, '宽城县', '0', 137, 0, '673', 1, 0, '', NULL, 0),
(674, '围场县', '0', 137, 0, '674', 1, 0, '', NULL, 0),
(675, '新华区', '0', 138, 0, '675', 1, 0, '', NULL, 0),
(676, '运河区', '0', 138, 0, '676', 1, 0, '', NULL, 0),
(677, '沧县', '0', 138, 0, '677', 1, 0, '', NULL, 0),
(678, '青县', '0', 138, 0, '678', 1, 0, '', NULL, 0),
(679, '东光县', '0', 138, 0, '679', 1, 0, '', NULL, 0),
(680, '海兴县', '0', 138, 0, '680', 1, 0, '', NULL, 0),
(681, '盐山县', '0', 138, 0, '681', 1, 0, '', NULL, 0),
(682, '肃宁县', '0', 138, 0, '682', 1, 0, '', NULL, 0),
(683, '南皮县', '0', 138, 0, '683', 1, 0, '', NULL, 0),
(684, '吴桥县', '0', 138, 0, '684', 1, 0, '', NULL, 0),
(685, '献县', '0', 138, 0, '685', 1, 0, '', NULL, 0),
(686, '孟村县', '0', 138, 0, '686', 1, 0, '', NULL, 0),
(687, '泊头市', '0', 138, 0, '687', 1, 0, '', NULL, 0),
(688, '任丘市', '0', 138, 0, '688', 1, 0, '', NULL, 0),
(689, '黄骅市', '0', 138, 0, '689', 1, 0, '', NULL, 0),
(690, '河间市', '0', 138, 0, '690', 1, 0, '', NULL, 0),
(691, '安次区', '0', 139, 0, '691', 1, 0, '', NULL, 0),
(692, '广阳区', '0', 139, 0, '692', 1, 0, '', NULL, 0),
(693, '固安县', '0', 139, 0, '693', 1, 0, '', NULL, 0),
(694, '永清县', '0', 139, 0, '694', 1, 0, '', NULL, 0),
(695, '香河县', '0', 139, 0, '695', 1, 0, '', NULL, 0),
(696, '大城县', '0', 139, 0, '696', 1, 0, '', NULL, 0),
(697, '文安县', '0', 139, 0, '697', 1, 0, '', NULL, 0),
(698, '大厂县', '0', 139, 0, '698', 1, 0, '', NULL, 0),
(699, '霸州市', '0', 139, 0, '699', 1, 0, '', NULL, 0),
(700, '三河市', '0', 139, 0, '700', 1, 0, '', NULL, 0),
(701, '桃城区', '0', 140, 0, '701', 1, 0, '', NULL, 0),
(702, '枣强县', '0', 140, 0, '702', 1, 0, '', NULL, 0),
(703, '武邑县', '0', 140, 0, '703', 1, 0, '', NULL, 0),
(704, '武强县', '0', 140, 0, '704', 1, 0, '', NULL, 0),
(705, '饶阳县', '0', 140, 0, '705', 1, 0, '', NULL, 0),
(706, '安平县', '0', 140, 0, '706', 1, 0, '', NULL, 0),
(707, '故城县', '0', 140, 0, '707', 1, 0, '', NULL, 0),
(708, '景县', '0', 140, 0, '708', 1, 0, '', NULL, 0),
(709, '阜城县', '0', 140, 0, '709', 1, 0, '', NULL, 0),
(710, '冀州市', '0', 140, 0, '710', 1, 0, '', NULL, 0),
(711, '深州市', '0', 140, 0, '711', 1, 0, '', NULL, 0),
(712, '小店区', '0', 141, 0, '712', 1, 0, '', NULL, 0),
(713, '迎泽区', '0', 141, 0, '713', 1, 0, '', NULL, 0),
(714, '杏花岭区', '0', 141, 0, '714', 1, 0, '', NULL, 0),
(715, '尖草坪区', '0', 141, 0, '715', 1, 0, '', NULL, 0),
(716, '万柏林区', '0', 141, 0, '716', 1, 0, '', NULL, 0),
(717, '晋源区', '0', 141, 0, '717', 1, 0, '', NULL, 0),
(718, '清徐县', '0', 141, 0, '718', 1, 0, '', NULL, 0),
(719, '阳曲县', '0', 141, 0, '719', 1, 0, '', NULL, 0),
(720, '娄烦县', '0', 141, 0, '720', 1, 0, '', NULL, 0),
(721, '古交市', '0', 141, 0, '721', 1, 0, '', NULL, 0),
(722, '城区', '0', 142, 0, '722', 1, 0, '', NULL, 0),
(723, '矿区', '0', 142, 0, '723', 1, 0, '', NULL, 0),
(724, '南郊区', '0', 142, 0, '724', 1, 0, '', NULL, 0),
(725, '新荣区', '0', 142, 0, '725', 1, 0, '', NULL, 0),
(726, '阳高县', '0', 142, 0, '726', 1, 0, '', NULL, 0),
(727, '天镇县', '0', 142, 0, '727', 1, 0, '', NULL, 0),
(728, '广灵县', '0', 142, 0, '728', 1, 0, '', NULL, 0),
(729, '灵丘县', '0', 142, 0, '729', 1, 0, '', NULL, 0),
(730, '浑源县', '0', 142, 0, '730', 1, 0, '', NULL, 0),
(731, '左云县', '0', 142, 0, '731', 1, 0, '', NULL, 0),
(732, '大同县', '0', 142, 0, '732', 1, 0, '', NULL, 0),
(733, '城区', '0', 143, 0, '733', 1, 0, '', NULL, 0),
(734, '矿区', '0', 143, 0, '734', 1, 0, '', NULL, 0),
(735, '郊区', '0', 143, 0, '735', 1, 0, '', NULL, 0),
(736, '平定县', '0', 143, 0, '736', 1, 0, '', NULL, 0),
(737, '盂县', '0', 143, 0, '737', 1, 0, '', NULL, 0),
(738, '城区', '0', 144, 0, '738', 1, 0, '', NULL, 0),
(739, '郊区', '0', 144, 0, '739', 1, 0, '', NULL, 0),
(740, '长治县', '0', 144, 0, '740', 1, 0, '', NULL, 0),
(741, '襄垣县', '0', 144, 0, '741', 1, 0, '', NULL, 0),
(742, '屯留县', '0', 144, 0, '742', 1, 0, '', NULL, 0),
(743, '平顺县', '0', 144, 0, '743', 1, 0, '', NULL, 0),
(744, '黎城县', '0', 144, 0, '744', 1, 0, '', NULL, 0),
(745, '壶关县', '0', 144, 0, '745', 1, 0, '', NULL, 0),
(746, '长子县', '0', 144, 0, '746', 1, 0, '', NULL, 0),
(747, '武乡县', '0', 144, 0, '747', 1, 0, '', NULL, 0),
(748, '沁县', '0', 144, 0, '748', 1, 0, '', NULL, 0),
(749, '沁源县', '0', 144, 0, '749', 1, 0, '', NULL, 0),
(750, '潞城市', '0', 144, 0, '750', 1, 0, '', NULL, 0),
(751, '城区', '0', 145, 0, '751', 1, 0, '', NULL, 0),
(752, '沁水县', '0', 145, 0, '752', 1, 0, '', NULL, 0),
(753, '阳城县', '0', 145, 0, '753', 1, 0, '', NULL, 0),
(754, '陵川县', '0', 145, 0, '754', 1, 0, '', NULL, 0),
(755, '泽州县', '0', 145, 0, '755', 1, 0, '', NULL, 0),
(756, '高平市', '0', 145, 0, '756', 1, 0, '', NULL, 0),
(757, '朔城区', '0', 146, 0, '757', 1, 0, '', NULL, 0),
(758, '平鲁区', '0', 146, 0, '758', 1, 0, '', NULL, 0),
(759, '山阴县', '0', 146, 0, '759', 1, 0, '', NULL, 0),
(760, '应县', '0', 146, 0, '760', 1, 0, '', NULL, 0),
(761, '右玉县', '0', 146, 0, '761', 1, 0, '', NULL, 0),
(762, '怀仁县', '0', 146, 0, '762', 1, 0, '', NULL, 0),
(763, '榆次区', '0', 147, 0, '763', 1, 0, '', NULL, 0),
(764, '榆社县', '0', 147, 0, '764', 1, 0, '', NULL, 0),
(765, '左权县', '0', 147, 0, '765', 1, 0, '', NULL, 0),
(766, '和顺县', '0', 147, 0, '766', 1, 0, '', NULL, 0),
(767, '昔阳县', '0', 147, 0, '767', 1, 0, '', NULL, 0),
(768, '寿阳县', '0', 147, 0, '768', 1, 0, '', NULL, 0),
(769, '太谷县', '0', 147, 0, '769', 1, 0, '', NULL, 0),
(770, '祁县', '0', 147, 0, '770', 1, 0, '', NULL, 0),
(771, '平遥县', '0', 147, 0, '771', 1, 0, '', NULL, 0),
(772, '灵石县', '0', 147, 0, '772', 1, 0, '', NULL, 0),
(773, '介休市', '0', 147, 0, '773', 1, 0, '', NULL, 0),
(774, '盐湖区', '0', 148, 0, '774', 1, 0, '', NULL, 0),
(775, '临猗县', '0', 148, 0, '775', 1, 0, '', NULL, 0),
(776, '万荣县', '0', 148, 0, '776', 1, 0, '', NULL, 0),
(777, '闻喜县', '0', 148, 0, '777', 1, 0, '', NULL, 0),
(778, '稷山县', '0', 148, 0, '778', 1, 0, '', NULL, 0),
(779, '新绛县', '0', 148, 0, '779', 1, 0, '', NULL, 0),
(780, '绛县', '0', 148, 0, '780', 1, 0, '', NULL, 0),
(781, '垣曲县', '0', 148, 0, '781', 1, 0, '', NULL, 0),
(782, '夏县', '0', 148, 0, '782', 1, 0, '', NULL, 0),
(783, '平陆县', '0', 148, 0, '783', 1, 0, '', NULL, 0),
(784, '芮城县', '0', 148, 0, '784', 1, 0, '', NULL, 0),
(785, '永济市', '0', 148, 0, '785', 1, 0, '', NULL, 0),
(786, '河津市', '0', 148, 0, '786', 1, 0, '', NULL, 0),
(787, '忻府区', '0', 149, 0, '787', 1, 0, '', NULL, 0),
(788, '定襄县', '0', 149, 0, '788', 1, 0, '', NULL, 0),
(789, '五台县', '0', 149, 0, '789', 1, 0, '', NULL, 0),
(790, '代县', '0', 149, 0, '790', 1, 0, '', NULL, 0),
(791, '繁峙县', '0', 149, 0, '791', 1, 0, '', NULL, 0),
(792, '宁武县', '0', 149, 0, '792', 1, 0, '', NULL, 0),
(793, '静乐县', '0', 149, 0, '793', 1, 0, '', NULL, 0),
(794, '神池县', '0', 149, 0, '794', 1, 0, '', NULL, 0),
(795, '五寨县', '0', 149, 0, '795', 1, 0, '', NULL, 0),
(796, '岢岚县', '0', 149, 0, '796', 1, 0, '', NULL, 0),
(797, '河曲县', '0', 149, 0, '797', 1, 0, '', NULL, 0),
(798, '保德县', '0', 149, 0, '798', 1, 0, '', NULL, 0),
(799, '偏关县', '0', 149, 0, '799', 1, 0, '', NULL, 0),
(800, '原平市', '0', 149, 0, '800', 1, 0, '', NULL, 0),
(801, '尧都区', '0', 150, 0, '801', 1, 0, '', NULL, 0),
(802, '曲沃县', '0', 150, 0, '802', 1, 0, '', NULL, 0),
(803, '翼城县', '0', 150, 0, '803', 1, 0, '', NULL, 0),
(804, '襄汾县', '0', 150, 0, '804', 1, 0, '', NULL, 0),
(805, '洪洞县', '0', 150, 0, '805', 1, 0, '', NULL, 0),
(806, '古县', '0', 150, 0, '806', 1, 0, '', NULL, 0),
(807, '安泽县', '0', 150, 0, '807', 1, 0, '', NULL, 0),
(808, '浮山县', '0', 150, 0, '808', 1, 0, '', NULL, 0),
(809, '吉县', '0', 150, 0, '809', 1, 0, '', NULL, 0),
(810, '乡宁县', '0', 150, 0, '810', 1, 0, '', NULL, 0),
(811, '大宁县', '0', 150, 0, '811', 1, 0, '', NULL, 0),
(812, '隰县', '0', 150, 0, '812', 1, 0, '', NULL, 0),
(813, '永和县', '0', 150, 0, '813', 1, 0, '', NULL, 0),
(814, '蒲县', '0', 150, 0, '814', 1, 0, '', NULL, 0),
(815, '汾西县', '0', 150, 0, '815', 1, 0, '', NULL, 0),
(816, '侯马市', '0', 150, 0, '816', 1, 0, '', NULL, 0),
(817, '霍州市', '0', 150, 0, '817', 1, 0, '', NULL, 0),
(818, '离石区', '0', 151, 0, '818', 1, 0, '', NULL, 0),
(819, '文水县', '0', 151, 0, '819', 1, 0, '', NULL, 0),
(820, '交城县', '0', 151, 0, '820', 1, 0, '', NULL, 0),
(821, '兴县', '0', 151, 0, '821', 1, 0, '', NULL, 0),
(822, '临县', '0', 151, 0, '822', 1, 0, '', NULL, 0),
(823, '柳林县', '0', 151, 0, '823', 1, 0, '', NULL, 0),
(824, '石楼县', '0', 151, 0, '824', 1, 0, '', NULL, 0),
(825, '岚县', '0', 151, 0, '825', 1, 0, '', NULL, 0),
(826, '方山县', '0', 151, 0, '826', 1, 0, '', NULL, 0),
(827, '中阳县', '0', 151, 0, '827', 1, 0, '', NULL, 0),
(828, '交口县', '0', 151, 0, '828', 1, 0, '', NULL, 0),
(829, '孝义市', '0', 151, 0, '829', 1, 0, '', NULL, 0),
(830, '汾阳市', '0', 151, 0, '830', 1, 0, '', NULL, 0),
(831, '新城区', '0', 152, 0, '831', 1, 0, '', NULL, 0),
(832, '回民区', '0', 152, 0, '832', 1, 0, '', NULL, 0),
(833, '玉泉区', '0', 152, 0, '833', 1, 0, '', NULL, 0),
(834, '赛罕区', '0', 152, 0, '834', 1, 0, '', NULL, 0),
(835, '土默特左旗', '0', 152, 0, '835', 1, 0, '', NULL, 0),
(836, '托克托县', '0', 152, 0, '836', 1, 0, '', NULL, 0),
(837, '和林格尔县', '0', 152, 0, '837', 1, 0, '', NULL, 0),
(838, '清水河县', '0', 152, 0, '838', 1, 0, '', NULL, 0),
(839, '武川县', '0', 152, 0, '839', 1, 0, '', NULL, 0),
(840, '东河区', '0', 153, 0, '840', 1, 0, '', NULL, 0),
(841, '昆都仑区', '0', 153, 0, '841', 1, 0, '', NULL, 0),
(842, '青山区', '0', 153, 0, '842', 1, 0, '', NULL, 0),
(843, '石拐区', '0', 153, 0, '843', 1, 0, '', NULL, 0),
(844, '白云矿区', '0', 153, 0, '844', 1, 0, '', NULL, 0),
(845, '九原区', '0', 153, 0, '845', 1, 0, '', NULL, 0),
(846, '土默特右旗', '0', 153, 0, '846', 1, 0, '', NULL, 0),
(847, '固阳县', '0', 153, 0, '847', 1, 0, '', NULL, 0),
(848, '达尔罕茂明安联合旗', '0', 153, 0, '848', 1, 0, '', NULL, 0),
(849, '海勃湾区', '0', 154, 0, '849', 1, 0, '', NULL, 0),
(850, '海南区', '0', 154, 0, '850', 1, 0, '', NULL, 0),
(851, '乌达区', '0', 154, 0, '851', 1, 0, '', NULL, 0),
(852, '红山区', '0', 155, 0, '852', 1, 0, '', NULL, 0),
(853, '元宝山区', '0', 155, 0, '853', 1, 0, '', NULL, 0),
(854, '松山区', '0', 155, 0, '854', 1, 0, '', NULL, 0),
(855, '阿鲁科尔沁旗', '0', 155, 0, '855', 1, 0, '', NULL, 0),
(856, '巴林左旗', '0', 155, 0, '856', 1, 0, '', NULL, 0),
(857, '巴林右旗', '0', 155, 0, '857', 1, 0, '', NULL, 0),
(858, '林西县', '0', 155, 0, '858', 1, 0, '', NULL, 0),
(859, '克什克腾旗', '0', 155, 0, '859', 1, 0, '', NULL, 0),
(860, '翁牛特旗', '0', 155, 0, '860', 1, 0, '', NULL, 0),
(861, '喀喇沁旗', '0', 155, 0, '861', 1, 0, '', NULL, 0),
(862, '宁城县', '0', 155, 0, '862', 1, 0, '', NULL, 0),
(863, '敖汉旗', '0', 155, 0, '863', 1, 0, '', NULL, 0),
(864, '科尔沁区', '0', 156, 0, '864', 1, 0, '', NULL, 0),
(865, '科尔沁左翼中旗', '0', 156, 0, '865', 1, 0, '', NULL, 0),
(866, '科尔沁左翼后旗', '0', 156, 0, '866', 1, 0, '', NULL, 0),
(867, '开鲁县', '0', 156, 0, '867', 1, 0, '', NULL, 0),
(868, '库伦旗', '0', 156, 0, '868', 1, 0, '', NULL, 0),
(869, '奈曼旗', '0', 156, 0, '869', 1, 0, '', NULL, 0),
(870, '扎鲁特旗', '0', 156, 0, '870', 1, 0, '', NULL, 0),
(871, '霍林郭勒市', '0', 156, 0, '871', 1, 0, '', NULL, 0),
(872, '东胜区', '0', 157, 0, '872', 1, 0, '', NULL, 0),
(873, '达拉特旗', '0', 157, 0, '873', 1, 0, '', NULL, 0),
(874, '准格尔旗', '0', 157, 0, '874', 1, 0, '', NULL, 0),
(875, '鄂托克前旗', '0', 157, 0, '875', 1, 0, '', NULL, 0),
(876, '鄂托克旗', '0', 157, 0, '876', 1, 0, '', NULL, 0),
(877, '杭锦旗', '0', 157, 0, '877', 1, 0, '', NULL, 0),
(878, '乌审旗', '0', 157, 0, '878', 1, 0, '', NULL, 0),
(879, '伊金霍洛旗', '0', 157, 0, '879', 1, 0, '', NULL, 0),
(880, '海拉尔区', '0', 158, 0, '880', 1, 0, '', NULL, 0),
(881, '阿荣旗', '0', 158, 0, '881', 1, 0, '', NULL, 0),
(882, '莫力达瓦达斡尔族自治旗', '0', 158, 0, '882', 1, 0, '', NULL, 0),
(883, '鄂伦春自治旗', '0', 158, 0, '883', 1, 0, '', NULL, 0),
(884, '鄂温克族自治旗', '0', 158, 0, '884', 1, 0, '', NULL, 0),
(885, '陈巴尔虎旗', '0', 158, 0, '885', 1, 0, '', NULL, 0),
(886, '新巴尔虎左旗', '0', 158, 0, '886', 1, 0, '', NULL, 0),
(887, '新巴尔虎右旗', '0', 158, 0, '887', 1, 0, '', NULL, 0),
(888, '满洲里市', '0', 158, 0, '888', 1, 0, '', NULL, 0),
(889, '牙克石市', '0', 158, 0, '889', 1, 0, '', NULL, 0),
(890, '扎兰屯市', '0', 158, 0, '890', 1, 0, '', NULL, 0),
(891, '额尔古纳市', '0', 158, 0, '891', 1, 0, '', NULL, 0),
(892, '根河市', '0', 158, 0, '892', 1, 0, '', NULL, 0),
(893, '临河区', '0', 159, 0, '893', 1, 0, '', NULL, 0),
(894, '五原县', '0', 159, 0, '894', 1, 0, '', NULL, 0),
(895, '磴口县', '0', 159, 0, '895', 1, 0, '', NULL, 0),
(896, '乌拉特前旗', '0', 159, 0, '896', 1, 0, '', NULL, 0),
(897, '乌拉特中旗', '0', 159, 0, '897', 1, 0, '', NULL, 0),
(898, '乌拉特后旗', '0', 159, 0, '898', 1, 0, '', NULL, 0),
(899, '杭锦后旗', '0', 159, 0, '899', 1, 0, '', NULL, 0),
(900, '集宁区', '0', 160, 0, '900', 1, 0, '', NULL, 0),
(901, '卓资县', '0', 160, 0, '901', 1, 0, '', NULL, 0),
(902, '化德县', '0', 160, 0, '902', 1, 0, '', NULL, 0),
(903, '商都县', '0', 160, 0, '903', 1, 0, '', NULL, 0),
(904, '兴和县', '0', 160, 0, '904', 1, 0, '', NULL, 0),
(905, '凉城县', '0', 160, 0, '905', 1, 0, '', NULL, 0),
(906, '察哈尔右翼前旗', '0', 160, 0, '906', 1, 0, '', NULL, 0),
(907, '察哈尔右翼中旗', '0', 160, 0, '907', 1, 0, '', NULL, 0),
(908, '察哈尔右翼后旗', '0', 160, 0, '908', 1, 0, '', NULL, 0),
(909, '四子王旗', '0', 160, 0, '909', 1, 0, '', NULL, 0),
(910, '丰镇市', '0', 160, 0, '910', 1, 0, '', NULL, 0),
(911, '乌兰浩特市', '0', 161, 0, '911', 1, 0, '', NULL, 0),
(912, '阿尔山市', '0', 161, 0, '912', 1, 0, '', NULL, 0),
(913, '科尔沁右翼前旗', '0', 161, 0, '913', 1, 0, '', NULL, 0),
(914, '科尔沁右翼中旗', '0', 161, 0, '914', 1, 0, '', NULL, 0),
(915, '扎赉特旗', '0', 161, 0, '915', 1, 0, '', NULL, 0),
(916, '突泉县', '0', 161, 0, '916', 1, 0, '', NULL, 0),
(917, '二连浩特市', '0', 162, 0, '917', 1, 0, '', NULL, 0),
(918, '锡林浩特市', '0', 162, 0, '918', 1, 0, '', NULL, 0),
(919, '阿巴嘎旗', '0', 162, 0, '919', 1, 0, '', NULL, 0),
(920, '苏尼特左旗', '0', 162, 0, '920', 1, 0, '', NULL, 0),
(921, '苏尼特右旗', '0', 162, 0, '921', 1, 0, '', NULL, 0),
(922, '东乌珠穆沁旗', '0', 162, 0, '922', 1, 0, '', NULL, 0),
(923, '西乌珠穆沁旗', '0', 162, 0, '923', 1, 0, '', NULL, 0),
(924, '太仆寺旗', '0', 162, 0, '924', 1, 0, '', NULL, 0),
(925, '镶黄旗', '0', 162, 0, '925', 1, 0, '', NULL, 0),
(926, '正镶白旗', '0', 162, 0, '926', 1, 0, '', NULL, 0),
(927, '正蓝旗', '0', 162, 0, '927', 1, 0, '', NULL, 0),
(928, '多伦县', '0', 162, 0, '928', 1, 0, '', NULL, 0),
(929, '阿拉善左旗', '0', 163, 0, '929', 1, 0, '', NULL, 0),
(930, '阿拉善右旗', '0', 163, 0, '930', 1, 0, '', NULL, 0),
(931, '额济纳旗', '0', 163, 0, '931', 1, 0, '', NULL, 0),
(932, '和平区', '0', 164, 0, '932', 1, 0, '', NULL, 0),
(933, '沈河区', '0', 164, 0, '933', 1, 0, '', NULL, 0),
(934, '大东区', '0', 164, 0, '934', 1, 0, '', NULL, 0),
(935, '皇姑区', '0', 164, 0, '935', 1, 0, '', NULL, 0),
(936, '铁西区', '0', 164, 0, '936', 1, 0, '', NULL, 0),
(937, '苏家屯区', '0', 164, 0, '937', 1, 0, '', NULL, 0),
(938, '东陵区', '0', 164, 0, '938', 1, 0, '', NULL, 0),
(939, '新城子区', '0', 164, 0, '939', 1, 0, '', NULL, 0),
(940, '于洪区', '0', 164, 0, '940', 1, 0, '', NULL, 0),
(941, '辽中县', '0', 164, 0, '941', 1, 0, '', NULL, 0),
(942, '康平县', '0', 164, 0, '942', 1, 0, '', NULL, 0),
(943, '法库县', '0', 164, 0, '943', 1, 0, '', NULL, 0),
(944, '新民市', '0', 164, 0, '944', 1, 0, '', NULL, 0),
(945, '中山区', '0', 165, 0, '945', 1, 0, '', NULL, 0),
(946, '西岗区', '0', 165, 0, '946', 1, 0, '', NULL, 0),
(947, '沙河口区', '0', 165, 0, '947', 1, 0, '', NULL, 0),
(948, '甘井子区', '0', 165, 0, '948', 1, 0, '', NULL, 0),
(949, '旅顺口区', '0', 165, 0, '949', 1, 0, '', NULL, 0),
(950, '金州区', '0', 165, 0, '950', 1, 0, '', NULL, 0),
(951, '长海县', '0', 165, 0, '951', 1, 0, '', NULL, 0),
(952, '瓦房店市', '0', 165, 0, '952', 1, 0, '', NULL, 0),
(953, '普兰店市', '0', 165, 0, '953', 1, 0, '', NULL, 0),
(954, '庄河市', '0', 165, 0, '954', 1, 0, '', NULL, 0),
(955, '铁东区', '0', 166, 0, '955', 1, 0, '', NULL, 0),
(956, '铁西区', '0', 166, 0, '956', 1, 0, '', NULL, 0),
(957, '立山区', '0', 166, 0, '957', 1, 0, '', NULL, 0),
(958, '千山区', '0', 166, 0, '958', 1, 0, '', NULL, 0),
(959, '台安县', '0', 166, 0, '959', 1, 0, '', NULL, 0),
(960, '岫岩满族自治县', '0', 166, 0, '960', 1, 0, '', NULL, 0),
(961, '海城市', '0', 166, 0, '961', 1, 0, '', NULL, 0),
(962, '新抚区', '0', 167, 0, '962', 1, 0, '', NULL, 0),
(963, '东洲区', '0', 167, 0, '963', 1, 0, '', NULL, 0),
(964, '望花区', '0', 167, 0, '964', 1, 0, '', NULL, 0),
(965, '顺城区', '0', 167, 0, '965', 1, 0, '', NULL, 0),
(966, '抚顺县', '0', 167, 0, '966', 1, 0, '', NULL, 0),
(967, '新宾满族自治县', '0', 167, 0, '967', 1, 0, '', NULL, 0),
(968, '清原满族自治县', '0', 167, 0, '968', 1, 0, '', NULL, 0),
(969, '平山区', '0', 168, 0, '969', 1, 0, '', NULL, 0),
(970, '溪湖区', '0', 168, 0, '970', 1, 0, '', NULL, 0),
(971, '明山区', '0', 168, 0, '971', 1, 0, '', NULL, 0),
(972, '南芬区', '0', 168, 0, '972', 1, 0, '', NULL, 0),
(973, '本溪满族自治县', '0', 168, 0, '973', 1, 0, '', NULL, 0),
(974, '桓仁满族自治县', '0', 168, 0, '974', 1, 0, '', NULL, 0),
(975, '元宝区', '0', 169, 0, '975', 1, 0, '', NULL, 0),
(976, '振兴区', '0', 169, 0, '976', 1, 0, '', NULL, 0),
(977, '振安区', '0', 169, 0, '977', 1, 0, '', NULL, 0),
(978, '宽甸满族自治县', '0', 169, 0, '978', 1, 0, '', NULL, 0),
(979, '东港市', '0', 169, 0, '979', 1, 0, '', NULL, 0),
(980, '凤城市', '0', 169, 0, '980', 1, 0, '', NULL, 0),
(981, '古塔区', '0', 170, 0, '981', 1, 0, '', NULL, 0),
(982, '凌河区', '0', 170, 0, '982', 1, 0, '', NULL, 0),
(983, '太和区', '0', 170, 0, '983', 1, 0, '', NULL, 0),
(984, '黑山县', '0', 170, 0, '984', 1, 0, '', NULL, 0),
(985, '义县', '0', 170, 0, '985', 1, 0, '', NULL, 0),
(986, '凌海市', '0', 170, 0, '986', 1, 0, '', NULL, 0),
(987, '北镇市', '0', 170, 0, '987', 1, 0, '', NULL, 0),
(988, '站前区', '0', 171, 0, '988', 1, 0, '', NULL, 0),
(989, '西市区', '0', 171, 0, '989', 1, 0, '', NULL, 0),
(990, '鲅鱼圈区', '0', 171, 0, '990', 1, 0, '', NULL, 0),
(991, '老边区', '0', 171, 0, '991', 1, 0, '', NULL, 0),
(992, '盖州市', '0', 171, 0, '992', 1, 0, '', NULL, 0),
(993, '大石桥市', '0', 171, 0, '993', 1, 0, '', NULL, 0),
(994, '海州区', '0', 172, 0, '994', 1, 0, '', NULL, 0),
(995, '新邱区', '0', 172, 0, '995', 1, 0, '', NULL, 0),
(996, '太平区', '0', 172, 0, '996', 1, 0, '', NULL, 0),
(997, '清河门区', '0', 172, 0, '997', 1, 0, '', NULL, 0),
(998, '细河区', '0', 172, 0, '998', 1, 0, '', NULL, 0),
(999, '阜新蒙古族自治县', '0', 172, 0, '999', 1, 0, '', NULL, 0),
(1000, '彰武县', '0', 172, 0, '1000', 1, 0, '', NULL, 0),
(1001, '白塔区', '0', 173, 0, '1001', 1, 0, '', NULL, 0),
(1002, '文圣区', '0', 173, 0, '1002', 1, 0, '', NULL, 0),
(1003, '宏伟区', '0', 173, 0, '1003', 1, 0, '', NULL, 0),
(1004, '弓长岭区', '0', 173, 0, '1004', 1, 0, '', NULL, 0),
(1005, '太子河区', '0', 173, 0, '1005', 1, 0, '', NULL, 0),
(1006, '辽阳县', '0', 173, 0, '1006', 1, 0, '', NULL, 0),
(1007, '灯塔市', '0', 173, 0, '1007', 1, 0, '', NULL, 0),
(1008, '双台子区', '0', 174, 0, '1008', 1, 0, '', NULL, 0),
(1009, '兴隆台区', '0', 174, 0, '1009', 1, 0, '', NULL, 0),
(1010, '大洼县', '0', 174, 0, '1010', 1, 0, '', NULL, 0),
(1011, '盘山县', '0', 174, 0, '1011', 1, 0, '', NULL, 0),
(1012, '银州区', '0', 175, 0, '1012', 1, 0, '', NULL, 0),
(1013, '清河区', '0', 175, 0, '1013', 1, 0, '', NULL, 0),
(1014, '铁岭县', '0', 175, 0, '1014', 1, 0, '', NULL, 0),
(1015, '西丰县', '0', 175, 0, '1015', 1, 0, '', NULL, 0),
(1016, '昌图县', '0', 175, 0, '1016', 1, 0, '', NULL, 0),
(1017, '调兵山市', '0', 175, 0, '1017', 1, 0, '', NULL, 0),
(1018, '开原市', '0', 175, 0, '1018', 1, 0, '', NULL, 0),
(1019, '双塔区', '0', 176, 0, '1019', 1, 0, '', NULL, 0),
(1020, '龙城区', '0', 176, 0, '1020', 1, 0, '', NULL, 0),
(1021, '朝阳县', '0', 176, 0, '1021', 1, 0, '', NULL, 0),
(1022, '建平县', '0', 176, 0, '1022', 1, 0, '', NULL, 0),
(1023, '喀喇沁左翼蒙古族自治县', '0', 176, 0, '1023', 1, 0, '', NULL, 0),
(1024, '北票市', '0', 176, 0, '1024', 1, 0, '', NULL, 0),
(1025, '凌源市', '0', 176, 0, '1025', 1, 0, '', NULL, 0),
(1026, '连山区', '0', 177, 0, '1026', 1, 0, '', NULL, 0),
(1027, '龙港区', '0', 177, 0, '1027', 1, 0, '', NULL, 0),
(1028, '南票区', '0', 177, 0, '1028', 1, 0, '', NULL, 0),
(1029, '绥中县', '0', 177, 0, '1029', 1, 0, '', NULL, 0),
(1030, '建昌县', '0', 177, 0, '1030', 1, 0, '', NULL, 0),
(1031, '兴城市', '0', 177, 0, '1031', 1, 0, '', NULL, 0),
(1032, '南关区', '0', 178, 0, '1032', 1, 0, '', NULL, 0),
(1033, '宽城区', '0', 178, 0, '1033', 1, 0, '', NULL, 0),
(1034, '朝阳区', '0', 178, 0, '1034', 1, 0, '', NULL, 0),
(1035, '二道区', '0', 178, 0, '1035', 1, 0, '', NULL, 0),
(1036, '绿园区', '0', 178, 0, '1036', 1, 0, '', NULL, 0),
(1037, '双阳区', '0', 178, 0, '1037', 1, 0, '', NULL, 0),
(1038, '农安县', '0', 178, 0, '1038', 1, 0, '', NULL, 0),
(1039, '九台市', '0', 178, 0, '1039', 1, 0, '', NULL, 0),
(1040, '榆树市', '0', 178, 0, '1040', 1, 0, '', NULL, 0),
(1041, '德惠市', '0', 178, 0, '1041', 1, 0, '', NULL, 0),
(1042, '昌邑区', '0', 179, 0, '1042', 1, 0, '', NULL, 0),
(1043, '龙潭区', '0', 179, 0, '1043', 1, 0, '', NULL, 0),
(1044, '船营区', '0', 179, 0, '1044', 1, 0, '', NULL, 0),
(1045, '丰满区', '0', 179, 0, '1045', 1, 0, '', NULL, 0),
(1046, '永吉县', '0', 179, 0, '1046', 1, 0, '', NULL, 0),
(1047, '蛟河市', '0', 179, 0, '1047', 1, 0, '', NULL, 0),
(1048, '桦甸市', '0', 179, 0, '1048', 1, 0, '', NULL, 0),
(1049, '舒兰市', '0', 179, 0, '1049', 1, 0, '', NULL, 0),
(1050, '磐石市', '0', 179, 0, '1050', 1, 0, '', NULL, 0),
(1051, '铁西区', '0', 180, 0, '1051', 1, 0, '', NULL, 0),
(1052, '铁东区', '0', 180, 0, '1052', 1, 0, '', NULL, 0),
(1053, '梨树县', '0', 180, 0, '1053', 1, 0, '', NULL, 0),
(1054, '伊通满族自治县', '0', 180, 0, '1054', 1, 0, '', NULL, 0),
(1055, '公主岭市', '0', 180, 0, '1055', 1, 0, '', NULL, 0),
(1056, '双辽市', '0', 180, 0, '1056', 1, 0, '', NULL, 0),
(1057, '龙山区', '0', 181, 0, '1057', 1, 0, '', NULL, 0),
(1058, '西安区', '0', 181, 0, '1058', 1, 0, '', NULL, 0),
(1059, '东丰县', '0', 181, 0, '1059', 1, 0, '', NULL, 0),
(1060, '东辽县', '0', 181, 0, '1060', 1, 0, '', NULL, 0),
(1061, '东昌区', '0', 182, 0, '1061', 1, 0, '', NULL, 0),
(1062, '二道江区', '0', 182, 0, '1062', 1, 0, '', NULL, 0),
(1063, '通化县', '0', 182, 0, '1063', 1, 0, '', NULL, 0),
(1064, '辉南县', '0', 182, 0, '1064', 1, 0, '', NULL, 0),
(1065, '柳河县', '0', 182, 0, '1065', 1, 0, '', NULL, 0),
(1066, '梅河口市', '0', 182, 0, '1066', 1, 0, '', NULL, 0),
(1067, '集安市', '0', 182, 0, '1067', 1, 0, '', NULL, 0),
(1068, '八道江区', '0', 183, 0, '1068', 1, 0, '', NULL, 0),
(1069, '抚松县', '0', 183, 0, '1069', 1, 0, '', NULL, 0),
(1070, '靖宇县', '0', 183, 0, '1070', 1, 0, '', NULL, 0),
(1071, '长白朝鲜族自治县', '0', 183, 0, '1071', 1, 0, '', NULL, 0),
(1072, '江源县', '0', 183, 0, '1072', 1, 0, '', NULL, 0),
(1073, '临江市', '0', 183, 0, '1073', 1, 0, '', NULL, 0),
(1074, '宁江区', '0', 184, 0, '1074', 1, 0, '', NULL, 0),
(1075, '前郭尔罗斯蒙古族自治县', '0', 184, 0, '1075', 1, 0, '', NULL, 0),
(1076, '长岭县', '0', 184, 0, '1076', 1, 0, '', NULL, 0),
(1077, '乾安县', '0', 184, 0, '1077', 1, 0, '', NULL, 0),
(1078, '扶余县', '0', 184, 0, '1078', 1, 0, '', NULL, 0),
(1079, '洮北区', '0', 185, 0, '1079', 1, 0, '', NULL, 0),
(1080, '镇赉县', '0', 185, 0, '1080', 1, 0, '', NULL, 0),
(1081, '通榆县', '0', 185, 0, '1081', 1, 0, '', NULL, 0),
(1082, '洮南市', '0', 185, 0, '1082', 1, 0, '', NULL, 0),
(1083, '大安市', '0', 185, 0, '1083', 1, 0, '', NULL, 0),
(1084, '延吉市', '0', 186, 0, '1084', 1, 0, '', NULL, 0),
(1085, '图们市', '0', 186, 0, '1085', 1, 0, '', NULL, 0),
(1086, '敦化市', '0', 186, 0, '1086', 1, 0, '', NULL, 0),
(1087, '珲春市', '0', 186, 0, '1087', 1, 0, '', NULL, 0),
(1088, '龙井市', '0', 186, 0, '1088', 1, 0, '', NULL, 0),
(1089, '和龙市', '0', 186, 0, '1089', 1, 0, '', NULL, 0),
(1090, '汪清县', '0', 186, 0, '1090', 1, 0, '', NULL, 0),
(1091, '安图县', '0', 186, 0, '1091', 1, 0, '', NULL, 0),
(1092, '道里区', '0', 187, 0, '1092', 1, 0, '', NULL, 0),
(1093, '南岗区', '0', 187, 0, '1093', 1, 0, '', NULL, 0),
(1094, '道外区', '0', 187, 0, '1094', 1, 0, '', NULL, 0),
(1095, '香坊区', '0', 187, 0, '1095', 1, 0, '', NULL, 0),
(1096, '动力区', '0', 187, 0, '1096', 1, 0, '', NULL, 0),
(1097, '平房区', '0', 187, 0, '1097', 1, 0, '', NULL, 0),
(1098, '松北区', '0', 187, 0, '1098', 1, 0, '', NULL, 0),
(1099, '呼兰区', '0', 187, 0, '1099', 1, 0, '', NULL, 0),
(1100, '依兰县', '0', 187, 0, '1100', 1, 0, '', NULL, 0),
(1101, '方正县', '0', 187, 0, '1101', 1, 0, '', NULL, 0),
(1102, '宾县', '0', 187, 0, '1102', 1, 0, '', NULL, 0),
(1103, '巴彦县', '0', 187, 0, '1103', 1, 0, '', NULL, 0),
(1104, '木兰县', '0', 187, 0, '1104', 1, 0, '', NULL, 0),
(1105, '通河县', '0', 187, 0, '1105', 1, 0, '', NULL, 0),
(1106, '延寿县', '0', 187, 0, '1106', 1, 0, '', NULL, 0),
(1107, '阿城市', '0', 187, 0, '1107', 1, 0, '', NULL, 0),
(1108, '双城市', '0', 187, 0, '1108', 1, 0, '', NULL, 0),
(1109, '尚志市', '0', 187, 0, '1109', 1, 0, '', NULL, 0),
(1110, '五常市', '0', 187, 0, '1110', 1, 0, '', NULL, 0),
(1111, '龙沙区', '0', 188, 0, '1111', 1, 0, '', NULL, 0),
(1112, '建华区', '0', 188, 0, '1112', 1, 0, '', NULL, 0),
(1113, '铁锋区', '0', 188, 0, '1113', 1, 0, '', NULL, 0),
(1114, '昂昂溪区', '0', 188, 0, '1114', 1, 0, '', NULL, 0),
(1115, '富拉尔基区', '0', 188, 0, '1115', 1, 0, '', NULL, 0),
(1116, '碾子山区', '0', 188, 0, '1116', 1, 0, '', NULL, 0),
(1117, '梅里斯达斡尔族区', '0', 188, 0, '1117', 1, 0, '', NULL, 0),
(1118, '龙江县', '0', 188, 0, '1118', 1, 0, '', NULL, 0),
(1119, '依安县', '0', 188, 0, '1119', 1, 0, '', NULL, 0),
(1120, '泰来县', '0', 188, 0, '1120', 1, 0, '', NULL, 0),
(1121, '甘南县', '0', 188, 0, '1121', 1, 0, '', NULL, 0),
(1122, '富裕县', '0', 188, 0, '1122', 1, 0, '', NULL, 0),
(1123, '克山县', '0', 188, 0, '1123', 1, 0, '', NULL, 0),
(1124, '克东县', '0', 188, 0, '1124', 1, 0, '', NULL, 0),
(1125, '拜泉县', '0', 188, 0, '1125', 1, 0, '', NULL, 0),
(1126, '讷河市', '0', 188, 0, '1126', 1, 0, '', NULL, 0),
(1127, '鸡冠区', '0', 189, 0, '1127', 1, 0, '', NULL, 0),
(1128, '恒山区', '0', 189, 0, '1128', 1, 0, '', NULL, 0),
(1129, '滴道区', '0', 189, 0, '1129', 1, 0, '', NULL, 0),
(1130, '梨树区', '0', 189, 0, '1130', 1, 0, '', NULL, 0),
(1131, '城子河区', '0', 189, 0, '1131', 1, 0, '', NULL, 0),
(1132, '麻山区', '0', 189, 0, '1132', 1, 0, '', NULL, 0),
(1133, '鸡东县', '0', 189, 0, '1133', 1, 0, '', NULL, 0),
(1134, '虎林市', '0', 189, 0, '1134', 1, 0, '', NULL, 0),
(1135, '密山市', '0', 189, 0, '1135', 1, 0, '', NULL, 0),
(1136, '向阳区', '0', 190, 0, '1136', 1, 0, '', NULL, 0),
(1137, '工农区', '0', 190, 0, '1137', 1, 0, '', NULL, 0),
(1138, '南山区', '0', 190, 0, '1138', 1, 0, '', NULL, 0),
(1139, '兴安区', '0', 190, 0, '1139', 1, 0, '', NULL, 0),
(1140, '东山区', '0', 190, 0, '1140', 1, 0, '', NULL, 0),
(1141, '兴山区', '0', 190, 0, '1141', 1, 0, '', NULL, 0),
(1142, '萝北县', '0', 190, 0, '1142', 1, 0, '', NULL, 0),
(1143, '绥滨县', '0', 190, 0, '1143', 1, 0, '', NULL, 0),
(1144, '尖山区', '0', 191, 0, '1144', 1, 0, '', NULL, 0),
(1145, '岭东区', '0', 191, 0, '1145', 1, 0, '', NULL, 0),
(1146, '四方台区', '0', 191, 0, '1146', 1, 0, '', NULL, 0),
(1147, '宝山区', '0', 191, 0, '1147', 1, 0, '', NULL, 0),
(1148, '集贤县', '0', 191, 0, '1148', 1, 0, '', NULL, 0),
(1149, '友谊县', '0', 191, 0, '1149', 1, 0, '', NULL, 0),
(1150, '宝清县', '0', 191, 0, '1150', 1, 0, '', NULL, 0),
(1151, '饶河县', '0', 191, 0, '1151', 1, 0, '', NULL, 0),
(1152, '萨尔图区', '0', 192, 0, '1152', 1, 0, '', NULL, 0),
(1153, '龙凤区', '0', 192, 0, '1153', 1, 0, '', NULL, 0),
(1154, '让胡路区', '0', 192, 0, '1154', 1, 0, '', NULL, 0),
(1155, '红岗区', '0', 192, 0, '1155', 1, 0, '', NULL, 0),
(1156, '大同区', '0', 192, 0, '1156', 1, 0, '', NULL, 0),
(1157, '肇州县', '0', 192, 0, '1157', 1, 0, '', NULL, 0),
(1158, '肇源县', '0', 192, 0, '1158', 1, 0, '', NULL, 0),
(1159, '林甸县', '0', 192, 0, '1159', 1, 0, '', NULL, 0),
(1160, '杜尔伯特蒙古族自治县', '0', 192, 0, '1160', 1, 0, '', NULL, 0),
(1161, '伊春区', '0', 193, 0, '1161', 1, 0, '', NULL, 0),
(1162, '南岔区', '0', 193, 0, '1162', 1, 0, '', NULL, 0),
(1163, '友好区', '0', 193, 0, '1163', 1, 0, '', NULL, 0),
(1164, '西林区', '0', 193, 0, '1164', 1, 0, '', NULL, 0),
(1165, '翠峦区', '0', 193, 0, '1165', 1, 0, '', NULL, 0),
(1166, '新青区', '0', 193, 0, '1166', 1, 0, '', NULL, 0),
(1167, '美溪区', '0', 193, 0, '1167', 1, 0, '', NULL, 0),
(1168, '金山屯区', '0', 193, 0, '1168', 1, 0, '', NULL, 0),
(1169, '五营区', '0', 193, 0, '1169', 1, 0, '', NULL, 0),
(1170, '乌马河区', '0', 193, 0, '1170', 1, 0, '', NULL, 0),
(1171, '汤旺河区', '0', 193, 0, '1171', 1, 0, '', NULL, 0),
(1172, '带岭区', '0', 193, 0, '1172', 1, 0, '', NULL, 0),
(1173, '乌伊岭区', '0', 193, 0, '1173', 1, 0, '', NULL, 0),
(1174, '红星区', '0', 193, 0, '1174', 1, 0, '', NULL, 0),
(1175, '上甘岭区', '0', 193, 0, '1175', 1, 0, '', NULL, 0),
(1176, '嘉荫县', '0', 193, 0, '1176', 1, 0, '', NULL, 0),
(1177, '铁力市', '0', 193, 0, '1177', 1, 0, '', NULL, 0),
(1178, '永红区', '0', 194, 0, '1178', 1, 0, '', NULL, 0),
(1179, '向阳区', '0', 194, 0, '1179', 1, 0, '', NULL, 0),
(1180, '前进区', '0', 194, 0, '1180', 1, 0, '', NULL, 0),
(1181, '东风区', '0', 194, 0, '1181', 1, 0, '', NULL, 0),
(1182, '郊区', '0', 194, 0, '1182', 1, 0, '', NULL, 0),
(1183, '桦南县', '0', 194, 0, '1183', 1, 0, '', NULL, 0),
(1184, '桦川县', '0', 194, 0, '1184', 1, 0, '', NULL, 0),
(1185, '汤原县', '0', 194, 0, '1185', 1, 0, '', NULL, 0),
(1186, '抚远县', '0', 194, 0, '1186', 1, 0, '', NULL, 0),
(1187, '同江市', '0', 194, 0, '1187', 1, 0, '', NULL, 0),
(1188, '富锦市', '0', 194, 0, '1188', 1, 0, '', NULL, 0),
(1189, '新兴区', '0', 195, 0, '1189', 1, 0, '', NULL, 0),
(1190, '桃山区', '0', 195, 0, '1190', 1, 0, '', NULL, 0),
(1191, '茄子河区', '0', 195, 0, '1191', 1, 0, '', NULL, 0),
(1192, '勃利县', '0', 195, 0, '1192', 1, 0, '', NULL, 0),
(1193, '东安区', '0', 196, 0, '1193', 1, 0, '', NULL, 0),
(1194, '阳明区', '0', 196, 0, '1194', 1, 0, '', NULL, 0),
(1195, '爱民区', '0', 196, 0, '1195', 1, 0, '', NULL, 0),
(1196, '西安区', '0', 196, 0, '1196', 1, 0, '', NULL, 0),
(1197, '东宁县', '0', 196, 0, '1197', 1, 0, '', NULL, 0),
(1198, '林口县', '0', 196, 0, '1198', 1, 0, '', NULL, 0),
(1199, '绥芬河市', '0', 196, 0, '1199', 1, 0, '', NULL, 0),
(1200, '海林市', '0', 196, 0, '1200', 1, 0, '', NULL, 0),
(1201, '宁安市', '0', 196, 0, '1201', 1, 0, '', NULL, 0),
(1202, '穆棱市', '0', 196, 0, '1202', 1, 0, '', NULL, 0),
(1203, '爱辉区', '0', 197, 0, '1203', 1, 0, '', NULL, 0),
(1204, '嫩江县', '0', 197, 0, '1204', 1, 0, '', NULL, 0),
(1205, '逊克县', '0', 197, 0, '1205', 1, 0, '', NULL, 0),
(1206, '孙吴县', '0', 197, 0, '1206', 1, 0, '', NULL, 0),
(1207, '北安市', '0', 197, 0, '1207', 1, 0, '', NULL, 0),
(1208, '五大连池市', '0', 197, 0, '1208', 1, 0, '', NULL, 0),
(1209, '北林区', '0', 198, 0, '1209', 1, 0, '', NULL, 0),
(1210, '望奎县', '0', 198, 0, '1210', 1, 0, '', NULL, 0),
(1211, '兰西县', '0', 198, 0, '1211', 1, 0, '', NULL, 0),
(1212, '青冈县', '0', 198, 0, '1212', 1, 0, '', NULL, 0),
(1213, '庆安县', '0', 198, 0, '1213', 1, 0, '', NULL, 0),
(1214, '明水县', '0', 198, 0, '1214', 1, 0, '', NULL, 0),
(1215, '绥棱县', '0', 198, 0, '1215', 1, 0, '', NULL, 0),
(1216, '安达市', '0', 198, 0, '1216', 1, 0, '', NULL, 0),
(1217, '肇东市', '0', 198, 0, '1217', 1, 0, '', NULL, 0),
(1218, '海伦市', '0', 198, 0, '1218', 1, 0, '', NULL, 0),
(1219, '呼玛县', '0', 199, 0, '1219', 1, 0, '', NULL, 0),
(1220, '塔河县', '0', 199, 0, '1220', 1, 0, '', NULL, 0),
(1221, '漠河县', '0', 199, 0, '1221', 1, 0, '', NULL, 0),
(1222, '玄武区', '0', 200, 0, '1222', 1, 0, '', NULL, 0),
(1223, '白下区', '0', 200, 0, '1223', 1, 0, '', NULL, 0),
(1224, '秦淮区', '0', 200, 0, '1224', 1, 0, '', NULL, 0),
(1225, '建邺区', '0', 200, 0, '1225', 1, 0, '', NULL, 0),
(1226, '鼓楼区', '0', 200, 0, '1226', 1, 0, '', NULL, 0),
(1227, '下关区', '0', 200, 0, '1227', 1, 0, '', NULL, 0),
(1228, '浦口区', '0', 200, 0, '1228', 1, 0, '', NULL, 0),
(1229, '栖霞区', '0', 200, 0, '1229', 1, 0, '', NULL, 0),
(1230, '雨花台区', '0', 200, 0, '1230', 1, 0, '', NULL, 0),
(1231, '江宁区', '0', 200, 0, '1231', 1, 0, '', NULL, 0),
(1232, '六合区', '0', 200, 0, '1232', 1, 0, '', NULL, 0),
(1233, '溧水县', '0', 200, 0, '1233', 1, 0, '', NULL, 0),
(1234, '高淳县', '0', 200, 0, '1234', 1, 0, '', NULL, 0),
(1235, '崇安区', '0', 201, 0, '1235', 1, 0, '', NULL, 0),
(1236, '南长区', '0', 201, 0, '1236', 1, 0, '', NULL, 0),
(1237, '北塘区', '0', 201, 0, '1237', 1, 0, '', NULL, 0),
(1238, '锡山区', '0', 201, 0, '1238', 1, 0, '', NULL, 0);
INSERT DELAYED IGNORE INTO `cban_linkage` (`linkageid`, `name`, `style`, `parentid`, `child`, `arrchildid`, `keyid`, `listorder`, `description`, `setting`, `siteid`) VALUES 
(1239, '惠山区', '0', 201, 0, '1239', 1, 0, '', NULL, 0),
(1240, '滨湖区', '0', 201, 0, '1240', 1, 0, '', NULL, 0),
(1241, '江阴市', '0', 201, 0, '1241', 1, 0, '', NULL, 0),
(1242, '宜兴市', '0', 201, 0, '1242', 1, 0, '', NULL, 0),
(1243, '鼓楼区', '0', 202, 0, '1243', 1, 0, '', NULL, 0),
(1244, '云龙区', '0', 202, 0, '1244', 1, 0, '', NULL, 0),
(1245, '九里区', '0', 202, 0, '1245', 1, 0, '', NULL, 0),
(1246, '贾汪区', '0', 202, 0, '1246', 1, 0, '', NULL, 0),
(1247, '泉山区', '0', 202, 0, '1247', 1, 0, '', NULL, 0),
(1248, '丰县', '0', 202, 0, '1248', 1, 0, '', NULL, 0),
(1249, '沛县', '0', 202, 0, '1249', 1, 0, '', NULL, 0),
(1250, '铜山县', '0', 202, 0, '1250', 1, 0, '', NULL, 0),
(1251, '睢宁县', '0', 202, 0, '1251', 1, 0, '', NULL, 0),
(1252, '新沂市', '0', 202, 0, '1252', 1, 0, '', NULL, 0),
(1253, '邳州市', '0', 202, 0, '1253', 1, 0, '', NULL, 0),
(1254, '天宁区', '0', 203, 0, '1254', 1, 0, '', NULL, 0),
(1255, '钟楼区', '0', 203, 0, '1255', 1, 0, '', NULL, 0),
(1256, '戚墅堰区', '0', 203, 0, '1256', 1, 0, '', NULL, 0),
(1257, '新北区', '0', 203, 0, '1257', 1, 0, '', NULL, 0),
(1258, '武进区', '0', 203, 0, '1258', 1, 0, '', NULL, 0),
(1259, '溧阳市', '0', 203, 0, '1259', 1, 0, '', NULL, 0),
(1260, '金坛市', '0', 203, 0, '1260', 1, 0, '', NULL, 0),
(1261, '沧浪区', '0', 204, 0, '1261', 1, 0, '', NULL, 0),
(1262, '平江区', '0', 204, 0, '1262', 1, 0, '', NULL, 0),
(1263, '金阊区', '0', 204, 0, '1263', 1, 0, '', NULL, 0),
(1264, '虎丘区', '0', 204, 0, '1264', 1, 0, '', NULL, 0),
(1265, '吴中区', '0', 204, 0, '1265', 1, 0, '', NULL, 0),
(1266, '相城区', '0', 204, 0, '1266', 1, 0, '', NULL, 0),
(1267, '常熟市', '0', 204, 0, '1267', 1, 0, '', NULL, 0),
(1268, '张家港市', '0', 204, 0, '1268', 1, 0, '', NULL, 0),
(1269, '昆山市', '0', 204, 0, '1269', 1, 0, '', NULL, 0),
(1270, '吴江市', '0', 204, 0, '1270', 1, 0, '', NULL, 0),
(1271, '太仓市', '0', 204, 0, '1271', 1, 0, '', NULL, 0),
(1272, '崇川区', '0', 205, 0, '1272', 1, 0, '', NULL, 0),
(1273, '港闸区', '0', 205, 0, '1273', 1, 0, '', NULL, 0),
(1274, '海安县', '0', 205, 0, '1274', 1, 0, '', NULL, 0),
(1275, '如东县', '0', 205, 0, '1275', 1, 0, '', NULL, 0),
(1276, '启东市', '0', 205, 0, '1276', 1, 0, '', NULL, 0),
(1277, '如皋市', '0', 205, 0, '1277', 1, 0, '', NULL, 0),
(1278, '通州市', '0', 205, 0, '1278', 1, 0, '', NULL, 0),
(1279, '海门市', '0', 205, 0, '1279', 1, 0, '', NULL, 0),
(1280, '连云区', '0', 206, 0, '1280', 1, 0, '', NULL, 0),
(1281, '新浦区', '0', 206, 0, '1281', 1, 0, '', NULL, 0),
(1282, '海州区', '0', 206, 0, '1282', 1, 0, '', NULL, 0),
(1283, '赣榆县', '0', 206, 0, '1283', 1, 0, '', NULL, 0),
(1284, '东海县', '0', 206, 0, '1284', 1, 0, '', NULL, 0),
(1285, '灌云县', '0', 206, 0, '1285', 1, 0, '', NULL, 0),
(1286, '灌南县', '0', 206, 0, '1286', 1, 0, '', NULL, 0),
(1287, '清河区', '0', 207, 0, '1287', 1, 0, '', NULL, 0),
(1288, '楚州区', '0', 207, 0, '1288', 1, 0, '', NULL, 0),
(1289, '淮阴区', '0', 207, 0, '1289', 1, 0, '', NULL, 0),
(1290, '清浦区', '0', 207, 0, '1290', 1, 0, '', NULL, 0),
(1291, '涟水县', '0', 207, 0, '1291', 1, 0, '', NULL, 0),
(1292, '洪泽县', '0', 207, 0, '1292', 1, 0, '', NULL, 0),
(1293, '盱眙县', '0', 207, 0, '1293', 1, 0, '', NULL, 0),
(1294, '金湖县', '0', 207, 0, '1294', 1, 0, '', NULL, 0),
(1295, '亭湖区', '0', 208, 0, '1295', 1, 0, '', NULL, 0),
(1296, '盐都区', '0', 208, 0, '1296', 1, 0, '', NULL, 0),
(1297, '响水县', '0', 208, 0, '1297', 1, 0, '', NULL, 0),
(1298, '滨海县', '0', 208, 0, '1298', 1, 0, '', NULL, 0),
(1299, '阜宁县', '0', 208, 0, '1299', 1, 0, '', NULL, 0),
(1300, '射阳县', '0', 208, 0, '1300', 1, 0, '', NULL, 0),
(1301, '建湖县', '0', 208, 0, '1301', 1, 0, '', NULL, 0),
(1302, '东台市', '0', 208, 0, '1302', 1, 0, '', NULL, 0),
(1303, '大丰市', '0', 208, 0, '1303', 1, 0, '', NULL, 0),
(1304, '广陵区', '0', 209, 0, '1304', 1, 0, '', NULL, 0),
(1305, '邗江区', '0', 209, 0, '1305', 1, 0, '', NULL, 0),
(1306, '维扬区', '0', 209, 0, '1306', 1, 0, '', NULL, 0),
(1307, '宝应县', '0', 209, 0, '1307', 1, 0, '', NULL, 0),
(1308, '仪征市', '0', 209, 0, '1308', 1, 0, '', NULL, 0),
(1309, '高邮市', '0', 209, 0, '1309', 1, 0, '', NULL, 0),
(1310, '江都市', '0', 209, 0, '1310', 1, 0, '', NULL, 0),
(1311, '京口区', '0', 210, 0, '1311', 1, 0, '', NULL, 0),
(1312, '润州区', '0', 210, 0, '1312', 1, 0, '', NULL, 0),
(1313, '丹徒区', '0', 210, 0, '1313', 1, 0, '', NULL, 0),
(1314, '丹阳市', '0', 210, 0, '1314', 1, 0, '', NULL, 0),
(1315, '扬中市', '0', 210, 0, '1315', 1, 0, '', NULL, 0),
(1316, '句容市', '0', 210, 0, '1316', 1, 0, '', NULL, 0),
(1317, '海陵区', '0', 211, 0, '1317', 1, 0, '', NULL, 0),
(1318, '高港区', '0', 211, 0, '1318', 1, 0, '', NULL, 0),
(1319, '兴化市', '0', 211, 0, '1319', 1, 0, '', NULL, 0),
(1320, '靖江市', '0', 211, 0, '1320', 1, 0, '', NULL, 0),
(1321, '泰兴市', '0', 211, 0, '1321', 1, 0, '', NULL, 0),
(1322, '姜堰市', '0', 211, 0, '1322', 1, 0, '', NULL, 0),
(1323, '宿城区', '0', 212, 0, '1323', 1, 0, '', NULL, 0),
(1324, '宿豫区', '0', 212, 0, '1324', 1, 0, '', NULL, 0),
(1325, '沭阳县', '0', 212, 0, '1325', 1, 0, '', NULL, 0),
(1326, '泗阳县', '0', 212, 0, '1326', 1, 0, '', NULL, 0),
(1327, '泗洪县', '0', 212, 0, '1327', 1, 0, '', NULL, 0),
(1328, '上城区', '0', 213, 0, '1328', 1, 0, '', NULL, 0),
(1329, '下城区', '0', 213, 0, '1329', 1, 0, '', NULL, 0),
(1330, '江干区', '0', 213, 0, '1330', 1, 0, '', NULL, 0),
(1331, '拱墅区', '0', 213, 0, '1331', 1, 0, '', NULL, 0),
(1332, '西湖区', '0', 213, 0, '1332', 1, 0, '', NULL, 0),
(1333, '滨江区', '0', 213, 0, '1333', 1, 0, '', NULL, 0),
(1334, '萧山区', '0', 213, 0, '1334', 1, 0, '', NULL, 0),
(1335, '余杭区', '0', 213, 0, '1335', 1, 0, '', NULL, 0),
(1336, '桐庐县', '0', 213, 0, '1336', 1, 0, '', NULL, 0),
(1337, '淳安县', '0', 213, 0, '1337', 1, 0, '', NULL, 0),
(1338, '建德市', '0', 213, 0, '1338', 1, 0, '', NULL, 0),
(1339, '富阳市', '0', 213, 0, '1339', 1, 0, '', NULL, 0),
(1340, '临安市', '0', 213, 0, '1340', 1, 0, '', NULL, 0),
(1341, '海曙区', '0', 214, 0, '1341', 1, 0, '', NULL, 0),
(1342, '江东区', '0', 214, 0, '1342', 1, 0, '', NULL, 0),
(1343, '江北区', '0', 214, 0, '1343', 1, 0, '', NULL, 0),
(1344, '北仑区', '0', 214, 0, '1344', 1, 0, '', NULL, 0),
(1345, '镇海区', '0', 214, 0, '1345', 1, 0, '', NULL, 0),
(1346, '鄞州区', '0', 214, 0, '1346', 1, 0, '', NULL, 0),
(1347, '象山县', '0', 214, 0, '1347', 1, 0, '', NULL, 0),
(1348, '宁海县', '0', 214, 0, '1348', 1, 0, '', NULL, 0),
(1349, '余姚市', '0', 214, 0, '1349', 1, 0, '', NULL, 0),
(1350, '慈溪市', '0', 214, 0, '1350', 1, 0, '', NULL, 0),
(1351, '奉化市', '0', 214, 0, '1351', 1, 0, '', NULL, 0),
(1352, '鹿城区', '0', 215, 0, '1352', 1, 0, '', NULL, 0),
(1353, '龙湾区', '0', 215, 0, '1353', 1, 0, '', NULL, 0),
(1354, '瓯海区', '0', 215, 0, '1354', 1, 0, '', NULL, 0),
(1355, '洞头县', '0', 215, 0, '1355', 1, 0, '', NULL, 0),
(1356, '永嘉县', '0', 215, 0, '1356', 1, 0, '', NULL, 0),
(1357, '平阳县', '0', 215, 0, '1357', 1, 0, '', NULL, 0),
(1358, '苍南县', '0', 215, 0, '1358', 1, 0, '', NULL, 0),
(1359, '文成县', '0', 215, 0, '1359', 1, 0, '', NULL, 0),
(1360, '泰顺县', '0', 215, 0, '1360', 1, 0, '', NULL, 0),
(1361, '瑞安市', '0', 215, 0, '1361', 1, 0, '', NULL, 0),
(1362, '乐清市', '0', 215, 0, '1362', 1, 0, '', NULL, 0),
(1363, '秀城区', '0', 216, 0, '1363', 1, 0, '', NULL, 0),
(1364, '秀洲区', '0', 216, 0, '1364', 1, 0, '', NULL, 0),
(1365, '嘉善县', '0', 216, 0, '1365', 1, 0, '', NULL, 0),
(1366, '海盐县', '0', 216, 0, '1366', 1, 0, '', NULL, 0),
(1367, '海宁市', '0', 216, 0, '1367', 1, 0, '', NULL, 0),
(1368, '平湖市', '0', 216, 0, '1368', 1, 0, '', NULL, 0),
(1369, '桐乡市', '0', 216, 0, '1369', 1, 0, '', NULL, 0),
(1370, '吴兴区', '0', 217, 0, '1370', 1, 0, '', NULL, 0),
(1371, '南浔区', '0', 217, 0, '1371', 1, 0, '', NULL, 0),
(1372, '德清县', '0', 217, 0, '1372', 1, 0, '', NULL, 0),
(1373, '长兴县', '0', 217, 0, '1373', 1, 0, '', NULL, 0),
(1374, '安吉县', '0', 217, 0, '1374', 1, 0, '', NULL, 0),
(1375, '越城区', '0', 218, 0, '1375', 1, 0, '', NULL, 0),
(1376, '绍兴县', '0', 218, 0, '1376', 1, 0, '', NULL, 0),
(1377, '新昌县', '0', 218, 0, '1377', 1, 0, '', NULL, 0),
(1378, '诸暨市', '0', 218, 0, '1378', 1, 0, '', NULL, 0),
(1379, '上虞市', '0', 218, 0, '1379', 1, 0, '', NULL, 0),
(1380, '嵊州市', '0', 218, 0, '1380', 1, 0, '', NULL, 0),
(1381, '婺城区', '0', 219, 0, '1381', 1, 0, '', NULL, 0),
(1382, '金东区', '0', 219, 0, '1382', 1, 0, '', NULL, 0),
(1383, '武义县', '0', 219, 0, '1383', 1, 0, '', NULL, 0),
(1384, '浦江县', '0', 219, 0, '1384', 1, 0, '', NULL, 0),
(1385, '磐安县', '0', 219, 0, '1385', 1, 0, '', NULL, 0),
(1386, '兰溪市', '0', 219, 0, '1386', 1, 0, '', NULL, 0),
(1387, '义乌市', '0', 219, 0, '1387', 1, 0, '', NULL, 0),
(1388, '东阳市', '0', 219, 0, '1388', 1, 0, '', NULL, 0),
(1389, '永康市', '0', 219, 0, '1389', 1, 0, '', NULL, 0),
(1390, '柯城区', '0', 220, 0, '1390', 1, 0, '', NULL, 0),
(1391, '衢江区', '0', 220, 0, '1391', 1, 0, '', NULL, 0),
(1392, '常山县', '0', 220, 0, '1392', 1, 0, '', NULL, 0),
(1393, '开化县', '0', 220, 0, '1393', 1, 0, '', NULL, 0),
(1394, '龙游县', '0', 220, 0, '1394', 1, 0, '', NULL, 0),
(1395, '江山市', '0', 220, 0, '1395', 1, 0, '', NULL, 0),
(1396, '定海区', '0', 221, 0, '1396', 1, 0, '', NULL, 0),
(1397, '普陀区', '0', 221, 0, '1397', 1, 0, '', NULL, 0),
(1398, '岱山县', '0', 221, 0, '1398', 1, 0, '', NULL, 0),
(1399, '嵊泗县', '0', 221, 0, '1399', 1, 0, '', NULL, 0),
(1400, '椒江区', '0', 222, 0, '1400', 1, 0, '', NULL, 0),
(1401, '黄岩区', '0', 222, 0, '1401', 1, 0, '', NULL, 0),
(1402, '路桥区', '0', 222, 0, '1402', 1, 0, '', NULL, 0),
(1403, '玉环县', '0', 222, 0, '1403', 1, 0, '', NULL, 0),
(1404, '三门县', '0', 222, 0, '1404', 1, 0, '', NULL, 0),
(1405, '天台县', '0', 222, 0, '1405', 1, 0, '', NULL, 0),
(1406, '仙居县', '0', 222, 0, '1406', 1, 0, '', NULL, 0),
(1407, '温岭市', '0', 222, 0, '1407', 1, 0, '', NULL, 0),
(1408, '临海市', '0', 222, 0, '1408', 1, 0, '', NULL, 0),
(1409, '莲都区', '0', 223, 0, '1409', 1, 0, '', NULL, 0),
(1410, '青田县', '0', 223, 0, '1410', 1, 0, '', NULL, 0),
(1411, '缙云县', '0', 223, 0, '1411', 1, 0, '', NULL, 0),
(1412, '遂昌县', '0', 223, 0, '1412', 1, 0, '', NULL, 0),
(1413, '松阳县', '0', 223, 0, '1413', 1, 0, '', NULL, 0),
(1414, '云和县', '0', 223, 0, '1414', 1, 0, '', NULL, 0),
(1415, '庆元县', '0', 223, 0, '1415', 1, 0, '', NULL, 0),
(1416, '景宁畲族自治县', '0', 223, 0, '1416', 1, 0, '', NULL, 0),
(1417, '龙泉市', '0', 223, 0, '1417', 1, 0, '', NULL, 0),
(1418, '瑶海区', '0', 224, 0, '1418', 1, 0, '', NULL, 0),
(1419, '庐阳区', '0', 224, 0, '1419', 1, 0, '', NULL, 0),
(1420, '蜀山区', '0', 224, 0, '1420', 1, 0, '', NULL, 0),
(1421, '包河区', '0', 224, 0, '1421', 1, 0, '', NULL, 0),
(1422, '长丰县', '0', 224, 0, '1422', 1, 0, '', NULL, 0),
(1423, '肥东县', '0', 224, 0, '1423', 1, 0, '', NULL, 0),
(1424, '肥西县', '0', 224, 0, '1424', 1, 0, '', NULL, 0),
(1425, '镜湖区', '0', 225, 0, '1425', 1, 0, '', NULL, 0),
(1426, '弋江区', '0', 225, 0, '1426', 1, 0, '', NULL, 0),
(1427, '鸠江区', '0', 225, 0, '1427', 1, 0, '', NULL, 0),
(1428, '三山区', '0', 225, 0, '1428', 1, 0, '', NULL, 0),
(1429, '芜湖县', '0', 225, 0, '1429', 1, 0, '', NULL, 0),
(1430, '繁昌县', '0', 225, 0, '1430', 1, 0, '', NULL, 0),
(1431, '南陵县', '0', 225, 0, '1431', 1, 0, '', NULL, 0),
(1432, '龙子湖区', '0', 226, 0, '1432', 1, 0, '', NULL, 0),
(1433, '蚌山区', '0', 226, 0, '1433', 1, 0, '', NULL, 0),
(1434, '禹会区', '0', 226, 0, '1434', 1, 0, '', NULL, 0),
(1435, '淮上区', '0', 226, 0, '1435', 1, 0, '', NULL, 0),
(1436, '怀远县', '0', 226, 0, '1436', 1, 0, '', NULL, 0),
(1437, '五河县', '0', 226, 0, '1437', 1, 0, '', NULL, 0),
(1438, '固镇县', '0', 226, 0, '1438', 1, 0, '', NULL, 0),
(1439, '大通区', '0', 227, 0, '1439', 1, 0, '', NULL, 0),
(1440, '田家庵区', '0', 227, 0, '1440', 1, 0, '', NULL, 0),
(1441, '谢家集区', '0', 227, 0, '1441', 1, 0, '', NULL, 0),
(1442, '八公山区', '0', 227, 0, '1442', 1, 0, '', NULL, 0),
(1443, '潘集区', '0', 227, 0, '1443', 1, 0, '', NULL, 0),
(1444, '凤台县', '0', 227, 0, '1444', 1, 0, '', NULL, 0),
(1445, '金家庄区', '0', 228, 0, '1445', 1, 0, '', NULL, 0),
(1446, '花山区', '0', 228, 0, '1446', 1, 0, '', NULL, 0),
(1447, '雨山区', '0', 228, 0, '1447', 1, 0, '', NULL, 0),
(1448, '当涂县', '0', 228, 0, '1448', 1, 0, '', NULL, 0),
(1449, '杜集区', '0', 229, 0, '1449', 1, 0, '', NULL, 0),
(1450, '相山区', '0', 229, 0, '1450', 1, 0, '', NULL, 0),
(1451, '烈山区', '0', 229, 0, '1451', 1, 0, '', NULL, 0),
(1452, '濉溪县', '0', 229, 0, '1452', 1, 0, '', NULL, 0),
(1453, '铜官山区', '0', 230, 0, '1453', 1, 0, '', NULL, 0),
(1454, '狮子山区', '0', 230, 0, '1454', 1, 0, '', NULL, 0),
(1455, '郊区', '0', 230, 0, '1455', 1, 0, '', NULL, 0),
(1456, '铜陵县', '0', 230, 0, '1456', 1, 0, '', NULL, 0),
(1457, '迎江区', '0', 231, 0, '1457', 1, 0, '', NULL, 0),
(1458, '大观区', '0', 231, 0, '1458', 1, 0, '', NULL, 0),
(1459, '宜秀区', '0', 231, 0, '1459', 1, 0, '', NULL, 0),
(1460, '怀宁县', '0', 231, 0, '1460', 1, 0, '', NULL, 0),
(1461, '枞阳县', '0', 231, 0, '1461', 1, 0, '', NULL, 0),
(1462, '潜山县', '0', 231, 0, '1462', 1, 0, '', NULL, 0),
(1463, '太湖县', '0', 231, 0, '1463', 1, 0, '', NULL, 0),
(1464, '宿松县', '0', 231, 0, '1464', 1, 0, '', NULL, 0),
(1465, '望江县', '0', 231, 0, '1465', 1, 0, '', NULL, 0),
(1466, '岳西县', '0', 231, 0, '1466', 1, 0, '', NULL, 0),
(1467, '桐城市', '0', 231, 0, '1467', 1, 0, '', NULL, 0),
(1468, '屯溪区', '0', 232, 0, '1468', 1, 0, '', NULL, 0),
(1469, '黄山区', '0', 232, 0, '1469', 1, 0, '', NULL, 0),
(1470, '徽州区', '0', 232, 0, '1470', 1, 0, '', NULL, 0),
(1471, '歙县', '0', 232, 0, '1471', 1, 0, '', NULL, 0),
(1472, '休宁县', '0', 232, 0, '1472', 1, 0, '', NULL, 0),
(1473, '黟县', '0', 232, 0, '1473', 1, 0, '', NULL, 0),
(1474, '祁门县', '0', 232, 0, '1474', 1, 0, '', NULL, 0),
(1475, '琅琊区', '0', 233, 0, '1475', 1, 0, '', NULL, 0),
(1476, '南谯区', '0', 233, 0, '1476', 1, 0, '', NULL, 0),
(1477, '来安县', '0', 233, 0, '1477', 1, 0, '', NULL, 0),
(1478, '全椒县', '0', 233, 0, '1478', 1, 0, '', NULL, 0),
(1479, '定远县', '0', 233, 0, '1479', 1, 0, '', NULL, 0),
(1480, '凤阳县', '0', 233, 0, '1480', 1, 0, '', NULL, 0),
(1481, '天长市', '0', 233, 0, '1481', 1, 0, '', NULL, 0),
(1482, '明光市', '0', 233, 0, '1482', 1, 0, '', NULL, 0),
(1483, '颍州区', '0', 234, 0, '1483', 1, 0, '', NULL, 0),
(1484, '颍东区', '0', 234, 0, '1484', 1, 0, '', NULL, 0),
(1485, '颍泉区', '0', 234, 0, '1485', 1, 0, '', NULL, 0),
(1486, '临泉县', '0', 234, 0, '1486', 1, 0, '', NULL, 0),
(1487, '太和县', '0', 234, 0, '1487', 1, 0, '', NULL, 0),
(1488, '阜南县', '0', 234, 0, '1488', 1, 0, '', NULL, 0),
(1489, '颍上县', '0', 234, 0, '1489', 1, 0, '', NULL, 0),
(1490, '界首市', '0', 234, 0, '1490', 1, 0, '', NULL, 0),
(1491, '埇桥区', '0', 235, 0, '1491', 1, 0, '', NULL, 0),
(1492, '砀山县', '0', 235, 0, '1492', 1, 0, '', NULL, 0),
(1493, '萧县', '0', 235, 0, '1493', 1, 0, '', NULL, 0),
(1494, '灵璧县', '0', 235, 0, '1494', 1, 0, '', NULL, 0),
(1495, '泗县', '0', 235, 0, '1495', 1, 0, '', NULL, 0),
(1496, '居巢区', '0', 236, 0, '1496', 1, 0, '', NULL, 0),
(1497, '庐江县', '0', 236, 0, '1497', 1, 0, '', NULL, 0),
(1498, '无为县', '0', 236, 0, '1498', 1, 0, '', NULL, 0),
(1499, '含山县', '0', 236, 0, '1499', 1, 0, '', NULL, 0),
(1500, '和县', '0', 236, 0, '1500', 1, 0, '', NULL, 0),
(1501, '金安区', '0', 237, 0, '1501', 1, 0, '', NULL, 0),
(1502, '裕安区', '0', 237, 0, '1502', 1, 0, '', NULL, 0),
(1503, '寿县', '0', 237, 0, '1503', 1, 0, '', NULL, 0),
(1504, '霍邱县', '0', 237, 0, '1504', 1, 0, '', NULL, 0),
(1505, '舒城县', '0', 237, 0, '1505', 1, 0, '', NULL, 0),
(1506, '金寨县', '0', 237, 0, '1506', 1, 0, '', NULL, 0),
(1507, '霍山县', '0', 237, 0, '1507', 1, 0, '', NULL, 0),
(1508, '谯城区', '0', 238, 0, '1508', 1, 0, '', NULL, 0),
(1509, '涡阳县', '0', 238, 0, '1509', 1, 0, '', NULL, 0),
(1510, '蒙城县', '0', 238, 0, '1510', 1, 0, '', NULL, 0),
(1511, '利辛县', '0', 238, 0, '1511', 1, 0, '', NULL, 0),
(1512, '贵池区', '0', 239, 0, '1512', 1, 0, '', NULL, 0),
(1513, '东至县', '0', 239, 0, '1513', 1, 0, '', NULL, 0),
(1514, '石台县', '0', 239, 0, '1514', 1, 0, '', NULL, 0),
(1515, '青阳县', '0', 239, 0, '1515', 1, 0, '', NULL, 0),
(1516, '宣州区', '0', 240, 0, '1516', 1, 0, '', NULL, 0),
(1517, '郎溪县', '0', 240, 0, '1517', 1, 0, '', NULL, 0),
(1518, '广德县', '0', 240, 0, '1518', 1, 0, '', NULL, 0),
(1519, '泾县', '0', 240, 0, '1519', 1, 0, '', NULL, 0),
(1520, '绩溪县', '0', 240, 0, '1520', 1, 0, '', NULL, 0),
(1521, '旌德县', '0', 240, 0, '1521', 1, 0, '', NULL, 0),
(1522, '宁国市', '0', 240, 0, '1522', 1, 0, '', NULL, 0),
(1523, '鼓楼区', '0', 241, 0, '1523', 1, 0, '', NULL, 0),
(1524, '台江区', '0', 241, 0, '1524', 1, 0, '', NULL, 0),
(1525, '仓山区', '0', 241, 0, '1525', 1, 0, '', NULL, 0),
(1526, '马尾区', '0', 241, 0, '1526', 1, 0, '', NULL, 0),
(1527, '晋安区', '0', 241, 0, '1527', 1, 0, '', NULL, 0),
(1528, '闽侯县', '0', 241, 0, '1528', 1, 0, '', NULL, 0),
(1529, '连江县', '0', 241, 0, '1529', 1, 0, '', NULL, 0),
(1530, '罗源县', '0', 241, 0, '1530', 1, 0, '', NULL, 0),
(1531, '闽清县', '0', 241, 0, '1531', 1, 0, '', NULL, 0),
(1532, '永泰县', '0', 241, 0, '1532', 1, 0, '', NULL, 0),
(1533, '平潭县', '0', 241, 0, '1533', 1, 0, '', NULL, 0),
(1534, '福清市', '0', 241, 0, '1534', 1, 0, '', NULL, 0),
(1535, '长乐市', '0', 241, 0, '1535', 1, 0, '', NULL, 0),
(1536, '思明区', '0', 242, 0, '1536', 1, 0, '', NULL, 0),
(1537, '海沧区', '0', 242, 0, '1537', 1, 0, '', NULL, 0),
(1538, '湖里区', '0', 242, 0, '1538', 1, 0, '', NULL, 0),
(1539, '集美区', '0', 242, 0, '1539', 1, 0, '', NULL, 0),
(1540, '同安区', '0', 242, 0, '1540', 1, 0, '', NULL, 0),
(1541, '翔安区', '0', 242, 0, '1541', 1, 0, '', NULL, 0),
(1542, '城厢区', '0', 243, 0, '1542', 1, 0, '', NULL, 0),
(1543, '涵江区', '0', 243, 0, '1543', 1, 0, '', NULL, 0),
(1544, '荔城区', '0', 243, 0, '1544', 1, 0, '', NULL, 0),
(1545, '秀屿区', '0', 243, 0, '1545', 1, 0, '', NULL, 0),
(1546, '仙游县', '0', 243, 0, '1546', 1, 0, '', NULL, 0),
(1547, '梅列区', '0', 244, 0, '1547', 1, 0, '', NULL, 0),
(1548, '三元区', '0', 244, 0, '1548', 1, 0, '', NULL, 0),
(1549, '明溪县', '0', 244, 0, '1549', 1, 0, '', NULL, 0),
(1550, '清流县', '0', 244, 0, '1550', 1, 0, '', NULL, 0),
(1551, '宁化县', '0', 244, 0, '1551', 1, 0, '', NULL, 0),
(1552, '大田县', '0', 244, 0, '1552', 1, 0, '', NULL, 0),
(1553, '尤溪县', '0', 244, 0, '1553', 1, 0, '', NULL, 0),
(1554, '沙县', '0', 244, 0, '1554', 1, 0, '', NULL, 0),
(1555, '将乐县', '0', 244, 0, '1555', 1, 0, '', NULL, 0),
(1556, '泰宁县', '0', 244, 0, '1556', 1, 0, '', NULL, 0),
(1557, '建宁县', '0', 244, 0, '1557', 1, 0, '', NULL, 0),
(1558, '永安市', '0', 244, 0, '1558', 1, 0, '', NULL, 0),
(1559, '鲤城区', '0', 245, 0, '1559', 1, 0, '', NULL, 0),
(1560, '丰泽区', '0', 245, 0, '1560', 1, 0, '', NULL, 0),
(1561, '洛江区', '0', 245, 0, '1561', 1, 0, '', NULL, 0),
(1562, '泉港区', '0', 245, 0, '1562', 1, 0, '', NULL, 0),
(1563, '惠安县', '0', 245, 0, '1563', 1, 0, '', NULL, 0),
(1564, '安溪县', '0', 245, 0, '1564', 1, 0, '', NULL, 0),
(1565, '永春县', '0', 245, 0, '1565', 1, 0, '', NULL, 0),
(1566, '德化县', '0', 245, 0, '1566', 1, 0, '', NULL, 0),
(1567, '金门县', '0', 245, 0, '1567', 1, 0, '', NULL, 0),
(1568, '石狮市', '0', 245, 0, '1568', 1, 0, '', NULL, 0),
(1569, '晋江市', '0', 245, 0, '1569', 1, 0, '', NULL, 0),
(1570, '南安市', '0', 245, 0, '1570', 1, 0, '', NULL, 0),
(1571, '芗城区', '0', 246, 0, '1571', 1, 0, '', NULL, 0),
(1572, '龙文区', '0', 246, 0, '1572', 1, 0, '', NULL, 0),
(1573, '云霄县', '0', 246, 0, '1573', 1, 0, '', NULL, 0),
(1574, '漳浦县', '0', 246, 0, '1574', 1, 0, '', NULL, 0),
(1575, '诏安县', '0', 246, 0, '1575', 1, 0, '', NULL, 0),
(1576, '长泰县', '0', 246, 0, '1576', 1, 0, '', NULL, 0),
(1577, '东山县', '0', 246, 0, '1577', 1, 0, '', NULL, 0),
(1578, '南靖县', '0', 246, 0, '1578', 1, 0, '', NULL, 0),
(1579, '平和县', '0', 246, 0, '1579', 1, 0, '', NULL, 0),
(1580, '华安县', '0', 246, 0, '1580', 1, 0, '', NULL, 0),
(1581, '龙海市', '0', 246, 0, '1581', 1, 0, '', NULL, 0),
(1582, '延平区', '0', 247, 0, '1582', 1, 0, '', NULL, 0),
(1583, '顺昌县', '0', 247, 0, '1583', 1, 0, '', NULL, 0),
(1584, '浦城县', '0', 247, 0, '1584', 1, 0, '', NULL, 0),
(1585, '光泽县', '0', 247, 0, '1585', 1, 0, '', NULL, 0),
(1586, '松溪县', '0', 247, 0, '1586', 1, 0, '', NULL, 0),
(1587, '政和县', '0', 247, 0, '1587', 1, 0, '', NULL, 0),
(1588, '邵武市', '0', 247, 0, '1588', 1, 0, '', NULL, 0),
(1589, '武夷山市', '0', 247, 0, '1589', 1, 0, '', NULL, 0),
(1590, '建瓯市', '0', 247, 0, '1590', 1, 0, '', NULL, 0),
(1591, '建阳市', '0', 247, 0, '1591', 1, 0, '', NULL, 0),
(1592, '新罗区', '0', 248, 0, '1592', 1, 0, '', NULL, 0),
(1593, '长汀县', '0', 248, 0, '1593', 1, 0, '', NULL, 0),
(1594, '永定县', '0', 248, 0, '1594', 1, 0, '', NULL, 0),
(1595, '上杭县', '0', 248, 0, '1595', 1, 0, '', NULL, 0),
(1596, '武平县', '0', 248, 0, '1596', 1, 0, '', NULL, 0),
(1597, '连城县', '0', 248, 0, '1597', 1, 0, '', NULL, 0),
(1598, '漳平市', '0', 248, 0, '1598', 1, 0, '', NULL, 0),
(1599, '蕉城区', '0', 249, 0, '1599', 1, 0, '', NULL, 0),
(1600, '霞浦县', '0', 249, 0, '1600', 1, 0, '', NULL, 0),
(1601, '古田县', '0', 249, 0, '1601', 1, 0, '', NULL, 0),
(1602, '屏南县', '0', 249, 0, '1602', 1, 0, '', NULL, 0),
(1603, '寿宁县', '0', 249, 0, '1603', 1, 0, '', NULL, 0),
(1604, '周宁县', '0', 249, 0, '1604', 1, 0, '', NULL, 0),
(1605, '柘荣县', '0', 249, 0, '1605', 1, 0, '', NULL, 0),
(1606, '福安市', '0', 249, 0, '1606', 1, 0, '', NULL, 0),
(1607, '福鼎市', '0', 249, 0, '1607', 1, 0, '', NULL, 0),
(1608, '东湖区', '0', 250, 0, '1608', 1, 0, '', NULL, 0),
(1609, '西湖区', '0', 250, 0, '1609', 1, 0, '', NULL, 0),
(1610, '青云谱区', '0', 250, 0, '1610', 1, 0, '', NULL, 0),
(1611, '湾里区', '0', 250, 0, '1611', 1, 0, '', NULL, 0),
(1612, '青山湖区', '0', 250, 0, '1612', 1, 0, '', NULL, 0),
(1613, '南昌县', '0', 250, 0, '1613', 1, 0, '', NULL, 0),
(1614, '新建县', '0', 250, 0, '1614', 1, 0, '', NULL, 0),
(1615, '安义县', '0', 250, 0, '1615', 1, 0, '', NULL, 0),
(1616, '进贤县', '0', 250, 0, '1616', 1, 0, '', NULL, 0),
(1617, '昌江区', '0', 251, 0, '1617', 1, 0, '', NULL, 0),
(1618, '珠山区', '0', 251, 0, '1618', 1, 0, '', NULL, 0),
(1619, '浮梁县', '0', 251, 0, '1619', 1, 0, '', NULL, 0),
(1620, '乐平市', '0', 251, 0, '1620', 1, 0, '', NULL, 0),
(1621, '安源区', '0', 252, 0, '1621', 1, 0, '', NULL, 0),
(1622, '湘东区', '0', 252, 0, '1622', 1, 0, '', NULL, 0),
(1623, '莲花县', '0', 252, 0, '1623', 1, 0, '', NULL, 0),
(1624, '上栗县', '0', 252, 0, '1624', 1, 0, '', NULL, 0),
(1625, '芦溪县', '0', 252, 0, '1625', 1, 0, '', NULL, 0),
(1626, '庐山区', '0', 253, 0, '1626', 1, 0, '', NULL, 0),
(1627, '浔阳区', '0', 253, 0, '1627', 1, 0, '', NULL, 0),
(1628, '九江县', '0', 253, 0, '1628', 1, 0, '', NULL, 0),
(1629, '武宁县', '0', 253, 0, '1629', 1, 0, '', NULL, 0),
(1630, '修水县', '0', 253, 0, '1630', 1, 0, '', NULL, 0),
(1631, '永修县', '0', 253, 0, '1631', 1, 0, '', NULL, 0),
(1632, '德安县', '0', 253, 0, '1632', 1, 0, '', NULL, 0),
(1633, '星子县', '0', 253, 0, '1633', 1, 0, '', NULL, 0),
(1634, '都昌县', '0', 253, 0, '1634', 1, 0, '', NULL, 0),
(1635, '湖口县', '0', 253, 0, '1635', 1, 0, '', NULL, 0),
(1636, '彭泽县', '0', 253, 0, '1636', 1, 0, '', NULL, 0),
(1637, '瑞昌市', '0', 253, 0, '1637', 1, 0, '', NULL, 0),
(1638, '渝水区', '0', 254, 0, '1638', 1, 0, '', NULL, 0),
(1639, '分宜县', '0', 254, 0, '1639', 1, 0, '', NULL, 0),
(1640, '月湖区', '0', 255, 0, '1640', 1, 0, '', NULL, 0),
(1641, '余江县', '0', 255, 0, '1641', 1, 0, '', NULL, 0),
(1642, '贵溪市', '0', 255, 0, '1642', 1, 0, '', NULL, 0),
(1643, '章贡区', '0', 256, 0, '1643', 1, 0, '', NULL, 0),
(1644, '赣县', '0', 256, 0, '1644', 1, 0, '', NULL, 0),
(1645, '信丰县', '0', 256, 0, '1645', 1, 0, '', NULL, 0),
(1646, '大余县', '0', 256, 0, '1646', 1, 0, '', NULL, 0),
(1647, '上犹县', '0', 256, 0, '1647', 1, 0, '', NULL, 0),
(1648, '崇义县', '0', 256, 0, '1648', 1, 0, '', NULL, 0),
(1649, '安远县', '0', 256, 0, '1649', 1, 0, '', NULL, 0),
(1650, '龙南县', '0', 256, 0, '1650', 1, 0, '', NULL, 0),
(1651, '定南县', '0', 256, 0, '1651', 1, 0, '', NULL, 0),
(1652, '全南县', '0', 256, 0, '1652', 1, 0, '', NULL, 0),
(1653, '宁都县', '0', 256, 0, '1653', 1, 0, '', NULL, 0),
(1654, '于都县', '0', 256, 0, '1654', 1, 0, '', NULL, 0),
(1655, '兴国县', '0', 256, 0, '1655', 1, 0, '', NULL, 0),
(1656, '会昌县', '0', 256, 0, '1656', 1, 0, '', NULL, 0),
(1657, '寻乌县', '0', 256, 0, '1657', 1, 0, '', NULL, 0),
(1658, '石城县', '0', 256, 0, '1658', 1, 0, '', NULL, 0),
(1659, '瑞金市', '0', 256, 0, '1659', 1, 0, '', NULL, 0),
(1660, '南康市', '0', 256, 0, '1660', 1, 0, '', NULL, 0),
(1661, '吉州区', '0', 257, 0, '1661', 1, 0, '', NULL, 0),
(1662, '青原区', '0', 257, 0, '1662', 1, 0, '', NULL, 0),
(1663, '吉安县', '0', 257, 0, '1663', 1, 0, '', NULL, 0),
(1664, '吉水县', '0', 257, 0, '1664', 1, 0, '', NULL, 0),
(1665, '峡江县', '0', 257, 0, '1665', 1, 0, '', NULL, 0),
(1666, '新干县', '0', 257, 0, '1666', 1, 0, '', NULL, 0),
(1667, '永丰县', '0', 257, 0, '1667', 1, 0, '', NULL, 0),
(1668, '泰和县', '0', 257, 0, '1668', 1, 0, '', NULL, 0),
(1669, '遂川县', '0', 257, 0, '1669', 1, 0, '', NULL, 0),
(1670, '万安县', '0', 257, 0, '1670', 1, 0, '', NULL, 0),
(1671, '安福县', '0', 257, 0, '1671', 1, 0, '', NULL, 0),
(1672, '永新县', '0', 257, 0, '1672', 1, 0, '', NULL, 0),
(1673, '井冈山市', '0', 257, 0, '1673', 1, 0, '', NULL, 0),
(1674, '袁州区', '0', 258, 0, '1674', 1, 0, '', NULL, 0),
(1675, '奉新县', '0', 258, 0, '1675', 1, 0, '', NULL, 0),
(1676, '万载县', '0', 258, 0, '1676', 1, 0, '', NULL, 0),
(1677, '上高县', '0', 258, 0, '1677', 1, 0, '', NULL, 0),
(1678, '宜丰县', '0', 258, 0, '1678', 1, 0, '', NULL, 0),
(1679, '靖安县', '0', 258, 0, '1679', 1, 0, '', NULL, 0),
(1680, '铜鼓县', '0', 258, 0, '1680', 1, 0, '', NULL, 0),
(1681, '丰城市', '0', 258, 0, '1681', 1, 0, '', NULL, 0),
(1682, '樟树市', '0', 258, 0, '1682', 1, 0, '', NULL, 0),
(1683, '高安市', '0', 258, 0, '1683', 1, 0, '', NULL, 0),
(1684, '临川区', '0', 259, 0, '1684', 1, 0, '', NULL, 0),
(1685, '南城县', '0', 259, 0, '1685', 1, 0, '', NULL, 0),
(1686, '黎川县', '0', 259, 0, '1686', 1, 0, '', NULL, 0),
(1687, '南丰县', '0', 259, 0, '1687', 1, 0, '', NULL, 0),
(1688, '崇仁县', '0', 259, 0, '1688', 1, 0, '', NULL, 0),
(1689, '乐安县', '0', 259, 0, '1689', 1, 0, '', NULL, 0),
(1690, '宜黄县', '0', 259, 0, '1690', 1, 0, '', NULL, 0),
(1691, '金溪县', '0', 259, 0, '1691', 1, 0, '', NULL, 0),
(1692, '资溪县', '0', 259, 0, '1692', 1, 0, '', NULL, 0),
(1693, '东乡县', '0', 259, 0, '1693', 1, 0, '', NULL, 0),
(1694, '广昌县', '0', 259, 0, '1694', 1, 0, '', NULL, 0),
(1695, '信州区', '0', 260, 0, '1695', 1, 0, '', NULL, 0),
(1696, '上饶县', '0', 260, 0, '1696', 1, 0, '', NULL, 0),
(1697, '广丰县', '0', 260, 0, '1697', 1, 0, '', NULL, 0),
(1698, '玉山县', '0', 260, 0, '1698', 1, 0, '', NULL, 0),
(1699, '铅山县', '0', 260, 0, '1699', 1, 0, '', NULL, 0),
(1700, '横峰县', '0', 260, 0, '1700', 1, 0, '', NULL, 0),
(1701, '弋阳县', '0', 260, 0, '1701', 1, 0, '', NULL, 0),
(1702, '余干县', '0', 260, 0, '1702', 1, 0, '', NULL, 0),
(1703, '鄱阳县', '0', 260, 0, '1703', 1, 0, '', NULL, 0),
(1704, '万年县', '0', 260, 0, '1704', 1, 0, '', NULL, 0),
(1705, '婺源县', '0', 260, 0, '1705', 1, 0, '', NULL, 0),
(1706, '德兴市', '0', 260, 0, '1706', 1, 0, '', NULL, 0),
(1707, '历下区', '0', 261, 0, '1707', 1, 0, '', NULL, 0),
(1708, '市中区', '0', 261, 0, '1708', 1, 0, '', NULL, 0),
(1709, '槐荫区', '0', 261, 0, '1709', 1, 0, '', NULL, 0),
(1710, '天桥区', '0', 261, 0, '1710', 1, 0, '', NULL, 0),
(1711, '历城区', '0', 261, 0, '1711', 1, 0, '', NULL, 0),
(1712, '长清区', '0', 261, 0, '1712', 1, 0, '', NULL, 0),
(1713, '平阴县', '0', 261, 0, '1713', 1, 0, '', NULL, 0),
(1714, '济阳县', '0', 261, 0, '1714', 1, 0, '', NULL, 0),
(1715, '商河县', '0', 261, 0, '1715', 1, 0, '', NULL, 0),
(1716, '章丘市', '0', 261, 0, '1716', 1, 0, '', NULL, 0),
(1717, '市南区', '0', 262, 0, '1717', 1, 0, '', NULL, 0),
(1718, '市北区', '0', 262, 0, '1718', 1, 0, '', NULL, 0),
(1719, '四方区', '0', 262, 0, '1719', 1, 0, '', NULL, 0),
(1720, '黄岛区', '0', 262, 0, '1720', 1, 0, '', NULL, 0),
(1721, '崂山区', '0', 262, 0, '1721', 1, 0, '', NULL, 0),
(1722, '李沧区', '0', 262, 0, '1722', 1, 0, '', NULL, 0),
(1723, '城阳区', '0', 262, 0, '1723', 1, 0, '', NULL, 0),
(1724, '胶州市', '0', 262, 0, '1724', 1, 0, '', NULL, 0),
(1725, '即墨市', '0', 262, 0, '1725', 1, 0, '', NULL, 0),
(1726, '平度市', '0', 262, 0, '1726', 1, 0, '', NULL, 0),
(1727, '胶南市', '0', 262, 0, '1727', 1, 0, '', NULL, 0),
(1728, '莱西市', '0', 262, 0, '1728', 1, 0, '', NULL, 0),
(1729, '淄川区', '0', 263, 0, '1729', 1, 0, '', NULL, 0),
(1730, '张店区', '0', 263, 0, '1730', 1, 0, '', NULL, 0),
(1731, '博山区', '0', 263, 0, '1731', 1, 0, '', NULL, 0),
(1732, '临淄区', '0', 263, 0, '1732', 1, 0, '', NULL, 0),
(1733, '周村区', '0', 263, 0, '1733', 1, 0, '', NULL, 0),
(1734, '桓台县', '0', 263, 0, '1734', 1, 0, '', NULL, 0),
(1735, '高青县', '0', 263, 0, '1735', 1, 0, '', NULL, 0),
(1736, '沂源县', '0', 263, 0, '1736', 1, 0, '', NULL, 0),
(1737, '市中区', '0', 264, 0, '1737', 1, 0, '', NULL, 0),
(1738, '薛城区', '0', 264, 0, '1738', 1, 0, '', NULL, 0),
(1739, '峄城区', '0', 264, 0, '1739', 1, 0, '', NULL, 0),
(1740, '台儿庄区', '0', 264, 0, '1740', 1, 0, '', NULL, 0),
(1741, '山亭区', '0', 264, 0, '1741', 1, 0, '', NULL, 0),
(1742, '滕州市', '0', 264, 0, '1742', 1, 0, '', NULL, 0),
(1743, '东营区', '0', 265, 0, '1743', 1, 0, '', NULL, 0),
(1744, '河口区', '0', 265, 0, '1744', 1, 0, '', NULL, 0),
(1745, '垦利县', '0', 265, 0, '1745', 1, 0, '', NULL, 0),
(1746, '利津县', '0', 265, 0, '1746', 1, 0, '', NULL, 0),
(1747, '广饶县', '0', 265, 0, '1747', 1, 0, '', NULL, 0),
(1748, '芝罘区', '0', 266, 0, '1748', 1, 0, '', NULL, 0),
(1749, '福山区', '0', 266, 0, '1749', 1, 0, '', NULL, 0),
(1750, '牟平区', '0', 266, 0, '1750', 1, 0, '', NULL, 0),
(1751, '莱山区', '0', 266, 0, '1751', 1, 0, '', NULL, 0),
(1752, '长岛县', '0', 266, 0, '1752', 1, 0, '', NULL, 0),
(1753, '龙口市', '0', 266, 0, '1753', 1, 0, '', NULL, 0),
(1754, '莱阳市', '0', 266, 0, '1754', 1, 0, '', NULL, 0),
(1755, '莱州市', '0', 266, 0, '1755', 1, 0, '', NULL, 0),
(1756, '蓬莱市', '0', 266, 0, '1756', 1, 0, '', NULL, 0),
(1757, '招远市', '0', 266, 0, '1757', 1, 0, '', NULL, 0),
(1758, '栖霞市', '0', 266, 0, '1758', 1, 0, '', NULL, 0),
(1759, '海阳市', '0', 266, 0, '1759', 1, 0, '', NULL, 0),
(1760, '潍城区', '0', 267, 0, '1760', 1, 0, '', NULL, 0),
(1761, '寒亭区', '0', 267, 0, '1761', 1, 0, '', NULL, 0),
(1762, '坊子区', '0', 267, 0, '1762', 1, 0, '', NULL, 0),
(1763, '奎文区', '0', 267, 0, '1763', 1, 0, '', NULL, 0),
(1764, '临朐县', '0', 267, 0, '1764', 1, 0, '', NULL, 0),
(1765, '昌乐县', '0', 267, 0, '1765', 1, 0, '', NULL, 0),
(1766, '青州市', '0', 267, 0, '1766', 1, 0, '', NULL, 0),
(1767, '诸城市', '0', 267, 0, '1767', 1, 0, '', NULL, 0),
(1768, '寿光市', '0', 267, 0, '1768', 1, 0, '', NULL, 0),
(1769, '安丘市', '0', 267, 0, '1769', 1, 0, '', NULL, 0),
(1770, '高密市', '0', 267, 0, '1770', 1, 0, '', NULL, 0),
(1771, '昌邑市', '0', 267, 0, '1771', 1, 0, '', NULL, 0),
(1772, '市中区', '0', 268, 0, '1772', 1, 0, '', NULL, 0),
(1773, '任城区', '0', 268, 0, '1773', 1, 0, '', NULL, 0),
(1774, '微山县', '0', 268, 0, '1774', 1, 0, '', NULL, 0),
(1775, '鱼台县', '0', 268, 0, '1775', 1, 0, '', NULL, 0),
(1776, '金乡县', '0', 268, 0, '1776', 1, 0, '', NULL, 0),
(1777, '嘉祥县', '0', 268, 0, '1777', 1, 0, '', NULL, 0),
(1778, '汶上县', '0', 268, 0, '1778', 1, 0, '', NULL, 0),
(1779, '泗水县', '0', 268, 0, '1779', 1, 0, '', NULL, 0),
(1780, '梁山县', '0', 268, 0, '1780', 1, 0, '', NULL, 0),
(1781, '曲阜市', '0', 268, 0, '1781', 1, 0, '', NULL, 0),
(1782, '兖州市', '0', 268, 0, '1782', 1, 0, '', NULL, 0),
(1783, '邹城市', '0', 268, 0, '1783', 1, 0, '', NULL, 0),
(1784, '泰山区', '0', 269, 0, '1784', 1, 0, '', NULL, 0),
(1785, '岱岳区', '0', 269, 0, '1785', 1, 0, '', NULL, 0),
(1786, '宁阳县', '0', 269, 0, '1786', 1, 0, '', NULL, 0),
(1787, '东平县', '0', 269, 0, '1787', 1, 0, '', NULL, 0),
(1788, '新泰市', '0', 269, 0, '1788', 1, 0, '', NULL, 0),
(1789, '肥城市', '0', 269, 0, '1789', 1, 0, '', NULL, 0),
(1790, '环翠区', '0', 270, 0, '1790', 1, 0, '', NULL, 0),
(1791, '文登市', '0', 270, 0, '1791', 1, 0, '', NULL, 0),
(1792, '荣成市', '0', 270, 0, '1792', 1, 0, '', NULL, 0),
(1793, '乳山市', '0', 270, 0, '1793', 1, 0, '', NULL, 0),
(1794, '东港区', '0', 271, 0, '1794', 1, 0, '', NULL, 0),
(1795, '岚山区', '0', 271, 0, '1795', 1, 0, '', NULL, 0),
(1796, '五莲县', '0', 271, 0, '1796', 1, 0, '', NULL, 0),
(1797, '莒县', '0', 271, 0, '1797', 1, 0, '', NULL, 0),
(1798, '莱城区', '0', 272, 0, '1798', 1, 0, '', NULL, 0),
(1799, '钢城区', '0', 272, 0, '1799', 1, 0, '', NULL, 0),
(1800, '兰山区', '0', 273, 0, '1800', 1, 0, '', NULL, 0),
(1801, '罗庄区', '0', 273, 0, '1801', 1, 0, '', NULL, 0),
(1802, '河东区', '0', 273, 0, '1802', 1, 0, '', NULL, 0),
(1803, '沂南县', '0', 273, 0, '1803', 1, 0, '', NULL, 0),
(1804, '郯城县', '0', 273, 0, '1804', 1, 0, '', NULL, 0),
(1805, '沂水县', '0', 273, 0, '1805', 1, 0, '', NULL, 0),
(1806, '苍山县', '0', 273, 0, '1806', 1, 0, '', NULL, 0),
(1807, '费县', '0', 273, 0, '1807', 1, 0, '', NULL, 0),
(1808, '平邑县', '0', 273, 0, '1808', 1, 0, '', NULL, 0),
(1809, '莒南县', '0', 273, 0, '1809', 1, 0, '', NULL, 0),
(1810, '蒙阴县', '0', 273, 0, '1810', 1, 0, '', NULL, 0),
(1811, '临沭县', '0', 273, 0, '1811', 1, 0, '', NULL, 0),
(1812, '德城区', '0', 274, 0, '1812', 1, 0, '', NULL, 0),
(1813, '陵县', '0', 274, 0, '1813', 1, 0, '', NULL, 0),
(1814, '宁津县', '0', 274, 0, '1814', 1, 0, '', NULL, 0),
(1815, '庆云县', '0', 274, 0, '1815', 1, 0, '', NULL, 0),
(1816, '临邑县', '0', 274, 0, '1816', 1, 0, '', NULL, 0),
(1817, '齐河县', '0', 274, 0, '1817', 1, 0, '', NULL, 0),
(1818, '平原县', '0', 274, 0, '1818', 1, 0, '', NULL, 0),
(1819, '夏津县', '0', 274, 0, '1819', 1, 0, '', NULL, 0),
(1820, '武城县', '0', 274, 0, '1820', 1, 0, '', NULL, 0),
(1821, '乐陵市', '0', 274, 0, '1821', 1, 0, '', NULL, 0),
(1822, '禹城市', '0', 274, 0, '1822', 1, 0, '', NULL, 0),
(1823, '东昌府区', '0', 275, 0, '1823', 1, 0, '', NULL, 0),
(1824, '阳谷县', '0', 275, 0, '1824', 1, 0, '', NULL, 0),
(1825, '莘县', '0', 275, 0, '1825', 1, 0, '', NULL, 0),
(1826, '茌平县', '0', 275, 0, '1826', 1, 0, '', NULL, 0),
(1827, '东阿县', '0', 275, 0, '1827', 1, 0, '', NULL, 0),
(1828, '冠县', '0', 275, 0, '1828', 1, 0, '', NULL, 0),
(1829, '高唐县', '0', 275, 0, '1829', 1, 0, '', NULL, 0),
(1830, '临清市', '0', 275, 0, '1830', 1, 0, '', NULL, 0),
(1831, '滨城区', '0', 276, 0, '1831', 1, 0, '', NULL, 0),
(1832, '惠民县', '0', 276, 0, '1832', 1, 0, '', NULL, 0),
(1833, '阳信县', '0', 276, 0, '1833', 1, 0, '', NULL, 0),
(1834, '无棣县', '0', 276, 0, '1834', 1, 0, '', NULL, 0),
(1835, '沾化县', '0', 276, 0, '1835', 1, 0, '', NULL, 0),
(1836, '博兴县', '0', 276, 0, '1836', 1, 0, '', NULL, 0),
(1837, '邹平县', '0', 276, 0, '1837', 1, 0, '', NULL, 0),
(1838, '牡丹区', '0', 277, 0, '1838', 1, 0, '', NULL, 0),
(1839, '曹县', '0', 277, 0, '1839', 1, 0, '', NULL, 0),
(1840, '单县', '0', 277, 0, '1840', 1, 0, '', NULL, 0),
(1841, '成武县', '0', 277, 0, '1841', 1, 0, '', NULL, 0),
(1842, '巨野县', '0', 277, 0, '1842', 1, 0, '', NULL, 0),
(1843, '郓城县', '0', 277, 0, '1843', 1, 0, '', NULL, 0),
(1844, '鄄城县', '0', 277, 0, '1844', 1, 0, '', NULL, 0),
(1845, '定陶县', '0', 277, 0, '1845', 1, 0, '', NULL, 0),
(1846, '东明县', '0', 277, 0, '1846', 1, 0, '', NULL, 0),
(1847, '中原区', '0', 278, 0, '1847', 1, 0, '', NULL, 0),
(1848, '二七区', '0', 278, 0, '1848', 1, 0, '', NULL, 0),
(1849, '管城回族区', '0', 278, 0, '1849', 1, 0, '', NULL, 0),
(1850, '金水区', '0', 278, 0, '1850', 1, 0, '', NULL, 0),
(1851, '上街区', '0', 278, 0, '1851', 1, 0, '', NULL, 0),
(1852, '惠济区', '0', 278, 0, '1852', 1, 0, '', NULL, 0),
(1853, '中牟县', '0', 278, 0, '1853', 1, 0, '', NULL, 0),
(1854, '巩义市', '0', 278, 0, '1854', 1, 0, '', NULL, 0),
(1855, '荥阳市', '0', 278, 0, '1855', 1, 0, '', NULL, 0),
(1856, '新密市', '0', 278, 0, '1856', 1, 0, '', NULL, 0),
(1857, '新郑市', '0', 278, 0, '1857', 1, 0, '', NULL, 0),
(1858, '登封市', '0', 278, 0, '1858', 1, 0, '', NULL, 0),
(1859, '龙亭区', '0', 279, 0, '1859', 1, 0, '', NULL, 0),
(1860, '顺河回族区', '0', 279, 0, '1860', 1, 0, '', NULL, 0),
(1861, '鼓楼区', '0', 279, 0, '1861', 1, 0, '', NULL, 0),
(1862, '禹王台区', '0', 279, 0, '1862', 1, 0, '', NULL, 0),
(1863, '金明区', '0', 279, 0, '1863', 1, 0, '', NULL, 0),
(1864, '杞县', '0', 279, 0, '1864', 1, 0, '', NULL, 0),
(1865, '通许县', '0', 279, 0, '1865', 1, 0, '', NULL, 0),
(1866, '尉氏县', '0', 279, 0, '1866', 1, 0, '', NULL, 0),
(1867, '开封县', '0', 279, 0, '1867', 1, 0, '', NULL, 0),
(1868, '兰考县', '0', 279, 0, '1868', 1, 0, '', NULL, 0),
(1869, '老城区', '0', 280, 0, '1869', 1, 0, '', NULL, 0),
(1870, '西工区', '0', 280, 0, '1870', 1, 0, '', NULL, 0),
(1871, '廛河回族区', '0', 280, 0, '1871', 1, 0, '', NULL, 0),
(1872, '涧西区', '0', 280, 0, '1872', 1, 0, '', NULL, 0),
(1873, '吉利区', '0', 280, 0, '1873', 1, 0, '', NULL, 0),
(1874, '洛龙区', '0', 280, 0, '1874', 1, 0, '', NULL, 0),
(1875, '孟津县', '0', 280, 0, '1875', 1, 0, '', NULL, 0),
(1876, '新安县', '0', 280, 0, '1876', 1, 0, '', NULL, 0),
(1877, '栾川县', '0', 280, 0, '1877', 1, 0, '', NULL, 0),
(1878, '嵩县', '0', 280, 0, '1878', 1, 0, '', NULL, 0),
(1879, '汝阳县', '0', 280, 0, '1879', 1, 0, '', NULL, 0),
(1880, '宜阳县', '0', 280, 0, '1880', 1, 0, '', NULL, 0),
(1881, '洛宁县', '0', 280, 0, '1881', 1, 0, '', NULL, 0),
(1882, '伊川县', '0', 280, 0, '1882', 1, 0, '', NULL, 0),
(1883, '偃师市', '0', 280, 0, '1883', 1, 0, '', NULL, 0),
(1884, '新华区', '0', 281, 0, '1884', 1, 0, '', NULL, 0),
(1885, '卫东区', '0', 281, 0, '1885', 1, 0, '', NULL, 0),
(1886, '石龙区', '0', 281, 0, '1886', 1, 0, '', NULL, 0),
(1887, '湛河区', '0', 281, 0, '1887', 1, 0, '', NULL, 0),
(1888, '宝丰县', '0', 281, 0, '1888', 1, 0, '', NULL, 0),
(1889, '叶县', '0', 281, 0, '1889', 1, 0, '', NULL, 0),
(1890, '鲁山县', '0', 281, 0, '1890', 1, 0, '', NULL, 0),
(1891, '郏县', '0', 281, 0, '1891', 1, 0, '', NULL, 0),
(1892, '舞钢市', '0', 281, 0, '1892', 1, 0, '', NULL, 0),
(1893, '汝州市', '0', 281, 0, '1893', 1, 0, '', NULL, 0),
(1894, '文峰区', '0', 282, 0, '1894', 1, 0, '', NULL, 0),
(1895, '北关区', '0', 282, 0, '1895', 1, 0, '', NULL, 0),
(1896, '殷都区', '0', 282, 0, '1896', 1, 0, '', NULL, 0),
(1897, '龙安区', '0', 282, 0, '1897', 1, 0, '', NULL, 0),
(1898, '安阳县', '0', 282, 0, '1898', 1, 0, '', NULL, 0),
(1899, '汤阴县', '0', 282, 0, '1899', 1, 0, '', NULL, 0),
(1900, '滑县', '0', 282, 0, '1900', 1, 0, '', NULL, 0),
(1901, '内黄县', '0', 282, 0, '1901', 1, 0, '', NULL, 0),
(1902, '林州市', '0', 282, 0, '1902', 1, 0, '', NULL, 0),
(1903, '鹤山区', '0', 283, 0, '1903', 1, 0, '', NULL, 0),
(1904, '山城区', '0', 283, 0, '1904', 1, 0, '', NULL, 0),
(1905, '淇滨区', '0', 283, 0, '1905', 1, 0, '', NULL, 0),
(1906, '浚县', '0', 283, 0, '1906', 1, 0, '', NULL, 0),
(1907, '淇县', '0', 283, 0, '1907', 1, 0, '', NULL, 0),
(1908, '红旗区', '0', 284, 0, '1908', 1, 0, '', NULL, 0),
(1909, '卫滨区', '0', 284, 0, '1909', 1, 0, '', NULL, 0),
(1910, '凤泉区', '0', 284, 0, '1910', 1, 0, '', NULL, 0),
(1911, '牧野区', '0', 284, 0, '1911', 1, 0, '', NULL, 0),
(1912, '新乡县', '0', 284, 0, '1912', 1, 0, '', NULL, 0),
(1913, '获嘉县', '0', 284, 0, '1913', 1, 0, '', NULL, 0),
(1914, '原阳县', '0', 284, 0, '1914', 1, 0, '', NULL, 0),
(1915, '延津县', '0', 284, 0, '1915', 1, 0, '', NULL, 0),
(1916, '封丘县', '0', 284, 0, '1916', 1, 0, '', NULL, 0),
(1917, '长垣县', '0', 284, 0, '1917', 1, 0, '', NULL, 0),
(1918, '卫辉市', '0', 284, 0, '1918', 1, 0, '', NULL, 0),
(1919, '辉县市', '0', 284, 0, '1919', 1, 0, '', NULL, 0),
(1920, '解放区', '0', 285, 0, '1920', 1, 0, '', NULL, 0),
(1921, '中站区', '0', 285, 0, '1921', 1, 0, '', NULL, 0),
(1922, '马村区', '0', 285, 0, '1922', 1, 0, '', NULL, 0),
(1923, '山阳区', '0', 285, 0, '1923', 1, 0, '', NULL, 0),
(1924, '修武县', '0', 285, 0, '1924', 1, 0, '', NULL, 0),
(1925, '博爱县', '0', 285, 0, '1925', 1, 0, '', NULL, 0),
(1926, '武陟县', '0', 285, 0, '1926', 1, 0, '', NULL, 0),
(1927, '温县', '0', 285, 0, '1927', 1, 0, '', NULL, 0),
(1928, '济源市', '0', 285, 0, '1928', 1, 0, '', NULL, 0),
(1929, '沁阳市', '0', 285, 0, '1929', 1, 0, '', NULL, 0),
(1930, '孟州市', '0', 285, 0, '1930', 1, 0, '', NULL, 0),
(1931, '华龙区', '0', 286, 0, '1931', 1, 0, '', NULL, 0),
(1932, '清丰县', '0', 286, 0, '1932', 1, 0, '', NULL, 0),
(1933, '南乐县', '0', 286, 0, '1933', 1, 0, '', NULL, 0),
(1934, '范县', '0', 286, 0, '1934', 1, 0, '', NULL, 0),
(1935, '台前县', '0', 286, 0, '1935', 1, 0, '', NULL, 0),
(1936, '濮阳县', '0', 286, 0, '1936', 1, 0, '', NULL, 0),
(1937, '魏都区', '0', 287, 0, '1937', 1, 0, '', NULL, 0),
(1938, '许昌县', '0', 287, 0, '1938', 1, 0, '', NULL, 0),
(1939, '鄢陵县', '0', 287, 0, '1939', 1, 0, '', NULL, 0),
(1940, '襄城县', '0', 287, 0, '1940', 1, 0, '', NULL, 0),
(1941, '禹州市', '0', 287, 0, '1941', 1, 0, '', NULL, 0),
(1942, '长葛市', '0', 287, 0, '1942', 1, 0, '', NULL, 0),
(1943, '源汇区', '0', 288, 0, '1943', 1, 0, '', NULL, 0),
(1944, '郾城区', '0', 288, 0, '1944', 1, 0, '', NULL, 0),
(1945, '召陵区', '0', 288, 0, '1945', 1, 0, '', NULL, 0),
(1946, '舞阳县', '0', 288, 0, '1946', 1, 0, '', NULL, 0),
(1947, '临颍县', '0', 288, 0, '1947', 1, 0, '', NULL, 0),
(1948, '湖滨区', '0', 289, 0, '1948', 1, 0, '', NULL, 0),
(1949, '渑池县', '0', 289, 0, '1949', 1, 0, '', NULL, 0),
(1950, '陕县', '0', 289, 0, '1950', 1, 0, '', NULL, 0),
(1951, '卢氏县', '0', 289, 0, '1951', 1, 0, '', NULL, 0),
(1952, '义马市', '0', 289, 0, '1952', 1, 0, '', NULL, 0),
(1953, '灵宝市', '0', 289, 0, '1953', 1, 0, '', NULL, 0),
(1954, '宛城区', '0', 290, 0, '1954', 1, 0, '', NULL, 0),
(1955, '卧龙区', '0', 290, 0, '1955', 1, 0, '', NULL, 0),
(1956, '南召县', '0', 290, 0, '1956', 1, 0, '', NULL, 0),
(1957, '方城县', '0', 290, 0, '1957', 1, 0, '', NULL, 0),
(1958, '西峡县', '0', 290, 0, '1958', 1, 0, '', NULL, 0),
(1959, '镇平县', '0', 290, 0, '1959', 1, 0, '', NULL, 0),
(1960, '内乡县', '0', 290, 0, '1960', 1, 0, '', NULL, 0),
(1961, '淅川县', '0', 290, 0, '1961', 1, 0, '', NULL, 0),
(1962, '社旗县', '0', 290, 0, '1962', 1, 0, '', NULL, 0),
(1963, '唐河县', '0', 290, 0, '1963', 1, 0, '', NULL, 0),
(1964, '新野县', '0', 290, 0, '1964', 1, 0, '', NULL, 0),
(1965, '桐柏县', '0', 290, 0, '1965', 1, 0, '', NULL, 0),
(1966, '邓州市', '0', 290, 0, '1966', 1, 0, '', NULL, 0),
(1967, '梁园区', '0', 291, 0, '1967', 1, 0, '', NULL, 0),
(1968, '睢阳区', '0', 291, 0, '1968', 1, 0, '', NULL, 0),
(1969, '民权县', '0', 291, 0, '1969', 1, 0, '', NULL, 0),
(1970, '睢县', '0', 291, 0, '1970', 1, 0, '', NULL, 0),
(1971, '宁陵县', '0', 291, 0, '1971', 1, 0, '', NULL, 0),
(1972, '柘城县', '0', 291, 0, '1972', 1, 0, '', NULL, 0),
(1973, '虞城县', '0', 291, 0, '1973', 1, 0, '', NULL, 0),
(1974, '夏邑县', '0', 291, 0, '1974', 1, 0, '', NULL, 0),
(1975, '永城市', '0', 291, 0, '1975', 1, 0, '', NULL, 0),
(1976, '浉河区', '0', 292, 0, '1976', 1, 0, '', NULL, 0),
(1977, '平桥区', '0', 292, 0, '1977', 1, 0, '', NULL, 0),
(1978, '罗山县', '0', 292, 0, '1978', 1, 0, '', NULL, 0),
(1979, '光山县', '0', 292, 0, '1979', 1, 0, '', NULL, 0),
(1980, '新县', '0', 292, 0, '1980', 1, 0, '', NULL, 0),
(1981, '商城县', '0', 292, 0, '1981', 1, 0, '', NULL, 0),
(1982, '固始县', '0', 292, 0, '1982', 1, 0, '', NULL, 0),
(1983, '潢川县', '0', 292, 0, '1983', 1, 0, '', NULL, 0),
(1984, '淮滨县', '0', 292, 0, '1984', 1, 0, '', NULL, 0),
(1985, '息县', '0', 292, 0, '1985', 1, 0, '', NULL, 0),
(1986, '川汇区', '0', 293, 0, '1986', 1, 0, '', NULL, 0),
(1987, '扶沟县', '0', 293, 0, '1987', 1, 0, '', NULL, 0),
(1988, '西华县', '0', 293, 0, '1988', 1, 0, '', NULL, 0),
(1989, '商水县', '0', 293, 0, '1989', 1, 0, '', NULL, 0),
(1990, '沈丘县', '0', 293, 0, '1990', 1, 0, '', NULL, 0),
(1991, '郸城县', '0', 293, 0, '1991', 1, 0, '', NULL, 0),
(1992, '淮阳县', '0', 293, 0, '1992', 1, 0, '', NULL, 0),
(1993, '太康县', '0', 293, 0, '1993', 1, 0, '', NULL, 0),
(1994, '鹿邑县', '0', 293, 0, '1994', 1, 0, '', NULL, 0),
(1995, '项城市', '0', 293, 0, '1995', 1, 0, '', NULL, 0),
(1996, '驿城区', '0', 294, 0, '1996', 1, 0, '', NULL, 0),
(1997, '西平县', '0', 294, 0, '1997', 1, 0, '', NULL, 0),
(1998, '上蔡县', '0', 294, 0, '1998', 1, 0, '', NULL, 0),
(1999, '平舆县', '0', 294, 0, '1999', 1, 0, '', NULL, 0),
(2000, '正阳县', '0', 294, 0, '2000', 1, 0, '', NULL, 0),
(2001, '确山县', '0', 294, 0, '2001', 1, 0, '', NULL, 0),
(2002, '泌阳县', '0', 294, 0, '2002', 1, 0, '', NULL, 0),
(2003, '汝南县', '0', 294, 0, '2003', 1, 0, '', NULL, 0),
(2004, '遂平县', '0', 294, 0, '2004', 1, 0, '', NULL, 0),
(2005, '新蔡县', '0', 294, 0, '2005', 1, 0, '', NULL, 0),
(2006, '江岸区', '0', 295, 0, '2006', 1, 0, '', NULL, 0),
(2007, '江汉区', '0', 295, 0, '2007', 1, 0, '', NULL, 0),
(2008, '硚口区', '0', 295, 0, '2008', 1, 0, '', NULL, 0),
(2009, '汉阳区', '0', 295, 0, '2009', 1, 0, '', NULL, 0),
(2010, '武昌区', '0', 295, 0, '2010', 1, 0, '', NULL, 0),
(2011, '青山区', '0', 295, 0, '2011', 1, 0, '', NULL, 0),
(2012, '洪山区', '0', 295, 0, '2012', 1, 0, '', NULL, 0),
(2013, '东西湖区', '0', 295, 0, '2013', 1, 0, '', NULL, 0),
(2014, '汉南区', '0', 295, 0, '2014', 1, 0, '', NULL, 0),
(2015, '蔡甸区', '0', 295, 0, '2015', 1, 0, '', NULL, 0),
(2016, '江夏区', '0', 295, 0, '2016', 1, 0, '', NULL, 0),
(2017, '黄陂区', '0', 295, 0, '2017', 1, 0, '', NULL, 0),
(2018, '新洲区', '0', 295, 0, '2018', 1, 0, '', NULL, 0),
(2019, '黄石港区', '0', 296, 0, '2019', 1, 0, '', NULL, 0),
(2020, '西塞山区', '0', 296, 0, '2020', 1, 0, '', NULL, 0),
(2021, '下陆区', '0', 296, 0, '2021', 1, 0, '', NULL, 0),
(2022, '铁山区', '0', 296, 0, '2022', 1, 0, '', NULL, 0),
(2023, '阳新县', '0', 296, 0, '2023', 1, 0, '', NULL, 0),
(2024, '大冶市', '0', 296, 0, '2024', 1, 0, '', NULL, 0),
(2025, '茅箭区', '0', 297, 0, '2025', 1, 0, '', NULL, 0),
(2026, '张湾区', '0', 297, 0, '2026', 1, 0, '', NULL, 0),
(2027, '郧县', '0', 297, 0, '2027', 1, 0, '', NULL, 0),
(2028, '郧西县', '0', 297, 0, '2028', 1, 0, '', NULL, 0),
(2029, '竹山县', '0', 297, 0, '2029', 1, 0, '', NULL, 0),
(2030, '竹溪县', '0', 297, 0, '2030', 1, 0, '', NULL, 0),
(2031, '房县', '0', 297, 0, '2031', 1, 0, '', NULL, 0),
(2032, '丹江口市', '0', 297, 0, '2032', 1, 0, '', NULL, 0),
(2033, '西陵区', '0', 298, 0, '2033', 1, 0, '', NULL, 0),
(2034, '伍家岗区', '0', 298, 0, '2034', 1, 0, '', NULL, 0),
(2035, '点军区', '0', 298, 0, '2035', 1, 0, '', NULL, 0),
(2036, '猇亭区', '0', 298, 0, '2036', 1, 0, '', NULL, 0),
(2037, '夷陵区', '0', 298, 0, '2037', 1, 0, '', NULL, 0),
(2038, '远安县', '0', 298, 0, '2038', 1, 0, '', NULL, 0),
(2039, '兴山县', '0', 298, 0, '2039', 1, 0, '', NULL, 0),
(2040, '秭归县', '0', 298, 0, '2040', 1, 0, '', NULL, 0),
(2041, '长阳土家族自治县', '0', 298, 0, '2041', 1, 0, '', NULL, 0),
(2042, '五峰土家族自治县', '0', 298, 0, '2042', 1, 0, '', NULL, 0),
(2043, '宜都市', '0', 298, 0, '2043', 1, 0, '', NULL, 0),
(2044, '当阳市', '0', 298, 0, '2044', 1, 0, '', NULL, 0),
(2045, '枝江市', '0', 298, 0, '2045', 1, 0, '', NULL, 0),
(2046, '襄城区', '0', 299, 0, '2046', 1, 0, '', NULL, 0),
(2047, '樊城区', '0', 299, 0, '2047', 1, 0, '', NULL, 0),
(2048, '襄阳区', '0', 299, 0, '2048', 1, 0, '', NULL, 0),
(2049, '南漳县', '0', 299, 0, '2049', 1, 0, '', NULL, 0),
(2050, '谷城县', '0', 299, 0, '2050', 1, 0, '', NULL, 0),
(2051, '保康县', '0', 299, 0, '2051', 1, 0, '', NULL, 0),
(2052, '老河口市', '0', 299, 0, '2052', 1, 0, '', NULL, 0),
(2053, '枣阳市', '0', 299, 0, '2053', 1, 0, '', NULL, 0),
(2054, '宜城市', '0', 299, 0, '2054', 1, 0, '', NULL, 0),
(2055, '梁子湖区', '0', 300, 0, '2055', 1, 0, '', NULL, 0),
(2056, '华容区', '0', 300, 0, '2056', 1, 0, '', NULL, 0),
(2057, '鄂城区', '0', 300, 0, '2057', 1, 0, '', NULL, 0),
(2058, '东宝区', '0', 301, 0, '2058', 1, 0, '', NULL, 0),
(2059, '掇刀区', '0', 301, 0, '2059', 1, 0, '', NULL, 0),
(2060, '京山县', '0', 301, 0, '2060', 1, 0, '', NULL, 0),
(2061, '沙洋县', '0', 301, 0, '2061', 1, 0, '', NULL, 0),
(2062, '钟祥市', '0', 301, 0, '2062', 1, 0, '', NULL, 0),
(2063, '孝南区', '0', 302, 0, '2063', 1, 0, '', NULL, 0),
(2064, '孝昌县', '0', 302, 0, '2064', 1, 0, '', NULL, 0),
(2065, '大悟县', '0', 302, 0, '2065', 1, 0, '', NULL, 0),
(2066, '云梦县', '0', 302, 0, '2066', 1, 0, '', NULL, 0),
(2067, '应城市', '0', 302, 0, '2067', 1, 0, '', NULL, 0),
(2068, '安陆市', '0', 302, 0, '2068', 1, 0, '', NULL, 0),
(2069, '汉川市', '0', 302, 0, '2069', 1, 0, '', NULL, 0),
(2070, '沙市区', '0', 303, 0, '2070', 1, 0, '', NULL, 0),
(2071, '荆州区', '0', 303, 0, '2071', 1, 0, '', NULL, 0),
(2072, '公安县', '0', 303, 0, '2072', 1, 0, '', NULL, 0),
(2073, '监利县', '0', 303, 0, '2073', 1, 0, '', NULL, 0),
(2074, '江陵县', '0', 303, 0, '2074', 1, 0, '', NULL, 0),
(2075, '石首市', '0', 303, 0, '2075', 1, 0, '', NULL, 0),
(2076, '洪湖市', '0', 303, 0, '2076', 1, 0, '', NULL, 0),
(2077, '松滋市', '0', 303, 0, '2077', 1, 0, '', NULL, 0),
(2078, '黄州区', '0', 304, 0, '2078', 1, 0, '', NULL, 0),
(2079, '团风县', '0', 304, 0, '2079', 1, 0, '', NULL, 0),
(2080, '红安县', '0', 304, 0, '2080', 1, 0, '', NULL, 0),
(2081, '罗田县', '0', 304, 0, '2081', 1, 0, '', NULL, 0),
(2082, '英山县', '0', 304, 0, '2082', 1, 0, '', NULL, 0);
INSERT DELAYED IGNORE INTO `cban_linkage` (`linkageid`, `name`, `style`, `parentid`, `child`, `arrchildid`, `keyid`, `listorder`, `description`, `setting`, `siteid`) VALUES 
(2083, '浠水县', '0', 304, 0, '2083', 1, 0, '', NULL, 0),
(2084, '蕲春县', '0', 304, 0, '2084', 1, 0, '', NULL, 0),
(2085, '黄梅县', '0', 304, 0, '2085', 1, 0, '', NULL, 0),
(2086, '麻城市', '0', 304, 0, '2086', 1, 0, '', NULL, 0),
(2087, '武穴市', '0', 304, 0, '2087', 1, 0, '', NULL, 0),
(2088, '咸安区', '0', 305, 0, '2088', 1, 0, '', NULL, 0),
(2089, '嘉鱼县', '0', 305, 0, '2089', 1, 0, '', NULL, 0),
(2090, '通城县', '0', 305, 0, '2090', 1, 0, '', NULL, 0),
(2091, '崇阳县', '0', 305, 0, '2091', 1, 0, '', NULL, 0),
(2092, '通山县', '0', 305, 0, '2092', 1, 0, '', NULL, 0),
(2093, '赤壁市', '0', 305, 0, '2093', 1, 0, '', NULL, 0),
(2094, '曾都区', '0', 306, 0, '2094', 1, 0, '', NULL, 0),
(2095, '广水市', '0', 306, 0, '2095', 1, 0, '', NULL, 0),
(2096, '恩施市', '0', 307, 0, '2096', 1, 0, '', NULL, 0),
(2097, '利川市', '0', 307, 0, '2097', 1, 0, '', NULL, 0),
(2098, '建始县', '0', 307, 0, '2098', 1, 0, '', NULL, 0),
(2099, '巴东县', '0', 307, 0, '2099', 1, 0, '', NULL, 0),
(2100, '宣恩县', '0', 307, 0, '2100', 1, 0, '', NULL, 0),
(2101, '咸丰县', '0', 307, 0, '2101', 1, 0, '', NULL, 0),
(2102, '来凤县', '0', 307, 0, '2102', 1, 0, '', NULL, 0),
(2103, '鹤峰县', '0', 307, 0, '2103', 1, 0, '', NULL, 0),
(2104, '芙蓉区', '0', 312, 0, '2104', 1, 0, '', NULL, 0),
(2105, '天心区', '0', 312, 0, '2105', 1, 0, '', NULL, 0),
(2106, '岳麓区', '0', 312, 0, '2106', 1, 0, '', NULL, 0),
(2107, '开福区', '0', 312, 0, '2107', 1, 0, '', NULL, 0),
(2108, '雨花区', '0', 312, 0, '2108', 1, 0, '', NULL, 0),
(2109, '长沙县', '0', 312, 0, '2109', 1, 0, '', NULL, 0),
(2110, '望城县', '0', 312, 0, '2110', 1, 0, '', NULL, 0),
(2111, '宁乡县', '0', 312, 0, '2111', 1, 0, '', NULL, 0),
(2112, '浏阳市', '0', 312, 0, '2112', 1, 0, '', NULL, 0),
(2113, '荷塘区', '0', 313, 0, '2113', 1, 0, '', NULL, 0),
(2114, '芦淞区', '0', 313, 0, '2114', 1, 0, '', NULL, 0),
(2115, '石峰区', '0', 313, 0, '2115', 1, 0, '', NULL, 0),
(2116, '天元区', '0', 313, 0, '2116', 1, 0, '', NULL, 0),
(2117, '株洲县', '0', 313, 0, '2117', 1, 0, '', NULL, 0),
(2118, '攸县', '0', 313, 0, '2118', 1, 0, '', NULL, 0),
(2119, '茶陵县', '0', 313, 0, '2119', 1, 0, '', NULL, 0),
(2120, '炎陵县', '0', 313, 0, '2120', 1, 0, '', NULL, 0),
(2121, '醴陵市', '0', 313, 0, '2121', 1, 0, '', NULL, 0),
(2122, '雨湖区', '0', 314, 0, '2122', 1, 0, '', NULL, 0),
(2123, '岳塘区', '0', 314, 0, '2123', 1, 0, '', NULL, 0),
(2124, '湘潭县', '0', 314, 0, '2124', 1, 0, '', NULL, 0),
(2125, '湘乡市', '0', 314, 0, '2125', 1, 0, '', NULL, 0),
(2126, '韶山市', '0', 314, 0, '2126', 1, 0, '', NULL, 0),
(2127, '珠晖区', '0', 315, 0, '2127', 1, 0, '', NULL, 0),
(2128, '雁峰区', '0', 315, 0, '2128', 1, 0, '', NULL, 0),
(2129, '石鼓区', '0', 315, 0, '2129', 1, 0, '', NULL, 0),
(2130, '蒸湘区', '0', 315, 0, '2130', 1, 0, '', NULL, 0),
(2131, '南岳区', '0', 315, 0, '2131', 1, 0, '', NULL, 0),
(2132, '衡阳县', '0', 315, 0, '2132', 1, 0, '', NULL, 0),
(2133, '衡南县', '0', 315, 0, '2133', 1, 0, '', NULL, 0),
(2134, '衡山县', '0', 315, 0, '2134', 1, 0, '', NULL, 0),
(2135, '衡东县', '0', 315, 0, '2135', 1, 0, '', NULL, 0),
(2136, '祁东县', '0', 315, 0, '2136', 1, 0, '', NULL, 0),
(2137, '耒阳市', '0', 315, 0, '2137', 1, 0, '', NULL, 0),
(2138, '常宁市', '0', 315, 0, '2138', 1, 0, '', NULL, 0),
(2139, '双清区', '0', 316, 0, '2139', 1, 0, '', NULL, 0),
(2140, '大祥区', '0', 316, 0, '2140', 1, 0, '', NULL, 0),
(2141, '北塔区', '0', 316, 0, '2141', 1, 0, '', NULL, 0),
(2142, '邵东县', '0', 316, 0, '2142', 1, 0, '', NULL, 0),
(2143, '新邵县', '0', 316, 0, '2143', 1, 0, '', NULL, 0),
(2144, '邵阳县', '0', 316, 0, '2144', 1, 0, '', NULL, 0),
(2145, '隆回县', '0', 316, 0, '2145', 1, 0, '', NULL, 0),
(2146, '洞口县', '0', 316, 0, '2146', 1, 0, '', NULL, 0),
(2147, '绥宁县', '0', 316, 0, '2147', 1, 0, '', NULL, 0),
(2148, '新宁县', '0', 316, 0, '2148', 1, 0, '', NULL, 0),
(2149, '城步苗族自治县', '0', 316, 0, '2149', 1, 0, '', NULL, 0),
(2150, '武冈市', '0', 316, 0, '2150', 1, 0, '', NULL, 0),
(2151, '岳阳楼区', '0', 317, 0, '2151', 1, 0, '', NULL, 0),
(2152, '云溪区', '0', 317, 0, '2152', 1, 0, '', NULL, 0),
(2153, '君山区', '0', 317, 0, '2153', 1, 0, '', NULL, 0),
(2154, '岳阳县', '0', 317, 0, '2154', 1, 0, '', NULL, 0),
(2155, '华容县', '0', 317, 0, '2155', 1, 0, '', NULL, 0),
(2156, '湘阴县', '0', 317, 0, '2156', 1, 0, '', NULL, 0),
(2157, '平江县', '0', 317, 0, '2157', 1, 0, '', NULL, 0),
(2158, '汨罗市', '0', 317, 0, '2158', 1, 0, '', NULL, 0),
(2159, '临湘市', '0', 317, 0, '2159', 1, 0, '', NULL, 0),
(2160, '武陵区', '0', 318, 0, '2160', 1, 0, '', NULL, 0),
(2161, '鼎城区', '0', 318, 0, '2161', 1, 0, '', NULL, 0),
(2162, '安乡县', '0', 318, 0, '2162', 1, 0, '', NULL, 0),
(2163, '汉寿县', '0', 318, 0, '2163', 1, 0, '', NULL, 0),
(2164, '澧县', '0', 318, 0, '2164', 1, 0, '', NULL, 0),
(2165, '临澧县', '0', 318, 0, '2165', 1, 0, '', NULL, 0),
(2166, '桃源县', '0', 318, 0, '2166', 1, 0, '', NULL, 0),
(2167, '石门县', '0', 318, 0, '2167', 1, 0, '', NULL, 0),
(2168, '津市市', '0', 318, 0, '2168', 1, 0, '', NULL, 0),
(2169, '永定区', '0', 319, 0, '2169', 1, 0, '', NULL, 0),
(2170, '武陵源区', '0', 319, 0, '2170', 1, 0, '', NULL, 0),
(2171, '慈利县', '0', 319, 0, '2171', 1, 0, '', NULL, 0),
(2172, '桑植县', '0', 319, 0, '2172', 1, 0, '', NULL, 0),
(2173, '资阳区', '0', 320, 0, '2173', 1, 0, '', NULL, 0),
(2174, '赫山区', '0', 320, 0, '2174', 1, 0, '', NULL, 0),
(2175, '南县', '0', 320, 0, '2175', 1, 0, '', NULL, 0),
(2176, '桃江县', '0', 320, 0, '2176', 1, 0, '', NULL, 0),
(2177, '安化县', '0', 320, 0, '2177', 1, 0, '', NULL, 0),
(2178, '沅江市', '0', 320, 0, '2178', 1, 0, '', NULL, 0),
(2179, '北湖区', '0', 321, 0, '2179', 1, 0, '', NULL, 0),
(2180, '苏仙区', '0', 321, 0, '2180', 1, 0, '', NULL, 0),
(2181, '桂阳县', '0', 321, 0, '2181', 1, 0, '', NULL, 0),
(2182, '宜章县', '0', 321, 0, '2182', 1, 0, '', NULL, 0),
(2183, '永兴县', '0', 321, 0, '2183', 1, 0, '', NULL, 0),
(2184, '嘉禾县', '0', 321, 0, '2184', 1, 0, '', NULL, 0),
(2185, '临武县', '0', 321, 0, '2185', 1, 0, '', NULL, 0),
(2186, '汝城县', '0', 321, 0, '2186', 1, 0, '', NULL, 0),
(2187, '桂东县', '0', 321, 0, '2187', 1, 0, '', NULL, 0),
(2188, '安仁县', '0', 321, 0, '2188', 1, 0, '', NULL, 0),
(2189, '资兴市', '0', 321, 0, '2189', 1, 0, '', NULL, 0),
(2190, '零陵区', '0', 322, 0, '2190', 1, 0, '', NULL, 0),
(2191, '冷水滩区', '0', 322, 0, '2191', 1, 0, '', NULL, 0),
(2192, '祁阳县', '0', 322, 0, '2192', 1, 0, '', NULL, 0),
(2193, '东安县', '0', 322, 0, '2193', 1, 0, '', NULL, 0),
(2194, '双牌县', '0', 322, 0, '2194', 1, 0, '', NULL, 0),
(2195, '道县', '0', 322, 0, '2195', 1, 0, '', NULL, 0),
(2196, '江永县', '0', 322, 0, '2196', 1, 0, '', NULL, 0),
(2197, '宁远县', '0', 322, 0, '2197', 1, 0, '', NULL, 0),
(2198, '蓝山县', '0', 322, 0, '2198', 1, 0, '', NULL, 0),
(2199, '新田县', '0', 322, 0, '2199', 1, 0, '', NULL, 0),
(2200, '江华瑶族自治县', '0', 322, 0, '2200', 1, 0, '', NULL, 0),
(2201, '鹤城区', '0', 323, 0, '2201', 1, 0, '', NULL, 0),
(2202, '中方县', '0', 323, 0, '2202', 1, 0, '', NULL, 0),
(2203, '沅陵县', '0', 323, 0, '2203', 1, 0, '', NULL, 0),
(2204, '辰溪县', '0', 323, 0, '2204', 1, 0, '', NULL, 0),
(2205, '溆浦县', '0', 323, 0, '2205', 1, 0, '', NULL, 0),
(2206, '会同县', '0', 323, 0, '2206', 1, 0, '', NULL, 0),
(2207, '麻阳苗族自治县', '0', 323, 0, '2207', 1, 0, '', NULL, 0),
(2208, '新晃侗族自治县', '0', 323, 0, '2208', 1, 0, '', NULL, 0),
(2209, '芷江侗族自治县', '0', 323, 0, '2209', 1, 0, '', NULL, 0),
(2210, '靖州苗族侗族自治县', '0', 323, 0, '2210', 1, 0, '', NULL, 0),
(2211, '通道侗族自治县', '0', 323, 0, '2211', 1, 0, '', NULL, 0),
(2212, '洪江市', '0', 323, 0, '2212', 1, 0, '', NULL, 0),
(2213, '娄星区', '0', 324, 0, '2213', 1, 0, '', NULL, 0),
(2214, '双峰县', '0', 324, 0, '2214', 1, 0, '', NULL, 0),
(2215, '新化县', '0', 324, 0, '2215', 1, 0, '', NULL, 0),
(2216, '冷水江市', '0', 324, 0, '2216', 1, 0, '', NULL, 0),
(2217, '涟源市', '0', 324, 0, '2217', 1, 0, '', NULL, 0),
(2218, '吉首市', '0', 325, 0, '2218', 1, 0, '', NULL, 0),
(2219, '泸溪县', '0', 325, 0, '2219', 1, 0, '', NULL, 0),
(2220, '凤凰县', '0', 325, 0, '2220', 1, 0, '', NULL, 0),
(2221, '花垣县', '0', 325, 0, '2221', 1, 0, '', NULL, 0),
(2222, '保靖县', '0', 325, 0, '2222', 1, 0, '', NULL, 0),
(2223, '古丈县', '0', 325, 0, '2223', 1, 0, '', NULL, 0),
(2224, '永顺县', '0', 325, 0, '2224', 1, 0, '', NULL, 0),
(2225, '龙山县', '0', 325, 0, '2225', 1, 0, '', NULL, 0),
(2226, '荔湾区', '0', 326, 0, '2226', 1, 0, '', NULL, 0),
(2227, '越秀区', '0', 326, 0, '2227', 1, 0, '', NULL, 0),
(2228, '海珠区', '0', 326, 0, '2228', 1, 0, '', NULL, 0),
(2229, '天河区', '0', 326, 0, '2229', 1, 0, '', NULL, 0),
(2230, '白云区', '0', 326, 0, '2230', 1, 0, '', NULL, 0),
(2231, '黄埔区', '0', 326, 0, '2231', 1, 0, '', NULL, 0),
(2232, '番禺区', '0', 326, 0, '2232', 1, 0, '', NULL, 0),
(2233, '花都区', '0', 326, 0, '2233', 1, 0, '', NULL, 0),
(2234, '南沙区', '0', 326, 0, '2234', 1, 0, '', NULL, 0),
(2235, '萝岗区', '0', 326, 0, '2235', 1, 0, '', NULL, 0),
(2236, '增城市', '0', 326, 0, '2236', 1, 0, '', NULL, 0),
(2237, '从化市', '0', 326, 0, '2237', 1, 0, '', NULL, 0),
(2238, '武江区', '0', 327, 0, '2238', 1, 0, '', NULL, 0),
(2239, '浈江区', '0', 327, 0, '2239', 1, 0, '', NULL, 0),
(2240, '曲江区', '0', 327, 0, '2240', 1, 0, '', NULL, 0),
(2241, '始兴县', '0', 327, 0, '2241', 1, 0, '', NULL, 0),
(2242, '仁化县', '0', 327, 0, '2242', 1, 0, '', NULL, 0),
(2243, '翁源县', '0', 327, 0, '2243', 1, 0, '', NULL, 0),
(2244, '乳源瑶族自治县', '0', 327, 0, '2244', 1, 0, '', NULL, 0),
(2245, '新丰县', '0', 327, 0, '2245', 1, 0, '', NULL, 0),
(2246, '乐昌市', '0', 327, 0, '2246', 1, 0, '', NULL, 0),
(2247, '南雄市', '0', 327, 0, '2247', 1, 0, '', NULL, 0),
(2248, '罗湖区', '0', 328, 0, '2248', 1, 0, '', NULL, 0),
(2249, '福田区', '0', 328, 0, '2249', 1, 0, '', NULL, 0),
(2250, '南山区', '0', 328, 0, '2250', 1, 0, '', NULL, 0),
(2251, '宝安区', '0', 328, 0, '2251', 1, 0, '', NULL, 0),
(2252, '龙岗区', '0', 328, 0, '2252', 1, 0, '', NULL, 0),
(2253, '盐田区', '0', 328, 0, '2253', 1, 0, '', NULL, 0),
(2254, '香洲区', '0', 329, 0, '2254', 1, 0, '', NULL, 0),
(2255, '斗门区', '0', 329, 0, '2255', 1, 0, '', NULL, 0),
(2256, '金湾区', '0', 329, 0, '2256', 1, 0, '', NULL, 0),
(2257, '龙湖区', '0', 330, 0, '2257', 1, 0, '', NULL, 0),
(2258, '金平区', '0', 330, 0, '2258', 1, 0, '', NULL, 0),
(2259, '濠江区', '0', 330, 0, '2259', 1, 0, '', NULL, 0),
(2260, '潮阳区', '0', 330, 0, '2260', 1, 0, '', NULL, 0),
(2261, '潮南区', '0', 330, 0, '2261', 1, 0, '', NULL, 0),
(2262, '澄海区', '0', 330, 0, '2262', 1, 0, '', NULL, 0),
(2263, '南澳县', '0', 330, 0, '2263', 1, 0, '', NULL, 0),
(2264, '禅城区', '0', 331, 0, '2264', 1, 0, '', NULL, 0),
(2265, '南海区', '0', 331, 0, '2265', 1, 0, '', NULL, 0),
(2266, '顺德区', '0', 331, 0, '2266', 1, 0, '', NULL, 0),
(2267, '三水区', '0', 331, 0, '2267', 1, 0, '', NULL, 0),
(2268, '高明区', '0', 331, 0, '2268', 1, 0, '', NULL, 0),
(2269, '蓬江区', '0', 332, 0, '2269', 1, 0, '', NULL, 0),
(2270, '江海区', '0', 332, 0, '2270', 1, 0, '', NULL, 0),
(2271, '新会区', '0', 332, 0, '2271', 1, 0, '', NULL, 0),
(2272, '台山市', '0', 332, 0, '2272', 1, 0, '', NULL, 0),
(2273, '开平市', '0', 332, 0, '2273', 1, 0, '', NULL, 0),
(2274, '鹤山市', '0', 332, 0, '2274', 1, 0, '', NULL, 0),
(2275, '恩平市', '0', 332, 0, '2275', 1, 0, '', NULL, 0),
(2276, '赤坎区', '0', 333, 0, '2276', 1, 0, '', NULL, 0),
(2277, '霞山区', '0', 333, 0, '2277', 1, 0, '', NULL, 0),
(2278, '坡头区', '0', 333, 0, '2278', 1, 0, '', NULL, 0),
(2279, '麻章区', '0', 333, 0, '2279', 1, 0, '', NULL, 0),
(2280, '遂溪县', '0', 333, 0, '2280', 1, 0, '', NULL, 0),
(2281, '徐闻县', '0', 333, 0, '2281', 1, 0, '', NULL, 0),
(2282, '廉江市', '0', 333, 0, '2282', 1, 0, '', NULL, 0),
(2283, '雷州市', '0', 333, 0, '2283', 1, 0, '', NULL, 0),
(2284, '吴川市', '0', 333, 0, '2284', 1, 0, '', NULL, 0),
(2285, '茂南区', '0', 334, 0, '2285', 1, 0, '', NULL, 0),
(2286, '茂港区', '0', 334, 0, '2286', 1, 0, '', NULL, 0),
(2287, '电白县', '0', 334, 0, '2287', 1, 0, '', NULL, 0),
(2288, '高州市', '0', 334, 0, '2288', 1, 0, '', NULL, 0),
(2289, '化州市', '0', 334, 0, '2289', 1, 0, '', NULL, 0),
(2290, '信宜市', '0', 334, 0, '2290', 1, 0, '', NULL, 0),
(2291, '端州区', '0', 335, 0, '2291', 1, 0, '', NULL, 0),
(2292, '鼎湖区', '0', 335, 0, '2292', 1, 0, '', NULL, 0),
(2293, '广宁县', '0', 335, 0, '2293', 1, 0, '', NULL, 0),
(2294, '怀集县', '0', 335, 0, '2294', 1, 0, '', NULL, 0),
(2295, '封开县', '0', 335, 0, '2295', 1, 0, '', NULL, 0),
(2296, '德庆县', '0', 335, 0, '2296', 1, 0, '', NULL, 0),
(2297, '高要市', '0', 335, 0, '2297', 1, 0, '', NULL, 0),
(2298, '四会市', '0', 335, 0, '2298', 1, 0, '', NULL, 0),
(2299, '惠城区', '0', 336, 0, '2299', 1, 0, '', NULL, 0),
(2300, '惠阳区', '0', 336, 0, '2300', 1, 0, '', NULL, 0),
(2301, '博罗县', '0', 336, 0, '2301', 1, 0, '', NULL, 0),
(2302, '惠东县', '0', 336, 0, '2302', 1, 0, '', NULL, 0),
(2303, '龙门县', '0', 336, 0, '2303', 1, 0, '', NULL, 0),
(2304, '梅江区', '0', 337, 0, '2304', 1, 0, '', NULL, 0),
(2305, '梅县', '0', 337, 0, '2305', 1, 0, '', NULL, 0),
(2306, '大埔县', '0', 337, 0, '2306', 1, 0, '', NULL, 0),
(2307, '丰顺县', '0', 337, 0, '2307', 1, 0, '', NULL, 0),
(2308, '五华县', '0', 337, 0, '2308', 1, 0, '', NULL, 0),
(2309, '平远县', '0', 337, 0, '2309', 1, 0, '', NULL, 0),
(2310, '蕉岭县', '0', 337, 0, '2310', 1, 0, '', NULL, 0),
(2311, '兴宁市', '0', 337, 0, '2311', 1, 0, '', NULL, 0),
(2312, '城区', '0', 338, 0, '2312', 1, 0, '', NULL, 0),
(2313, '海丰县', '0', 338, 0, '2313', 1, 0, '', NULL, 0),
(2314, '陆河县', '0', 338, 0, '2314', 1, 0, '', NULL, 0),
(2315, '陆丰市', '0', 338, 0, '2315', 1, 0, '', NULL, 0),
(2316, '源城区', '0', 339, 0, '2316', 1, 0, '', NULL, 0),
(2317, '紫金县', '0', 339, 0, '2317', 1, 0, '', NULL, 0),
(2318, '龙川县', '0', 339, 0, '2318', 1, 0, '', NULL, 0),
(2319, '连平县', '0', 339, 0, '2319', 1, 0, '', NULL, 0),
(2320, '和平县', '0', 339, 0, '2320', 1, 0, '', NULL, 0),
(2321, '东源县', '0', 339, 0, '2321', 1, 0, '', NULL, 0),
(2322, '江城区', '0', 340, 0, '2322', 1, 0, '', NULL, 0),
(2323, '阳西县', '0', 340, 0, '2323', 1, 0, '', NULL, 0),
(2324, '阳东县', '0', 340, 0, '2324', 1, 0, '', NULL, 0),
(2325, '阳春市', '0', 340, 0, '2325', 1, 0, '', NULL, 0),
(2326, '清城区', '0', 341, 0, '2326', 1, 0, '', NULL, 0),
(2327, '佛冈县', '0', 341, 0, '2327', 1, 0, '', NULL, 0),
(2328, '阳山县', '0', 341, 0, '2328', 1, 0, '', NULL, 0),
(2329, '连山壮族瑶族自治县', '0', 341, 0, '2329', 1, 0, '', NULL, 0),
(2330, '连南瑶族自治县', '0', 341, 0, '2330', 1, 0, '', NULL, 0),
(2331, '清新县', '0', 341, 0, '2331', 1, 0, '', NULL, 0),
(2332, '英德市', '0', 341, 0, '2332', 1, 0, '', NULL, 0),
(2333, '连州市', '0', 341, 0, '2333', 1, 0, '', NULL, 0),
(2334, '湘桥区', '0', 344, 0, '2334', 1, 0, '', NULL, 0),
(2335, '潮安县', '0', 344, 0, '2335', 1, 0, '', NULL, 0),
(2336, '饶平县', '0', 344, 0, '2336', 1, 0, '', NULL, 0),
(2337, '榕城区', '0', 345, 0, '2337', 1, 0, '', NULL, 0),
(2338, '揭东县', '0', 345, 0, '2338', 1, 0, '', NULL, 0),
(2339, '揭西县', '0', 345, 0, '2339', 1, 0, '', NULL, 0),
(2340, '惠来县', '0', 345, 0, '2340', 1, 0, '', NULL, 0),
(2341, '普宁市', '0', 345, 0, '2341', 1, 0, '', NULL, 0),
(2342, '云城区', '0', 346, 0, '2342', 1, 0, '', NULL, 0),
(2343, '新兴县', '0', 346, 0, '2343', 1, 0, '', NULL, 0),
(2344, '郁南县', '0', 346, 0, '2344', 1, 0, '', NULL, 0),
(2345, '云安县', '0', 346, 0, '2345', 1, 0, '', NULL, 0),
(2346, '罗定市', '0', 346, 0, '2346', 1, 0, '', NULL, 0),
(2347, '兴宁区', '0', 347, 0, '2347', 1, 0, '', NULL, 0),
(2348, '青秀区', '0', 347, 0, '2348', 1, 0, '', NULL, 0),
(2349, '江南区', '0', 347, 0, '2349', 1, 0, '', NULL, 0),
(2350, '西乡塘区', '0', 347, 0, '2350', 1, 0, '', NULL, 0),
(2351, '良庆区', '0', 347, 0, '2351', 1, 0, '', NULL, 0),
(2352, '邕宁区', '0', 347, 0, '2352', 1, 0, '', NULL, 0),
(2353, '武鸣县', '0', 347, 0, '2353', 1, 0, '', NULL, 0),
(2354, '隆安县', '0', 347, 0, '2354', 1, 0, '', NULL, 0),
(2355, '马山县', '0', 347, 0, '2355', 1, 0, '', NULL, 0),
(2356, '上林县', '0', 347, 0, '2356', 1, 0, '', NULL, 0),
(2357, '宾阳县', '0', 347, 0, '2357', 1, 0, '', NULL, 0),
(2358, '横县', '0', 347, 0, '2358', 1, 0, '', NULL, 0),
(2359, '城中区', '0', 348, 0, '2359', 1, 0, '', NULL, 0),
(2360, '鱼峰区', '0', 348, 0, '2360', 1, 0, '', NULL, 0),
(2361, '柳南区', '0', 348, 0, '2361', 1, 0, '', NULL, 0),
(2362, '柳北区', '0', 348, 0, '2362', 1, 0, '', NULL, 0),
(2363, '柳江县', '0', 348, 0, '2363', 1, 0, '', NULL, 0),
(2364, '柳城县', '0', 348, 0, '2364', 1, 0, '', NULL, 0),
(2365, '鹿寨县', '0', 348, 0, '2365', 1, 0, '', NULL, 0),
(2366, '融安县', '0', 348, 0, '2366', 1, 0, '', NULL, 0),
(2367, '融水苗族自治县', '0', 348, 0, '2367', 1, 0, '', NULL, 0),
(2368, '三江侗族自治县', '0', 348, 0, '2368', 1, 0, '', NULL, 0),
(2369, '秀峰区', '0', 349, 0, '2369', 1, 0, '', NULL, 0),
(2370, '叠彩区', '0', 349, 0, '2370', 1, 0, '', NULL, 0),
(2371, '象山区', '0', 349, 0, '2371', 1, 0, '', NULL, 0),
(2372, '七星区', '0', 349, 0, '2372', 1, 0, '', NULL, 0),
(2373, '雁山区', '0', 349, 0, '2373', 1, 0, '', NULL, 0),
(2374, '阳朔县', '0', 349, 0, '2374', 1, 0, '', NULL, 0),
(2375, '临桂县', '0', 349, 0, '2375', 1, 0, '', NULL, 0),
(2376, '灵川县', '0', 349, 0, '2376', 1, 0, '', NULL, 0),
(2377, '全州县', '0', 349, 0, '2377', 1, 0, '', NULL, 0),
(2378, '兴安县', '0', 349, 0, '2378', 1, 0, '', NULL, 0),
(2379, '永福县', '0', 349, 0, '2379', 1, 0, '', NULL, 0),
(2380, '灌阳县', '0', 349, 0, '2380', 1, 0, '', NULL, 0),
(2381, '龙胜各族自治县', '0', 349, 0, '2381', 1, 0, '', NULL, 0),
(2382, '资源县', '0', 349, 0, '2382', 1, 0, '', NULL, 0),
(2383, '平乐县', '0', 349, 0, '2383', 1, 0, '', NULL, 0),
(2384, '荔蒲县', '0', 349, 0, '2384', 1, 0, '', NULL, 0),
(2385, '恭城瑶族自治县', '0', 349, 0, '2385', 1, 0, '', NULL, 0),
(2386, '万秀区', '0', 350, 0, '2386', 1, 0, '', NULL, 0),
(2387, '蝶山区', '0', 350, 0, '2387', 1, 0, '', NULL, 0),
(2388, '长洲区', '0', 350, 0, '2388', 1, 0, '', NULL, 0),
(2389, '苍梧县', '0', 350, 0, '2389', 1, 0, '', NULL, 0),
(2390, '藤县', '0', 350, 0, '2390', 1, 0, '', NULL, 0),
(2391, '蒙山县', '0', 350, 0, '2391', 1, 0, '', NULL, 0),
(2392, '岑溪市', '0', 350, 0, '2392', 1, 0, '', NULL, 0),
(2393, '海城区', '0', 351, 0, '2393', 1, 0, '', NULL, 0),
(2394, '银海区', '0', 351, 0, '2394', 1, 0, '', NULL, 0),
(2395, '铁山港区', '0', 351, 0, '2395', 1, 0, '', NULL, 0),
(2396, '合浦县', '0', 351, 0, '2396', 1, 0, '', NULL, 0),
(2397, '港口区', '0', 352, 0, '2397', 1, 0, '', NULL, 0),
(2398, '防城区', '0', 352, 0, '2398', 1, 0, '', NULL, 0),
(2399, '上思县', '0', 352, 0, '2399', 1, 0, '', NULL, 0),
(2400, '东兴市', '0', 352, 0, '2400', 1, 0, '', NULL, 0),
(2401, '钦南区', '0', 353, 0, '2401', 1, 0, '', NULL, 0),
(2402, '钦北区', '0', 353, 0, '2402', 1, 0, '', NULL, 0),
(2403, '灵山县', '0', 353, 0, '2403', 1, 0, '', NULL, 0),
(2404, '浦北县', '0', 353, 0, '2404', 1, 0, '', NULL, 0),
(2405, '港北区', '0', 354, 0, '2405', 1, 0, '', NULL, 0),
(2406, '港南区', '0', 354, 0, '2406', 1, 0, '', NULL, 0),
(2407, '覃塘区', '0', 354, 0, '2407', 1, 0, '', NULL, 0),
(2408, '平南县', '0', 354, 0, '2408', 1, 0, '', NULL, 0),
(2409, '桂平市', '0', 354, 0, '2409', 1, 0, '', NULL, 0),
(2410, '玉州区', '0', 355, 0, '2410', 1, 0, '', NULL, 0),
(2411, '容县', '0', 355, 0, '2411', 1, 0, '', NULL, 0),
(2412, '陆川县', '0', 355, 0, '2412', 1, 0, '', NULL, 0),
(2413, '博白县', '0', 355, 0, '2413', 1, 0, '', NULL, 0),
(2414, '兴业县', '0', 355, 0, '2414', 1, 0, '', NULL, 0),
(2415, '北流市', '0', 355, 0, '2415', 1, 0, '', NULL, 0),
(2416, '右江区', '0', 356, 0, '2416', 1, 0, '', NULL, 0),
(2417, '田阳县', '0', 356, 0, '2417', 1, 0, '', NULL, 0),
(2418, '田东县', '0', 356, 0, '2418', 1, 0, '', NULL, 0),
(2419, '平果县', '0', 356, 0, '2419', 1, 0, '', NULL, 0),
(2420, '德保县', '0', 356, 0, '2420', 1, 0, '', NULL, 0),
(2421, '靖西县', '0', 356, 0, '2421', 1, 0, '', NULL, 0),
(2422, '那坡县', '0', 356, 0, '2422', 1, 0, '', NULL, 0),
(2423, '凌云县', '0', 356, 0, '2423', 1, 0, '', NULL, 0),
(2424, '乐业县', '0', 356, 0, '2424', 1, 0, '', NULL, 0),
(2425, '田林县', '0', 356, 0, '2425', 1, 0, '', NULL, 0),
(2426, '西林县', '0', 356, 0, '2426', 1, 0, '', NULL, 0),
(2427, '隆林各族自治县', '0', 356, 0, '2427', 1, 0, '', NULL, 0),
(2428, '八步区', '0', 357, 0, '2428', 1, 0, '', NULL, 0),
(2429, '昭平县', '0', 357, 0, '2429', 1, 0, '', NULL, 0),
(2430, '钟山县', '0', 357, 0, '2430', 1, 0, '', NULL, 0),
(2431, '富川瑶族自治县', '0', 357, 0, '2431', 1, 0, '', NULL, 0),
(2432, '金城江区', '0', 358, 0, '2432', 1, 0, '', NULL, 0),
(2433, '南丹县', '0', 358, 0, '2433', 1, 0, '', NULL, 0),
(2434, '天峨县', '0', 358, 0, '2434', 1, 0, '', NULL, 0),
(2435, '凤山县', '0', 358, 0, '2435', 1, 0, '', NULL, 0),
(2436, '东兰县', '0', 358, 0, '2436', 1, 0, '', NULL, 0),
(2437, '罗城仫佬族自治县', '0', 358, 0, '2437', 1, 0, '', NULL, 0),
(2438, '环江毛南族自治县', '0', 358, 0, '2438', 1, 0, '', NULL, 0),
(2439, '巴马瑶族自治县', '0', 358, 0, '2439', 1, 0, '', NULL, 0),
(2440, '都安瑶族自治县', '0', 358, 0, '2440', 1, 0, '', NULL, 0),
(2441, '大化瑶族自治县', '0', 358, 0, '2441', 1, 0, '', NULL, 0),
(2442, '宜州市', '0', 358, 0, '2442', 1, 0, '', NULL, 0),
(2443, '兴宾区', '0', 359, 0, '2443', 1, 0, '', NULL, 0),
(2444, '忻城县', '0', 359, 0, '2444', 1, 0, '', NULL, 0),
(2445, '象州县', '0', 359, 0, '2445', 1, 0, '', NULL, 0),
(2446, '武宣县', '0', 359, 0, '2446', 1, 0, '', NULL, 0),
(2447, '金秀瑶族自治县', '0', 359, 0, '2447', 1, 0, '', NULL, 0),
(2448, '合山市', '0', 359, 0, '2448', 1, 0, '', NULL, 0),
(2449, '江洲区', '0', 360, 0, '2449', 1, 0, '', NULL, 0),
(2450, '扶绥县', '0', 360, 0, '2450', 1, 0, '', NULL, 0),
(2451, '宁明县', '0', 360, 0, '2451', 1, 0, '', NULL, 0),
(2452, '龙州县', '0', 360, 0, '2452', 1, 0, '', NULL, 0),
(2453, '大新县', '0', 360, 0, '2453', 1, 0, '', NULL, 0),
(2454, '天等县', '0', 360, 0, '2454', 1, 0, '', NULL, 0),
(2455, '凭祥市', '0', 360, 0, '2455', 1, 0, '', NULL, 0),
(2456, '秀英区', '0', 361, 0, '2456', 1, 0, '', NULL, 0),
(2457, '龙华区', '0', 361, 0, '2457', 1, 0, '', NULL, 0),
(2458, '琼山区', '0', 361, 0, '2458', 1, 0, '', NULL, 0),
(2459, '美兰区', '0', 361, 0, '2459', 1, 0, '', NULL, 0),
(2460, '锦江区', '0', 382, 0, '2460', 1, 0, '', NULL, 0),
(2461, '青羊区', '0', 382, 0, '2461', 1, 0, '', NULL, 0),
(2462, '金牛区', '0', 382, 0, '2462', 1, 0, '', NULL, 0),
(2463, '武侯区', '0', 382, 0, '2463', 1, 0, '', NULL, 0),
(2464, '成华区', '0', 382, 0, '2464', 1, 0, '', NULL, 0),
(2465, '龙泉驿区', '0', 382, 0, '2465', 1, 0, '', NULL, 0),
(2466, '青白江区', '0', 382, 0, '2466', 1, 0, '', NULL, 0),
(2467, '新都区', '0', 382, 0, '2467', 1, 0, '', NULL, 0),
(2468, '温江区', '0', 382, 0, '2468', 1, 0, '', NULL, 0),
(2469, '金堂县', '0', 382, 0, '2469', 1, 0, '', NULL, 0),
(2470, '双流县', '0', 382, 0, '2470', 1, 0, '', NULL, 0),
(2471, '郫县', '0', 382, 0, '2471', 1, 0, '', NULL, 0),
(2472, '大邑县', '0', 382, 0, '2472', 1, 0, '', NULL, 0),
(2473, '蒲江县', '0', 382, 0, '2473', 1, 0, '', NULL, 0),
(2474, '新津县', '0', 382, 0, '2474', 1, 0, '', NULL, 0),
(2475, '都江堰市', '0', 382, 0, '2475', 1, 0, '', NULL, 0),
(2476, '彭州市', '0', 382, 0, '2476', 1, 0, '', NULL, 0),
(2477, '邛崃市', '0', 382, 0, '2477', 1, 0, '', NULL, 0),
(2478, '崇州市', '0', 382, 0, '2478', 1, 0, '', NULL, 0),
(2479, '自流井区', '0', 383, 0, '2479', 1, 0, '', NULL, 0),
(2480, '贡井区', '0', 383, 0, '2480', 1, 0, '', NULL, 0),
(2481, '大安区', '0', 383, 0, '2481', 1, 0, '', NULL, 0),
(2482, '沿滩区', '0', 383, 0, '2482', 1, 0, '', NULL, 0),
(2483, '荣县', '0', 383, 0, '2483', 1, 0, '', NULL, 0),
(2484, '富顺县', '0', 383, 0, '2484', 1, 0, '', NULL, 0),
(2485, '东区', '0', 384, 0, '2485', 1, 0, '', NULL, 0),
(2486, '西区', '0', 384, 0, '2486', 1, 0, '', NULL, 0),
(2487, '仁和区', '0', 384, 0, '2487', 1, 0, '', NULL, 0),
(2488, '米易县', '0', 384, 0, '2488', 1, 0, '', NULL, 0),
(2489, '盐边县', '0', 384, 0, '2489', 1, 0, '', NULL, 0),
(2490, '江阳区', '0', 385, 0, '2490', 1, 0, '', NULL, 0),
(2491, '纳溪区', '0', 385, 0, '2491', 1, 0, '', NULL, 0),
(2492, '龙马潭区', '0', 385, 0, '2492', 1, 0, '', NULL, 0),
(2493, '泸县', '0', 385, 0, '2493', 1, 0, '', NULL, 0),
(2494, '合江县', '0', 385, 0, '2494', 1, 0, '', NULL, 0),
(2495, '叙永县', '0', 385, 0, '2495', 1, 0, '', NULL, 0),
(2496, '古蔺县', '0', 385, 0, '2496', 1, 0, '', NULL, 0),
(2497, '旌阳区', '0', 386, 0, '2497', 1, 0, '', NULL, 0),
(2498, '中江县', '0', 386, 0, '2498', 1, 0, '', NULL, 0),
(2499, '罗江县', '0', 386, 0, '2499', 1, 0, '', NULL, 0),
(2500, '广汉市', '0', 386, 0, '2500', 1, 0, '', NULL, 0),
(2501, '什邡市', '0', 386, 0, '2501', 1, 0, '', NULL, 0),
(2502, '绵竹市', '0', 386, 0, '2502', 1, 0, '', NULL, 0),
(2503, '涪城区', '0', 387, 0, '2503', 1, 0, '', NULL, 0),
(2504, '游仙区', '0', 387, 0, '2504', 1, 0, '', NULL, 0),
(2505, '三台县', '0', 387, 0, '2505', 1, 0, '', NULL, 0),
(2506, '盐亭县', '0', 387, 0, '2506', 1, 0, '', NULL, 0),
(2507, '安县', '0', 387, 0, '2507', 1, 0, '', NULL, 0),
(2508, '梓潼县', '0', 387, 0, '2508', 1, 0, '', NULL, 0),
(2509, '北川羌族自治县', '0', 387, 0, '2509', 1, 0, '', NULL, 0),
(2510, '平武县', '0', 387, 0, '2510', 1, 0, '', NULL, 0),
(2511, '江油市', '0', 387, 0, '2511', 1, 0, '', NULL, 0),
(2512, '市中区', '0', 388, 0, '2512', 1, 0, '', NULL, 0),
(2513, '元坝区', '0', 388, 0, '2513', 1, 0, '', NULL, 0),
(2514, '朝天区', '0', 388, 0, '2514', 1, 0, '', NULL, 0),
(2515, '旺苍县', '0', 388, 0, '2515', 1, 0, '', NULL, 0),
(2516, '青川县', '0', 388, 0, '2516', 1, 0, '', NULL, 0),
(2517, '剑阁县', '0', 388, 0, '2517', 1, 0, '', NULL, 0),
(2518, '苍溪县', '0', 388, 0, '2518', 1, 0, '', NULL, 0),
(2519, '船山区', '0', 389, 0, '2519', 1, 0, '', NULL, 0),
(2520, '安居区', '0', 389, 0, '2520', 1, 0, '', NULL, 0),
(2521, '蓬溪县', '0', 389, 0, '2521', 1, 0, '', NULL, 0),
(2522, '射洪县', '0', 389, 0, '2522', 1, 0, '', NULL, 0),
(2523, '大英县', '0', 389, 0, '2523', 1, 0, '', NULL, 0),
(2524, '市中区', '0', 390, 0, '2524', 1, 0, '', NULL, 0),
(2525, '东兴区', '0', 390, 0, '2525', 1, 0, '', NULL, 0),
(2526, '威远县', '0', 390, 0, '2526', 1, 0, '', NULL, 0),
(2527, '资中县', '0', 390, 0, '2527', 1, 0, '', NULL, 0),
(2528, '隆昌县', '0', 390, 0, '2528', 1, 0, '', NULL, 0),
(2529, '市中区', '0', 391, 0, '2529', 1, 0, '', NULL, 0),
(2530, '沙湾区', '0', 391, 0, '2530', 1, 0, '', NULL, 0),
(2531, '五通桥区', '0', 391, 0, '2531', 1, 0, '', NULL, 0),
(2532, '金口河区', '0', 391, 0, '2532', 1, 0, '', NULL, 0),
(2533, '犍为县', '0', 391, 0, '2533', 1, 0, '', NULL, 0),
(2534, '井研县', '0', 391, 0, '2534', 1, 0, '', NULL, 0),
(2535, '夹江县', '0', 391, 0, '2535', 1, 0, '', NULL, 0),
(2536, '沐川县', '0', 391, 0, '2536', 1, 0, '', NULL, 0),
(2537, '峨边彝族自治县', '0', 391, 0, '2537', 1, 0, '', NULL, 0),
(2538, '马边彝族自治县', '0', 391, 0, '2538', 1, 0, '', NULL, 0),
(2539, '峨眉山市', '0', 391, 0, '2539', 1, 0, '', NULL, 0),
(2540, '顺庆区', '0', 392, 0, '2540', 1, 0, '', NULL, 0),
(2541, '高坪区', '0', 392, 0, '2541', 1, 0, '', NULL, 0),
(2542, '嘉陵区', '0', 392, 0, '2542', 1, 0, '', NULL, 0),
(2543, '南部县', '0', 392, 0, '2543', 1, 0, '', NULL, 0),
(2544, '营山县', '0', 392, 0, '2544', 1, 0, '', NULL, 0),
(2545, '蓬安县', '0', 392, 0, '2545', 1, 0, '', NULL, 0),
(2546, '仪陇县', '0', 392, 0, '2546', 1, 0, '', NULL, 0),
(2547, '西充县', '0', 392, 0, '2547', 1, 0, '', NULL, 0),
(2548, '阆中市', '0', 392, 0, '2548', 1, 0, '', NULL, 0),
(2549, '东坡区', '0', 393, 0, '2549', 1, 0, '', NULL, 0),
(2550, '仁寿县', '0', 393, 0, '2550', 1, 0, '', NULL, 0),
(2551, '彭山县', '0', 393, 0, '2551', 1, 0, '', NULL, 0),
(2552, '洪雅县', '0', 393, 0, '2552', 1, 0, '', NULL, 0),
(2553, '丹棱县', '0', 393, 0, '2553', 1, 0, '', NULL, 0),
(2554, '青神县', '0', 393, 0, '2554', 1, 0, '', NULL, 0),
(2555, '翠屏区', '0', 394, 0, '2555', 1, 0, '', NULL, 0),
(2556, '宜宾县', '0', 394, 0, '2556', 1, 0, '', NULL, 0),
(2557, '南溪县', '0', 394, 0, '2557', 1, 0, '', NULL, 0),
(2558, '江安县', '0', 394, 0, '2558', 1, 0, '', NULL, 0),
(2559, '长宁县', '0', 394, 0, '2559', 1, 0, '', NULL, 0),
(2560, '高县', '0', 394, 0, '2560', 1, 0, '', NULL, 0),
(2561, '珙县', '0', 394, 0, '2561', 1, 0, '', NULL, 0),
(2562, '筠连县', '0', 394, 0, '2562', 1, 0, '', NULL, 0),
(2563, '兴文县', '0', 394, 0, '2563', 1, 0, '', NULL, 0),
(2564, '屏山县', '0', 394, 0, '2564', 1, 0, '', NULL, 0),
(2565, '广安区', '0', 395, 0, '2565', 1, 0, '', NULL, 0),
(2566, '岳池县', '0', 395, 0, '2566', 1, 0, '', NULL, 0),
(2567, '武胜县', '0', 395, 0, '2567', 1, 0, '', NULL, 0),
(2568, '邻水县', '0', 395, 0, '2568', 1, 0, '', NULL, 0),
(2569, '华蓥市', '0', 395, 0, '2569', 1, 0, '', NULL, 0),
(2570, '通川区', '0', 396, 0, '2570', 1, 0, '', NULL, 0),
(2571, '达县', '0', 396, 0, '2571', 1, 0, '', NULL, 0),
(2572, '宣汉县', '0', 396, 0, '2572', 1, 0, '', NULL, 0),
(2573, '开江县', '0', 396, 0, '2573', 1, 0, '', NULL, 0),
(2574, '大竹县', '0', 396, 0, '2574', 1, 0, '', NULL, 0),
(2575, '渠县', '0', 396, 0, '2575', 1, 0, '', NULL, 0),
(2576, '万源市', '0', 396, 0, '2576', 1, 0, '', NULL, 0),
(2577, '雨城区', '0', 397, 0, '2577', 1, 0, '', NULL, 0),
(2578, '名山县', '0', 397, 0, '2578', 1, 0, '', NULL, 0),
(2579, '荥经县', '0', 397, 0, '2579', 1, 0, '', NULL, 0),
(2580, '汉源县', '0', 397, 0, '2580', 1, 0, '', NULL, 0),
(2581, '石棉县', '0', 397, 0, '2581', 1, 0, '', NULL, 0),
(2582, '天全县', '0', 397, 0, '2582', 1, 0, '', NULL, 0),
(2583, '芦山县', '0', 397, 0, '2583', 1, 0, '', NULL, 0),
(2584, '宝兴县', '0', 397, 0, '2584', 1, 0, '', NULL, 0),
(2585, '巴州区', '0', 398, 0, '2585', 1, 0, '', NULL, 0),
(2586, '通江县', '0', 398, 0, '2586', 1, 0, '', NULL, 0),
(2587, '南江县', '0', 398, 0, '2587', 1, 0, '', NULL, 0),
(2588, '平昌县', '0', 398, 0, '2588', 1, 0, '', NULL, 0),
(2589, '雁江区', '0', 399, 0, '2589', 1, 0, '', NULL, 0),
(2590, '安岳县', '0', 399, 0, '2590', 1, 0, '', NULL, 0),
(2591, '乐至县', '0', 399, 0, '2591', 1, 0, '', NULL, 0),
(2592, '简阳市', '0', 399, 0, '2592', 1, 0, '', NULL, 0),
(2593, '汶川县', '0', 400, 0, '2593', 1, 0, '', NULL, 0),
(2594, '理县', '0', 400, 0, '2594', 1, 0, '', NULL, 0),
(2595, '茂县', '0', 400, 0, '2595', 1, 0, '', NULL, 0),
(2596, '松潘县', '0', 400, 0, '2596', 1, 0, '', NULL, 0),
(2597, '九寨沟县', '0', 400, 0, '2597', 1, 0, '', NULL, 0),
(2598, '金川县', '0', 400, 0, '2598', 1, 0, '', NULL, 0),
(2599, '小金县', '0', 400, 0, '2599', 1, 0, '', NULL, 0),
(2600, '黑水县', '0', 400, 0, '2600', 1, 0, '', NULL, 0),
(2601, '马尔康县', '0', 400, 0, '2601', 1, 0, '', NULL, 0),
(2602, '壤塘县', '0', 400, 0, '2602', 1, 0, '', NULL, 0),
(2603, '阿坝县', '0', 400, 0, '2603', 1, 0, '', NULL, 0),
(2604, '若尔盖县', '0', 400, 0, '2604', 1, 0, '', NULL, 0),
(2605, '红原县', '0', 400, 0, '2605', 1, 0, '', NULL, 0),
(2606, '康定县', '0', 401, 0, '2606', 1, 0, '', NULL, 0),
(2607, '泸定县', '0', 401, 0, '2607', 1, 0, '', NULL, 0),
(2608, '丹巴县', '0', 401, 0, '2608', 1, 0, '', NULL, 0),
(2609, '九龙县', '0', 401, 0, '2609', 1, 0, '', NULL, 0),
(2610, '雅江县', '0', 401, 0, '2610', 1, 0, '', NULL, 0),
(2611, '道孚县', '0', 401, 0, '2611', 1, 0, '', NULL, 0),
(2612, '炉霍县', '0', 401, 0, '2612', 1, 0, '', NULL, 0),
(2613, '甘孜县', '0', 401, 0, '2613', 1, 0, '', NULL, 0),
(2614, '新龙县', '0', 401, 0, '2614', 1, 0, '', NULL, 0),
(2615, '德格县', '0', 401, 0, '2615', 1, 0, '', NULL, 0),
(2616, '白玉县', '0', 401, 0, '2616', 1, 0, '', NULL, 0),
(2617, '石渠县', '0', 401, 0, '2617', 1, 0, '', NULL, 0),
(2618, '色达县', '0', 401, 0, '2618', 1, 0, '', NULL, 0),
(2619, '理塘县', '0', 401, 0, '2619', 1, 0, '', NULL, 0),
(2620, '巴塘县', '0', 401, 0, '2620', 1, 0, '', NULL, 0),
(2621, '乡城县', '0', 401, 0, '2621', 1, 0, '', NULL, 0),
(2622, '稻城县', '0', 401, 0, '2622', 1, 0, '', NULL, 0),
(2623, '得荣县', '0', 401, 0, '2623', 1, 0, '', NULL, 0),
(2624, '西昌市', '0', 402, 0, '2624', 1, 0, '', NULL, 0),
(2625, '木里藏族自治县', '0', 402, 0, '2625', 1, 0, '', NULL, 0),
(2626, '盐源县', '0', 402, 0, '2626', 1, 0, '', NULL, 0),
(2627, '德昌县', '0', 402, 0, '2627', 1, 0, '', NULL, 0),
(2628, '会理县', '0', 402, 0, '2628', 1, 0, '', NULL, 0),
(2629, '会东县', '0', 402, 0, '2629', 1, 0, '', NULL, 0),
(2630, '宁南县', '0', 402, 0, '2630', 1, 0, '', NULL, 0),
(2631, '普格县', '0', 402, 0, '2631', 1, 0, '', NULL, 0),
(2632, '布拖县', '0', 402, 0, '2632', 1, 0, '', NULL, 0),
(2633, '金阳县', '0', 402, 0, '2633', 1, 0, '', NULL, 0),
(2634, '昭觉县', '0', 402, 0, '2634', 1, 0, '', NULL, 0),
(2635, '喜德县', '0', 402, 0, '2635', 1, 0, '', NULL, 0),
(2636, '冕宁县', '0', 402, 0, '2636', 1, 0, '', NULL, 0),
(2637, '越西县', '0', 402, 0, '2637', 1, 0, '', NULL, 0),
(2638, '甘洛县', '0', 402, 0, '2638', 1, 0, '', NULL, 0),
(2639, '美姑县', '0', 402, 0, '2639', 1, 0, '', NULL, 0),
(2640, '雷波县', '0', 402, 0, '2640', 1, 0, '', NULL, 0),
(2641, '南明区', '0', 403, 0, '2641', 1, 0, '', NULL, 0),
(2642, '云岩区', '0', 403, 0, '2642', 1, 0, '', NULL, 0),
(2643, '花溪区', '0', 403, 0, '2643', 1, 0, '', NULL, 0),
(2644, '乌当区', '0', 403, 0, '2644', 1, 0, '', NULL, 0),
(2645, '白云区', '0', 403, 0, '2645', 1, 0, '', NULL, 0),
(2646, '小河区', '0', 403, 0, '2646', 1, 0, '', NULL, 0),
(2647, '开阳县', '0', 403, 0, '2647', 1, 0, '', NULL, 0),
(2648, '息烽县', '0', 403, 0, '2648', 1, 0, '', NULL, 0),
(2649, '修文县', '0', 403, 0, '2649', 1, 0, '', NULL, 0),
(2650, '清镇市', '0', 403, 0, '2650', 1, 0, '', NULL, 0),
(2651, '钟山区', '0', 404, 0, '2651', 1, 0, '', NULL, 0),
(2652, '六枝特区', '0', 404, 0, '2652', 1, 0, '', NULL, 0),
(2653, '水城县', '0', 404, 0, '2653', 1, 0, '', NULL, 0),
(2654, '盘县', '0', 404, 0, '2654', 1, 0, '', NULL, 0),
(2655, '红花岗区', '0', 405, 0, '2655', 1, 0, '', NULL, 0),
(2656, '汇川区', '0', 405, 0, '2656', 1, 0, '', NULL, 0),
(2657, '遵义县', '0', 405, 0, '2657', 1, 0, '', NULL, 0),
(2658, '桐梓县', '0', 405, 0, '2658', 1, 0, '', NULL, 0),
(2659, '绥阳县', '0', 405, 0, '2659', 1, 0, '', NULL, 0),
(2660, '正安县', '0', 405, 0, '2660', 1, 0, '', NULL, 0),
(2661, '道真仡佬族苗族自治县', '0', 405, 0, '2661', 1, 0, '', NULL, 0),
(2662, '务川仡佬族苗族自治县', '0', 405, 0, '2662', 1, 0, '', NULL, 0),
(2663, '凤冈县', '0', 405, 0, '2663', 1, 0, '', NULL, 0),
(2664, '湄潭县', '0', 405, 0, '2664', 1, 0, '', NULL, 0),
(2665, '余庆县', '0', 405, 0, '2665', 1, 0, '', NULL, 0),
(2666, '习水县', '0', 405, 0, '2666', 1, 0, '', NULL, 0),
(2667, '赤水市', '0', 405, 0, '2667', 1, 0, '', NULL, 0),
(2668, '仁怀市', '0', 405, 0, '2668', 1, 0, '', NULL, 0),
(2669, '西秀区', '0', 406, 0, '2669', 1, 0, '', NULL, 0),
(2670, '平坝县', '0', 406, 0, '2670', 1, 0, '', NULL, 0),
(2671, '普定县', '0', 406, 0, '2671', 1, 0, '', NULL, 0),
(2672, '镇宁布依族苗族自治县', '0', 406, 0, '2672', 1, 0, '', NULL, 0),
(2673, '关岭布依族苗族自治县', '0', 406, 0, '2673', 1, 0, '', NULL, 0),
(2674, '紫云苗族布依族自治县', '0', 406, 0, '2674', 1, 0, '', NULL, 0),
(2675, '铜仁市', '0', 407, 0, '2675', 1, 0, '', NULL, 0),
(2676, '江口县', '0', 407, 0, '2676', 1, 0, '', NULL, 0),
(2677, '玉屏侗族自治县', '0', 407, 0, '2677', 1, 0, '', NULL, 0),
(2678, '石阡县', '0', 407, 0, '2678', 1, 0, '', NULL, 0),
(2679, '思南县', '0', 407, 0, '2679', 1, 0, '', NULL, 0),
(2680, '印江土家族苗族自治县', '0', 407, 0, '2680', 1, 0, '', NULL, 0),
(2681, '德江县', '0', 407, 0, '2681', 1, 0, '', NULL, 0),
(2682, '沿河土家族自治县', '0', 407, 0, '2682', 1, 0, '', NULL, 0),
(2683, '松桃苗族自治县', '0', 407, 0, '2683', 1, 0, '', NULL, 0),
(2684, '万山特区', '0', 407, 0, '2684', 1, 0, '', NULL, 0),
(2685, '兴义市', '0', 408, 0, '2685', 1, 0, '', NULL, 0),
(2686, '兴仁县', '0', 408, 0, '2686', 1, 0, '', NULL, 0),
(2687, '普安县', '0', 408, 0, '2687', 1, 0, '', NULL, 0),
(2688, '晴隆县', '0', 408, 0, '2688', 1, 0, '', NULL, 0),
(2689, '贞丰县', '0', 408, 0, '2689', 1, 0, '', NULL, 0),
(2690, '望谟县', '0', 408, 0, '2690', 1, 0, '', NULL, 0),
(2691, '册亨县', '0', 408, 0, '2691', 1, 0, '', NULL, 0),
(2692, '安龙县', '0', 408, 0, '2692', 1, 0, '', NULL, 0),
(2693, '毕节市', '0', 409, 0, '2693', 1, 0, '', NULL, 0),
(2694, '大方县', '0', 409, 0, '2694', 1, 0, '', NULL, 0),
(2695, '黔西县', '0', 409, 0, '2695', 1, 0, '', NULL, 0),
(2696, '金沙县', '0', 409, 0, '2696', 1, 0, '', NULL, 0),
(2697, '织金县', '0', 409, 0, '2697', 1, 0, '', NULL, 0),
(2698, '纳雍县', '0', 409, 0, '2698', 1, 0, '', NULL, 0),
(2699, '威宁彝族回族苗族自治县', '0', 409, 0, '2699', 1, 0, '', NULL, 0),
(2700, '赫章县', '0', 409, 0, '2700', 1, 0, '', NULL, 0),
(2701, '凯里市', '0', 410, 0, '2701', 1, 0, '', NULL, 0),
(2702, '黄平县', '0', 410, 0, '2702', 1, 0, '', NULL, 0),
(2703, '施秉县', '0', 410, 0, '2703', 1, 0, '', NULL, 0),
(2704, '三穗县', '0', 410, 0, '2704', 1, 0, '', NULL, 0),
(2705, '镇远县', '0', 410, 0, '2705', 1, 0, '', NULL, 0),
(2706, '岑巩县', '0', 410, 0, '2706', 1, 0, '', NULL, 0),
(2707, '天柱县', '0', 410, 0, '2707', 1, 0, '', NULL, 0),
(2708, '锦屏县', '0', 410, 0, '2708', 1, 0, '', NULL, 0),
(2709, '剑河县', '0', 410, 0, '2709', 1, 0, '', NULL, 0),
(2710, '台江县', '0', 410, 0, '2710', 1, 0, '', NULL, 0),
(2711, '黎平县', '0', 410, 0, '2711', 1, 0, '', NULL, 0),
(2712, '榕江县', '0', 410, 0, '2712', 1, 0, '', NULL, 0),
(2713, '从江县', '0', 410, 0, '2713', 1, 0, '', NULL, 0),
(2714, '雷山县', '0', 410, 0, '2714', 1, 0, '', NULL, 0),
(2715, '麻江县', '0', 410, 0, '2715', 1, 0, '', NULL, 0),
(2716, '丹寨县', '0', 410, 0, '2716', 1, 0, '', NULL, 0),
(2717, '都匀市', '0', 411, 0, '2717', 1, 0, '', NULL, 0),
(2718, '福泉市', '0', 411, 0, '2718', 1, 0, '', NULL, 0),
(2719, '荔波县', '0', 411, 0, '2719', 1, 0, '', NULL, 0),
(2720, '贵定县', '0', 411, 0, '2720', 1, 0, '', NULL, 0),
(2721, '瓮安县', '0', 411, 0, '2721', 1, 0, '', NULL, 0),
(2722, '独山县', '0', 411, 0, '2722', 1, 0, '', NULL, 0),
(2723, '平塘县', '0', 411, 0, '2723', 1, 0, '', NULL, 0),
(2724, '罗甸县', '0', 411, 0, '2724', 1, 0, '', NULL, 0),
(2725, '长顺县', '0', 411, 0, '2725', 1, 0, '', NULL, 0),
(2726, '龙里县', '0', 411, 0, '2726', 1, 0, '', NULL, 0),
(2727, '惠水县', '0', 411, 0, '2727', 1, 0, '', NULL, 0),
(2728, '三都水族自治县', '0', 411, 0, '2728', 1, 0, '', NULL, 0),
(2729, '五华区', '0', 412, 0, '2729', 1, 0, '', NULL, 0),
(2730, '盘龙区', '0', 412, 0, '2730', 1, 0, '', NULL, 0),
(2731, '官渡区', '0', 412, 0, '2731', 1, 0, '', NULL, 0),
(2732, '西山区', '0', 412, 0, '2732', 1, 0, '', NULL, 0),
(2733, '东川区', '0', 412, 0, '2733', 1, 0, '', NULL, 0),
(2734, '呈贡县', '0', 412, 0, '2734', 1, 0, '', NULL, 0),
(2735, '晋宁县', '0', 412, 0, '2735', 1, 0, '', NULL, 0),
(2736, '富民县', '0', 412, 0, '2736', 1, 0, '', NULL, 0),
(2737, '宜良县', '0', 412, 0, '2737', 1, 0, '', NULL, 0),
(2738, '石林彝族自治县', '0', 412, 0, '2738', 1, 0, '', NULL, 0),
(2739, '嵩明县', '0', 412, 0, '2739', 1, 0, '', NULL, 0),
(2740, '禄劝彝族苗族自治县', '0', 412, 0, '2740', 1, 0, '', NULL, 0),
(2741, '寻甸回族彝族自治县', '0', 412, 0, '2741', 1, 0, '', NULL, 0),
(2742, '安宁市', '0', 412, 0, '2742', 1, 0, '', NULL, 0),
(2743, '麒麟区', '0', 413, 0, '2743', 1, 0, '', NULL, 0),
(2744, '马龙县', '0', 413, 0, '2744', 1, 0, '', NULL, 0),
(2745, '陆良县', '0', 413, 0, '2745', 1, 0, '', NULL, 0),
(2746, '师宗县', '0', 413, 0, '2746', 1, 0, '', NULL, 0),
(2747, '罗平县', '0', 413, 0, '2747', 1, 0, '', NULL, 0),
(2748, '富源县', '0', 413, 0, '2748', 1, 0, '', NULL, 0),
(2749, '会泽县', '0', 413, 0, '2749', 1, 0, '', NULL, 0),
(2750, '沾益县', '0', 413, 0, '2750', 1, 0, '', NULL, 0),
(2751, '宣威市', '0', 413, 0, '2751', 1, 0, '', NULL, 0),
(2752, '红塔区', '0', 414, 0, '2752', 1, 0, '', NULL, 0),
(2753, '江川县', '0', 414, 0, '2753', 1, 0, '', NULL, 0),
(2754, '澄江县', '0', 414, 0, '2754', 1, 0, '', NULL, 0),
(2755, '通海县', '0', 414, 0, '2755', 1, 0, '', NULL, 0),
(2756, '华宁县', '0', 414, 0, '2756', 1, 0, '', NULL, 0),
(2757, '易门县', '0', 414, 0, '2757', 1, 0, '', NULL, 0),
(2758, '峨山彝族自治县', '0', 414, 0, '2758', 1, 0, '', NULL, 0),
(2759, '新平彝族傣族自治县', '0', 414, 0, '2759', 1, 0, '', NULL, 0),
(2760, '元江哈尼族彝族傣族自治县', '0', 414, 0, '2760', 1, 0, '', NULL, 0),
(2761, '隆阳区', '0', 415, 0, '2761', 1, 0, '', NULL, 0),
(2762, '施甸县', '0', 415, 0, '2762', 1, 0, '', NULL, 0),
(2763, '腾冲县', '0', 415, 0, '2763', 1, 0, '', NULL, 0),
(2764, '龙陵县', '0', 415, 0, '2764', 1, 0, '', NULL, 0),
(2765, '昌宁县', '0', 415, 0, '2765', 1, 0, '', NULL, 0),
(2766, '昭阳区', '0', 416, 0, '2766', 1, 0, '', NULL, 0),
(2767, '鲁甸县', '0', 416, 0, '2767', 1, 0, '', NULL, 0),
(2768, '巧家县', '0', 416, 0, '2768', 1, 0, '', NULL, 0),
(2769, '盐津县', '0', 416, 0, '2769', 1, 0, '', NULL, 0),
(2770, '大关县', '0', 416, 0, '2770', 1, 0, '', NULL, 0),
(2771, '永善县', '0', 416, 0, '2771', 1, 0, '', NULL, 0),
(2772, '绥江县', '0', 416, 0, '2772', 1, 0, '', NULL, 0),
(2773, '镇雄县', '0', 416, 0, '2773', 1, 0, '', NULL, 0),
(2774, '彝良县', '0', 416, 0, '2774', 1, 0, '', NULL, 0),
(2775, '威信县', '0', 416, 0, '2775', 1, 0, '', NULL, 0),
(2776, '水富县', '0', 416, 0, '2776', 1, 0, '', NULL, 0),
(2777, '古城区', '0', 417, 0, '2777', 1, 0, '', NULL, 0),
(2778, '玉龙纳西族自治县', '0', 417, 0, '2778', 1, 0, '', NULL, 0),
(2779, '永胜县', '0', 417, 0, '2779', 1, 0, '', NULL, 0),
(2780, '华坪县', '0', 417, 0, '2780', 1, 0, '', NULL, 0),
(2781, '宁蒗彝族自治县', '0', 417, 0, '2781', 1, 0, '', NULL, 0),
(2782, '翠云区', '0', 418, 0, '2782', 1, 0, '', NULL, 0),
(2783, '普洱哈尼族彝族自治县', '0', 418, 0, '2783', 1, 0, '', NULL, 0),
(2784, '墨江哈尼族自治县', '0', 418, 0, '2784', 1, 0, '', NULL, 0),
(2785, '景东彝族自治县', '0', 418, 0, '2785', 1, 0, '', NULL, 0),
(2786, '景谷傣族彝族自治县', '0', 418, 0, '2786', 1, 0, '', NULL, 0),
(2787, '镇沅彝族哈尼族拉祜族自治县', '0', 418, 0, '2787', 1, 0, '', NULL, 0),
(2788, '江城哈尼族彝族自治县', '0', 418, 0, '2788', 1, 0, '', NULL, 0),
(2789, '孟连傣族拉祜族佤族自治县', '0', 418, 0, '2789', 1, 0, '', NULL, 0),
(2790, '澜沧拉祜族自治县', '0', 418, 0, '2790', 1, 0, '', NULL, 0),
(2791, '西盟佤族自治县', '0', 418, 0, '2791', 1, 0, '', NULL, 0),
(2792, '临翔区', '0', 419, 0, '2792', 1, 0, '', NULL, 0),
(2793, '凤庆县', '0', 419, 0, '2793', 1, 0, '', NULL, 0),
(2794, '云县', '0', 419, 0, '2794', 1, 0, '', NULL, 0),
(2795, '永德县', '0', 419, 0, '2795', 1, 0, '', NULL, 0),
(2796, '镇康县', '0', 419, 0, '2796', 1, 0, '', NULL, 0),
(2797, '双江拉祜族佤族布朗族傣族自治县', '0', 419, 0, '2797', 1, 0, '', NULL, 0),
(2798, '耿马傣族佤族自治县', '0', 419, 0, '2798', 1, 0, '', NULL, 0),
(2799, '沧源佤族自治县', '0', 420, 0, '2799', 1, 0, '', NULL, 0),
(2800, '楚雄市', '0', 420, 0, '2800', 1, 0, '', NULL, 0),
(2801, '双柏县', '0', 420, 0, '2801', 1, 0, '', NULL, 0),
(2802, '牟定县', '0', 420, 0, '2802', 1, 0, '', NULL, 0),
(2803, '南华县', '0', 420, 0, '2803', 1, 0, '', NULL, 0),
(2804, '姚安县', '0', 420, 0, '2804', 1, 0, '', NULL, 0),
(2805, '大姚县', '0', 420, 0, '2805', 1, 0, '', NULL, 0),
(2806, '永仁县', '0', 420, 0, '2806', 1, 0, '', NULL, 0),
(2807, '元谋县', '0', 420, 0, '2807', 1, 0, '', NULL, 0),
(2808, '武定县', '0', 420, 0, '2808', 1, 0, '', NULL, 0),
(2809, '禄丰县', '0', 420, 0, '2809', 1, 0, '', NULL, 0),
(2810, '个旧市', '0', 421, 0, '2810', 1, 0, '', NULL, 0),
(2811, '开远市', '0', 421, 0, '2811', 1, 0, '', NULL, 0),
(2812, '蒙自县', '0', 421, 0, '2812', 1, 0, '', NULL, 0),
(2813, '屏边苗族自治县', '0', 421, 0, '2813', 1, 0, '', NULL, 0),
(2814, '建水县', '0', 421, 0, '2814', 1, 0, '', NULL, 0),
(2815, '石屏县', '0', 421, 0, '2815', 1, 0, '', NULL, 0),
(2816, '弥勒县', '0', 421, 0, '2816', 1, 0, '', NULL, 0),
(2817, '泸西县', '0', 421, 0, '2817', 1, 0, '', NULL, 0),
(2818, '元阳县', '0', 421, 0, '2818', 1, 0, '', NULL, 0),
(2819, '红河县', '0', 421, 0, '2819', 1, 0, '', NULL, 0),
(2820, '金平苗族瑶族傣族自治县', '0', 421, 0, '2820', 1, 0, '', NULL, 0),
(2821, '绿春县', '0', 421, 0, '2821', 1, 0, '', NULL, 0),
(2822, '河口瑶族自治县', '0', 421, 0, '2822', 1, 0, '', NULL, 0),
(2823, '文山县', '0', 422, 0, '2823', 1, 0, '', NULL, 0),
(2824, '砚山县', '0', 422, 0, '2824', 1, 0, '', NULL, 0),
(2825, '西畴县', '0', 422, 0, '2825', 1, 0, '', NULL, 0),
(2826, '麻栗坡县', '0', 422, 0, '2826', 1, 0, '', NULL, 0),
(2827, '马关县', '0', 422, 0, '2827', 1, 0, '', NULL, 0),
(2828, '丘北县', '0', 422, 0, '2828', 1, 0, '', NULL, 0),
(2829, '广南县', '0', 422, 0, '2829', 1, 0, '', NULL, 0),
(2830, '富宁县', '0', 422, 0, '2830', 1, 0, '', NULL, 0),
(2831, '景洪市', '0', 423, 0, '2831', 1, 0, '', NULL, 0),
(2832, '勐海县', '0', 423, 0, '2832', 1, 0, '', NULL, 0),
(2833, '勐腊县', '0', 423, 0, '2833', 1, 0, '', NULL, 0),
(2834, '大理市', '0', 424, 0, '2834', 1, 0, '', NULL, 0),
(2835, '漾濞彝族自治县', '0', 424, 0, '2835', 1, 0, '', NULL, 0),
(2836, '祥云县', '0', 424, 0, '2836', 1, 0, '', NULL, 0),
(2837, '宾川县', '0', 424, 0, '2837', 1, 0, '', NULL, 0),
(2838, '弥渡县', '0', 424, 0, '2838', 1, 0, '', NULL, 0),
(2839, '南涧彝族自治县', '0', 424, 0, '2839', 1, 0, '', NULL, 0),
(2840, '巍山彝族回族自治县', '0', 424, 0, '2840', 1, 0, '', NULL, 0),
(2841, '永平县', '0', 424, 0, '2841', 1, 0, '', NULL, 0),
(2842, '云龙县', '0', 424, 0, '2842', 1, 0, '', NULL, 0),
(2843, '洱源县', '0', 424, 0, '2843', 1, 0, '', NULL, 0),
(2844, '剑川县', '0', 424, 0, '2844', 1, 0, '', NULL, 0),
(2845, '鹤庆县', '0', 424, 0, '2845', 1, 0, '', NULL, 0),
(2846, '瑞丽市', '0', 425, 0, '2846', 1, 0, '', NULL, 0),
(2847, '潞西市', '0', 425, 0, '2847', 1, 0, '', NULL, 0),
(2848, '梁河县', '0', 425, 0, '2848', 1, 0, '', NULL, 0),
(2849, '盈江县', '0', 425, 0, '2849', 1, 0, '', NULL, 0),
(2850, '陇川县', '0', 425, 0, '2850', 1, 0, '', NULL, 0),
(2851, '泸水县', '0', 426, 0, '2851', 1, 0, '', NULL, 0),
(2852, '福贡县', '0', 426, 0, '2852', 1, 0, '', NULL, 0),
(2853, '贡山独龙族怒族自治县', '0', 426, 0, '2853', 1, 0, '', NULL, 0),
(2854, '兰坪白族普米族自治县', '0', 426, 0, '2854', 1, 0, '', NULL, 0),
(2855, '香格里拉县', '0', 427, 0, '2855', 1, 0, '', NULL, 0),
(2856, '德钦县', '0', 427, 0, '2856', 1, 0, '', NULL, 0),
(2857, '维西傈僳族自治县', '0', 427, 0, '2857', 1, 0, '', NULL, 0),
(2858, '城关区', '0', 428, 0, '2858', 1, 0, '', NULL, 0),
(2859, '林周县', '0', 428, 0, '2859', 1, 0, '', NULL, 0),
(2860, '当雄县', '0', 428, 0, '2860', 1, 0, '', NULL, 0),
(2861, '尼木县', '0', 428, 0, '2861', 1, 0, '', NULL, 0),
(2862, '曲水县', '0', 428, 0, '2862', 1, 0, '', NULL, 0),
(2863, '堆龙德庆县', '0', 428, 0, '2863', 1, 0, '', NULL, 0),
(2864, '达孜县', '0', 428, 0, '2864', 1, 0, '', NULL, 0),
(2865, '墨竹工卡县', '0', 428, 0, '2865', 1, 0, '', NULL, 0),
(2866, '昌都县', '0', 429, 0, '2866', 1, 0, '', NULL, 0),
(2867, '江达县', '0', 429, 0, '2867', 1, 0, '', NULL, 0),
(2868, '贡觉县', '0', 429, 0, '2868', 1, 0, '', NULL, 0),
(2869, '类乌齐县', '0', 429, 0, '2869', 1, 0, '', NULL, 0),
(2870, '丁青县', '0', 429, 0, '2870', 1, 0, '', NULL, 0),
(2871, '察雅县', '0', 429, 0, '2871', 1, 0, '', NULL, 0),
(2872, '八宿县', '0', 429, 0, '2872', 1, 0, '', NULL, 0),
(2873, '左贡县', '0', 429, 0, '2873', 1, 0, '', NULL, 0),
(2874, '芒康县', '0', 429, 0, '2874', 1, 0, '', NULL, 0),
(2875, '洛隆县', '0', 429, 0, '2875', 1, 0, '', NULL, 0),
(2876, '边坝县', '0', 429, 0, '2876', 1, 0, '', NULL, 0),
(2877, '乃东县', '0', 430, 0, '2877', 1, 0, '', NULL, 0),
(2878, '扎囊县', '0', 430, 0, '2878', 1, 0, '', NULL, 0),
(2879, '贡嘎县', '0', 430, 0, '2879', 1, 0, '', NULL, 0),
(2880, '桑日县', '0', 430, 0, '2880', 1, 0, '', NULL, 0),
(2881, '琼结县', '0', 430, 0, '2881', 1, 0, '', NULL, 0),
(2882, '曲松县', '0', 430, 0, '2882', 1, 0, '', NULL, 0),
(2883, '措美县', '0', 430, 0, '2883', 1, 0, '', NULL, 0),
(2884, '洛扎县', '0', 430, 0, '2884', 1, 0, '', NULL, 0),
(2885, '加查县', '0', 430, 0, '2885', 1, 0, '', NULL, 0),
(2886, '隆子县', '0', 430, 0, '2886', 1, 0, '', NULL, 0),
(2887, '错那县', '0', 430, 0, '2887', 1, 0, '', NULL, 0),
(2888, '浪卡子县', '0', 430, 0, '2888', 1, 0, '', NULL, 0),
(2889, '日喀则市', '0', 431, 0, '2889', 1, 0, '', NULL, 0),
(2890, '南木林县', '0', 431, 0, '2890', 1, 0, '', NULL, 0),
(2891, '江孜县', '0', 431, 0, '2891', 1, 0, '', NULL, 0),
(2892, '定日县', '0', 431, 0, '2892', 1, 0, '', NULL, 0),
(2893, '萨迦县', '0', 431, 0, '2893', 1, 0, '', NULL, 0),
(2894, '拉孜县', '0', 431, 0, '2894', 1, 0, '', NULL, 0),
(2895, '昂仁县', '0', 431, 0, '2895', 1, 0, '', NULL, 0),
(2896, '谢通门县', '0', 431, 0, '2896', 1, 0, '', NULL, 0),
(2897, '白朗县', '0', 431, 0, '2897', 1, 0, '', NULL, 0),
(2898, '仁布县', '0', 431, 0, '2898', 1, 0, '', NULL, 0),
(2899, '康马县', '0', 431, 0, '2899', 1, 0, '', NULL, 0),
(2900, '定结县', '0', 431, 0, '2900', 1, 0, '', NULL, 0),
(2901, '仲巴县', '0', 431, 0, '2901', 1, 0, '', NULL, 0),
(2902, '亚东县', '0', 431, 0, '2902', 1, 0, '', NULL, 0),
(2903, '吉隆县', '0', 431, 0, '2903', 1, 0, '', NULL, 0),
(2904, '聂拉木县', '0', 431, 0, '2904', 1, 0, '', NULL, 0),
(2905, '萨嘎县', '0', 431, 0, '2905', 1, 0, '', NULL, 0),
(2906, '岗巴县', '0', 431, 0, '2906', 1, 0, '', NULL, 0),
(2907, '那曲县', '0', 432, 0, '2907', 1, 0, '', NULL, 0),
(2908, '嘉黎县', '0', 432, 0, '2908', 1, 0, '', NULL, 0);
INSERT DELAYED IGNORE INTO `cban_linkage` (`linkageid`, `name`, `style`, `parentid`, `child`, `arrchildid`, `keyid`, `listorder`, `description`, `setting`, `siteid`) VALUES 
(2909, '比如县', '0', 432, 0, '2909', 1, 0, '', NULL, 0),
(2910, '聂荣县', '0', 432, 0, '2910', 1, 0, '', NULL, 0),
(2911, '安多县', '0', 432, 0, '2911', 1, 0, '', NULL, 0),
(2912, '申扎县', '0', 432, 0, '2912', 1, 0, '', NULL, 0),
(2913, '索县', '0', 432, 0, '2913', 1, 0, '', NULL, 0),
(2914, '班戈县', '0', 432, 0, '2914', 1, 0, '', NULL, 0),
(2915, '巴青县', '0', 432, 0, '2915', 1, 0, '', NULL, 0),
(2916, '尼玛县', '0', 432, 0, '2916', 1, 0, '', NULL, 0),
(2917, '普兰县', '0', 433, 0, '2917', 1, 0, '', NULL, 0),
(2918, '札达县', '0', 433, 0, '2918', 1, 0, '', NULL, 0),
(2919, '噶尔县', '0', 433, 0, '2919', 1, 0, '', NULL, 0),
(2920, '日土县', '0', 433, 0, '2920', 1, 0, '', NULL, 0),
(2921, '革吉县', '0', 433, 0, '2921', 1, 0, '', NULL, 0),
(2922, '改则县', '0', 433, 0, '2922', 1, 0, '', NULL, 0),
(2923, '措勤县', '0', 433, 0, '2923', 1, 0, '', NULL, 0),
(2924, '林芝县', '0', 434, 0, '2924', 1, 0, '', NULL, 0),
(2925, '工布江达县', '0', 434, 0, '2925', 1, 0, '', NULL, 0),
(2926, '米林县', '0', 434, 0, '2926', 1, 0, '', NULL, 0),
(2927, '墨脱县', '0', 434, 0, '2927', 1, 0, '', NULL, 0),
(2928, '波密县', '0', 434, 0, '2928', 1, 0, '', NULL, 0),
(2929, '察隅县', '0', 434, 0, '2929', 1, 0, '', NULL, 0),
(2930, '朗县', '0', 434, 0, '2930', 1, 0, '', NULL, 0),
(2931, '新城区', '0', 435, 0, '2931', 1, 0, '', NULL, 0),
(2932, '碑林区', '0', 435, 0, '2932', 1, 0, '', NULL, 0),
(2933, '莲湖区', '0', 435, 0, '2933', 1, 0, '', NULL, 0),
(2934, '灞桥区', '0', 435, 0, '2934', 1, 0, '', NULL, 0),
(2935, '未央区', '0', 435, 0, '2935', 1, 0, '', NULL, 0),
(2936, '雁塔区', '0', 435, 0, '2936', 1, 0, '', NULL, 0),
(2937, '阎良区', '0', 435, 0, '2937', 1, 0, '', NULL, 0),
(2938, '临潼区', '0', 435, 0, '2938', 1, 0, '', NULL, 0),
(2939, '长安区', '0', 435, 0, '2939', 1, 0, '', NULL, 0),
(2940, '蓝田县', '0', 435, 0, '2940', 1, 0, '', NULL, 0),
(2941, '周至县', '0', 435, 0, '2941', 1, 0, '', NULL, 0),
(2942, '户县', '0', 435, 0, '2942', 1, 0, '', NULL, 0),
(2943, '高陵县', '0', 435, 0, '2943', 1, 0, '', NULL, 0),
(2944, '王益区', '0', 436, 0, '2944', 1, 0, '', NULL, 0),
(2945, '印台区', '0', 436, 0, '2945', 1, 0, '', NULL, 0),
(2946, '耀州区', '0', 436, 0, '2946', 1, 0, '', NULL, 0),
(2947, '宜君县', '0', 436, 0, '2947', 1, 0, '', NULL, 0),
(2948, '渭滨区', '0', 437, 0, '2948', 1, 0, '', NULL, 0),
(2949, '金台区', '0', 437, 0, '2949', 1, 0, '', NULL, 0),
(2950, '陈仓区', '0', 437, 0, '2950', 1, 0, '', NULL, 0),
(2951, '凤翔县', '0', 437, 0, '2951', 1, 0, '', NULL, 0),
(2952, '岐山县', '0', 437, 0, '2952', 1, 0, '', NULL, 0),
(2953, '扶风县', '0', 437, 0, '2953', 1, 0, '', NULL, 0),
(2954, '眉县', '0', 437, 0, '2954', 1, 0, '', NULL, 0),
(2955, '陇县', '0', 437, 0, '2955', 1, 0, '', NULL, 0),
(2956, '千阳县', '0', 437, 0, '2956', 1, 0, '', NULL, 0),
(2957, '麟游县', '0', 437, 0, '2957', 1, 0, '', NULL, 0),
(2958, '凤县', '0', 437, 0, '2958', 1, 0, '', NULL, 0),
(2959, '太白县', '0', 437, 0, '2959', 1, 0, '', NULL, 0),
(2960, '秦都区', '0', 438, 0, '2960', 1, 0, '', NULL, 0),
(2961, '杨凌区', '0', 438, 0, '2961', 1, 0, '', NULL, 0),
(2962, '渭城区', '0', 438, 0, '2962', 1, 0, '', NULL, 0),
(2963, '三原县', '0', 438, 0, '2963', 1, 0, '', NULL, 0),
(2964, '泾阳县', '0', 438, 0, '2964', 1, 0, '', NULL, 0),
(2965, '乾县', '0', 438, 0, '2965', 1, 0, '', NULL, 0),
(2966, '礼泉县', '0', 438, 0, '2966', 1, 0, '', NULL, 0),
(2967, '永寿县', '0', 438, 0, '2967', 1, 0, '', NULL, 0),
(2968, '彬县', '0', 438, 0, '2968', 1, 0, '', NULL, 0),
(2969, '长武县', '0', 438, 0, '2969', 1, 0, '', NULL, 0),
(2970, '旬邑县', '0', 438, 0, '2970', 1, 0, '', NULL, 0),
(2971, '淳化县', '0', 438, 0, '2971', 1, 0, '', NULL, 0),
(2972, '武功县', '0', 438, 0, '2972', 1, 0, '', NULL, 0),
(2973, '兴平市', '0', 438, 0, '2973', 1, 0, '', NULL, 0),
(2974, '临渭区', '0', 439, 0, '2974', 1, 0, '', NULL, 0),
(2975, '华县', '0', 439, 0, '2975', 1, 0, '', NULL, 0),
(2976, '潼关县', '0', 439, 0, '2976', 1, 0, '', NULL, 0),
(2977, '大荔县', '0', 439, 0, '2977', 1, 0, '', NULL, 0),
(2978, '合阳县', '0', 439, 0, '2978', 1, 0, '', NULL, 0),
(2979, '澄城县', '0', 439, 0, '2979', 1, 0, '', NULL, 0),
(2980, '蒲城县', '0', 439, 0, '2980', 1, 0, '', NULL, 0),
(2981, '白水县', '0', 439, 0, '2981', 1, 0, '', NULL, 0),
(2982, '富平县', '0', 439, 0, '2982', 1, 0, '', NULL, 0),
(2983, '韩城市', '0', 439, 0, '2983', 1, 0, '', NULL, 0),
(2984, '华阴市', '0', 439, 0, '2984', 1, 0, '', NULL, 0),
(2985, '宝塔区', '0', 440, 0, '2985', 1, 0, '', NULL, 0),
(2986, '延长县', '0', 440, 0, '2986', 1, 0, '', NULL, 0),
(2987, '延川县', '0', 440, 0, '2987', 1, 0, '', NULL, 0),
(2988, '子长县', '0', 440, 0, '2988', 1, 0, '', NULL, 0),
(2989, '安塞县', '0', 440, 0, '2989', 1, 0, '', NULL, 0),
(2990, '志丹县', '0', 440, 0, '2990', 1, 0, '', NULL, 0),
(2991, '吴起县', '0', 440, 0, '2991', 1, 0, '', NULL, 0),
(2992, '甘泉县', '0', 440, 0, '2992', 1, 0, '', NULL, 0),
(2993, '富县', '0', 440, 0, '2993', 1, 0, '', NULL, 0),
(2994, '洛川县', '0', 440, 0, '2994', 1, 0, '', NULL, 0),
(2995, '宜川县', '0', 440, 0, '2995', 1, 0, '', NULL, 0),
(2996, '黄龙县', '0', 440, 0, '2996', 1, 0, '', NULL, 0),
(2997, '黄陵县', '0', 440, 0, '2997', 1, 0, '', NULL, 0),
(2998, '汉台区', '0', 441, 0, '2998', 1, 0, '', NULL, 0),
(2999, '南郑县', '0', 441, 0, '2999', 1, 0, '', NULL, 0),
(3000, '城固县', '0', 441, 0, '3000', 1, 0, '', NULL, 0),
(3001, '洋县', '0', 441, 0, '3001', 1, 0, '', NULL, 0),
(3002, '西乡县', '0', 441, 0, '3002', 1, 0, '', NULL, 0),
(3003, '勉县', '0', 441, 0, '3003', 1, 0, '', NULL, 0),
(3004, '宁强县', '0', 441, 0, '3004', 1, 0, '', NULL, 0),
(3005, '略阳县', '0', 441, 0, '3005', 1, 0, '', NULL, 0),
(3006, '镇巴县', '0', 441, 0, '3006', 1, 0, '', NULL, 0),
(3007, '留坝县', '0', 441, 0, '3007', 1, 0, '', NULL, 0),
(3008, '佛坪县', '0', 441, 0, '3008', 1, 0, '', NULL, 0),
(3009, '榆阳区', '0', 442, 0, '3009', 1, 0, '', NULL, 0),
(3010, '神木县', '0', 442, 0, '3010', 1, 0, '', NULL, 0),
(3011, '府谷县', '0', 442, 0, '3011', 1, 0, '', NULL, 0),
(3012, '横山县', '0', 442, 0, '3012', 1, 0, '', NULL, 0),
(3013, '靖边县', '0', 442, 0, '3013', 1, 0, '', NULL, 0),
(3014, '定边县', '0', 442, 0, '3014', 1, 0, '', NULL, 0),
(3015, '绥德县', '0', 442, 0, '3015', 1, 0, '', NULL, 0),
(3016, '米脂县', '0', 442, 0, '3016', 1, 0, '', NULL, 0),
(3017, '佳县', '0', 442, 0, '3017', 1, 0, '', NULL, 0),
(3018, '吴堡县', '0', 442, 0, '3018', 1, 0, '', NULL, 0),
(3019, '清涧县', '0', 442, 0, '3019', 1, 0, '', NULL, 0),
(3020, '子洲县', '0', 442, 0, '3020', 1, 0, '', NULL, 0),
(3021, '汉滨区', '0', 443, 0, '3021', 1, 0, '', NULL, 0),
(3022, '汉阴县', '0', 443, 0, '3022', 1, 0, '', NULL, 0),
(3023, '石泉县', '0', 443, 0, '3023', 1, 0, '', NULL, 0),
(3024, '宁陕县', '0', 443, 0, '3024', 1, 0, '', NULL, 0),
(3025, '紫阳县', '0', 443, 0, '3025', 1, 0, '', NULL, 0),
(3026, '岚皋县', '0', 443, 0, '3026', 1, 0, '', NULL, 0),
(3027, '平利县', '0', 443, 0, '3027', 1, 0, '', NULL, 0),
(3028, '镇坪县', '0', 443, 0, '3028', 1, 0, '', NULL, 0),
(3029, '旬阳县', '0', 443, 0, '3029', 1, 0, '', NULL, 0),
(3030, '白河县', '0', 443, 0, '3030', 1, 0, '', NULL, 0),
(3031, '商州区', '0', 444, 0, '3031', 1, 0, '', NULL, 0),
(3032, '洛南县', '0', 444, 0, '3032', 1, 0, '', NULL, 0),
(3033, '丹凤县', '0', 444, 0, '3033', 1, 0, '', NULL, 0),
(3034, '商南县', '0', 444, 0, '3034', 1, 0, '', NULL, 0),
(3035, '山阳县', '0', 444, 0, '3035', 1, 0, '', NULL, 0),
(3036, '镇安县', '0', 444, 0, '3036', 1, 0, '', NULL, 0),
(3037, '柞水县', '0', 444, 0, '3037', 1, 0, '', NULL, 0),
(3038, '城关区', '0', 445, 0, '3038', 1, 0, '', NULL, 0),
(3039, '七里河区', '0', 445, 0, '3039', 1, 0, '', NULL, 0),
(3040, '西固区', '0', 445, 0, '3040', 1, 0, '', NULL, 0),
(3041, '安宁区', '0', 445, 0, '3041', 1, 0, '', NULL, 0),
(3042, '红古区', '0', 445, 0, '3042', 1, 0, '', NULL, 0),
(3043, '永登县', '0', 445, 0, '3043', 1, 0, '', NULL, 0),
(3044, '皋兰县', '0', 445, 0, '3044', 1, 0, '', NULL, 0),
(3045, '榆中县', '0', 445, 0, '3045', 1, 0, '', NULL, 0),
(3046, '金川区', '0', 447, 0, '3046', 1, 0, '', NULL, 0),
(3047, '永昌县', '0', 447, 0, '3047', 1, 0, '', NULL, 0),
(3048, '白银区', '0', 448, 0, '3048', 1, 0, '', NULL, 0),
(3049, '平川区', '0', 448, 0, '3049', 1, 0, '', NULL, 0),
(3050, '靖远县', '0', 448, 0, '3050', 1, 0, '', NULL, 0),
(3051, '会宁县', '0', 448, 0, '3051', 1, 0, '', NULL, 0),
(3052, '景泰县', '0', 448, 0, '3052', 1, 0, '', NULL, 0),
(3053, '秦城区', '0', 449, 0, '3053', 1, 0, '', NULL, 0),
(3054, '北道区', '0', 449, 0, '3054', 1, 0, '', NULL, 0),
(3055, '清水县', '0', 449, 0, '3055', 1, 0, '', NULL, 0),
(3056, '秦安县', '0', 449, 0, '3056', 1, 0, '', NULL, 0),
(3057, '甘谷县', '0', 449, 0, '3057', 1, 0, '', NULL, 0),
(3058, '武山县', '0', 449, 0, '3058', 1, 0, '', NULL, 0),
(3059, '张家川回族自治县', '0', 449, 0, '3059', 1, 0, '', NULL, 0),
(3060, '凉州区', '0', 450, 0, '3060', 1, 0, '', NULL, 0),
(3061, '民勤县', '0', 450, 0, '3061', 1, 0, '', NULL, 0),
(3062, '古浪县', '0', 450, 0, '3062', 1, 0, '', NULL, 0),
(3063, '天祝藏族自治县', '0', 450, 0, '3063', 1, 0, '', NULL, 0),
(3064, '甘州区', '0', 451, 0, '3064', 1, 0, '', NULL, 0),
(3065, '肃南裕固族自治县', '0', 451, 0, '3065', 1, 0, '', NULL, 0),
(3066, '民乐县', '0', 451, 0, '3066', 1, 0, '', NULL, 0),
(3067, '临泽县', '0', 451, 0, '3067', 1, 0, '', NULL, 0),
(3068, '高台县', '0', 451, 0, '3068', 1, 0, '', NULL, 0),
(3069, '山丹县', '0', 451, 0, '3069', 1, 0, '', NULL, 0),
(3070, '崆峒区', '0', 452, 0, '3070', 1, 0, '', NULL, 0),
(3071, '泾川县', '0', 452, 0, '3071', 1, 0, '', NULL, 0),
(3072, '灵台县', '0', 452, 0, '3072', 1, 0, '', NULL, 0),
(3073, '崇信县', '0', 452, 0, '3073', 1, 0, '', NULL, 0),
(3074, '华亭县', '0', 452, 0, '3074', 1, 0, '', NULL, 0),
(3075, '庄浪县', '0', 452, 0, '3075', 1, 0, '', NULL, 0),
(3076, '静宁县', '0', 452, 0, '3076', 1, 0, '', NULL, 0),
(3077, '肃州区', '0', 453, 0, '3077', 1, 0, '', NULL, 0),
(3078, '金塔县', '0', 453, 0, '3078', 1, 0, '', NULL, 0),
(3079, '瓜州县', '0', 453, 0, '3079', 1, 0, '', NULL, 0),
(3080, '肃北蒙古族自治县', '0', 453, 0, '3080', 1, 0, '', NULL, 0),
(3081, '阿克塞哈萨克族自治县', '0', 453, 0, '3081', 1, 0, '', NULL, 0),
(3082, '玉门市', '0', 453, 0, '3082', 1, 0, '', NULL, 0),
(3083, '敦煌市', '0', 453, 0, '3083', 1, 0, '', NULL, 0),
(3084, '西峰区', '0', 454, 0, '3084', 1, 0, '', NULL, 0),
(3085, '庆城县', '0', 454, 0, '3085', 1, 0, '', NULL, 0),
(3086, '环县', '0', 454, 0, '3086', 1, 0, '', NULL, 0),
(3087, '华池县', '0', 454, 0, '3087', 1, 0, '', NULL, 0),
(3088, '合水县', '0', 454, 0, '3088', 1, 0, '', NULL, 0),
(3089, '正宁县', '0', 454, 0, '3089', 1, 0, '', NULL, 0),
(3090, '宁县', '0', 454, 0, '3090', 1, 0, '', NULL, 0),
(3091, '镇原县', '0', 454, 0, '3091', 1, 0, '', NULL, 0),
(3092, '安定区', '0', 455, 0, '3092', 1, 0, '', NULL, 0),
(3093, '通渭县', '0', 455, 0, '3093', 1, 0, '', NULL, 0),
(3094, '陇西县', '0', 455, 0, '3094', 1, 0, '', NULL, 0),
(3095, '渭源县', '0', 455, 0, '3095', 1, 0, '', NULL, 0),
(3096, '临洮县', '0', 455, 0, '3096', 1, 0, '', NULL, 0),
(3097, '漳县', '0', 455, 0, '3097', 1, 0, '', NULL, 0),
(3098, '岷县', '0', 455, 0, '3098', 1, 0, '', NULL, 0),
(3099, '武都区', '0', 456, 0, '3099', 1, 0, '', NULL, 0),
(3100, '成县', '0', 456, 0, '3100', 1, 0, '', NULL, 0),
(3101, '文县', '0', 456, 0, '3101', 1, 0, '', NULL, 0),
(3102, '宕昌县', '0', 456, 0, '3102', 1, 0, '', NULL, 0),
(3103, '康县', '0', 456, 0, '3103', 1, 0, '', NULL, 0),
(3104, '西和县', '0', 456, 0, '3104', 1, 0, '', NULL, 0),
(3105, '礼县', '0', 456, 0, '3105', 1, 0, '', NULL, 0),
(3106, '徽县', '0', 456, 0, '3106', 1, 0, '', NULL, 0),
(3107, '两当县', '0', 456, 0, '3107', 1, 0, '', NULL, 0),
(3108, '临夏市', '0', 457, 0, '3108', 1, 0, '', NULL, 0),
(3109, '临夏县', '0', 457, 0, '3109', 1, 0, '', NULL, 0),
(3110, '康乐县', '0', 457, 0, '3110', 1, 0, '', NULL, 0),
(3111, '永靖县', '0', 457, 0, '3111', 1, 0, '', NULL, 0),
(3112, '广河县', '0', 457, 0, '3112', 1, 0, '', NULL, 0),
(3113, '和政县', '0', 457, 0, '3113', 1, 0, '', NULL, 0),
(3114, '东乡族自治县', '0', 457, 0, '3114', 1, 0, '', NULL, 0),
(3115, '积石山保安族东乡族撒拉族自治县', '0', 457, 0, '3115', 1, 0, '', NULL, 0),
(3116, '合作市', '0', 458, 0, '3116', 1, 0, '', NULL, 0),
(3117, '临潭县', '0', 458, 0, '3117', 1, 0, '', NULL, 0),
(3118, '卓尼县', '0', 458, 0, '3118', 1, 0, '', NULL, 0),
(3119, '舟曲县', '0', 458, 0, '3119', 1, 0, '', NULL, 0),
(3120, '迭部县', '0', 458, 0, '3120', 1, 0, '', NULL, 0),
(3121, '玛曲县', '0', 458, 0, '3121', 1, 0, '', NULL, 0),
(3122, '碌曲县', '0', 458, 0, '3122', 1, 0, '', NULL, 0),
(3123, '夏河县', '0', 458, 0, '3123', 1, 0, '', NULL, 0),
(3124, '城东区', '0', 459, 0, '3124', 1, 0, '', NULL, 0),
(3125, '城中区', '0', 459, 0, '3125', 1, 0, '', NULL, 0),
(3126, '城西区', '0', 459, 0, '3126', 1, 0, '', NULL, 0),
(3127, '城北区', '0', 459, 0, '3127', 1, 0, '', NULL, 0),
(3128, '大通回族土族自治县', '0', 459, 0, '3128', 1, 0, '', NULL, 0),
(3129, '湟中县', '0', 459, 0, '3129', 1, 0, '', NULL, 0),
(3130, '湟源县', '0', 459, 0, '3130', 1, 0, '', NULL, 0),
(3131, '平安县', '0', 460, 0, '3131', 1, 0, '', NULL, 0),
(3132, '民和回族土族自治县', '0', 460, 0, '3132', 1, 0, '', NULL, 0),
(3133, '乐都县', '0', 460, 0, '3133', 1, 0, '', NULL, 0),
(3134, '互助土族自治县', '0', 460, 0, '3134', 1, 0, '', NULL, 0),
(3135, '化隆回族自治县', '0', 460, 0, '3135', 1, 0, '', NULL, 0),
(3136, '循化撒拉族自治县', '0', 460, 0, '3136', 1, 0, '', NULL, 0),
(3137, '门源回族自治县', '0', 461, 0, '3137', 1, 0, '', NULL, 0),
(3138, '祁连县', '0', 461, 0, '3138', 1, 0, '', NULL, 0),
(3139, '海晏县', '0', 461, 0, '3139', 1, 0, '', NULL, 0),
(3140, '刚察县', '0', 461, 0, '3140', 1, 0, '', NULL, 0),
(3141, '同仁县', '0', 462, 0, '3141', 1, 0, '', NULL, 0),
(3142, '尖扎县', '0', 462, 0, '3142', 1, 0, '', NULL, 0),
(3143, '泽库县', '0', 462, 0, '3143', 1, 0, '', NULL, 0),
(3144, '河南蒙古族自治县', '0', 462, 0, '3144', 1, 0, '', NULL, 0),
(3145, '共和县', '0', 463, 0, '3145', 1, 0, '', NULL, 0),
(3146, '同德县', '0', 463, 0, '3146', 1, 0, '', NULL, 0),
(3147, '贵德县', '0', 463, 0, '3147', 1, 0, '', NULL, 0),
(3148, '兴海县', '0', 463, 0, '3148', 1, 0, '', NULL, 0),
(3149, '贵南县', '0', 463, 0, '3149', 1, 0, '', NULL, 0),
(3150, '玛沁县', '0', 464, 0, '3150', 1, 0, '', NULL, 0),
(3151, '班玛县', '0', 464, 0, '3151', 1, 0, '', NULL, 0),
(3152, '甘德县', '0', 464, 0, '3152', 1, 0, '', NULL, 0),
(3153, '达日县', '0', 464, 0, '3153', 1, 0, '', NULL, 0),
(3154, '久治县', '0', 464, 0, '3154', 1, 0, '', NULL, 0),
(3155, '玛多县', '0', 464, 0, '3155', 1, 0, '', NULL, 0),
(3156, '玉树县', '0', 465, 0, '3156', 1, 0, '', NULL, 0),
(3157, '杂多县', '0', 465, 0, '3157', 1, 0, '', NULL, 0),
(3158, '称多县', '0', 465, 0, '3158', 1, 0, '', NULL, 0),
(3159, '治多县', '0', 465, 0, '3159', 1, 0, '', NULL, 0),
(3160, '囊谦县', '0', 465, 0, '3160', 1, 0, '', NULL, 0),
(3161, '曲麻莱县', '0', 465, 0, '3161', 1, 0, '', NULL, 0),
(3162, '格尔木市', '0', 466, 0, '3162', 1, 0, '', NULL, 0),
(3163, '德令哈市', '0', 466, 0, '3163', 1, 0, '', NULL, 0),
(3164, '乌兰县', '0', 466, 0, '3164', 1, 0, '', NULL, 0),
(3165, '都兰县', '0', 466, 0, '3165', 1, 0, '', NULL, 0),
(3166, '天峻县', '0', 466, 0, '3166', 1, 0, '', NULL, 0),
(3167, '兴庆区', '0', 467, 0, '3167', 1, 0, '', NULL, 0),
(3168, '西夏区', '0', 467, 0, '3168', 1, 0, '', NULL, 0),
(3169, '金凤区', '0', 467, 0, '3169', 1, 0, '', NULL, 0),
(3170, '永宁县', '0', 467, 0, '3170', 1, 0, '', NULL, 0),
(3171, '贺兰县', '0', 467, 0, '3171', 1, 0, '', NULL, 0),
(3172, '灵武市', '0', 467, 0, '3172', 1, 0, '', NULL, 0),
(3173, '大武口区', '0', 468, 0, '3173', 1, 0, '', NULL, 0),
(3174, '惠农区', '0', 468, 0, '3174', 1, 0, '', NULL, 0),
(3175, '平罗县', '0', 468, 0, '3175', 1, 0, '', NULL, 0),
(3176, '利通区', '0', 469, 0, '3176', 1, 0, '', NULL, 0),
(3177, '盐池县', '0', 469, 0, '3177', 1, 0, '', NULL, 0),
(3178, '同心县', '0', 469, 0, '3178', 1, 0, '', NULL, 0),
(3179, '青铜峡市', '0', 469, 0, '3179', 1, 0, '', NULL, 0),
(3180, '原州区', '0', 470, 0, '3180', 1, 0, '', NULL, 0),
(3181, '西吉县', '0', 470, 0, '3181', 1, 0, '', NULL, 0),
(3182, '隆德县', '0', 470, 0, '3182', 1, 0, '', NULL, 0),
(3183, '泾源县', '0', 470, 0, '3183', 1, 0, '', NULL, 0),
(3184, '彭阳县', '0', 470, 0, '3184', 1, 0, '', NULL, 0),
(3185, '沙坡头区', '0', 471, 0, '3185', 1, 0, '', NULL, 0),
(3186, '中宁县', '0', 471, 0, '3186', 1, 0, '', NULL, 0),
(3187, '海原县', '0', 471, 0, '3187', 1, 0, '', NULL, 0),
(3188, '天山区', '0', 472, 0, '3188', 1, 0, '', NULL, 0),
(3189, '沙依巴克区', '0', 472, 0, '3189', 1, 0, '', NULL, 0),
(3190, '新市区', '0', 472, 0, '3190', 1, 0, '', NULL, 0),
(3191, '水磨沟区', '0', 472, 0, '3191', 1, 0, '', NULL, 0),
(3192, '头屯河区', '0', 472, 0, '3192', 1, 0, '', NULL, 0),
(3193, '达坂城区', '0', 472, 0, '3193', 1, 0, '', NULL, 0),
(3194, '东山区', '0', 472, 0, '3194', 1, 0, '', NULL, 0),
(3195, '乌鲁木齐县', '0', 472, 0, '3195', 1, 0, '', NULL, 0),
(3196, '独山子区', '0', 473, 0, '3196', 1, 0, '', NULL, 0),
(3197, '克拉玛依区', '0', 473, 0, '3197', 1, 0, '', NULL, 0),
(3198, '白碱滩区', '0', 473, 0, '3198', 1, 0, '', NULL, 0),
(3199, '乌尔禾区', '0', 473, 0, '3199', 1, 0, '', NULL, 0),
(3200, '吐鲁番市', '0', 474, 0, '3200', 1, 0, '', NULL, 0),
(3201, '鄯善县', '0', 474, 0, '3201', 1, 0, '', NULL, 0),
(3202, '托克逊县', '0', 474, 0, '3202', 1, 0, '', NULL, 0),
(3203, '哈密市', '0', 475, 0, '3203', 1, 0, '', NULL, 0),
(3204, '巴里坤哈萨克自治县', '0', 475, 0, '3204', 1, 0, '', NULL, 0),
(3205, '伊吾县', '0', 475, 0, '3205', 1, 0, '', NULL, 0),
(3206, '昌吉市', '0', 476, 0, '3206', 1, 0, '', NULL, 0),
(3207, '阜康市', '0', 476, 0, '3207', 1, 0, '', NULL, 0),
(3208, '米泉市', '0', 476, 0, '3208', 1, 0, '', NULL, 0),
(3209, '呼图壁县', '0', 476, 0, '3209', 1, 0, '', NULL, 0),
(3210, '玛纳斯县', '0', 476, 0, '3210', 1, 0, '', NULL, 0),
(3211, '奇台县', '0', 476, 0, '3211', 1, 0, '', NULL, 0),
(3212, '吉木萨尔县', '0', 476, 0, '3212', 1, 0, '', NULL, 0),
(3213, '木垒哈萨克自治县', '0', 476, 0, '3213', 1, 0, '', NULL, 0),
(3214, '博乐市', '0', 477, 0, '3214', 1, 0, '', NULL, 0),
(3215, '精河县', '0', 477, 0, '3215', 1, 0, '', NULL, 0),
(3216, '温泉县', '0', 477, 0, '3216', 1, 0, '', NULL, 0),
(3217, '库尔勒市', '0', 478, 0, '3217', 1, 0, '', NULL, 0),
(3218, '轮台县', '0', 478, 0, '3218', 1, 0, '', NULL, 0),
(3219, '尉犁县', '0', 478, 0, '3219', 1, 0, '', NULL, 0),
(3220, '若羌县', '0', 478, 0, '3220', 1, 0, '', NULL, 0),
(3221, '且末县', '0', 478, 0, '3221', 1, 0, '', NULL, 0),
(3222, '焉耆回族自治县', '0', 478, 0, '3222', 1, 0, '', NULL, 0),
(3223, '和静县', '0', 478, 0, '3223', 1, 0, '', NULL, 0),
(3224, '和硕县', '0', 478, 0, '3224', 1, 0, '', NULL, 0),
(3225, '博湖县', '0', 478, 0, '3225', 1, 0, '', NULL, 0),
(3226, '阿克苏市', '0', 479, 0, '3226', 1, 0, '', NULL, 0),
(3227, '温宿县', '0', 479, 0, '3227', 1, 0, '', NULL, 0),
(3228, '库车县', '0', 479, 0, '3228', 1, 0, '', NULL, 0),
(3229, '沙雅县', '0', 479, 0, '3229', 1, 0, '', NULL, 0),
(3230, '新和县', '0', 479, 0, '3230', 1, 0, '', NULL, 0),
(3231, '拜城县', '0', 479, 0, '3231', 1, 0, '', NULL, 0),
(3232, '乌什县', '0', 479, 0, '3232', 1, 0, '', NULL, 0),
(3233, '阿瓦提县', '0', 479, 0, '3233', 1, 0, '', NULL, 0),
(3234, '柯坪县', '0', 479, 0, '3234', 1, 0, '', NULL, 0),
(3235, '阿图什市', '0', 480, 0, '3235', 1, 0, '', NULL, 0),
(3236, '阿克陶县', '0', 480, 0, '3236', 1, 0, '', NULL, 0),
(3237, '阿合奇县', '0', 480, 0, '3237', 1, 0, '', NULL, 0),
(3238, '乌恰县', '0', 480, 0, '3238', 1, 0, '', NULL, 0),
(3239, '喀什市', '0', 481, 0, '3239', 1, 0, '', NULL, 0),
(3240, '疏附县', '0', 481, 0, '3240', 1, 0, '', NULL, 0),
(3241, '疏勒县', '0', 481, 0, '3241', 1, 0, '', NULL, 0),
(3242, '英吉沙县', '0', 481, 0, '3242', 1, 0, '', NULL, 0),
(3243, '泽普县', '0', 481, 0, '3243', 1, 0, '', NULL, 0),
(3244, '莎车县', '0', 481, 0, '3244', 1, 0, '', NULL, 0),
(3245, '叶城县', '0', 481, 0, '3245', 1, 0, '', NULL, 0),
(3246, '麦盖提县', '0', 481, 0, '3246', 1, 0, '', NULL, 0),
(3247, '岳普湖县', '0', 481, 0, '3247', 1, 0, '', NULL, 0),
(3248, '伽师县', '0', 481, 0, '3248', 1, 0, '', NULL, 0),
(3249, '巴楚县', '0', 481, 0, '3249', 1, 0, '', NULL, 0),
(3250, '塔什库尔干塔吉克自治县', '0', 481, 0, '3250', 1, 0, '', NULL, 0),
(3251, '和田市', '0', 482, 0, '3251', 1, 0, '', NULL, 0),
(3252, '和田县', '0', 482, 0, '3252', 1, 0, '', NULL, 0),
(3253, '墨玉县', '0', 482, 0, '3253', 1, 0, '', NULL, 0),
(3254, '皮山县', '0', 482, 0, '3254', 1, 0, '', NULL, 0),
(3255, '洛浦县', '0', 482, 0, '3255', 1, 0, '', NULL, 0),
(3256, '策勒县', '0', 482, 0, '3256', 1, 0, '', NULL, 0),
(3257, '于田县', '0', 482, 0, '3257', 1, 0, '', NULL, 0),
(3258, '民丰县', '0', 482, 0, '3258', 1, 0, '', NULL, 0),
(3259, '伊宁市', '0', 483, 0, '3259', 1, 0, '', NULL, 0),
(3260, '奎屯市', '0', 483, 0, '3260', 1, 0, '', NULL, 0),
(3261, '伊宁县', '0', 483, 0, '3261', 1, 0, '', NULL, 0),
(3262, '察布查尔锡伯自治县', '0', 483, 0, '3262', 1, 0, '', NULL, 0),
(3263, '霍城县', '0', 483, 0, '3263', 1, 0, '', NULL, 0),
(3264, '巩留县', '0', 483, 0, '3264', 1, 0, '', NULL, 0),
(3265, '新源县', '0', 483, 0, '3265', 1, 0, '', NULL, 0),
(3266, '昭苏县', '0', 483, 0, '3266', 1, 0, '', NULL, 0),
(3267, '特克斯县', '0', 483, 0, '3267', 1, 0, '', NULL, 0),
(3268, '尼勒克县', '0', 483, 0, '3268', 1, 0, '', NULL, 0),
(3269, '塔城市', '0', 484, 0, '3269', 1, 0, '', NULL, 0),
(3270, '乌苏市', '0', 484, 0, '3270', 1, 0, '', NULL, 0),
(3271, '额敏县', '0', 484, 0, '3271', 1, 0, '', NULL, 0),
(3272, '沙湾县', '0', 484, 0, '3272', 1, 0, '', NULL, 0),
(3273, '托里县', '0', 484, 0, '3273', 1, 0, '', NULL, 0),
(3274, '裕民县', '0', 484, 0, '3274', 1, 0, '', NULL, 0),
(3275, '和布克赛尔蒙古自治县', '0', 484, 0, '3275', 1, 0, '', NULL, 0),
(3276, '阿勒泰市', '0', 485, 0, '3276', 1, 0, '', NULL, 0),
(3277, '布尔津县', '0', 485, 0, '3277', 1, 0, '', NULL, 0),
(3278, '富蕴县', '0', 485, 0, '3278', 1, 0, '', NULL, 0),
(3279, '福海县', '0', 485, 0, '3279', 1, 0, '', NULL, 0),
(3280, '哈巴河县', '0', 485, 0, '3280', 1, 0, '', NULL, 0),
(3281, '青河县', '0', 485, 0, '3281', 1, 0, '', NULL, 0),
(3282, '吉木乃县', '0', 485, 0, '3282', 1, 0, '', NULL, 0),
(3360, '家电分类导航', '0', 0, 0, '', 0, 0, '', NULL, 0),
(3361, '常用家电', '', 0, 1, '3361,3366,3367,3368,3369,3370', 3360, 0, '', NULL, 0),
(3362, '卫浴家电', '', 0, 1, '3362,3372,3373,3374,3375', 3360, 0, '', NULL, 0),
(3363, '厨房家电', '', 0, 1, '3363,3376,3377,3378,3379,3380,3381,3382,3383,3384,3385,3386', 3360, 0, '', NULL, 0),
(3364, '家庭影音', '', 0, 1, '3364,3387,3388,3389', 3360, 0, '', NULL, 0),
(3365, '小家电', '', 0, 1, '3365,3390,3391,3392,3393', 3360, 0, '', NULL, 0),
(3366, '液晶电视', '0', 3361, 0, '3366', 3360, 0, '', 'array (\n  ''level'' => ''0'',\n)', 0),
(3367, '等离子电视', '0', 3361, 0, '3367', 3360, 0, '', 'array (\n  ''level'' => ''0'',\n)', 0),
(3368, '空调', '0', 3361, 0, '3368', 3360, 0, '', 'array (\n  ''level'' => ''0'',\n)', 0),
(3369, '冰箱', '0', 3361, 0, '3369', 3360, 0, '', 'array (\n  ''level'' => ''0'',\n)', 0),
(3370, '洗衣机', '0', 3361, 0, '3370', 3360, 0, '', 'array (\n  ''level'' => ''0'',\n)', 0),
(3372, '电热水器', '', 3362, 0, '3372', 3360, 0, '', NULL, 0),
(3373, '太阳能热水器', '', 3362, 0, '3373', 3360, 0, '', NULL, 0),
(3374, '浴霸', '', 3362, 0, '3374', 3360, 0, '', NULL, 0),
(3375, '燃气热水器', '', 3362, 0, '3375', 3360, 0, '', NULL, 0),
(3376, '抽油烟机', '', 3363, 0, '3376', 3360, 0, '', NULL, 0),
(3377, '电饭煲', '', 3363, 0, '3377', 3360, 0, '', NULL, 0),
(3378, '豆浆机', '', 3363, 0, '3378', 3360, 0, '', NULL, 0),
(3379, '榨汁机', '', 3363, 0, '3379', 3360, 0, '', NULL, 0),
(3380, '电饼铛电磁炉', '', 3363, 0, '3380', 3360, 0, '', NULL, 0),
(3381, '微波炉', '', 3363, 0, '3381', 3360, 0, '', NULL, 0),
(3382, '咖啡机', '', 3363, 0, '3382', 3360, 0, '', NULL, 0),
(3383, '消毒柜', '', 3363, 0, '3383', 3360, 0, '', NULL, 0),
(3384, '饮水机', '', 3363, 0, '3384', 3360, 0, '', NULL, 0),
(3385, '多士炉', '', 3363, 0, '3385', 3360, 0, '', NULL, 0),
(3386, '洗碗机', '', 3363, 0, '3386', 3360, 0, '', NULL, 0),
(3387, '家庭影院', '', 3364, 0, '3387', 3360, 0, '', NULL, 0),
(3388, 'DVD播放机', '', 3364, 0, '3388', 3360, 0, '', NULL, 0),
(3389, '迷你组合音响', '', 3364, 0, '3389', 3360, 0, '', NULL, 0),
(3390, '电暖气', '', 3365, 0, '3390', 3360, 0, '', NULL, 0),
(3391, '电风扇', '', 3365, 0, '3391', 3360, 0, '', NULL, 0),
(3392, '电熨斗', '', 3365, 0, '3392', 3360, 0, '', NULL, 0),
(3393, '收音机', '', 3365, 0, '3393', 3360, 0, '', NULL, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_log`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 03 日 09:45
-- 

DROP TABLE IF EXISTS `cban_log`;
CREATE TABLE IF NOT EXISTS `cban_log` (
  `logid` int(10) unsigned NOT NULL auto_increment,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL default '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1348 ;

-- 
-- 导出表中的数据 `cban_log`
-- 

INSERT DELAYED IGNORE INTO `cban_log` (`logid`, `field`, `value`, `module`, `file`, `action`, `querystring`, `data`, `userid`, `username`, `ip`, `time`) VALUES 
(1, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-21 19:21:47'),
(2, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-21 19:21:53'),
(3, '', 0, 'template', '', 'style', '?m=template&c=style&a=updatename', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:21:46'),
(4, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:22:09'),
(5, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:22:23'),
(6, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:22:24'),
(7, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=priv_setting', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:23:25'),
(8, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:23:25'),
(9, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:23:27'),
(10, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 1, '', '127.0.0.1', '2014-07-21 20:23:38'),
(11, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 1, '', '127.0.0.1', '2014-07-21 20:23:46'),
(12, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 1, '', '127.0.0.1', '2014-07-21 20:23:47'),
(13, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 1, '', '127.0.0.1', '2014-07-21 20:23:53'),
(14, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=priv_setting', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:26'),
(15, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=priv_setting', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:39'),
(16, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:39'),
(17, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:43'),
(18, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=setting_cat_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:55'),
(19, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:55'),
(20, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=setting_cat_priv', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:24:56'),
(21, '', 0, 'template', '', 'style', '?m=template&c=style&a=disable', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:26:53'),
(22, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:27:33'),
(23, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-21 20:27:43'),
(24, '', 0, 'tag', '', 'tag', '?m=tag&c=tag&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:02:04'),
(25, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:02:12'),
(26, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:02:26'),
(27, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:02:51'),
(28, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:02:52'),
(29, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:06'),
(30, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:19'),
(31, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:19'),
(32, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=sort', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:27'),
(33, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:29'),
(34, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:36'),
(35, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:47'),
(36, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:52'),
(37, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:53'),
(38, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:03:54'),
(39, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:04:02'),
(40, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:04:05'),
(41, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:04:06'),
(42, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:04:39'),
(43, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:07:01'),
(44, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:10:42'),
(45, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:11:14'),
(46, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:11:26'),
(47, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:11:28'),
(48, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:14:10'),
(49, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:15:41'),
(50, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:16:14'),
(51, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:16:52'),
(52, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:17:02'),
(53, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:17:20'),
(54, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:17:58'),
(55, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:18:06'),
(56, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:18:28'),
(57, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:18:53'),
(58, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:19:27'),
(59, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:19:31'),
(60, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:20:54'),
(61, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:21:13'),
(62, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:21:33'),
(63, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:21:40'),
(64, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:24:09'),
(65, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:24:12'),
(66, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:24:32'),
(67, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:24:53'),
(68, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:24:59'),
(69, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:25:05'),
(70, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:25:09'),
(71, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:25:16'),
(72, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:25:53'),
(73, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:26:33'),
(74, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=priv_setting', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:26:57'),
(75, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:26:57'),
(76, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=setting_cat_priv', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:27:02'),
(77, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:27:02'),
(78, '', 0, 'admin', '', 'role', '?m=admin&c=role&a=member_manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:27:08'),
(79, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:28:13'),
(80, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:29:19'),
(81, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:29:23'),
(82, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:29:25'),
(83, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:30:34'),
(84, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:30:36'),
(85, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:39:20'),
(86, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:39:21'),
(87, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:39:26'),
(88, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:39:28'),
(89, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:43:04'),
(90, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:43:05'),
(91, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:52:10'),
(92, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:52:10'),
(93, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:52:16'),
(94, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:52:45'),
(95, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:52:46'),
(96, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:53:13'),
(97, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:53:17'),
(98, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:55:45'),
(99, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:55:47'),
(100, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:55:55'),
(101, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:55:57'),
(102, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:55:59'),
(103, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:56:06'),
(104, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:56:43'),
(105, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:56:44'),
(106, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:56:46'),
(107, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:56:50'),
(108, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:57:15'),
(109, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 10:57:16'),
(110, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:13'),
(111, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:16'),
(112, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:38'),
(113, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:40'),
(114, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:43'),
(115, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:51'),
(116, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 11:49:53'),
(117, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-22 12:25:18'),
(118, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-22 12:25:19'),
(119, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-22 12:25:20'),
(120, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-22 15:15:16'),
(121, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-22 15:15:29'),
(122, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:36'),
(123, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:44'),
(124, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:45'),
(125, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:47'),
(126, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:54'),
(127, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:56'),
(128, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:15:56'),
(129, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:39:34'),
(130, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:39:35'),
(131, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:40:25'),
(132, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 15:40:27'),
(133, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:29:52'),
(134, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:29:53'),
(135, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:29:55'),
(136, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:30:55'),
(137, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:30:57'),
(138, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:30:59'),
(139, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:31:02'),
(140, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 17:31:03'),
(141, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:18:30'),
(142, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:18:35'),
(143, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:18:35'),
(144, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:18:47'),
(145, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:19:00'),
(146, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:19:00'),
(147, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:19:01'),
(148, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:21:24'),
(149, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:23:36'),
(150, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:23:36'),
(151, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:24:03'),
(152, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:51:37'),
(153, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:51:37'),
(154, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:51:39'),
(155, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:56:55'),
(156, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:57:04'),
(157, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:57:04'),
(158, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:57:07'),
(159, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:57:09'),
(160, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:57:10'),
(161, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:58:50'),
(162, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 18:58:50'),
(163, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:14:44'),
(164, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:14:54'),
(165, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:14:59'),
(166, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:15:09'),
(167, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:17:49'),
(168, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:17:52'),
(169, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:17:56'),
(170, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:18:14'),
(171, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:18:20'),
(172, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:18:21'),
(173, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:18:26'),
(174, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:18:28'),
(175, '', 0, 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:18:31'),
(176, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:47:14'),
(177, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 20:54:53'),
(178, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:03:39'),
(179, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:03:59'),
(180, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:04:04'),
(181, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:04:11'),
(182, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:05:16'),
(183, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:05:31'),
(184, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 21:05:36'),
(185, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:02:46'),
(186, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:06:40'),
(187, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:07:16'),
(188, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:07:37'),
(189, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:07:51'),
(190, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:08:02'),
(191, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:08:06'),
(192, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:20:02'),
(193, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:21:36'),
(194, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:22:17'),
(195, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:25:49'),
(196, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 22:29:40'),
(197, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:50:55'),
(198, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:51:58'),
(199, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:52:42'),
(200, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:52:49'),
(201, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:52:56'),
(202, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:52:56'),
(203, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:56:52'),
(204, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:57:10'),
(205, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:57:11'),
(206, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:57:24'),
(207, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-22 23:57:30'),
(208, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-23 00:51:30'),
(209, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-23 00:56:06'),
(210, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-23 00:56:36'),
(211, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-23 00:56:48'),
(212, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-23 00:57:14'),
(213, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-23 01:02:01'),
(214, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 09:33:57'),
(215, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 09:34:36'),
(216, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 10:33:13'),
(217, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 10:38:34'),
(218, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 10:38:43'),
(219, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 10:39:06'),
(220, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:00:37'),
(221, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:02:44'),
(222, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:02:51'),
(223, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:03:37'),
(224, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:14:43'),
(225, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:14:55'),
(226, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:15:50'),
(227, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:17:32'),
(228, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:17:48'),
(229, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:18:31'),
(230, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:19:05'),
(231, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:19:29'),
(232, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:19:34'),
(233, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:20:07'),
(234, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:20:12'),
(235, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:21:19'),
(236, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:21:34'),
(237, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:21:57'),
(238, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:23:25'),
(239, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:23:35'),
(240, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:23:46'),
(241, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:24:16'),
(242, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:24:28'),
(243, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:54:50'),
(244, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 11:55:36'),
(245, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 16:29:17'),
(246, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 16:29:18'),
(247, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 16:29:24'),
(248, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 16:29:25'),
(249, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 16:29:31'),
(250, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:40'),
(251, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:43'),
(252, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:45'),
(253, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:45'),
(254, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:49'),
(255, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:49'),
(256, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:29:51'),
(257, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:30:01'),
(258, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:30:02'),
(259, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:31:45'),
(260, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:31:53'),
(261, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:32:11'),
(262, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:32:17'),
(263, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:32:42'),
(264, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:33:55'),
(265, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:34:00'),
(266, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:34:06'),
(267, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:34:10'),
(268, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:35:12'),
(269, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:35:32'),
(270, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:35:46'),
(271, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:35:49'),
(272, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:36:22'),
(273, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:36:31'),
(274, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:36:34'),
(275, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:36:44'),
(276, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:36:48'),
(277, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:37:15'),
(278, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:38:45'),
(279, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:38:57'),
(280, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:39:29'),
(281, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:40:03'),
(282, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:40:09'),
(283, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:40:16'),
(284, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:48:33'),
(285, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:49:23'),
(286, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:49:28'),
(287, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:49:47'),
(288, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:50:23'),
(289, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 16:50:30'),
(290, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 17:02:09'),
(291, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 17:02:17'),
(292, '', 0, 'content', '', 'content', '?m=content&c=content&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-23 17:05:02'),
(293, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 21:40:45'),
(294, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 21:40:45'),
(295, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-23 21:40:49'),
(296, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:41:08'),
(297, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:41:45'),
(298, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:41:57'),
(299, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:42:44'),
(300, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:53:07'),
(301, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:53:13'),
(302, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:53:27'),
(303, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:53:40'),
(304, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-23 21:53:43'),
(305, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-29 15:24:17'),
(306, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-07-29 15:24:23'),
(307, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:50:16'),
(308, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:50:35'),
(309, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:50:39'),
(310, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:51:35'),
(311, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:52:19'),
(312, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:52:36'),
(313, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:52:46'),
(314, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:53:02'),
(315, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:53:11'),
(316, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-29 15:53:57'),
(317, '', 0, 'attachment', '', 'manage', '?m=attachment&c=manage&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-29 16:29:59'),
(318, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-31 09:43:47'),
(319, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-31 09:43:47'),
(320, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-07-31 09:43:53'),
(321, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:53:01'),
(322, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:53:24'),
(323, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:55:21'),
(324, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:55:25'),
(325, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:55:38'),
(326, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:55:42'),
(327, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:57:49'),
(328, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:58:07'),
(329, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:58:40'),
(330, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 09:58:58'),
(331, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:00:29'),
(332, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:01:24'),
(333, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:02:26'),
(334, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:03:02'),
(335, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:04:51'),
(336, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:05:38'),
(337, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:05:49'),
(338, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:06:52'),
(339, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:07:34'),
(340, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:07:43'),
(341, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:08:21'),
(342, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:08:31'),
(343, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:09:33'),
(344, '', 0, 'content', '', 'type_manage', '?m=content&c=type_manage&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:09:51'),
(345, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:40:08'),
(346, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:43:15'),
(347, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:48:49'),
(348, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:50:36'),
(349, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:51:32'),
(350, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:54:45'),
(351, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:55:09'),
(352, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:55:29'),
(353, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:55:33'),
(354, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 10:56:11'),
(355, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:01:38'),
(356, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:01:46'),
(357, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:02:17'),
(358, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:02:24'),
(359, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:06:36'),
(360, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:22:22'),
(361, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:22:29'),
(362, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:24:48'),
(363, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:25:14'),
(364, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:25:21'),
(365, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:25:28'),
(366, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:25:51'),
(367, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 11:26:32'),
(368, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:03:15'),
(369, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:04:02'),
(370, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:05:43'),
(371, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:07:54'),
(372, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:08:16'),
(373, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:08:22'),
(374, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:08:34'),
(375, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:08:38'),
(376, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:10:13'),
(377, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:10:23'),
(378, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:10:39'),
(379, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:11:06'),
(380, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:12:21'),
(381, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:14:17'),
(382, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:14:24'),
(383, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:15:17'),
(384, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:15:21'),
(385, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:15:59');
INSERT DELAYED IGNORE INTO `cban_log` (`logid`, `field`, `value`, `module`, `file`, `action`, `querystring`, `data`, `userid`, `username`, `ip`, `time`) VALUES 
(386, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:16:04'),
(387, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:16:30'),
(388, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:16:43'),
(389, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:17:20'),
(390, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:17:33'),
(391, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:20:16'),
(392, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:20:31'),
(393, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:20:34'),
(394, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:20:48'),
(395, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:20:51'),
(396, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:21:09'),
(397, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:21:46'),
(398, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:22:00'),
(399, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:22:33'),
(400, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:23:14'),
(401, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:23:40'),
(402, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:24:10'),
(403, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:25:04'),
(404, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:25:11'),
(405, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:25:14'),
(406, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:25:21'),
(407, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:25:25'),
(408, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:25:57'),
(409, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:26:32'),
(410, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:26:41'),
(411, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:27:20'),
(412, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:27:38'),
(413, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:34:26'),
(414, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:35:31'),
(415, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:36:38'),
(416, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:37:35'),
(417, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:37:38'),
(418, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:38:00'),
(419, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:38:11'),
(420, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:38:53'),
(421, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:40:58'),
(422, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:42:20'),
(423, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:43:23'),
(424, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:44:42'),
(425, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:45:05'),
(426, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:45:32'),
(427, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:45:57'),
(428, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:47:09'),
(429, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:51:32'),
(430, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:51:52'),
(431, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:52:09'),
(432, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:52:38'),
(433, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:53:39'),
(434, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:53:51'),
(435, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 14:54:17'),
(436, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:02:26'),
(437, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:02:43'),
(438, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:04:09'),
(439, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:04:17'),
(440, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:05:44'),
(441, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:05:52'),
(442, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:06:28'),
(443, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:06:35'),
(444, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:38:11'),
(445, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:38:30'),
(446, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:39:06'),
(447, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:39:19'),
(448, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:39:37'),
(449, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:39:43'),
(450, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:40:10'),
(451, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:40:21'),
(452, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:40:29'),
(453, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:41:19'),
(454, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:41:44'),
(455, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:43:17'),
(456, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:43:22'),
(457, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:44:03'),
(458, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:44:25'),
(459, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:44:33'),
(460, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:44:58'),
(461, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:45:05'),
(462, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:45:10'),
(463, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:45:33'),
(464, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:45:49'),
(465, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:46:10'),
(466, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:46:14'),
(467, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:46:47'),
(468, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:46:57'),
(469, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:47:32'),
(470, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:50:31'),
(471, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:50:44'),
(472, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:51:23'),
(473, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:51:29'),
(474, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:52:41'),
(475, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:52:46'),
(476, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:58:20'),
(477, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:58:28'),
(478, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:58:47'),
(479, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:58:52'),
(480, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:59:49'),
(481, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 15:59:55'),
(482, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:00:00'),
(483, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:00:07'),
(484, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:01:19'),
(485, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:01:33'),
(486, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:01:50'),
(487, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:01:59'),
(488, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:02:07'),
(489, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:02:13'),
(490, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:02:18'),
(491, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:02:25'),
(492, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:02:29'),
(493, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:07:49'),
(494, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:09:15'),
(495, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:09:32'),
(496, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:09:45'),
(497, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:10:05'),
(498, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:10:14'),
(499, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:15:39'),
(500, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:25:09'),
(501, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:28:35'),
(502, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-07-31 16:55:03'),
(503, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-01 08:43:19'),
(504, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-01 08:43:24'),
(505, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:43:37'),
(506, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:45:46'),
(507, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:48:19'),
(508, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:49:32'),
(509, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:51:31'),
(510, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:51:42'),
(511, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:52:22'),
(512, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:52:28'),
(513, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:52:48'),
(514, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-01 08:52:56'),
(515, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-01 11:57:13'),
(516, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-03 17:11:37'),
(517, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-03 17:11:37'),
(518, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-03 17:11:37'),
(519, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-03 17:11:42'),
(520, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-03 17:13:16'),
(521, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-03 17:14:51'),
(522, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-03 17:15:04'),
(523, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-03 17:15:45'),
(524, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-03 17:15:53'),
(525, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-08-03 18:03:08'),
(526, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 09:19:36'),
(527, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 09:19:44'),
(528, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:24:29'),
(529, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:25:15'),
(530, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:25:47'),
(531, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:25:50'),
(532, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:26:20'),
(533, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:26:31'),
(534, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:26:33'),
(535, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:26:45'),
(536, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:26:58'),
(537, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:27:10'),
(538, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:27:29'),
(539, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:29:24'),
(540, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:29:34'),
(541, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:39:36'),
(542, '', 0, 'admin', '', 'site', '?m=admin&c=site&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:41:24'),
(543, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:43:31'),
(544, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:44:26'),
(545, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:45:04'),
(546, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:45:09'),
(547, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:45:25'),
(548, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 10:45:41'),
(549, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 11:46:44'),
(550, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 11:47:04'),
(551, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 12:26:35'),
(552, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 12:27:19'),
(553, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 12:27:23'),
(554, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 12:29:10'),
(555, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 12:29:41'),
(556, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:35:23'),
(557, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:35:36'),
(558, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:35:45'),
(559, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:35:56'),
(560, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:36:02'),
(561, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:36:10'),
(562, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:37:28'),
(563, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:37:36'),
(564, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:37:43'),
(565, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:37:47'),
(566, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:37:53'),
(567, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:38:02'),
(568, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:38:04'),
(569, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:38:10'),
(570, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:38:55'),
(571, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:02'),
(572, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:10'),
(573, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:24'),
(574, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:25'),
(575, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:33'),
(576, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:37'),
(577, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:41'),
(578, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:39:55'),
(579, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:01'),
(580, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:22'),
(581, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:28'),
(582, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:30'),
(583, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:41'),
(584, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:52'),
(585, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:53'),
(586, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:40:57'),
(587, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:01'),
(588, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:05'),
(589, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:07'),
(590, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:16'),
(591, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:18'),
(592, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:20'),
(593, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:24'),
(594, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:28'),
(595, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:37'),
(596, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:46'),
(597, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:48'),
(598, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:52'),
(599, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:41:56'),
(600, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:00'),
(601, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:01'),
(602, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:07'),
(603, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:17'),
(604, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:24'),
(605, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:42'),
(606, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:42:51'),
(607, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:00'),
(608, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:13'),
(609, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:14'),
(610, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:23'),
(611, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:24'),
(612, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:46'),
(613, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:43:48'),
(614, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:44:00'),
(615, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:44:08'),
(616, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:48:43'),
(617, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:49:10'),
(618, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:51:26'),
(619, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:52:02'),
(620, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:52:30'),
(621, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:53:31'),
(622, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:53:35'),
(623, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:53:50'),
(624, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:44'),
(625, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:46'),
(626, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:48'),
(627, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:51'),
(628, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:53'),
(629, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:56'),
(630, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:55:58'),
(631, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 14:56:01'),
(632, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:02:16'),
(633, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:03:22'),
(634, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:03:28'),
(635, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:03:34'),
(636, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:03:40'),
(637, '', 0, 'admin', '', 'linkage', '?m=admin&c=linkage&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:06:29'),
(638, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 15:16:30'),
(639, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 15:16:30'),
(640, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 15:16:36'),
(641, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:16:46'),
(642, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-04 15:16:53'),
(643, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 15:51:14'),
(644, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-04 15:51:19'),
(645, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:03:20'),
(646, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:03:28'),
(647, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:03:33'),
(648, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:03:38'),
(649, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:04:16'),
(650, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=count_items', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:04:26'),
(651, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:10:09'),
(652, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:10:42'),
(653, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:10:49'),
(654, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:10:55'),
(655, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:11:21'),
(656, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:11:27'),
(657, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-04 16:12:03'),
(658, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-08-05 09:21:54'),
(659, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-08-05 09:22:02'),
(660, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:22:42'),
(661, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:22:47'),
(662, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:23:42'),
(663, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:25:32'),
(664, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:26:05'),
(665, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:26:14'),
(666, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:26:48'),
(667, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:26:53'),
(668, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:27:10'),
(669, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:27:18'),
(670, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:27:29'),
(671, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:27:35'),
(672, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:46:59'),
(673, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:47:16'),
(674, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:48:43'),
(675, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:51:49'),
(676, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:52:22'),
(677, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 09:59:23'),
(678, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:00:01'),
(679, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:00:24'),
(680, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:00:35'),
(681, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:00:47'),
(682, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:04:05'),
(683, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:07:42'),
(684, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:07:47'),
(685, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:08:05'),
(686, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:08:54'),
(687, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:09:12'),
(688, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:09:17'),
(689, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:09:34'),
(690, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:09:42'),
(691, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:10:07'),
(692, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:10:36'),
(693, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:10:39'),
(694, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:11:18'),
(695, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:11:41'),
(696, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:11:46'),
(697, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:12:00'),
(698, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:12:39'),
(699, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:12:44'),
(700, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:16:04'),
(701, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:31:20'),
(702, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:32:13'),
(703, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:32:20'),
(704, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:40:22'),
(705, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:40:30'),
(706, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:40:44'),
(707, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:40:54'),
(708, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:40:59'),
(709, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:43:09'),
(710, '', 0, 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:45:55'),
(711, '', 0, 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:46:01'),
(712, '', 0, 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:46:04'),
(713, '', 0, 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', 1, 'admin', '127.0.0.1', '2014-08-05 10:46:05'),
(714, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 11:13:38'),
(715, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 11:13:47'),
(716, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-05 11:13:58'),
(717, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 11:14:14'),
(718, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-05 11:14:23'),
(719, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:48:57'),
(720, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:49:57'),
(721, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:50:01'),
(722, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:50:18'),
(723, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:50:20'),
(724, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:50:29'),
(725, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:53:36'),
(726, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:53:46'),
(727, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:54:49'),
(728, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:54:55'),
(729, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:54:57'),
(730, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:54:59'),
(731, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:57:13'),
(732, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:58:02'),
(733, '', 0, 'attachment', '', 'manage', '?m=attachment&c=manage&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:58:59'),
(734, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-05 14:59:50'),
(735, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-05 15:07:26'),
(736, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-05 15:59:49'),
(737, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-06 16:40:52'),
(738, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-06 16:41:00'),
(739, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-06 16:41:13'),
(740, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 16:19:18'),
(741, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 16:19:56'),
(742, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 16:20:18'),
(743, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-07 16:26:13'),
(744, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 16:26:18'),
(745, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 16:26:34'),
(746, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:37:42'),
(747, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:40:37'),
(748, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:40:59'),
(749, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:41:28'),
(750, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:41:41'),
(751, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:41:51'),
(752, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:42:02'),
(753, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:42:26'),
(754, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:42:43'),
(755, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:42:50'),
(756, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:43:00'),
(757, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:43:06'),
(758, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:43:11'),
(759, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:43:18'),
(760, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:43:54'),
(761, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:44:37'),
(762, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:45:00'),
(763, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:45:29'),
(764, '', 0, 'content', '', 'content', '?m=content&c=content&a=add_othors', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:45:34'),
(765, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:46:01'),
(766, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:46:27'),
(767, '', 0, 'content', '', 'content', '?m=content&c=content&a=add_othors', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:46:30'),
(768, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 18:46:49'),
(769, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 19:34:36'),
(770, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 19:34:43'),
(771, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 19:43:52'),
(772, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 19:43:58'),
(773, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 19:44:50'),
(774, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 19:44:56'),
(775, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:14:37'),
(776, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:15:18'),
(777, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:15:24'),
(778, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:15:30');
INSERT DELAYED IGNORE INTO `cban_log` (`logid`, `field`, `value`, `module`, `file`, `action`, `querystring`, `data`, `userid`, `username`, `ip`, `time`) VALUES 
(779, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:15:41'),
(780, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:16:10'),
(781, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:17:02'),
(782, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:18:42'),
(783, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:19:53'),
(784, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:20:36'),
(785, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:24:04'),
(786, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:24:27'),
(787, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:24:30'),
(788, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:25:00'),
(789, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:25:18'),
(790, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:25:24'),
(791, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:25:33'),
(792, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:26:08'),
(793, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:26:21'),
(794, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:26:47'),
(795, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:28:04'),
(796, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:28:10'),
(797, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:31:02'),
(798, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:43:29'),
(799, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:44:05'),
(800, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:44:13'),
(801, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:44:31'),
(802, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 20:48:14'),
(803, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:13:46'),
(804, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:14:02'),
(805, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:18:44'),
(806, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:18:50'),
(807, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:19:08'),
(808, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:19:19'),
(809, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:26:26'),
(810, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:28:42'),
(811, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:33:01'),
(812, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 21:33:37'),
(813, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:09:12'),
(814, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:09:20'),
(815, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:11:18'),
(816, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:12:48'),
(817, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:12:55'),
(818, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:36:30'),
(819, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:41:27'),
(820, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:41:33'),
(821, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:43:35'),
(822, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:43:38'),
(823, '', 0, 'content', '', 'content', '?m=content&c=content&a=remove', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:44:09'),
(824, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:44:15'),
(825, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:44:18'),
(826, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:50:52'),
(827, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:51:08'),
(828, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:52:58'),
(829, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:54:59'),
(830, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:55:11'),
(831, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:55:17'),
(832, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-07 22:56:26'),
(833, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-07 23:04:08'),
(834, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-07 23:04:26'),
(835, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-08 09:14:17'),
(836, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-08 09:14:22'),
(837, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:18:44'),
(838, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:19:12'),
(839, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:19:21'),
(840, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:22:35'),
(841, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:22:45'),
(842, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:36:52'),
(843, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:36:55'),
(844, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:37:06'),
(845, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:56:04'),
(846, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:56:34'),
(847, '', 0, 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 09:56:57'),
(848, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:04:02'),
(849, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:04:09'),
(850, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:04:27'),
(851, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:07:28'),
(852, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:07:37'),
(853, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:07:43'),
(854, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:09:33'),
(855, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:09:42'),
(856, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:56:48'),
(857, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:56:56'),
(858, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 10:57:03'),
(859, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:10:16'),
(860, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:10:20'),
(861, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:10:24'),
(862, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:10:26'),
(863, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:10:28'),
(864, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:10:30'),
(865, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:20:41'),
(866, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:20:47'),
(867, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:20:51'),
(868, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:20:55'),
(869, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:20:59'),
(870, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:38:29'),
(871, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:38:50'),
(872, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 11:39:15'),
(873, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:01:13'),
(874, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:01:17'),
(875, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:01:25'),
(876, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:01:27'),
(877, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:01:35'),
(878, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:08:11'),
(879, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:08:15'),
(880, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:08:27'),
(881, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:08:31'),
(882, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:12:57'),
(883, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:13:17'),
(884, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:13:29'),
(885, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:15:38'),
(886, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:15:43'),
(887, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:16:11'),
(888, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:16:18'),
(889, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:16:36'),
(890, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:16:46'),
(891, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:17:40'),
(892, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:17:57'),
(893, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:18:06'),
(894, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:18:29'),
(895, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:18:33'),
(896, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:18:41'),
(897, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:18:44'),
(898, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:19:20'),
(899, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:19:31'),
(900, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:19:36'),
(901, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-08 12:20:11'),
(902, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:30:49'),
(903, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:31:31'),
(904, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:31:35'),
(905, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:31:59'),
(906, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:32:04'),
(907, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:32:11'),
(908, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:32:17'),
(909, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:43:45'),
(910, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:43:56'),
(911, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:45:15'),
(912, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:45:25'),
(913, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:45:28'),
(914, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:45:31'),
(915, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:51:31'),
(916, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:51:35'),
(917, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:51:39'),
(918, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:51:42'),
(919, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:51:50'),
(920, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:51:56'),
(921, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:52:14'),
(922, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:52:18'),
(923, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:52:23'),
(924, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:52:29'),
(925, '', 0, 'poster', '', 'space', '?m=poster&c=space&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:53:17'),
(926, '', 0, 'poster', '', 'space', '?m=poster&c=space&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 14:53:27'),
(927, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-08 15:38:10'),
(928, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 15:38:19'),
(929, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-08 15:38:35'),
(930, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-08 15:38:47'),
(931, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-09 10:23:23'),
(932, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-09 10:23:29'),
(933, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:26:10'),
(934, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:26:57'),
(935, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:27:04'),
(936, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:27:30'),
(937, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:27:38'),
(938, '', 0, 'content', '', 'content', '?m=content&c=content&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:30:44'),
(939, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:30:51'),
(940, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:31:16'),
(941, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:34:17'),
(942, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:34:22'),
(943, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:34:44'),
(944, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:34:57'),
(945, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:35:40'),
(946, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:36:04'),
(947, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:36:18'),
(948, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:36:22'),
(949, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:36:41'),
(950, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:36:48'),
(951, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:37:11'),
(952, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-10 10:37:48'),
(953, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-11 10:16:17'),
(954, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-11 10:16:23'),
(955, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-12 10:40:06'),
(956, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-12 10:40:56'),
(957, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 10:41:14'),
(958, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 10:41:21'),
(959, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 10:41:33'),
(960, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-12 10:42:04'),
(961, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 11:02:21'),
(962, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 11:04:39'),
(963, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 11:04:45'),
(964, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 14:31:57'),
(965, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 14:32:38'),
(966, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 14:32:43'),
(967, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 14:33:12'),
(968, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 14:33:16'),
(969, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 14:57:57'),
(970, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:43'),
(971, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:44'),
(972, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:47'),
(973, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:50'),
(974, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:53'),
(975, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:53'),
(976, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:56'),
(977, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:57'),
(978, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:34:57'),
(979, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:35:38'),
(980, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:49:02'),
(981, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:49:15'),
(982, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:49:24'),
(983, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:49:45'),
(984, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-12 15:49:51'),
(985, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-19 10:55:24'),
(986, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-19 10:55:24'),
(987, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-19 10:55:31'),
(988, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 10:55:36'),
(989, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 10:55:36'),
(990, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 10:55:38'),
(991, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 10:55:40'),
(992, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 10:55:42'),
(993, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:00:26'),
(994, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:19'),
(995, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:29'),
(996, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:31'),
(997, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:36'),
(998, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:37'),
(999, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:38'),
(1000, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:01:40'),
(1001, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:02:42'),
(1002, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:03:37'),
(1003, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:11:50'),
(1004, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:11:52'),
(1005, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:11:55'),
(1006, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:11:58'),
(1007, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:12:07'),
(1008, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:12:10'),
(1009, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:12:14'),
(1010, '', 0, 'member', '', 'member', '?m=member&c=member&a=search', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:12:17'),
(1011, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:14:13'),
(1012, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:14:13'),
(1013, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:14:14'),
(1014, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:14:22'),
(1015, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:14:23'),
(1016, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:15:19'),
(1017, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:15:20'),
(1018, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:15:22'),
(1019, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:15:23'),
(1020, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:15:26'),
(1021, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:15:27'),
(1022, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:18:46'),
(1023, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:18:49'),
(1024, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:18:51'),
(1025, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:00'),
(1026, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:18'),
(1027, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:22'),
(1028, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:39'),
(1029, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:52'),
(1030, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:52'),
(1031, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:53'),
(1032, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:20:56'),
(1033, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:00'),
(1034, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:01'),
(1035, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:02'),
(1036, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:04'),
(1037, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:04'),
(1038, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:07'),
(1039, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:10'),
(1040, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:21:11'),
(1041, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:22:24'),
(1042, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:22:25'),
(1043, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:22:27'),
(1044, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:22:34'),
(1045, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:23:48'),
(1046, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:23:59'),
(1047, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:23:59'),
(1048, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:24:17'),
(1049, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:24:23'),
(1050, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:24:59'),
(1051, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:27:56'),
(1052, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:32:06'),
(1053, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:32:07'),
(1054, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:52:48'),
(1055, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:52:49'),
(1056, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:52:51'),
(1057, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:52:53'),
(1058, '', 0, 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:52:55'),
(1059, '', 0, 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:52:59'),
(1060, '', 0, 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 11:53:01'),
(1061, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:10:46'),
(1062, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:10:56'),
(1063, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:10:57'),
(1064, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:10:58'),
(1065, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:11:00'),
(1066, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:19:59'),
(1067, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:21:01'),
(1068, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:21:02'),
(1069, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:21:07'),
(1070, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:21:08'),
(1071, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:21:09'),
(1072, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:15'),
(1073, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:16'),
(1074, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:18'),
(1075, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:24'),
(1076, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:25'),
(1077, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:28'),
(1078, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:29'),
(1079, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:51'),
(1080, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:53'),
(1081, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:55'),
(1082, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:56'),
(1083, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:23:57'),
(1084, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:09'),
(1085, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:10'),
(1086, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:14'),
(1087, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:21'),
(1088, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:23'),
(1089, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:25'),
(1090, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:24:29'),
(1091, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:25:10'),
(1092, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:25:22'),
(1093, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:25:22'),
(1094, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:25:42'),
(1095, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:25:43'),
(1096, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:25:43'),
(1097, '', 0, 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:26:02'),
(1098, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:26:48'),
(1099, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:08'),
(1100, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:08'),
(1101, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:10'),
(1102, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:11'),
(1103, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:13'),
(1104, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:23'),
(1105, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:24'),
(1106, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:25'),
(1107, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:40'),
(1108, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:41'),
(1109, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:42'),
(1110, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:27:43'),
(1111, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:28:11'),
(1112, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:28:29'),
(1113, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:29'),
(1114, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:32'),
(1115, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:35'),
(1116, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:38'),
(1117, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:40'),
(1118, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:41'),
(1119, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:44'),
(1120, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:45'),
(1121, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:29:49'),
(1122, '', 0, 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', 1, 'admin', '127.0.0.1', '2014-08-19 12:30:59'),
(1123, '', 0, 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:03:32'),
(1124, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:03:34'),
(1125, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:03:37'),
(1126, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:03:41'),
(1127, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:03:58'),
(1128, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:03:59'),
(1129, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:04:02'),
(1130, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:13:53'),
(1131, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:13:56'),
(1132, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:13:59'),
(1133, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:16:03'),
(1134, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:16:06'),
(1135, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:17:33'),
(1136, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:17:36'),
(1137, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:17:38'),
(1138, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:17:39'),
(1139, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:17:44'),
(1140, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:18:00'),
(1141, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:18:16'),
(1142, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:20:49'),
(1143, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:20:50'),
(1144, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:20:54'),
(1145, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:21:33'),
(1146, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:22:08'),
(1147, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:22:57'),
(1148, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:29:20'),
(1149, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:29:24'),
(1150, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:29:26'),
(1151, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:29:30'),
(1152, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:26'),
(1153, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:45'),
(1154, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:47'),
(1155, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:49'),
(1156, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:51'),
(1157, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:52'),
(1158, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:54'),
(1159, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:55'),
(1160, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:30:56'),
(1161, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:31:54'),
(1162, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:32:05'),
(1163, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:32:08'),
(1164, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:32:09'),
(1165, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:05'),
(1166, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:07'),
(1167, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:09');
INSERT DELAYED IGNORE INTO `cban_log` (`logid`, `field`, `value`, `module`, `file`, `action`, `querystring`, `data`, `userid`, `username`, `ip`, `time`) VALUES 
(1168, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:11'),
(1169, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:13'),
(1170, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:15'),
(1171, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:17'),
(1172, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:19'),
(1173, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:36:23'),
(1174, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:32'),
(1175, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:34'),
(1176, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:36'),
(1177, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:37'),
(1178, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:39'),
(1179, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:41'),
(1180, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:44'),
(1181, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:45'),
(1182, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:46'),
(1183, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:47'),
(1184, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:38:49'),
(1185, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:40:01'),
(1186, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:40:03'),
(1187, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:42:25'),
(1188, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:42:27'),
(1189, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:42:29'),
(1190, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:43:26'),
(1191, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:43:29'),
(1192, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:44:09'),
(1193, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:44:27'),
(1194, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:57:06'),
(1195, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 14:57:07'),
(1196, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:04:49'),
(1197, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:04:50'),
(1198, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:04:51'),
(1199, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:04:52'),
(1200, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:04:53'),
(1201, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:04:55'),
(1202, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:05:10'),
(1203, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:05:12'),
(1204, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:05:16'),
(1205, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:06:18'),
(1206, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:06:20'),
(1207, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:06:22'),
(1208, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:06:23'),
(1209, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:06:24'),
(1210, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:07:42'),
(1211, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:07:43'),
(1212, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:07:45'),
(1213, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:07:46'),
(1214, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:08:36'),
(1215, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:08:37'),
(1216, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:08:46'),
(1217, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:08:48'),
(1218, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:10:41'),
(1219, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:12:59'),
(1220, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:13:02'),
(1221, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:13:03'),
(1222, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:13:18'),
(1223, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:13:20'),
(1224, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:14:28'),
(1225, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:14:53'),
(1226, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:15:25'),
(1227, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:15:26'),
(1228, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:15:28'),
(1229, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:15:30'),
(1230, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:13'),
(1231, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:17'),
(1232, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:19'),
(1233, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:21'),
(1234, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:21'),
(1235, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:22'),
(1236, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:16:22'),
(1237, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:20:54'),
(1238, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:21:03'),
(1239, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:21:05'),
(1240, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:26:02'),
(1241, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:26:03'),
(1242, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:26:24'),
(1243, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:26:30'),
(1244, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:26:31'),
(1245, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:26:59'),
(1246, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:12'),
(1247, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:16'),
(1248, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:17'),
(1249, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:19'),
(1250, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:20'),
(1251, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:22'),
(1252, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:24'),
(1253, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:29'),
(1254, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:31'),
(1255, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:31'),
(1256, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:27:32'),
(1257, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:28:42'),
(1258, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:28:43'),
(1259, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:28:44'),
(1260, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:00'),
(1261, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:18'),
(1262, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:23'),
(1263, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:26'),
(1264, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:28'),
(1265, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:30'),
(1266, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:33'),
(1267, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:33'),
(1268, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:36'),
(1269, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:38'),
(1270, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:39'),
(1271, '', 0, 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:29:42'),
(1272, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:40:43'),
(1273, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:40:44'),
(1274, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:44:54'),
(1275, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:44:55'),
(1276, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:45:31'),
(1277, '', 0, 'member', '', 'member', '?m=member&c=member&a=manage', '', 1, 'admin', '127.0.0.1', '2014-08-19 15:45:32'),
(1278, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-21 15:49:53'),
(1279, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-21 15:49:53'),
(1280, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-21 15:49:57'),
(1281, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-08-21 15:50:56'),
(1282, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-25 11:16:59'),
(1283, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-25 11:17:04'),
(1284, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-25 11:17:17'),
(1285, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-25 11:17:40'),
(1286, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-25 15:08:50'),
(1287, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-27 10:03:19'),
(1288, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-08-27 10:03:25'),
(1289, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=delete', '', 1, 'admin', '127.0.0.1', '2014-08-27 10:03:44'),
(1290, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-27 10:04:04'),
(1291, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-08-27 10:04:13'),
(1292, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-08-27 14:21:15'),
(1293, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, '', '127.0.0.1', '2014-08-27 14:21:23'),
(1294, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-09-02 10:54:38'),
(1295, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-09-02 10:54:43'),
(1296, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 10:54:58'),
(1297, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 11:17:31'),
(1298, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:20:58'),
(1299, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:21:17'),
(1300, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:22:19'),
(1301, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:22:29'),
(1302, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:22:34'),
(1303, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:22:38'),
(1304, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:22:41'),
(1305, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:22:55'),
(1306, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:25:09'),
(1307, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:25:23'),
(1308, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:25:28'),
(1309, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:25:37'),
(1310, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:25:42'),
(1311, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:26:10'),
(1312, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:26:13'),
(1313, '', 0, 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:29:55'),
(1314, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:30:42'),
(1315, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:30:59'),
(1316, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:31:06'),
(1317, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:35:17'),
(1318, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:35:35'),
(1319, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:35:42'),
(1320, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:37:18'),
(1321, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:37:48'),
(1322, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:37:50'),
(1323, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:38:27'),
(1324, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:38:48'),
(1325, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:38:57'),
(1326, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:39:30'),
(1327, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:39:38'),
(1328, '', 0, 'content', '', 'content', '?m=content&c=content&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:40:05'),
(1329, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:51:32'),
(1330, '', 0, 'content', '', 'content', '?m=content&c=content&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-02 14:55:33'),
(1331, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-09-03 09:10:20'),
(1332, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-09-03 09:10:26'),
(1333, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-09-03 09:10:27'),
(1334, '', 0, 'admin', '', 'index', '?m=admin&c=index&a=login', '', 0, 'admin', '127.0.0.1', '2014-09-03 09:10:32'),
(1335, '', 0, 'admin', '', 'category', '?m=admin&c=category&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:26:25'),
(1336, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:32:45'),
(1337, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:33:19'),
(1338, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:33:37'),
(1339, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:33:43'),
(1340, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:34:11'),
(1341, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:34:34'),
(1342, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:34:39'),
(1343, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=add', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:34:57'),
(1344, '', 0, 'admin', '', 'position', '?m=admin&c=position&a=listorder', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:35:12'),
(1345, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:44:47'),
(1346, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:44:53'),
(1347, '', 0, 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', 1, 'admin', '127.0.0.1', '2014-09-03 09:45:18');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member`
-- 
-- 创建时间: 2014 年 08 月 19 日 15:27
-- 最后更新时间: 2014 年 08 月 19 日 15:29
-- 

DROP TABLE IF EXISTS `cban_member`;
CREATE TABLE IF NOT EXISTS `cban_member` (
  `userid` mediumint(8) unsigned NOT NULL auto_increment,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL default '',
  `password` char(32) NOT NULL default '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL default '0',
  `lastdate` int(10) unsigned NOT NULL default '0',
  `regip` char(15) NOT NULL default '',
  `lastip` char(15) NOT NULL default '',
  `loginnum` smallint(5) unsigned NOT NULL default '0',
  `email` char(32) NOT NULL default '',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `areaid` smallint(5) unsigned NOT NULL default '0',
  `amount` decimal(8,2) unsigned NOT NULL default '0.00',
  `point` smallint(5) unsigned NOT NULL default '0',
  `modelid` smallint(5) unsigned NOT NULL default '0',
  `message` tinyint(1) unsigned NOT NULL default '0',
  `islock` tinyint(1) unsigned NOT NULL default '0',
  `vip` tinyint(1) unsigned NOT NULL default '0',
  `overduedate` int(10) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '1',
  `connectid` char(40) NOT NULL default '',
  `from` char(10) NOT NULL default '',
  `mobile` char(11) NOT NULL default '',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `cban_member`
-- 

INSERT DELAYED IGNORE INTO `cban_member` (`userid`, `phpssouid`, `username`, `password`, `encrypt`, `nickname`, `regdate`, `lastdate`, `regip`, `lastip`, `loginnum`, `email`, `groupid`, `areaid`, `amount`, `point`, `modelid`, `message`, `islock`, `vip`, `overduedate`, `siteid`, `connectid`, `from`, `mobile`) VALUES 
(1, 1, 'sadff', 'c57c6183bf39a41f09e42baf5f81f035', 'AjeA6C', 'sadff', 1408416915, 1408416915, '127.0.0.1', '', 0, 'sadff@qq.com', 2, 0, 0.00, 0, 10, 0, 0, 0, 0, 1, '', '', ''),
(2, 3, 'hehe', '7f30f0b731b883d2aae66a4d4dddc366', '4sGUlJ', 'hehe', 1406013385, 1406013385, '127.0.0.1', '', 0, 'hehe@qq.com', 2, 0, 0.00, 0, 13, 0, 0, 0, 0, 1, '', '', ''),
(3, 4, 'haha', 'e7ab8954a1db823c792e28ff228ec5a5', 'WwKE4R', 'haha', 1407221679, 1407221679, '127.0.0.1', '', 0, 'haha@qq.com', 2, 0, 0.00, 0, 13, 0, 0, 0, 0, 1, '', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_detail`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 19 日 15:08
-- 

DROP TABLE IF EXISTS `cban_member_detail`;
CREATE TABLE IF NOT EXISTS `cban_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `birthday` date default NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_member_detail`
-- 

INSERT DELAYED IGNORE INTO `cban_member_detail` (`userid`, `birthday`) VALUES 
(4, '0000-00-00'),
(6, '0000-00-00'),
(11, '0000-00-00'),
(1, '0000-00-00');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_group`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:26
-- 

DROP TABLE IF EXISTS `cban_member_group`;
CREATE TABLE IF NOT EXISTS `cban_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL auto_increment,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL default '0',
  `allowvisit` tinyint(1) unsigned NOT NULL default '0',
  `allowpost` tinyint(1) unsigned NOT NULL default '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL default '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL default '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL default '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL default '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- 导出表中的数据 `cban_member_group`
-- 

INSERT DELAYED IGNORE INTO `cban_member_group` (`groupid`, `name`, `issystem`, `starnum`, `point`, `allowmessage`, `allowvisit`, `allowpost`, `allowpostverify`, `allowsearch`, `allowupgrade`, `allowsendmessage`, `allowpostnum`, `allowattachment`, `price_y`, `price_m`, `price_d`, `icon`, `usernamecolor`, `description`, `sort`, `disabled`) VALUES 
(8, '游客', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0.00, 0.00, 0.00, '', '', '', 0, 0),
(2, '新手上路', 1, 1, 50, 100, 0, 1, 0, 1, 0, 1, 0, 1, 50.00, 10.00, 1.00, '', '', '', 2, 0),
(6, '注册会员', 1, 2, 100, 150, 0, 1, 0, 0, 1, 1, 0, 0, 300.00, 30.00, 1.00, '', '', '', 6, 0),
(4, '中级会员', 1, 3, 150, 500, 1, 1, 0, 1, 1, 1, 0, 0, 500.00, 60.00, 1.00, '', '', '', 4, 0),
(5, '高级会员', 1, 5, 300, 999, 1, 1, 0, 1, 1, 1, 0, 0, 360.00, 90.00, 5.00, '', '', '', 5, 0),
(1, '禁止访问', 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0.00, 0.00, 0.00, '', '', '0', 0, 0),
(7, '邮件认证', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, 'images/group/vip.jpg', '#000000', '', 7, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_md`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 19 日 10:55
-- 

DROP TABLE IF EXISTS `cban_member_md`;
CREATE TABLE IF NOT EXISTS `cban_member_md` (
  `userid` mediumint(8) unsigned NOT NULL,
  `license` varchar(15) NOT NULL default '',
  `orgcode` varchar(15) NOT NULL default '',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_member_md`
-- 

INSERT DELAYED IGNORE INTO `cban_member_md` (`userid`, `license`, `orgcode`) VALUES 
(1, '', '22222'),
(5, 'lulu', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_menu`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:26
-- 

DROP TABLE IF EXISTS `cban_member_menu`;
CREATE TABLE IF NOT EXISTS `cban_member_menu` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` char(40) NOT NULL default '',
  `parentid` smallint(6) NOT NULL default '0',
  `m` char(20) NOT NULL default '',
  `c` char(20) NOT NULL default '',
  `a` char(20) NOT NULL default '',
  `data` char(100) NOT NULL default '',
  `listorder` smallint(6) unsigned NOT NULL default '0',
  `display` enum('1','0') NOT NULL default '1',
  `isurl` enum('1','0') NOT NULL default '0',
  `url` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `cban_member_menu`
-- 

INSERT DELAYED IGNORE INTO `cban_member_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `isurl`, `url`) VALUES 
(1, 'member_init', 0, 'member', 'index', 'init', 't=0', 0, '1', '', ''),
(2, 'account_manage', 0, 'member', 'index', 'account_manage', 't=1', 0, '1', '', ''),
(3, 'favorite', 0, 'member', 'index', 'favorite', 't=2', 0, '1', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_qy`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 19 日 14:57
-- 

DROP TABLE IF EXISTS `cban_member_qy`;
CREATE TABLE IF NOT EXISTS `cban_member_qy` (
  `userid` mediumint(8) unsigned NOT NULL,
  `license` varchar(15) NOT NULL default '',
  `orgcode` varchar(15) NOT NULL default '',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_member_qy`
-- 

INSERT DELAYED IGNORE INTO `cban_member_qy` (`userid`, `license`, `orgcode`) VALUES 
(2, '111111', ''),
(3, 'hahaha', ''),
(10, '111111', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_verify`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 19 日 15:32
-- 

DROP TABLE IF EXISTS `cban_member_verify`;
CREATE TABLE IF NOT EXISTS `cban_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL auto_increment,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL default '0',
  `point` smallint(5) unsigned NOT NULL default '0',
  `amount` decimal(8,2) unsigned NOT NULL default '0.00',
  `modelinfo` char(255) NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `siteid` tinyint(1) unsigned NOT NULL default '1',
  `message` char(100) default NULL,
  `mobile` char(11) NOT NULL default '',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `cban_member_verify`
-- 

INSERT DELAYED IGNORE INTO `cban_member_verify` (`userid`, `username`, `password`, `encrypt`, `nickname`, `regdate`, `regip`, `email`, `modelid`, `point`, `amount`, `modelinfo`, `status`, `siteid`, `message`, `mobile`) VALUES 
(1, 'hehe', '123456', '4sGUlJ', 'hehe', 1406013385, '127.0.0.1', 'hehe@qq.com', 13, 0, 0.00, 'array (\n  ''license'' => ''111111'',\n  ''orgcode'' => '''',\n)', 1, 1, '', ''),
(2, 'haha', '123456', 'WwKE4R', 'haha', 1407221679, '127.0.0.1', 'haha@qq.com', 13, 0, 0.00, 'array (\n  ''license'' => ''hahaha'',\n  ''orgcode'' => '''',\n)', 1, 1, '', ''),
(3, 'aaa', '123456', 'bDYZjt', 'aaa', 1407828770, '127.0.0.1', 'aaa@qq.com', 10, 0, 0.00, 'array (\n  ''birthday'' => '''',\n)', 0, 1, '', ''),
(4, 'lulu', '123456', 'QTD3fb', 'lulu', 1408416895, '127.0.0.1', 'lulu@qq.com', 12, 0, 0.00, 'array (\n  ''license'' => ''lulu'',\n  ''orgcode'' => '''',\n)', 0, 1, '', ''),
(5, 'sadff', '123456', 'AjeA6C', 'sadff', 1408416915, '127.0.0.1', 'sadff@qq.com', 10, 0, 0.00, 'array (\n  ''birthday'' => '''',\n)', 0, 1, '', ''),
(6, 'nimaB', '123456', 'w1FIKE', 'nimaB', 1408430093, '127.0.0.1', 'nimaB@qq.com', 10, 0, 0.00, 'array (\n  ''birthday'' => '''',\n)', 0, 1, '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_member_vip`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_member_vip`;
CREATE TABLE IF NOT EXISTS `cban_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL default '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_member_vip`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_menu`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 最后检查时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_menu`;
CREATE TABLE IF NOT EXISTS `cban_menu` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` char(40) NOT NULL default '',
  `parentid` smallint(6) NOT NULL default '0',
  `m` char(20) NOT NULL default '',
  `c` char(20) NOT NULL default '',
  `a` char(20) NOT NULL default '',
  `data` char(100) NOT NULL default '',
  `listorder` smallint(6) unsigned NOT NULL default '0',
  `display` enum('1','0') NOT NULL default '1',
  `project1` tinyint(1) unsigned NOT NULL default '1',
  `project2` tinyint(1) unsigned NOT NULL default '1',
  `project3` tinyint(1) unsigned NOT NULL default '1',
  `project4` tinyint(1) unsigned NOT NULL default '1',
  `project5` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1580 ;

-- 
-- 导出表中的数据 `cban_menu`
-- 

INSERT DELAYED IGNORE INTO `cban_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`, `project2`, `project3`, `project4`, `project5`) VALUES 
(1, 'sys_setting', 0, 'admin', 'setting', 'init', '', 1, '1', 0, 1, 1, 1, 1),
(2, 'module', 0, 'admin', 'module', 'init', '', 2, '1', 1, 1, 1, 1, 1),
(872, 'sync_release_point', 873, 'release', 'index', 'init', '', 3, '1', 1, 1, 1, 1, 1),
(4, 'content', 0, 'content', 'content', 'init', '', 4, '1', 1, 1, 1, 1, 1),
(5, 'members', 0, 'member', 'member', 'init', '', 5, '1', 1, 1, 1, 1, 1),
(6, 'userinterface', 0, 'template', 'style', 'init', '', 6, '1', 0, 1, 1, 1, 1),
(30, 'correlative_setting', 1, 'admin', 'admin', 'admin', '', 0, '1', 1, 1, 1, 1, 1),
(31, 'menu_manage', 977, 'admin', 'menu', 'init', '', 8, '1', 1, 1, 1, 1, 1),
(32, 'posid_manage', 975, 'admin', 'position', 'init', '', 7, '1', 1, 1, 1, 1, 1),
(29, 'module_manage', 2, 'admin', 'module', '', '', 0, '1', 1, 1, 1, 1, 1),
(10, 'panel', 0, 'admin', 'index', 'public_main', '', 0, '1', 0, 1, 1, 1, 1),
(35, 'menu_add', 31, 'admin', 'menu', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(826, 'template_manager', 6, '', '', '', '', 0, '1', 1, 1, 1, 1, 1),
(54, 'admin_manage', 49, 'admin', 'admin_manage', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(43, 'category_manage', 975, 'admin', 'category', 'init', 'module=admin', 4, '1', 1, 1, 1, 1, 1),
(42, 'add_category', 43, 'admin', 'category', 'add', 's=0', 1, '1', 1, 1, 1, 1, 1),
(44, 'edit_category', 43, 'admin', 'category', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(45, 'badword_manage', 977, 'admin', 'badword', 'init', '', 10, '1', 1, 1, 1, 1, 1),
(46, 'posid_add', 32, 'admin', 'position', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(49, 'admin_setting', 1, 'admin', '', '', '', 0, '1', 1, 1, 1, 1, 1),
(50, 'role_manage', 49, 'admin', 'role', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(51, 'role_add', 50, 'admin', 'role', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(52, 'category_cache', 43, 'admin', 'category', 'public_cache', 'module=admin', 4, '1', 1, 1, 1, 1, 1),
(55, 'manage_member', 5, 'member', 'member', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(58, 'admin_add', 54, 'admin', 'admin_manage', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(59, 'model_manage', 975, 'content', 'sitemodel', 'init', '', 5, '1', 1, 1, 1, 1, 1),
(64, 'site_management', 30, 'admin', 'site', 'init', '', 2, '1', 1, 1, 1, 1, 1),
(81, 'member_add', 72, 'member', 'member', 'add', '', 2, '0', 1, 1, 1, 1, 1),
(62, 'add_model', 59, 'content', 'sitemodel', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(65, 'release_point_management', 30, 'admin', 'release_point', 'init', '', 3, '1', 1, 1, 1, 1, 1),
(66, 'badword_export', 45, 'admin', 'badword', 'export', '', 0, '1', 1, 1, 1, 1, 1),
(67, 'add_site', 64, 'admin', 'site', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(68, 'badword_import', 45, 'admin', 'badword', 'import', '', 0, '1', 1, 1, 1, 1, 1),
(812, 'member_group_manage', 76, 'member', 'member_group', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(74, 'member_verify', 55, 'member', 'member_verify', 'manage', 's=0', 3, '1', 1, 1, 1, 1, 1),
(76, 'manage_member_group', 5, 'member', 'member_group', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(77, 'manage_member_model', 5, 'member', 'member_model', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(78, 'member_group_add', 812, 'member', 'member_group', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(79, 'member_model_add', 813, 'member', 'member_model', 'add', '', 1, '0', 1, 1, 1, 1, 1),
(80, 'member_model_import', 77, 'member', 'member_model', 'import', '', 2, '0', 1, 1, 1, 1, 1),
(72, 'member_manage', 55, 'member', 'member', 'manage', '', 1, '1', 1, 1, 1, 1, 1),
(813, 'member_model_manage', 77, 'member', 'member_model', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(814, 'site_edit', 64, 'admin', 'site', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(815, 'site_del', 64, 'admin', 'site', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(816, 'release_point_add', 65, 'admin', 'release_point', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(817, 'release_point_del', 65, 'admin', 'release_point', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(818, 'release_point_edit', 65, 'admin', 'release_point', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(821, 'content_publish', 4, 'content', 'content', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(822, 'content_manage', 821, 'content', 'content', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(867, 'linkage', 977, 'admin', 'linkage', 'init', '', 13, '1', 1, 1, 1, 1, 1),
(827, 'template_style', 826, 'template', 'style', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(828, 'import_style', 827, 'template', 'style', 'import', '', 0, '0', 1, 1, 1, 1, 1),
(831, 'template_export', 827, 'template', 'style', 'export', '', 0, '0', 1, 1, 1, 1, 1),
(830, 'template_file', 827, 'template', 'file', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(832, 'template_onoff', 827, 'template', 'style', 'disable', '', 0, '0', 1, 1, 1, 1, 1),
(833, 'template_updatename', 827, 'template', 'style', 'updatename', '', 0, '0', 1, 1, 1, 1, 1),
(834, 'member_lock', 72, 'member', 'member', 'lock', '', 0, '0', 1, 1, 1, 1, 1),
(835, 'member_unlock', 72, 'member', 'member', 'unlock', '', 0, '0', 1, 1, 1, 1, 1),
(836, 'member_move', 72, 'member', 'member', 'move', '', 0, '0', 1, 1, 1, 1, 1),
(837, 'member_delete', 72, 'member', 'member', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(842, 'verify_ignore', 74, 'member', 'member_verify', 'manage', 's=2', 0, '1', 1, 1, 1, 1, 1),
(839, 'member_setting', 55, 'member', 'member_setting', 'manage', '', 4, '1', 1, 1, 1, 1, 1),
(841, 'verify_pass', 74, 'member', 'member_verify', 'manage', 's=1', 0, '1', 1, 1, 1, 1, 1),
(843, 'verify_delete', 74, 'member', 'member_verify', 'manage', 's=3', 0, '0', 1, 1, 1, 1, 1),
(844, 'verify_deny', 74, 'member', 'member_verify', 'manage', 's=4', 0, '1', 1, 1, 1, 1, 1),
(845, 'never_pass', 74, 'member', 'member_verify', 'manage', 's=5', 0, '1', 1, 1, 1, 1, 1),
(846, 'template_file_list', 827, 'template', 'file', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(847, 'template_file_edit', 827, 'template', 'file', 'edit_file', '', 0, '0', 1, 1, 1, 1, 1),
(848, 'file_add_file', 827, 'template', 'file', 'add_file', '', 0, '0', 1, 1, 1, 1, 1),
(850, 'listorder', 76, 'member', 'member_group', 'sort', '', 0, '0', 1, 1, 1, 1, 1),
(852, 'priv_setting', 50, 'admin', 'role', 'priv_setting', '', 0, '0', 1, 1, 1, 1, 1),
(853, 'role_priv', 50, 'admin', 'role', 'role_priv', '', 0, '0', 1, 1, 1, 1, 1),
(857, 'attachment_manage', 821, 'attachment', 'manage', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(868, 'special', 821, 'special', 'special', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(869, 'template_editor', 827, 'template', 'file', 'edit_file', '', 0, '0', 1, 1, 1, 1, 1),
(870, 'template_visualization', 827, 'template', 'file', 'visualization', '', 0, '0', 1, 1, 1, 1, 1),
(871, 'pc_tag_edit', 827, 'template', 'file', 'edit_pc_tag', '', 0, '0', 1, 1, 1, 1, 1),
(873, 'release_manage', 4, 'release', 'html', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(874, 'type_manage', 975, 'content', 'type_manage', 'init', '', 6, '1', 1, 1, 1, 1, 1),
(875, 'add_type', 874, 'content', 'type_manage', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(876, 'linkageadd', 867, 'admin', 'linkage', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(877, 'failure_list', 872, 'release', 'index', 'failed', '', 0, '1', 1, 1, 1, 1, 1),
(879, 'member_search', 72, 'member', 'member', 'search', '', 0, '0', 1, 1, 1, 1, 1),
(880, 'queue_del', 872, 'release', 'index', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(881, 'member_model_delete', 813, 'member', 'member_model', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(882, 'member_model_edit', 813, 'member', 'member_model', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(885, 'workflow', 977, 'content', 'workflow', 'init', '', 15, '1', 1, 1, 1, 1, 1),
(888, 'add_workflow', 885, 'content', 'workflow', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(889, 'member_modelfield_add', 813, 'member', 'member_modelfield', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(890, 'member_modelfield_edit', 813, 'member', 'member_modelfield', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(891, 'member_modelfield_delete', 813, 'member', 'member_modelfield', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(892, 'member_modelfield_manage', 813, 'member', 'member_modelfield', 'manage', '', 0, '0', 1, 1, 1, 1, 1),
(895, 'sitemodel_import', 59, 'content', 'sitemodel', 'import', '', 0, '1', 1, 1, 1, 1, 1),
(896, 'pay', 29, 'pay', 'payment', 'pay_list', 's=3', 0, '1', 1, 1, 1, 1, 1),
(897, 'payments', 896, 'pay', 'payment', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(898, 'paylist', 896, 'pay', 'payment', 'pay_list', '', 0, '1', 1, 1, 1, 1, 1),
(899, 'add_content', 822, 'content', 'content', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(900, 'modify_deposit', 896, 'pay', 'payment', 'modify_deposit', 's=1', 0, '1', 1, 1, 1, 1, 1),
(901, 'check_content', 822, 'content', 'content', 'pass', '', 0, '0', 1, 1, 1, 1, 1),
(902, 'dbsource', 29, 'dbsource', 'data', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(905, 'create_content_html', 873, 'content', 'create_html', 'show', '', 2, '1', 1, 1, 1, 1, 1),
(904, 'external_data_sources', 902, 'dbsource', 'dbsource_admin', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(906, 'update_urls', 873, 'content', 'create_html', 'update_urls', '', 1, '1', 1, 1, 1, 1, 1),
(960, 'node_add', 957, 'collection', 'node', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(909, 'fulltext_search', 29, 'search', 'search_type', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(910, 'manage_type', 909, 'search', 'search_type', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(911, 'search_setting', 909, 'search', 'search_admin', 'setting', '', 0, '1', 1, 1, 1, 1, 1),
(912, 'createindex', 909, 'search', 'search_admin', 'createindex', '', 0, '1', 1, 1, 1, 1, 1),
(913, 'add_search_type', 909, 'search', 'search_type', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(914, 'database_toos', 977, 'admin', 'database', 'export', '', 6, '1', 1, 1, 1, 1, 1),
(915, 'database_export', 914, 'admin', 'database', 'export', '', 0, '1', 1, 1, 1, 1, 1),
(916, 'database_import', 914, 'admin', 'database', 'import', '', 0, '1', 1, 1, 1, 1, 1),
(917, 'dbsource_add', 902, 'dbsource', 'dbsource_admin', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(918, 'dbsource_edit', 902, 'dbsource', 'dbsource_admin', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(919, 'dbsource_del', 902, 'dbsource', 'dbsource_admin', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(920, 'dbsource_data_add', 902, 'dbsource', 'data', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(921, 'dbsource_data_edit', 902, 'dbsource', 'data', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(922, 'dbsource_data_del', 902, 'dbsource', 'data', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(926, 'add_special', 868, 'special', 'special', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(927, 'edit_special', 868, 'special', 'special', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(928, 'special_list', 868, 'special', 'special', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(929, 'special_elite', 868, 'special', 'special', 'elite', '', 0, '0', 1, 1, 1, 1, 1),
(930, 'delete_special', 868, 'special', 'special', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(931, 'badword_add', 45, 'admin', 'badword', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(932, 'badword_edit', 45, 'admin', 'badword', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(933, 'badword_delete', 45, 'admin', 'badword', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(934, 'special_listorder', 868, 'special', 'special', 'listorder', '', 0, '0', 1, 1, 1, 1, 1),
(935, 'special_content_list', 868, 'special', 'content', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(936, 'special_content_add', 935, 'special', 'content', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(937, 'special_content_list', 935, 'special', 'content', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(938, 'special_content_edit', 935, 'special', 'content', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(939, 'special_content_delete', 935, 'special', 'content', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(940, 'special_content_listorder', 935, 'special', 'content', 'listorder', '', 0, '0', 1, 1, 1, 1, 1),
(941, 'special_content_import', 935, 'special', 'special', 'import', '', 0, '0', 1, 1, 1, 1, 1),
(942, 'history_version', 827, 'template', 'template_bak', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(943, 'restore_version', 827, 'template', 'template_bak', 'restore', '', 0, '0', 1, 1, 1, 1, 1),
(944, 'del_history_version', 827, 'template', 'template_bak', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(945, 'block', 821, 'block', 'block_admin', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(946, 'block_add', 945, 'block', 'block_admin', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(950, 'block_edit', 945, 'block', 'block_admin', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(951, 'block_del', 945, 'block', 'block_admin', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(952, 'block_update', 945, 'block', 'block_admin', 'block_update', '', 0, '0', 1, 1, 1, 1, 1),
(953, 'block_restore', 945, 'block', 'block_admin', 'history_restore', '', 0, '0', 1, 1, 1, 1, 1),
(954, 'history_del', 945, 'block', 'block_admin', 'history_del', '', 0, '0', 1, 1, 1, 1, 1),
(978, 'urlrule_manage', 977, 'admin', 'urlrule', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(957, 'collection_node', 821, 'collection', 'node', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(979, 'safe_config', 30, 'admin', 'setting', 'init', '&tab=2', 11, '1', 1, 1, 1, 1, 1),
(959, 'basic_config', 30, 'admin', 'setting', 'init', '', 10, '1', 1, 1, 1, 1, 1),
(961, 'position_edit', 32, 'admin', 'position', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(962, 'collection_node_edit', 957, 'collection', 'node', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(963, 'collection_node_delete', 957, 'collection', 'node', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(990, 'col_url_list', 957, 'collection', 'node', 'col_url_list', '', 0, '0', 1, 1, 1, 1, 1),
(965, 'collection_node_publish', 957, 'collection', 'node', 'publist', '', 0, '0', 1, 1, 1, 1, 1),
(966, 'collection_node_import', 957, 'collection', 'node', 'node_import', '', 0, '0', 1, 1, 1, 1, 1),
(967, 'collection_node_export', 957, 'collection', 'node', 'export', '', 0, '0', 1, 1, 1, 1, 1),
(968, 'collection_node_collection_content', 957, 'collection', 'node', 'col_content', '', 0, '0', 1, 1, 1, 1, 1),
(969, 'googlesitemap', 977, 'admin', 'googlesitemap', 'set', '', 11, '1', 1, 1, 1, 1, 1),
(970, 'admininfo', 10, 'admin', 'admin_manage', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(971, 'editpwd', 970, 'admin', 'admin_manage', 'public_edit_pwd', '', 1, '1', 1, 1, 1, 1, 1),
(972, 'editinfo', 970, 'admin', 'admin_manage', 'public_edit_info', '', 0, '1', 1, 1, 1, 1, 1),
(973, 'keylink', 977, 'admin', 'keylink', 'init', '', 12, '1', 1, 1, 1, 1, 1),
(974, 'add_keylink', 973, 'admin', 'keylink', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(975, 'content_settings', 4, 'content', 'content_settings', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(7, 'extend', 0, 'admin', 'extend', 'init_extend', '', 7, '1', 0, 1, 1, 1, 1),
(977, 'extend_all', 7, 'admin', 'extend_all', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(980, 'sso_config', 30, 'admin', 'setting', 'init', '&tab=3', 12, '1', 1, 1, 1, 1, 1),
(981, 'email_config', 30, 'admin', 'setting', 'init', '&tab=4', 13, '1', 1, 1, 1, 1, 1),
(982, 'module_manage', 29, 'admin', 'module', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(983, 'ipbanned', 977, 'admin', 'ipbanned', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(984, 'add_ipbanned', 983, 'admin', 'ipbanned', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(993, 'collection_content_import', 957, 'collection', 'node', 'import', '', 0, '0', 1, 1, 1, 1, 1),
(991, 'copy_node', 957, 'collection', 'node', 'copy', '', 0, '0', 1, 1, 1, 1, 1),
(992, 'content_del', 957, 'collection', 'node', 'content_del', '', 0, '0', 1, 1, 1, 1, 1),
(989, 'downsites', 977, 'admin', 'downservers', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(994, 'import_program_add', 957, 'collection', 'node', 'import_program_add', '', 0, '0', 1, 1, 1, 1, 1),
(995, 'import_program_del', 957, 'collection', 'node', 'import_program_del', '', 0, '0', 1, 1, 1, 1, 1),
(996, 'import_content', 957, 'collection', 'node', 'import_content', '', 0, '0', 1, 1, 1, 1, 1),
(997, 'log', 977, 'admin', 'log', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(998, 'add_page', 43, 'admin', 'category', 'add', 's=1', 2, '1', 1, 1, 1, 1, 1),
(999, 'add_cat_link', 43, 'admin', 'category', 'add', 's=2', 2, '1', 1, 1, 1, 1, 1),
(1000, 'count_items', 43, 'admin', 'category', 'count_items', '', 5, '1', 1, 1, 1, 1, 1),
(1001, 'cache_all', 977, 'admin', 'cache_all', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1002, 'create_list_html', 873, 'content', 'create_html', 'category', '', 0, '1', 1, 1, 1, 1, 1),
(1003, 'create_html_quick', 10, 'content', 'create_html_opt', 'index', '', 0, '1', 1, 1, 1, 1, 1),
(1004, 'create_index', 1003, 'content', 'create_html', 'public_index', '', 0, '1', 1, 1, 1, 1, 1),
(1005, 'scan', 977, 'scan', 'index', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1006, 'scan_report', 1005, 'scan', 'index', 'scan_report', '', 0, '1', 1, 1, 1, 1, 1),
(1007, 'md5_creat', 1005, 'scan', 'index', 'md5_creat', '', 0, '1', 1, 1, 1, 1, 1),
(1008, 'album_import', 868, 'special', 'album', 'import', '', 0, '1', 1, 1, 1, 1, 1),
(8, 'phpsso', 0, 'admin', 'phpsso', 'menu', '', 7, '1', 0, 1, 1, 1, 1),
(1011, 'edit_content', 822, 'content', 'content', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1012, 'push_to_special', 822, 'content', 'push', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(1023, 'delete_log', 997, 'admin', 'log', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1024, 'delete_ip', 983, 'admin', 'ipbanned', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1026, 'delete_keylink', 973, 'admin', 'keylink', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1027, 'edit_keylink', 973, 'admin', 'keylink', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1034, 'operation_pass', 74, 'member', 'member_verify', 'pass', '', 0, '0', 1, 1, 1, 1, 1),
(1035, 'operation_delete', 74, 'member', 'member_verify', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1039, 'operation_ignore', 74, 'member', 'member_verify', 'ignore', '', 0, '0', 1, 1, 1, 1, 1),
(1038, 'settingsave', 30, 'admin', 'setting', 'save', '', 0, '0', 1, 1, 1, 1, 1),
(1040, 'admin_edit', 54, 'admin', 'admin_manage', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1041, 'operation_reject', 74, 'member', 'member_verify', 'reject', '', 0, '0', 1, 1, 1, 1, 1),
(1042, 'admin_delete', 54, 'admin', 'admin_manage', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1043, 'card', 54, 'admin', 'admin_manage', 'card', '', 0, '0', 1, 1, 1, 1, 1),
(1044, 'creat_card', 54, 'admin', 'admin_manage', 'creat_card', '', 0, '0', 1, 1, 1, 1, 1),
(1045, 'remove_card', 54, 'admin', 'admin_manage', 'remove_card', '', 0, '0', 1, 1, 1, 1, 1),
(1049, 'member_group_edit', 812, 'member', 'member_group', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1048, 'member_edit', 72, 'member', 'member', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1050, 'role_edit', 50, 'admin', 'role', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1051, 'member_group_delete', 812, 'member', 'member_group', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1052, 'member_manage', 50, 'admin', 'role', 'member_manage', '', 0, '0', 1, 1, 1, 1, 1),
(1053, 'role_delete', 50, 'admin', 'role', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1054, 'member_model_export', 77, 'member', 'member_model', 'export', '', 0, '0', 1, 1, 1, 1, 1),
(1055, 'member_model_sort', 77, 'member', 'member_model', 'sort', '', 0, '0', 1, 1, 1, 1, 1),
(1056, 'member_model_move', 77, 'member', 'member_model', 'move', '', 0, '0', 1, 1, 1, 1, 1),
(1057, 'payment_add', 897, 'pay', 'payment', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1058, 'payment_delete', 897, 'pay', 'payment', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1059, 'payment_edit', 897, 'pay', 'payment', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1060, 'spend_record', 896, 'pay', 'spend', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1061, 'pay_stat', 896, 'pay', 'payment', 'pay_stat', '', 0, '1', 1, 1, 1, 1, 1),
(1062, 'fields_manage', 59, 'content', 'sitemodel_field', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(1063, 'edit_model_content', 59, 'content', 'sitemodel', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1064, 'disabled_model', 59, 'content', 'sitemodel', 'disabled', '', 0, '0', 1, 1, 1, 1, 1),
(1065, 'delete_model', 59, 'content', 'sitemodel', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1066, 'export_model', 59, 'content', 'sitemodel', 'export', '', 0, '0', 1, 1, 1, 1, 1),
(1067, 'delete', 874, 'content', 'type_manage', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1068, 'edit', 874, 'content', 'type_manage', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1069, 'add_urlrule', 978, 'admin', 'urlrule', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1070, 'edit_urlrule', 978, 'admin', 'urlrule', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1071, 'delete_urlrule', 978, 'admin', 'urlrule', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1072, 'edit_menu', 31, 'admin', 'menu', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1073, 'delete_menu', 31, 'admin', 'menu', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1074, 'edit_workflow', 885, 'content', 'workflow', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1075, 'delete_workflow', 885, 'content', 'workflow', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1076, 'creat_html', 868, 'special', 'special', 'html', '', 0, '1', 1, 1, 1, 1, 1),
(1093, 'connect_config', 30, 'admin', 'setting', 'init', '&tab=5', 14, '1', 1, 1, 1, 1, 1),
(1102, 'view_modelinfo', 74, 'member', 'member_verify', 'modelinfo', '', 0, '0', 1, 1, 1, 1, 1),
(1202, 'create_special_list', 868, 'special', 'special', 'create_special_list', '', 0, '1', 1, 1, 1, 1, 1),
(1240, 'view_memberlinfo', 72, 'member', 'member', 'memberinfo', '', 0, '0', 1, 1, 1, 1, 1),
(1239, 'copyfrom_manage', 977, 'admin', 'copyfrom', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1241, 'move_content', 822, 'content', 'content', 'remove', '', 0, '0', 1, 1, 1, 1, 1),
(1242, 'poster_template', 56, 'poster', 'space', 'poster_template', '', 0, '1', 1, 1, 1, 1, 1),
(1243, 'create_index', 873, 'content', 'create_html', 'public_index', '', 0, '1', 1, 1, 1, 1, 1),
(1244, 'add_othors', 822, 'content', 'content', 'add_othors', '', 0, '1', 1, 1, 1, 1, 1),
(1295, 'attachment_manager_dir', 857, 'attachment', 'manage', 'dir', '', 2, '1', 1, 1, 1, 1, 1),
(1296, 'attachment_manager_db', 857, 'attachment', 'manage', 'init', '', 1, '1', 1, 1, 1, 1, 1),
(1346, 'attachment_address_replace', 857, 'attachment', 'address', 'init', '', 3, '1', 1, 1, 1, 1, 1),
(1347, 'attachment_address_update', 857, 'attachment', 'address', 'update', '', 0, '0', 1, 1, 1, 1, 1),
(1348, 'delete_content', 822, 'content', 'content', 'delete', '', 0, '1', 1, 1, 1, 1, 1),
(1349, 'member_menu_manage', 977, 'member', 'member_menu', 'manage', '', 0, '1', 1, 1, 1, 1, 1),
(1350, 'member_menu_add', 1349, 'member', 'member_menu', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(1351, 'member_menu_edit', 1349, 'member', 'member_menu', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1352, 'member_menu_delete', 1349, 'member', 'member_menu', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1353, 'batch_show', 822, 'content', 'create_html', 'batch_show', '', 0, '1', 1, 1, 1, 1, 1),
(1354, 'pay_delete', 898, 'pay', 'payment', 'pay_del', '', 0, '0', 1, 1, 1, 1, 1),
(1355, 'pay_cancel', 898, 'pay', 'payment', 'pay_cancel', '', 0, '0', 1, 1, 1, 1, 1),
(1356, 'discount', 898, 'pay', 'payment', 'discount', '', 0, '0', 1, 1, 1, 1, 1),
(1360, 'category_batch_edit', 43, 'admin', 'category', 'batch_edit', '', 6, '1', 1, 1, 1, 1, 1),
(1500, 'listorder', 822, 'content', 'content', 'listorder', '', 0, '0', 1, 1, 1, 1, 1),
(1501, 'a_clean_data', 873, 'content', 'content', 'clear_data', '', 0, '1', 0, 0, 0, 0, 0),
(1502, 'announce', 29, 'announce', 'admin_announce', 'init', 's=1', 0, '1', 1, 1, 1, 1, 1),
(1503, 'announce_add', 1502, 'announce', 'admin_announce', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1504, 'edit_announce', 1502, 'announce', 'admin_announce', 'edit', 's=1', 0, '0', 1, 1, 1, 1, 1),
(1505, 'check_announce', 1502, 'announce', 'admin_announce', 'init', 's=2', 0, '1', 1, 1, 1, 1, 1),
(1506, 'overdue', 1502, 'announce', 'admin_announce', 'init', 's=3', 0, '1', 1, 1, 1, 1, 1),
(1507, 'del_announce', 1502, 'announce', 'admin_announce', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1508, 'comment', 29, 'comment', 'comment_admin', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1509, 'comment_manage', 821, 'comment', 'comment_admin', 'listinfo', '', 0, '1', 1, 1, 1, 1, 1),
(1510, 'comment_check', 1509, 'comment', 'check', 'checks', '', 0, '1', 1, 1, 1, 1, 1),
(1511, 'comment_list', 1508, 'comment', 'comment_admin', 'lists', '', 0, '0', 1, 1, 1, 1, 1),
(1512, 'link', 29, 'link', 'link', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1513, 'add_link', 1512, 'link', 'link', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1514, 'edit_link', 1512, 'link', 'link', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1515, 'delete_link', 1512, 'link', 'link', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1516, 'link_setting', 1512, 'link', 'link', 'setting', '', 0, '1', 1, 1, 1, 1, 1),
(1517, 'add_type', 1512, 'link', 'link', 'add_type', '', 0, '1', 1, 1, 1, 1, 1),
(1518, 'list_type', 1512, 'link', 'link', 'list_type', '', 0, '1', 1, 1, 1, 1, 1),
(1519, 'check_register', 1512, 'link', 'link', 'check_register', '', 0, '1', 1, 1, 1, 1, 1),
(1520, 'vote', 29, 'vote', 'vote', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1521, 'add_vote', 1520, 'vote', 'vote', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1522, 'edit_vote', 1520, 'vote', 'vote', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1523, 'delete_vote', 1520, 'vote', 'vote', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1524, 'vote_setting', 1520, 'vote', 'vote', 'setting', '', 0, '1', 1, 1, 1, 1, 1),
(1525, 'statistics_vote', 1520, 'vote', 'vote', 'statistics', '', 0, '0', 1, 1, 1, 1, 1),
(1526, 'statistics_userlist', 1520, 'vote', 'vote', 'statistics_userlist', '', 0, '0', 1, 1, 1, 1, 1),
(1527, 'create_js', 1520, 'vote', 'vote', 'create_js', '', 0, '1', 1, 1, 1, 1, 1),
(1528, 'message', 29, 'message', 'message', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1529, 'send_one', 1528, 'message', 'message', 'send_one', '', 0, '1', 1, 1, 1, 1, 1),
(1530, 'delete_message', 1528, 'message', 'message', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1531, 'message_send', 1528, 'message', 'message', 'message_send', '', 0, '0', 1, 1, 1, 1, 1),
(1532, 'message_group_manage', 1528, 'message', 'message', 'message_group_manage', '', 0, '1', 1, 1, 1, 1, 1),
(1533, 'mood', 29, 'mood', 'mood_admin', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1534, 'mood_setting', 1533, 'mood', 'mood_admin', 'setting', '', 0, '1', 1, 1, 1, 1, 1),
(1535, 'poster', 29, 'poster', 'space', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1536, 'add_space', 1535, 'poster', 'space', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1537, 'edit_space', 1535, 'poster', 'space', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1538, 'del_space', 1535, 'poster', 'space', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1539, 'poster_list', 1535, 'poster', 'poster', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(1540, 'add_poster', 1535, 'poster', 'poster', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1541, 'edit_poster', 1535, 'poster', 'poster', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1542, 'del_poster', 1535, 'poster', 'poster', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1543, 'poster_stat', 1535, 'poster', 'poster', 'stat', '', 0, '0', 1, 1, 1, 1, 1),
(1544, 'poster_setting', 1535, 'poster', 'space', 'setting', '', 0, '0', 1, 1, 1, 1, 1),
(1545, 'create_poster_js', 1535, 'poster', 'space', 'create_js', '', 0, '1', 1, 1, 1, 1, 1),
(1546, 'poster_template', 1535, 'poster', 'space', 'poster_template', '', 0, '1', 1, 1, 1, 1, 1),
(1547, 'formguide', 29, 'formguide', 'formguide', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1548, 'formguide_add', 1547, 'formguide', 'formguide', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1549, 'formguide_edit', 1547, 'formguide', 'formguide', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1550, 'form_info_list', 1547, 'formguide', 'formguide_info', 'init', '', 0, '0', 1, 1, 1, 1, 1),
(1551, 'formguide_disabled', 1547, 'formguide', 'formguide', 'disabled', '', 0, '0', 1, 1, 1, 1, 1),
(1552, 'formguide_delete', 1547, 'formguide', 'formguide', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1553, 'formguide_stat', 1547, 'formguide', 'formguide', 'stat', '', 0, '0', 1, 1, 1, 1, 1),
(1554, 'add_public_field', 1547, 'formguide', 'formguide_field', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(1555, 'list_public_field', 1547, 'formguide', 'formguide_field', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1556, 'module_setting', 1547, 'formguide', 'formguide', 'setting', '', 0, '0', 1, 1, 1, 1, 1),
(1557, 'wap', 29, 'wap', 'wap_admin', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1558, 'wap_add', 1557, 'wap', 'wap_admin', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1559, 'wap_edit', 1557, 'wap', 'wap_admin', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1560, 'wap_delete', 1557, 'wap', 'wap_admin', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1561, 'wap_type_manage', 1557, 'wap', 'wap_admin', 'type_manage', '', 0, '0', 1, 1, 1, 1, 1),
(1562, 'wap_type_edit', 1557, 'wap', 'wap_admin', 'type_edit', '', 0, '0', 1, 1, 1, 1, 1),
(1563, 'wap_type_delete', 1557, 'wap', 'wap_admin', 'type_delete', '', 0, '0', 1, 1, 1, 1, 1),
(1564, 'upgrade', 977, 'upgrade', 'index', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1565, 'checkfile', 1564, 'upgrade', 'index', 'checkfile', '', 0, '1', 1, 1, 1, 1, 1),
(1566, 'tag', 826, 'tag', 'tag', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1567, 'add_tag', 1566, 'tag', 'tag', 'add', '', 0, '0', 1, 1, 1, 1, 1),
(1568, 'edit_tag', 1566, 'tag', 'tag', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1569, 'delete_tag', 1566, 'tag', 'tag', 'del', '', 0, '0', 1, 1, 1, 1, 1),
(1570, 'tag_lists', 1566, 'tag', 'tag', 'lists', '', 0, '0', 1, 1, 1, 1, 1),
(1571, 'sms', 29, 'sms', 'sms', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1572, 'sms_setting', 1571, 'sms', 'sms', 'sms_setting', '', 0, '1', 1, 1, 1, 1, 1),
(1573, 'sms_pay_history', 1571, 'sms', 'sms', 'sms_pay_history', '', 0, '1', 1, 1, 1, 1, 1),
(1574, 'sms_buy_history', 1571, 'sms', 'sms', 'sms_buy_history', '', 0, '1', 1, 1, 1, 1, 1),
(1575, 'sms_api', 1571, 'sms', 'sms', 'sms_api', '', 0, '1', 1, 1, 1, 1, 1),
(1576, 'sms_sent', 1571, 'sms', 'sms', 'sms_sent', '', 0, '1', 1, 1, 1, 1, 1),
(1577, 'cban', 0, 'cban', 'cban', 'cban', '', 0, '1', 1, 1, 1, 1, 1),
(1578, 'supply', 1577, 'cban', 'manage', 'supply_list', '', 0, '1', 1, 1, 1, 1, 1),
(1579, 'supply', 1578, 'cban', 'manage', 'supply_list', '', 0, '1', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_message`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_message`;
CREATE TABLE IF NOT EXISTS `cban_message` (
  `messageid` int(10) unsigned NOT NULL auto_increment,
  `send_from_id` char(30) NOT NULL default '0',
  `send_to_id` char(30) NOT NULL default '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL default '0',
  `message_time` int(10) unsigned NOT NULL default '0',
  `subject` char(80) default NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL default '0',
  `del_type` tinyint(1) unsigned default '0',
  PRIMARY KEY  (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- 
-- 导出表中的数据 `cban_message`
-- 

INSERT DELAYED IGNORE INTO `cban_message` (`messageid`, `send_from_id`, `send_to_id`, `folder`, `status`, `message_time`, `subject`, `content`, `replyid`, `del_type`) VALUES 
(1, 'SYSTEM', 'nima', 'inbox', 1, 1406038000, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：dfsadfasdf<BR><a href=''index.php?m=member&c=content&a=edit&catid=9&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0),
(2, 'SYSTEM', 'nima', 'inbox', 1, 1406038071, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：dfsadfasdf<BR><a href=''index.php?m=member&c=content&a=edit&catid=9&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0),
(3, 'SYSTEM', 'nima', 'inbox', 1, 1406122868, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：1234567<BR><a href=''index.php?m=member&c=content&a=edit&catid=9&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0),
(4, 'SYSTEM', 'nima', 'inbox', 1, 1406122964, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：1234567<BR><a href=''index.php?m=member&c=content&a=edit&catid=9&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0),
(5, 'SYSTEM', 'admin', 'inbox', 1, 1407422190, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：3333333333333<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=3''><font color=red>点击这里修改</font></a><br>', 0, 0),
(6, 'SYSTEM', 'admin', 'inbox', 1, 1407422190, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：2222222222<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=2''><font color=red>点击这里修改</font></a><br>', 0, 0),
(7, 'SYSTEM', 'admin', 'inbox', 1, 1407422190, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：11111111111<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0),
(8, 'SYSTEM', 'admin', 'inbox', 1, 1407423178, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：3333333333333<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=3''><font color=red>点击这里修改</font></a><br>', 0, 0),
(9, 'SYSTEM', 'admin', 'inbox', 1, 1407423178, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：2222222222<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=2''><font color=red>点击这里修改</font></a><br>', 0, 0),
(10, 'SYSTEM', 'admin', 'inbox', 1, 1407423178, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：11111111111<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0),
(11, 'SYSTEM', 'admin', 'inbox', 1, 1407423311, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：3333333333333<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=3''><font color=red>点击这里修改</font></a><br>', 0, 0),
(12, 'SYSTEM', 'admin', 'inbox', 1, 1407423311, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：2222222222<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=2''><font color=red>点击这里修改</font></a><br>', 0, 0),
(13, 'SYSTEM', 'admin', 'inbox', 1, 1407423311, '您的稿件被退回，请修改后重新提交', '您发送的投稿不满足我们的要求，请重新编辑投稿！<BR>标题：11111111111<BR><a href=''index.php?m=member&c=content&a=edit&catid=44&id=1''><font color=red>点击这里修改</font></a><br>', 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_message_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_message_data`;
CREATE TABLE IF NOT EXISTS `cban_message_data` (
  `id` int(4) NOT NULL auto_increment,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_message_data`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_message_group`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_message_group`;
CREATE TABLE IF NOT EXISTS `cban_message_group` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `groupid` tinyint(4) unsigned NOT NULL default '0' COMMENT '用户组id',
  `subject` char(80) default NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned default '0',
  `status` tinyint(2) unsigned default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_message_group`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_model`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_model`;
CREATE TABLE IF NOT EXISTS `cban_model` (
  `modelid` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `items` smallint(5) unsigned NOT NULL default '0',
  `enablesearch` tinyint(1) unsigned NOT NULL default '1',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY  (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- 
-- 导出表中的数据 `cban_model`
-- 

INSERT DELAYED IGNORE INTO `cban_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `admin_list_template`, `member_add_template`, `member_list_template`, `sort`, `type`) VALUES 
(1, 1, '文章模型', '', 'news', '', 0, 0, 1, 0, 'default', 'category', 'list', 'show', '', '', '', '', 0, 0),
(2, 1, '下载模型', '', 'download', '', 0, 0, 1, 0, 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', 0, 0),
(3, 1, '图片模型', '', 'picture', '', 0, 0, 1, 0, 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', 0, 0),
(10, 1, '普通会员', '普通会员', 'member_detail', '', 0, 0, 1, 0, '', '', '', '', '', '', '', '', 1, 2),
(11, 1, '视频模型', '', 'video', '', 0, 0, 1, 0, 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', 0, 0),
(12, 1, '门店会员', '门店会员', 'member_md', '', 0, 0, 1, 0, '', '', '', '', '', '', '', '', 2, 2),
(13, 1, '企业会员', '企业会员', 'member_qy', '', 0, 0, 1, 0, '', '', '', '', '', '', '', '', 3, 2),
(15, 1, '门店信息模型', '用户发布门店信息', 'news_md', '', 0, 0, 1, 0, 'cban', 'category', 'list', 'show', '', '', '', '', 0, 0),
(16, 1, '企业信息模型', '用户发布企业信息', 'news_qy', '', 0, 0, 1, 0, 'cban', 'category', 'list', 'show', '', '', '', '', 0, 0),
(17, 1, '展会信息模型', '', 'news_zhxx', '', 0, 0, 1, 0, '', '', '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_model_field`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 03 日 09:44
-- 最后检查时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_model_field`;
CREATE TABLE IF NOT EXISTS `cban_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL auto_increment,
  `modelid` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL default '0',
  `maxlength` int(10) unsigned NOT NULL default '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL default '0',
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  `isunique` tinyint(1) unsigned NOT NULL default '0',
  `isbase` tinyint(1) unsigned NOT NULL default '0',
  `issearch` tinyint(1) unsigned NOT NULL default '0',
  `isadd` tinyint(1) unsigned NOT NULL default '0',
  `isfulltext` tinyint(1) unsigned NOT NULL default '0',
  `isposition` tinyint(1) unsigned NOT NULL default '0',
  `listorder` mediumint(8) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=228 ;

-- 
-- 导出表中的数据 `cban_model_field`
-- 

INSERT DELAYED IGNORE INTO `cban_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES 
(1, 1, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(2, 1, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(3, 1, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(4, 1, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(5, 1, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0),
(6, 1, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0),
(7, 1, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(8, 1, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n</div>', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''0'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(9, 1, 1, 'voteid', '添加投票', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''text\\'' name=\\''info[voteid]\\'' id=\\''voteid\\'' value=\\''{FIELD_VALUE}\\'' size=\\''3\\''> \r\n<input type=\\''button\\'' value="选择已有投票" onclick="omnipotent(\\''selectid\\'',\\''?m=vote&c=vote&a=public_get_votelist&from_api=1\\'',\\''选择已有投票\\'')" class="button">\r\n<input type=\\''button\\'' value="新增投票" onclick="omnipotent(\\''addvote\\'',\\''?m=vote&c=vote&a=add&from_api=1\\'',\\''添加投票\\'',0)" class="button">'',\n  ''fieldtype'' => ''mediumint'',\n  ''minnumber'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 1, 0, 21, 1, 0),
(10, 1, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 1, 0),
(11, 1, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(12, 1, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(13, 1, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(14, 1, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', 'array (\n  ''minnumber'' => '''',\n  ''maxnumber'' => '''',\n  ''decimaldigits'' => ''0'',\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n  ''rangetype'' => ''0'',\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 51, 0, 0),
(15, 1, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(16, 1, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(17, 1, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 1, 0),
(18, 1, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 1, 0),
(19, 1, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 1, 0),
(20, 1, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 1, 0),
(21, 1, 1, 'copyfrom', '来源', '', '', 0, 100, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 1, 0),
(80, 1, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(22, 2, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(23, 2, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0),
(24, 2, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(25, 2, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0),
(26, 2, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0),
(27, 2, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(28, 2, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(29, 2, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(30, 2, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0),
(31, 2, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 1, 0),
(32, 2, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(33, 2, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(34, 2, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0),
(35, 2, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(36, 2, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0),
(37, 2, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(38, 2, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0),
(39, 2, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(40, 2, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0),
(41, 2, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(42, 2, 1, 'downfiles', '本地下载', '', '', 0, 0, '', '', 'downfiles', 'array (\n  ''upload_allowext'' => ''rar|zip'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''10'',\n  ''downloadlink'' => ''1'',\n  ''downloadtype'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0),
(43, 2, 1, 'downfile', '镜像下载', '', '', 0, 0, '', '', 'downfile', 'array (\n  ''downloadlink'' => ''1'',\n  ''downloadtype'' => ''1'',\n  ''upload_allowext'' => ''rar|zip'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 9, 0, 0),
(44, 2, 1, 'systems', '软件平台', '<select name=''selectSystem'' onchange="ChangeInput(this,document.myform.systems,''/'')">\r\n	<option value=''WinXP''>WinXP</option>\r\n	<option value=''Vista''>Windows 7</option>\r\n	<option value=''Win2000''>Win2000</option>\r\n	<option value=''Win2003''>Win2003</option>\r\n	<option value=''Unix''>Unix</option>\r\n	<option value=''Linux''>Linux</option>\r\n	<option value=''MacOS''>MacOS</option>\r\n</select>', '', 0, 100, '', '', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => ''Win2000/WinXP/Win2003'',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 14, 0, 0),
(45, 2, 1, 'copytype', '软件授权形式', '', '', 0, 15, '', '', 'box', 'array (\n  ''options'' => ''免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''免费版'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 12, 0, 0),
(46, 2, 1, 'language', '软件语言', '', '', 0, 16, '', '', 'box', 'array (\n  ''options'' => ''英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''简体中文'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 13, 0, 0),
(47, 2, 1, 'classtype', '软件类型', '', '', 0, 20, '', '', 'box', 'array (\n  ''options'' => ''国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''国产软件'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 17, 0, 0),
(48, 2, 1, 'version', '版本号', '', '', 0, 20, '', '', 'text', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 1, 0, 13, 0, 0),
(49, 2, 1, 'filesize', '文件大小', '', '', 0, 10, '', '', 'text', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => ''未知'',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 1, 0, 14, 0, 0),
(50, 2, 1, 'stars', '评分等级', '', '', 0, 20, '', '', 'box', 'array (\n  ''options'' => ''★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''★★★☆☆'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 17, 0, 0),
(51, 3, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0),
(52, 3, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(53, 3, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(54, 3, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0),
(55, 3, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(56, 3, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0),
(57, 3, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(58, 3, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(59, 3, 1, 'relation', '相关组图', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0),
(60, 3, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(61, 3, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 0, 999999, '', '', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(62, 3, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(63, 3, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0),
(64, 3, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(65, 3, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0),
(66, 3, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(67, 3, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(68, 3, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(69, 3, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0),
(70, 3, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(71, 3, 1, 'pictureurls', '组图', '', '', 0, 0, '', '', 'images', 'array (\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isselectimage'' => ''1'',\n  ''upload_number'' => ''50'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 15, 0, 0),
(72, 3, 1, 'copyfrom', '来源', '', '', 0, 0, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0),
(73, 1, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 1, 0),
(74, 2, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0),
(75, 3, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0),
(83, 10, 1, 'birthday', '生日', '', '', 0, 0, '', '生日格式错误', 'datetime', 'array (\n  ''fieldtype'' => ''date'',\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0),
(84, 11, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(85, 11, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(86, 11, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', 'array (\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(87, 11, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\n  ''size'' => ''100'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0),
(88, 11, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\n  ''width'' => ''98'',\n  ''height'' => ''46'',\n  ''defaultvalue'' => '''',\n  ''enablehtml'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0),
(89, 11, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''dateformat'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n  ''defaultvalue'' => '''',\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(90, 11, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 0, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''0'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(91, 11, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(92, 11, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0),
(93, 11, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', 'array (\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(94, 11, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(95, 11, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(96, 11, 1, 'groupids_view', '阅读权限', '', '', 0, 100, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0),
(97, 11, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(98, 11, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0),
(99, 11, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(100, 11, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0),
(101, 11, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(102, 11, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0),
(103, 11, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(104, 11, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', 'array (\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 20, 0, 0),
(105, 11, 1, 'video', '视频上传', '', '', 0, 0, '', '', 'video', 'array (\n  ''upload_allowext'' => ''flv|rm|mp4|rmv'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0),
(106, 11, 1, 'vision', '画质', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''高清|1\r\n普通|2'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''0'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''1'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 9, 0, 0),
(107, 11, 1, 'video_category', '视频分类', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''1'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 9, 0, 0),
(145, 15, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 95, 1, 0),
(144, 15, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 94, 0, 0),
(142, 15, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 93, 0, 0),
(143, 15, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 23, 0, 0),
(141, 15, 1, 'groupids_view', '阅读权限', '', '', 0, 100, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 91, 1, 0),
(140, 15, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 90, 0, 0),
(171, 12, 0, 'license', '营业执照', '', '', 0, 15, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(172, 12, 0, 'orgcode', '组织机构代码', '', '', 0, 15, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(173, 13, 0, 'license', '营业执照', '', '', 0, 15, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(174, 13, 0, 'orgcode', '组织机构代码', '', '', 0, 15, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(138, 15, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 89, 1, 0),
(139, 15, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 20, 0, 0),
(136, 15, 1, 'thumb', '缩略图', '将作为标题图片', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''0'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 22, 1, 0),
(135, 15, 1, 'content', '内容', '', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''0'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 19, 0, 0),
(227, 15, 1, 'image', '标题图片', '', '', 0, 0, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''0'',\n  ''upload_maxsize'' => '''',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 1, 15, 0, 0),
(134, 15, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 21, 0, 0),
(132, 15, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 4, 0, 0),
(133, 15, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\n  ''width'' => ''98'',\n  ''height'' => ''46'',\n  ''defaultvalue'' => '''',\n  ''enablehtml'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(131, 15, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(130, 15, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0),
(129, 15, 1, 'catid', '信息发布类型', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', '', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(146, 15, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 96, 0, 0),
(147, 15, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 97, 1, 0),
(148, 15, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(149, 15, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 92, 1, 0),
(150, 16, 1, 'catid', '信息发布类型', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', '', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(151, 16, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0),
(152, 16, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(153, 16, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 4, 0, 0),
(154, 16, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(155, 16, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 21, 0, 0),
(156, 16, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''0'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 19, 0, 0),
(157, 16, 1, 'thumb', '缩略图', '将作为标题图片', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 22, 1, 0),
(158, 16, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 24, 1, 0),
(159, 16, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 89, 1, 0),
(160, 16, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 20, 0, 0),
(161, 16, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 90, 0, 0),
(162, 16, 1, 'groupids_view', '阅读权限', '', '', 0, 100, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 91, 1, 0),
(163, 16, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 93, 0, 0),
(164, 16, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 23, 0, 0),
(165, 16, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 94, 0, 0),
(166, 16, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 95, 1, 0),
(167, 16, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 96, 0, 0),
(168, 16, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 97, 1, 0),
(169, 16, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(170, 16, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 92, 1, 0),
(175, 15, 1, 'diqu', '地区', '', '', 1, 0, '', '', 'linkage', 'array (\n  ''linkageid'' => ''1'',\n  ''showtype'' => ''0'',\n  ''space'' => '''',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 6, 0, 0),
(176, 16, 1, 'diqu', '地区', '', '', 1, 0, '', '', 'linkage', 'array (\n  ''linkageid'' => ''1'',\n  ''space'' => '''',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 6, 0, 0),
(177, 15, 1, 'add', '详细地址', '', '', 10, 100, '', '详细地址不能为空', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 7, 0, 0),
(178, 15, 1, 'lxr', '联系人', '', '', 4, 20, '', '联系人不能为空', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 8, 0, 0),
(180, 15, 1, 'dianhua', '门店电话', '', '', 8, 15, '/^[0-9-]{6,13}$/', '门店电话不能为空', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 9, 0, 0),
(184, 15, 1, 'fax', '传真', '', '', 0, 25, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 11, 0, 0),
(185, 15, 1, 'qq', 'QQ', '', '', 0, 15, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 12, 0, 0),
(183, 15, 1, 'tel', '联系人手机', '', '', 0, 11, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 10, 0, 0),
(186, 15, 1, 'weixin', '微信', '', '', 0, 25, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(187, 15, 1, 'service', '服务类型', '', '', 1, 1, '', '', 'box', 'array (\n  ''options'' => ''请选择\r\n销售类型|1\r\n支持维修|2'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => '''',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 14, 0, 0),
(188, 16, 1, 'add', '详细地址', '', '', 10, 100, '', '详细地址不能为空', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 7, 0, 0),
(189, 16, 1, 'lxr', '联系人', '', '', 4, 20, '', '联系人不能为空', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 8, 0, 0),
(190, 16, 1, 'dianhua', '企业电话', '', '', 8, 15, '/^[0-9-]{6,13}$/', '企业电话不能为空', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 9, 0, 0),
(191, 16, 1, 'fax', '传真', '', '', 0, 25, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 11, 0, 0),
(192, 16, 1, 'qq', 'QQ', '', '', 0, 15, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 12, 0, 0),
(193, 16, 1, 'weixin', '微信', '', '', 0, 25, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(194, 16, 1, 'tel', '联系人手机', '', '', 0, 11, '', '', 'text', 'array (\n  ''size'' => ''25'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 10, 0, 0),
(195, 16, 1, 'pinpai', '品牌LOGO', '最多只能发布10个品牌，请在后面的输入框中输入品牌名称<br />双击第一个输入框可以预览图片<br />', '', 0, 0, '', '', 'images', 'array (\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''10'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 14, 0, 0),
(198, 16, 1, 'cptype', '产品类型', '', '', 0, 50, '', '', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 16, 0, 0),
(197, 16, 1, 'qylogo', '企业LOGO', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => '''',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 1, 15, 0, 0),
(199, 17, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(200, 17, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0),
(201, 17, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(202, 17, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 1, 0),
(203, 17, 1, 'description', '描述', '', '', 0, 255, '', '', 'textarea', 'array (\n  ''width'' => ''98'',\n  ''height'' => ''46'',\n  ''defaultvalue'' => '''',\n  ''enablehtml'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(204, 17, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(205, 17, 1, 'content', '内容', '', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''0'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(226, 17, 1, 'image', '标题图片', '', '', 0, 0, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''0'',\n  ''upload_maxsize'' => '''',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => ''155'',\n  ''images_height'' => ''115'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 1, 11, 0, 0),
(206, 17, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(207, 17, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 1, 0),
(208, 17, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 1, 0),
(209, 17, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(210, 17, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(211, 17, 1, 'groupids_view', '阅读权限', '', '', 0, 100, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 1, 0),
(212, 17, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(213, 17, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0),
(214, 17, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(215, 17, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 1, 0),
(216, 17, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(217, 17, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 1, 0),
(218, 17, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(219, 17, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 20, 1, 0),
(220, 17, 1, 'start_time', '起始时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''date'',\n  ''format'' => ''Y-m-d Ah:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 5, 0, 0),
(221, 17, 1, 'end_time', '结束时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''date'',\n  ''format'' => ''Y-m-d Ah:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 6, 0, 0),
(222, 17, 1, 'diqu', '地区', '', '', 0, 0, '', '', 'linkage', 'array (\n  ''linkageid'' => ''1'',\n  ''space'' => '''',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 7, 0, 0),
(223, 17, 1, 'address', '详细地址', '', '', 0, 0, '', '', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 8, 0, 0);
INSERT DELAYED IGNORE INTO `cban_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES 
(224, 17, 1, 'area', '面积/m*m', '', '', 0, 0, '', '', 'number', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => '''',\n  ''decimaldigits'' => ''0'',\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n  ''rangetype'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 9, 0, 0),
(225, 17, 1, 'cptype', '展品类型', '', '', 0, 0, '', '', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 10, 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_module`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 19 日 12:32
-- 

DROP TABLE IF EXISTS `cban_module`;
CREATE TABLE IF NOT EXISTS `cban_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL default '0',
  `version` varchar(50) NOT NULL default '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `installdate` date NOT NULL default '0000-00-00',
  `updatedate` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_module`
-- 

INSERT DELAYED IGNORE INTO `cban_module` (`module`, `name`, `url`, `iscore`, `version`, `description`, `setting`, `listorder`, `disabled`, `installdate`, `updatedate`) VALUES 
('admin', 'admin', '', 1, '1.0', '', 'array (\n  ''admin_email'' => ''phpcms@phpcms.cn'',\n  ''maxloginfailedtimes'' => ''8'',\n  ''minrefreshtime'' => ''2'',\n  ''mail_type'' => ''1'',\n  ''mail_server'' => ''smtp.qq.com'',\n  ''mail_port'' => ''25'',\n  ''category_ajax'' => ''0'',\n  ''mail_user'' => ''phpcms.cn@foxmail.com'',\n  ''mail_auth'' => ''1'',\n  ''mail_from'' => ''phpcms.cn@foxmail.com'',\n  ''mail_password'' => ''123456'',\n  ''errorlog_size'' => ''20'',\n)', 0, 0, '2010-10-18', '2010-10-18'),
('member', '会员', '', 1, '1.0', '', 'array (\n  ''allowregister'' => ''1'',\n  ''choosemodel'' => ''1'',\n  ''enablemailcheck'' => ''0'',\n  ''enablcodecheck'' => ''0'',\n  ''mobile_checktype'' => ''0'',\n  ''user_sendsms_title'' => '''',\n  ''registerverify'' => ''1'',\n  ''showapppoint'' => ''0'',\n  ''rmb_point_rate'' => ''10'',\n  ''defualtpoint'' => ''0'',\n  ''defualtamount'' => ''0'',\n  ''showregprotocol'' => ''0'',\n  ''regprotocol'' => ''		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 '',\n  ''registerverifymessage'' => '' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}'',\n  ''forgetpassword'' => '' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}'',\n)', 0, 0, '2010-09-06', '2010-09-06'),
('pay', '支付', '', 1, '1.0', '', '', 0, 0, '2010-09-06', '2010-09-06'),
('digg', '顶一下', '', 0, '1.0', '', '', 0, 0, '2010-09-06', '2010-09-06'),
('special', '专题', '', 0, '1.0', '', '', 0, 0, '2010-09-06', '2010-09-06'),
('content', '内容模块', '', 1, '1.0', '', '', 0, 0, '2010-09-06', '2010-09-06'),
('search', '全站搜索', '', 0, '1.0', '', 'array (\n  ''fulltextenble'' => ''1'',\n  ''relationenble'' => ''1'',\n  ''suggestenable'' => ''1'',\n  ''sphinxenable'' => ''0'',\n  ''sphinxhost'' => ''10.228.134.102'',\n  ''sphinxport'' => ''9312'',\n)', 0, 0, '2010-09-06', '2010-09-06'),
('scan', '木马扫描', 'scan', 0, '1.0', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('attachment', '附件', 'attachment', 1, '1.0', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('block', '碎片', '', 1, '1.0', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('collection', '采集模块', 'collection', 1, '1.0', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('dbsource', '数据源', '', 1, '', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('template', '模板风格', '', 1, '1.0', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('release', '发布点', '', 1, '1.0', '', '', 0, 0, '2010-09-01', '2010-09-06'),
('video', '视频库', '', 0, '1.0', '', '', 0, 0, '2012-09-28', '2012-09-28'),
('announce', '公告', 'announce/', 0, '1.0', '公告', '', 0, 0, '2014-07-21', '2014-07-21'),
('comment', '评论', 'comment/', 0, '1.0', '评论', '', 0, 0, '2014-07-21', '2014-07-21'),
('link', '友情链接', '', 0, '1.0', '', 'array (\n  1 => \n  array (\n    ''is_post'' => ''1'',\n    ''enablecheckcode'' => ''0'',\n  ),\n)', 0, 0, '2010-09-06', '2010-09-06'),
('vote', '投票', '', 0, '1.0', '', 'array (\r\n  1 => \r\n  array (\r\n    ''default_style'' => ''default'',\r\n    ''vote_tp_template'' => ''vote_tp'',\r\n    ''allowguest'' => ''1'',\r\n    ''enabled'' => ''1'',\r\n    ''interval'' => ''1'',\r\n    ''credit'' => ''1'',\r\n  ),\r\n)', 0, 0, '2010-09-06', '2010-09-06'),
('message', '短消息', '', 0, '1.0', '', '', 0, 0, '2010-09-06', '2010-09-06'),
('mood', '新闻心情', 'mood/', 0, '1.0', '新闻心情', '', 0, 0, '2014-07-21', '2014-07-21'),
('poster', '广告模块', 'poster/', 0, '1.0', '广告模块', '', 0, 0, '2014-07-21', '2014-07-21'),
('formguide', '表单向导', 'formguide/', 0, '1.0', 'formguide', 'array (\n  ''allowmultisubmit'' => ''1'',\n  ''interval'' => ''30'',\n  ''allowunreg'' => ''0'',\n  ''mailmessage'' => ''用户向我们提交了表单数据，赶快去看看吧。'',\n)', 0, 0, '2010-10-20', '2010-10-20'),
('wap', '手机门户', 'wap/', 0, '1.0', '手机门户', '', 0, 0, '2014-07-21', '2014-07-21'),
('upgrade', '在线升级', '', 0, '1.0', '', '', 0, 0, '2011-05-18', '2011-05-18'),
('tag', '标签向导', 'tag/', 0, '1.0', '标签向导', '', 0, 0, '2014-07-21', '2014-07-21'),
('sms', '短信平台', 'sms/', 0, '1.0', '短信平台', '', 0, 0, '2011-09-02', '2011-09-02'),
('supply_infor', '商机信息', '', 0, '1.0', '', '', 1, 0, '2014-07-29', '2014-07-29');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_mood`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_mood`;
CREATE TABLE IF NOT EXISTS `cban_mood` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL default '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL default '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL default '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL default '0',
  `n2` int(10) unsigned NOT NULL default '0',
  `n3` int(10) unsigned NOT NULL default '0',
  `n4` int(10) unsigned NOT NULL default '0',
  `n5` int(10) unsigned NOT NULL default '0',
  `n6` int(10) unsigned NOT NULL default '0',
  `n7` int(10) unsigned NOT NULL default '0',
  `n8` int(10) unsigned NOT NULL default '0',
  `n9` int(10) unsigned NOT NULL default '0',
  `n10` int(10) unsigned NOT NULL default '0',
  `lastupdate` int(10) unsigned NOT NULL default '0' COMMENT '最后更新时间',
  PRIMARY KEY  (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_mood`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news`
-- 
-- 创建时间: 2014 年 09 月 03 日 09:44
-- 最后更新时间: 2014 年 09 月 03 日 09:44
-- 

DROP TABLE IF EXISTS `cban_news`;
CREATE TABLE IF NOT EXISTS `cban_news` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` varchar(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` int(10) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `cban_news`
-- 

INSERT DELAYED IGNORE INTO `cban_news` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `description`, `posids`, `url`, `listorder`, `status`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`) VALUES 
(1, 41, 0, '1111111111111111', '', '', '111afas', 'asfsdfasdfsdfasdf', 0, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=41&id=1', 0, 99, 1, 0, 'admin', 1409639838, 1409639868),
(2, 41, 0, '2222222222', '', '', 'sdaf2222222222', 'asdfasdfasdfsadfsadfasdfdsafsdfasdf', 0, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=41&id=2', 0, 99, 1, 0, 'admin', 1409639870, 1409639907),
(3, 41, 0, '33333333333', '', 'http://127.0.0.1:8080/cban/uploadfile/2014/0902/20140902024000706.jpg', '33333333333', '33333333333333333333333333333333333333333333asdfasfadfasfsadfasdfasdfadfsdfasdfdf', 0, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=41&id=3', 0, 99, 1, 0, 'admin', 1409639978, 1409640005);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_data`
-- 
-- 创建时间: 2014 年 09 月 02 日 14:39
-- 最后更新时间: 2014 年 09 月 02 日 14:40
-- 

DROP TABLE IF EXISTS `cban_news_data`;
CREATE TABLE IF NOT EXISTS `cban_news_data` (
  `id` mediumint(8) unsigned default '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `relation` varchar(255) NOT NULL default '',
  `voteid` mediumint(8) unsigned NOT NULL default '0',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  `copyfrom` varchar(100) NOT NULL default '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_news_data`
-- 

INSERT DELAYED IGNORE INTO `cban_news_data` (`id`, `content`, `readpoint`, `groupids_view`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `relation`, `voteid`, `allow_comment`, `copyfrom`) VALUES 
(1, 'asfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdf<br />\r\nasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdf<br />\r\nasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdf<br />\r\nasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdfasfsdfasdfsdfasdf', 0, '', 0, 0, '', 0, '', 0, 1, ''),
(2, 'asdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdf<br />\r\nasdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdf<br />\r\nasdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdf<br />\r\nasdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdfasdfasdfasdfsadfsadfasdfdsafsdfasdf', 0, '', 0, 0, '', 0, '', 0, 1, ''),
(3, '33333333333333333333333333333333333333333333<br />\r\n<br />\r\nasdfasfadfasf<br />\r\nsadfasdfasdfadf<br />\r\nsdfasdfdf', 0, '', 0, 0, '', 0, '', 0, 1, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_md`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 12 日 14:26
-- 

DROP TABLE IF EXISTS `cban_news_md`;
CREATE TABLE IF NOT EXISTS `cban_news_md` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` varchar(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `diqu` int(10) unsigned NOT NULL default '0',
  `add` varchar(100) NOT NULL default '',
  `lxr` varchar(20) NOT NULL default '',
  `dianhua` varchar(15) NOT NULL default '',
  `tel` varchar(11) NOT NULL default '',
  `fax` varchar(25) NOT NULL default '',
  `qq` varchar(15) NOT NULL default '',
  `weixin` varchar(25) NOT NULL default '',
  `service` tinyint(3) unsigned NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `cban_news_md`
-- 

INSERT DELAYED IGNORE INTO `cban_news_md` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `description`, `posids`, `url`, `listorder`, `status`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `diqu`, `add`, `lxr`, `dianhua`, `tel`, `fax`, `qq`, `weixin`, `service`, `image`) VALUES 
(1, 9, 0, '1234567', '', 'http://127.0.0.1:8080/cban/uploadfile/2014/0723/20140723123322242.jpg', '1234567', '7654321', 1, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=9&id=1', 0, 99, 0, 0, 'nima', 1406790312, 1407638268, 241, '11111111111', '1111', '11111111', '11111111111', '', '', '', 2, 'http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_md_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_news_md_data`;
CREATE TABLE IF NOT EXISTS `cban_news_md_data` (
  `id` mediumint(8) unsigned default '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_news_md_data`
-- 

INSERT DELAYED IGNORE INTO `cban_news_md_data` (`id`, `content`, `readpoint`, `groupids_view`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`) VALUES 
(1, '123456<br />\r\n<img src="http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg" /><br />\r\n<br />\r\nlgkuhnkjnjnn', 0, '', 0, 0, '', 0, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_qy`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_news_qy`;
CREATE TABLE IF NOT EXISTS `cban_news_qy` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` varchar(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` char(255) NOT NULL default '',
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `diqu` int(10) unsigned NOT NULL default '0',
  `add` varchar(100) NOT NULL default '',
  `lxr` varchar(20) NOT NULL default '',
  `dianhua` varchar(15) NOT NULL default '',
  `fax` varchar(25) NOT NULL default '',
  `qq` varchar(15) NOT NULL default '',
  `weixin` varchar(25) NOT NULL default '',
  `tel` varchar(11) NOT NULL default '',
  `qylogo` varchar(100) NOT NULL default '',
  `cptype` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `cban_news_qy`
-- 

INSERT DELAYED IGNORE INTO `cban_news_qy` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `description`, `posids`, `url`, `listorder`, `status`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `diqu`, `add`, `lxr`, `dianhua`, `fax`, `qq`, `weixin`, `tel`, `qylogo`, `cptype`) VALUES 
(2, 10, 0, '企业信息发布111', '', 'http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg', '企业信息发布', '一个国家经济的崛起有赖于一批民族企业的壮大。  "诞生  "于改革开放之初的TCL，现已成长为有抱负的  "青年  "。作为率先国际化的中国企业，TCL没有任何可以借鉴的蓝本', 1, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=10&id=2', 0, 99, 0, 0, 'hehe', 1407207124, 1407208427, 241, '111111111111111111111111111111111111111111111111111111111', '1111', '11111111', '', '', '', '', 'http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805101359656.gif', '电视、空调、洗衣机'),
(3, 10, 0, 'haha家电集团', '', '', '哈哈哈集团', '哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团', 1, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=10&id=3', 0, 99, 0, 0, 'haha', 1407407855, 1407407855, 241, '1111111111111111111111', '11111111111111', '11111111', '', '', '', '', 'http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805025927232.gif', '抽油烟机 电饭煲 豆浆机 榨汁机');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_qy_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_news_qy_data`;
CREATE TABLE IF NOT EXISTS `cban_news_qy_data` (
  `id` mediumint(8) unsigned default '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  `relation` varchar(255) NOT NULL default '',
  `pinpai` mediumtext NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_news_qy_data`
-- 

INSERT DELAYED IGNORE INTO `cban_news_qy_data` (`id`, `content`, `readpoint`, `groupids_view`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `pinpai`) VALUES 
(2, '<img src="http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg" /><br />\r\n一个国家经济的崛起有赖于一批民族企业的壮大。&quot;诞生&quot;于改革开放之初的TCL，现已成长为有抱负的&quot;青年&quot;。作为率先国际化的中国企业，TCL没有任何可以借鉴的蓝本，在全球范围内探索着一条中国品牌从未走过的道路。经过国际化的严峻考验和不懈探索，我们在国际化道路上的步伐更加坚定。', 0, '', 0, 0, '', 0, 1, '', 'array (\n)'),
(3, '哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团,&#39;&#39;&#39;&#39;', 0, '', 0, 0, '', 0, 1, '', 'array (\n  0 => \n  array (\n    ''url'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0806/20140806044014207.gif'',\n    ''alt'' => ''格力'',\n  ),\n  1 => \n  array (\n    ''url'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0806/20140806044014333.gif'',\n    ''alt'' => ''海尔'',\n  ),\n  2 => \n  array (\n    ''url'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0806/20140806044015581.gif'',\n    ''alt'' => ''TCL'',\n  ),\n)');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_zhxx`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_news_zhxx`;
CREATE TABLE IF NOT EXISTS `cban_news_zhxx` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` char(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `start_time` date default NULL,
  `end_time` date default NULL,
  `diqu` int(10) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  `area` int(10) unsigned NOT NULL default '0',
  `cptype` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `cban_news_zhxx`
-- 

INSERT DELAYED IGNORE INTO `cban_news_zhxx` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `description`, `posids`, `url`, `listorder`, `status`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `start_time`, `end_time`, `diqu`, `address`, `area`, `cptype`, `image`) VALUES 
(1, 44, 0, '11111111111', '', '', '', '11111111111111111111111111333111', 1, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=44&id=1', 0, 99, 1, 0, 'admin', 1407411276, 1407480236, '0000-00-00', '0000-00-00', 244, '', 0, '', 'http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg'),
(2, 44, 0, '2222222222', '', '', '', '222222333', 1, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=44&id=2', 0, 99, 1, 0, 'admin', 1407411832, 1407470485, '0000-00-00', '0000-00-00', 241, '', 0, '', ''),
(3, 44, 0, '3333333333333', '', '', '', '333333333333333333333333333', 1, 'http://127.0.0.1:8080/cban/index.php?m=content&c=index&a=show&catid=44&id=3', 0, 99, 1, 0, 'admin', 1407411890, 1407480325, '2014-08-07', '2014-08-31', 241, 'XXX区XX路', 1000, '电视，洗衣机', 'http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805100108135.jpg');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_news_zhxx_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_news_zhxx_data`;
CREATE TABLE IF NOT EXISTS `cban_news_zhxx_data` (
  `id` mediumint(8) unsigned default '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  `relation` varchar(255) NOT NULL default '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_news_zhxx_data`
-- 

INSERT DELAYED IGNORE INTO `cban_news_zhxx_data` (`id`, `content`, `readpoint`, `groupids_view`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`) VALUES 
(1, '11111111111111111111111111111333', 0, '', 0, 0, '', 0, 1, ''),
(2, '22222222222222222222222222222222222333', 0, '', 0, 0, '', 0, 1, ''),
(3, 'sadfsadfasd fasd fasd 撒的发生的发撒的发阿斯蒂芬阿萨德发斯蒂芬阿斯顿发送到f阿斯蒂芬阿斯蒂芬<br />\r\n撒的发阿斯蒂芬阿萨德<br />\r\n阿萨德发生的 发生的<br />\r\n阿萨德富士达阿萨德<br />\r\n阿斯蒂芬阿萨德333 ', 0, '', 0, 0, '', 0, 1, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_page`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_page`;
CREATE TABLE IF NOT EXISTS `cban_page` (
  `catid` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL default '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_page`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_pay_account`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_pay_account`;
CREATE TABLE IF NOT EXISTS `cban_pay_account` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL default '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL default '1',
  `addtime` int(10) NOT NULL default '0',
  `paytime` int(10) NOT NULL default '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL default 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL default '1',
  `ip` char(15) NOT NULL default '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL default 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `cban_pay_account`
-- 

INSERT DELAYED IGNORE INTO `cban_pay_account` (`id`, `trade_sn`, `userid`, `username`, `contactname`, `email`, `telephone`, `discount`, `money`, `quantity`, `addtime`, `paytime`, `usernote`, `pay_id`, `pay_type`, `payment`, `type`, `ip`, `status`, `adminnote`) VALUES 
(1, '9_1', 1, 'nima', '', '', '', 0.00, '1', 1, 1406037766, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(2, '9_1', 1, 'nima', '', '', '', 0.00, '1', 1, 1406038057, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(3, '9_1', 1, 'nima', '', '', '', 0.00, '1', 1, 1406038086, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(4, '9_1', 1, 'nima', '', '', '', 0.00, '1', 1, 1406122917, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(5, '10_2', 2, 'hehe', '', '', '', 0.00, '1', 1, 1407208463, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(6, '10_3', 3, 'haha', '', '', '', 0.00, '1', 1, 1407221833, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(7, '10_3', 3, 'haha', '', '', '', 0.00, '1', 1, 1407221990, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(8, '10_3', 3, 'haha', '', '', '', 0.00, '1', 1, 1407225589, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(9, '10_3', 3, 'haha', '', '', '', 0.00, '1', 1, 1407314473, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(10, '10_3', 3, 'haha', '', '', '', 0.00, '1', 1, 1407407862, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin'),
(11, '9_1', 1, 'nima', '', '', '', 0.00, '1', 1, 1407637844, 0, '', 0, 'selfincome', '投稿奖励', 2, '127.0.0.1', 'succ', 'admin');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_pay_payment`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_pay_payment`;
CREATE TABLE IF NOT EXISTS `cban_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) default NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL default '0',
  `is_online` tinyint(1) unsigned NOT NULL default '0',
  `pay_order` tinyint(3) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY  (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_pay_payment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_pay_spend`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_pay_spend`;
CREATE TABLE IF NOT EXISTS `cban_pay_spend` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creat_at` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL default '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_pay_spend`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_picture`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_picture`;
CREATE TABLE IF NOT EXISTS `cban_picture` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` char(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` char(255) NOT NULL default '',
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_picture`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_picture_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_picture_data`;
CREATE TABLE IF NOT EXISTS `cban_picture_data` (
  `id` mediumint(8) unsigned default '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `relation` varchar(255) NOT NULL default '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL default '',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_picture_data`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_position`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 03 日 09:35
-- 

DROP TABLE IF EXISTS `cban_position`;
CREATE TABLE IF NOT EXISTS `cban_position` (
  `posid` smallint(5) unsigned NOT NULL auto_increment,
  `modelid` smallint(5) unsigned default '0',
  `catid` smallint(5) unsigned default '0',
  `name` char(30) NOT NULL default '',
  `maxnum` smallint(5) NOT NULL default '20',
  `extention` char(100) default NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `thumb` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`posid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- 
-- 导出表中的数据 `cban_position`
-- 

INSERT DELAYED IGNORE INTO `cban_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder`, `siteid`, `thumb`) VALUES 
(1, 0, 0, '首页焦点图推荐', 20, NULL, 99, 1, ''),
(2, 0, 0, '首页头条推荐', 20, NULL, 99, 1, ''),
(9, 0, 0, '网站顶部推荐', 20, NULL, 99, 1, ''),
(12, 0, 0, '首页图片推荐', 20, NULL, 99, 1, ''),
(19, 16, 10, '家电名企_本月热门家电厂商', 20, '', 1, 1, ''),
(20, 16, 10, '家电名企_最新入驻家电企业', 20, '', 2, 1, ''),
(21, 17, 44, '展会信息_热点展会排行', 20, '', 3, 1, ''),
(22, 17, 44, '展会信息_展会图片资讯', 4, '', 4, 1, ''),
(23, 15, 9, '千县万店_新加门店', 20, '', 5, 1, ''),
(24, 15, 9, '千县万店_门店图片', 20, '', 6, 1, ''),
(25, 15, 0, '家电维修_新加维修网点', 20, '', 7, 1, ''),
(26, 15, 0, '家电维修_维修网点图片', 20, '', 8, 1, ''),
(27, 1, 41, '行业资讯_新闻点击排行', 20, '', 9, 1, ''),
(28, 1, 41, '行业资讯_综合排行', 20, '', 10, 1, ''),
(29, 1, 41, '行业资讯_推荐图片新闻', 20, '', 11, 1, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_position_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_position_data`;
CREATE TABLE IF NOT EXISTS `cban_position_data` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `catid` smallint(5) unsigned NOT NULL default '0',
  `posid` smallint(5) unsigned NOT NULL default '0',
  `module` char(20) default NULL,
  `modelid` smallint(6) unsigned default '0',
  `thumb` tinyint(1) NOT NULL default '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL default '1',
  `listorder` mediumint(8) default '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) default NULL,
  `synedit` tinyint(1) default '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_position_data`
-- 

INSERT DELAYED IGNORE INTO `cban_position_data` (`id`, `catid`, `posid`, `module`, `modelid`, `thumb`, `data`, `siteid`, `listorder`, `expiration`, `extention`, `synedit`) VALUES 
(3, 10, 19, 'content', 16, 0, 'array (\n  ''title'' => ''haha家电集团'',\n  ''description'' => ''哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团'',\n  ''qylogo'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805025927232.gif'',\n  ''inputtime'' => ''1407221971'',\n  ''style'' => '''',\n)', 1, 2, 0, NULL, 0),
(2, 10, 19, 'content', 16, 0, 'array (\n  ''title'' => ''企业信息发布111'',\n  ''description'' => ''一个国家经济的崛起有赖于一批民族企业的壮大。  "诞生  "于改革开放之初的TCL，现已成长为有抱负的  "青年  "。作为率先国际化的中国企业，TCL没有任何可以借鉴的蓝本'',\n  ''qylogo'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805101359656.gif'',\n  ''cptype'' => ''电视、空调、洗衣机'',\n  ''inputtime'' => ''1407207124'',\n  ''style'' => '''',\n)', 1, 1, 0, NULL, 0),
(3, 10, 20, 'content', 16, 0, 'array (\n  ''title'' => ''haha家电集团'',\n  ''description'' => ''哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团哈哈哈集团'',\n  ''qylogo'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805025927232.gif'',\n  ''inputtime'' => ''1407221971'',\n  ''style'' => '''',\n)', 1, 1, 0, NULL, 0),
(2, 10, 20, 'content', 16, 0, 'array (\n  ''title'' => ''企业信息发布111'',\n  ''description'' => ''一个国家经济的崛起有赖于一批民族企业的壮大。  "诞生  "于改革开放之初的TCL，现已成长为有抱负的  "青年  "。作为率先国际化的中国企业，TCL没有任何可以借鉴的蓝本'',\n  ''qylogo'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805101359656.gif'',\n  ''cptype'' => ''电视、空调、洗衣机'',\n  ''inputtime'' => ''1407207124'',\n  ''style'' => '''',\n)', 1, 2, 0, NULL, 0),
(3, 44, 21, 'content', 17, 0, 'array (\n  ''title'' => ''3333333333333'',\n  ''description'' => ''333333333333333333333333333'',\n  ''image'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805100108135.jpg'',\n  ''inputtime'' => ''1407411890'',\n  ''style'' => '''',\n)', 1, 3, 0, NULL, 0),
(2, 44, 21, 'content', 17, 0, 'array (\n  ''title'' => ''2222222222'',\n  ''description'' => ''222222333'',\n  ''inputtime'' => ''1407411832'',\n  ''style'' => '''',\n)', 1, 2, 0, NULL, 0),
(1, 44, 21, 'content', 17, 0, 'array (\n  ''title'' => ''11111111111'',\n  ''description'' => ''11111111111111111111111111333111'',\n  ''image'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg'',\n  ''inputtime'' => ''1407411276'',\n  ''style'' => '''',\n)', 1, 1, 0, NULL, 0),
(3, 44, 22, 'content', 17, 0, 'array (\n  ''title'' => ''3333333333333'',\n  ''description'' => ''333333333333333333333333333'',\n  ''image'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0805/20140805100108135.jpg'',\n  ''inputtime'' => ''1407411890'',\n  ''style'' => '''',\n)', 1, 3, 0, NULL, 0),
(1, 44, 22, 'content', 17, 0, 'array (\n  ''title'' => ''11111111111'',\n  ''description'' => ''11111111111111111111111111333111'',\n  ''image'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg'',\n  ''inputtime'' => ''1407411276'',\n  ''style'' => '''',\n)', 1, 1, 0, NULL, 0),
(1, 9, 24, 'content', 15, 0, 'array (\n  ''title'' => ''1234567'',\n  ''description'' => ''7654321'',\n  ''image'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg'',\n  ''inputtime'' => ''1406790312'',\n  ''style'' => '''',\n)', 1, 1, 0, NULL, 0),
(1, 9, 23, 'content', 15, 0, 'array (\n  ''title'' => ''1234567'',\n  ''description'' => ''7654321'',\n  ''image'' => ''http://127.0.0.1:8080/cban/uploadfile/2014/0804/20140804095425390.jpg'',\n  ''inputtime'' => ''1406790312'',\n  ''style'' => '''',\n)', 1, 1, 0, NULL, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_poster`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_poster`;
CREATE TABLE IF NOT EXISTS `cban_poster` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL default '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL default '0',
  `enddate` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `hits` mediumint(8) unsigned NOT NULL default '0',
  `clicks` smallint(5) unsigned NOT NULL default '0',
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- 导出表中的数据 `cban_poster`
-- 

INSERT DELAYED IGNORE INTO `cban_poster` (`id`, `siteid`, `name`, `spaceid`, `type`, `setting`, `startdate`, `enddate`, `addtime`, `hits`, `clicks`, `listorder`, `disabled`) VALUES 
(1, 1, 'banner', 1, 'images', 'array (\n  1 => \n  array (\n    ''linkurl'' => ''http://www.phpcms.cn'',\n    ''imageurl'' => ''http://127.0.0.1:8080/cban/uploadfile/poster/2.png'',\n    ''alt'' => '''',\n  ),\n)', 1285813808, 1446249600, 1285813833, 0, 1, 0, 0),
(2, 1, 'phpcmsv9', 2, 'images', 'array (\n  1 => \n  array (\n    ''linkurl'' => ''http://www.phpcms.cn'',\n    ''imageurl'' => ''http://127.0.0.1:8080/cban/statics/images/v9/ad_login.jpg'',\n    ''alt'' => ''phpcms专业建站系统'',\n  ),\n)', 1285816298, 1446249600, 1285816310, 0, 1, 0, 0),
(3, 1, 'phpcms下载推荐', 3, 'images', 'array (\n  1 => \n  array (\n    ''linkurl'' => ''http://www.phpcms.cn'',\n    ''imageurl'' => ''http://127.0.0.1:8080/cban/uploadfile/poster/3.png'',\n    ''alt'' => ''phpcms官方'',\n  ),\n)', 1286504815, 1446249600, 1286504865, 0, 1, 0, 0),
(4, 1, 'phpcms广告', 4, 'images', 'array (\n  1 => \n  array (\n    ''linkurl'' => ''http://www.phpcms.cn'',\n    ''imageurl'' => ''http://127.0.0.1:8080/cban/uploadfile/poster/4.gif'',\n    ''alt'' => ''phpcms官方'',\n  ),\n)', 1286505141, 1446249600, 1286505178, 0, 0, 0, 0),
(10, 1, 'phpcms', 10, 'images', 'array (\n  1 => \n  array (\n    ''linkurl'' => ''http://www.phpcms.cn'',\n    ''imageurl'' => ''http://127.0.0.1:8080/cban/uploadfile/poster/6.jpg'',\n    ''alt'' => ''phpcms官方'',\n  ),\n)', 1289270509, 1446249600, 1289270541, 1, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_poster_201407`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_poster_201407`;
CREATE TABLE IF NOT EXISTS `cban_poster_201407` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `spaceid` smallint(5) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL default '0',
  `type` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_poster_201407`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_poster_201408`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_poster_201408`;
CREATE TABLE IF NOT EXISTS `cban_poster_201408` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` smallint(5) unsigned NOT NULL default '0',
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `spaceid` smallint(5) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL default '0',
  `type` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_poster_201408`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_poster_space`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_poster_space`;
CREATE TABLE IF NOT EXISTS `cban_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL default '0',
  `height` smallint(4) unsigned NOT NULL default '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- 导出表中的数据 `cban_poster_space`
-- 

INSERT DELAYED IGNORE INTO `cban_poster_space` (`spaceid`, `siteid`, `name`, `type`, `path`, `width`, `height`, `setting`, `description`, `items`, `disabled`) VALUES 
(1, 1, '顶部搜索右侧广告位', 'banner', 'poster_js/1.js', 430, 63, 'array (\n  ''paddleft'' => '''',\n  ''paddtop'' => '''',\n)', '', 1, 0),
(2, 1, '会员登陆页广告', 'banner', 'poster_js/2.js', 310, 304, 'array (\n  ''paddleft'' => '''',\n  ''paddtop'' => '''',\n)', '会员登陆页广告右侧代替外部通行证广告', 1, 0),
(3, 1, '图片频道图片排行下方', 'banner', 'poster_js/3.js', 249, 87, 'array (\n  ''paddleft'' => '''',\n  ''paddtop'' => '''',\n)', '', 1, 0),
(4, 1, '新闻中心推荐链接左侧', 'banner', 'poster_js/4.js', 748, 91, 'array (\n  ''paddleft'' => '''',\n  ''paddtop'' => '''',\n)', '', 1, 0),
(10, 1, '首页关注下方广告', 'banner', 'poster_js/10.js', 307, 60, 'array (\n  ''paddleft'' => '''',\n  ''paddtop'' => '''',\n)', '', 1, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_queue`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_queue`;
CREATE TABLE IF NOT EXISTS `cban_queue` (
  `id` int(10) NOT NULL auto_increment,
  `type` char(5) default NULL,
  `siteid` smallint(5) unsigned default '0',
  `path` varchar(100) default NULL,
  `status1` tinyint(1) default '0',
  `status2` tinyint(1) default '0',
  `status3` tinyint(1) default '0',
  `status4` tinyint(1) default '0',
  `times` int(10) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_queue`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_release_point`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_release_point`;
CREATE TABLE IF NOT EXISTS `cban_release_point` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `host` varchar(100) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `port` varchar(10) default '21',
  `pasv` tinyint(1) default '0',
  `ssl` tinyint(1) default '0',
  `path` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_release_point`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_search`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 09 月 02 日 14:40
-- 

DROP TABLE IF EXISTS `cban_search`;
CREATE TABLE IF NOT EXISTS `cban_search` (
  `searchid` int(10) unsigned NOT NULL auto_increment,
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `id` mediumint(8) unsigned NOT NULL default '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- 导出表中的数据 `cban_search`
-- 

INSERT DELAYED IGNORE INTO `cban_search` (`searchid`, `typeid`, `id`, `adddate`, `data`, `siteid`) VALUES 
(1, 54, 1, 1406790312, '1234567 1234567 ', 1),
(2, 55, 2, 1407207124, '企业信息发布111 企业信息发布 国际化 青年 率先 作为 中国企业 任何 探索 道路 借鉴 没有 可以 崛起 发布 一个 经济的 成长 民族 改革开放 企业 诞生 壮大 现已 经过 严峻 更加 走过 坚定 步伐 我们 不懈 考验 洗衣机 空调 电视 品牌 全球范围内 从未', 1),
(3, 55, 3, 1407407855, 'haha家电集团 哈哈哈集团 集团 哈哈 家电', 1),
(4, 56, 1, 1407411276, '11111111111  ', 1),
(5, 56, 2, 1407411832, '2222222222  ', 1),
(6, 56, 3, 1407411890, '3333333333333  发生 发送 电视 洗衣机', 1),
(7, 1, 1, 1409639838, '1111111111111111 111afas ', 1),
(8, 1, 2, 1409639870, '2222222222 sdaf2222222222 ', 1),
(9, 1, 3, 1409639978, '33333333333 33333333333 ', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_search_keyword`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_search_keyword`;
CREATE TABLE IF NOT EXISTS `cban_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_search_keyword`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_session`
-- 

DROP TABLE IF EXISTS `cban_session`;
CREATE TABLE IF NOT EXISTS `cban_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `roleid` tinyint(3) unsigned default '0',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_session`
-- 

INSERT DELAYED IGNORE INTO `cban_session` (`sessionid`, `userid`, `ip`, `lastvisit`, `roleid`, `groupid`, `m`, `c`, `a`, `data`) VALUES 
('8abd137ac3fededfc623b78e9ad9399b', 1, '127.0.0.1', 1409709354, 1, 0, 'admin', 'index', 'public_session_life', 'code|s:4:"387s";userid|s:1:"1";roleid|s:1:"1";pc_hash|s:6:"GppxPu";lock_screen|i:0;');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_site`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_site`;
CREATE TABLE IF NOT EXISTS `cban_site` (
  `siteid` smallint(5) unsigned NOT NULL auto_increment,
  `name` char(30) default '',
  `dirname` char(255) default '',
  `domain` char(255) default '',
  `site_title` char(255) default '',
  `keywords` char(255) default '',
  `description` char(255) default '',
  `release_point` text,
  `default_style` char(50) default NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) default '',
  PRIMARY KEY  (`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `cban_site`
-- 

INSERT DELAYED IGNORE INTO `cban_site` (`siteid`, `name`, `dirname`, `domain`, `site_title`, `keywords`, `description`, `release_point`, `default_style`, `template`, `setting`, `uuid`) VALUES 
(1, '默认站点', '', 'http://127.0.0.1:8080/cban/', 'CBAN中国家电品牌门户网站', '中国家电品牌,家电门户网站,各种家电', 'CBAN是中国第一家家电品牌门户网站，其中包含各种品牌家电，维修，销售等', '', 'cban', 'cban', 'array (\n  ''upload_maxsize'' => ''2048'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf'',\n  ''watermark_enable'' => ''1'',\n  ''watermark_minwidth'' => ''300'',\n  ''watermark_minheight'' => ''300'',\n  ''watermark_img'' => ''statics/images/water//mark.png'',\n  ''watermark_pct'' => ''85'',\n  ''watermark_quality'' => ''80'',\n  ''watermark_pos'' => ''9'',\n)', '66e1d6e9-6219-1032-ab4c-ef7167b14131');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sms_report`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_sms_report`;
CREATE TABLE IF NOT EXISTS `cban_sms_report` (
  `id` bigint(15) NOT NULL auto_increment,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL default '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL default '0',
  `status` tinyint(2) NOT NULL default '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_sms_report`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_special`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_special`;
CREATE TABLE IF NOT EXISTS `cban_special` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `aid` int(10) unsigned NOT NULL default '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL default '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `createtime` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `isvideo` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_special`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_special_content`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_special_content`;
CREATE TABLE IF NOT EXISTS `cban_special_content` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `specialid` smallint(5) unsigned NOT NULL default '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `searchid` mediumint(8) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `isdata` tinyint(1) unsigned NOT NULL default '0',
  `videoid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_special_content`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_special_c_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_special_c_data`;
CREATE TABLE IF NOT EXISTS `cban_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL default '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL default '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_special_c_data`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sphinx_counter`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_sphinx_counter`;
CREATE TABLE IF NOT EXISTS `cban_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_sphinx_counter`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sso_admin`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_sso_admin`;
CREATE TABLE IF NOT EXISTS `cban_sso_admin` (
  `id` smallint(6) NOT NULL auto_increment,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) default NULL,
  `issuper` tinyint(1) default '0',
  `lastlogin` int(10) default NULL,
  `ip` char(15) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `cban_sso_admin`
-- 

INSERT DELAYED IGNORE INTO `cban_sso_admin` (`id`, `username`, `password`, `encrypt`, `issuper`, `lastlogin`, `ip`) VALUES 
(1, 'admin', '03005e1fb38b18fe2e270b59a092daf0', 'PQuZ8I', 1, 1405996061, '127.0.0.1');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sso_applications`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_sso_applications`;
CREATE TABLE IF NOT EXISTS `cban_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL auto_increment,
  `type` char(16) NOT NULL default '',
  `name` char(20) NOT NULL default '',
  `url` char(255) NOT NULL default '',
  `authkey` char(255) NOT NULL default '',
  `ip` char(15) NOT NULL default '',
  `apifilename` char(30) NOT NULL default 'phpsso.php',
  `charset` char(8) NOT NULL default '',
  `synlogin` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `cban_sso_applications`
-- 

INSERT DELAYED IGNORE INTO `cban_sso_applications` (`appid`, `type`, `name`, `url`, `authkey`, `ip`, `apifilename`, `charset`, `synlogin`) VALUES 
(1, 'phpcms_v9', 'phpcms v9', 'http://127.0.0.1:8080/cban/', 'iQBx8suWiNrEuqpn1U6Mn1CL8kIc9ZwN', '', 'api.php?op=phpsso', 'utf-8', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sso_members`
-- 
-- 创建时间: 2014 年 08 月 19 日 15:27
-- 最后更新时间: 2014 年 08 月 19 日 15:29
-- 

DROP TABLE IF EXISTS `cban_sso_members`;
CREATE TABLE IF NOT EXISTS `cban_sso_members` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `username` char(20) NOT NULL default '',
  `password` char(32) NOT NULL default '',
  `random` char(8) NOT NULL default '',
  `email` char(32) NOT NULL default '',
  `regip` char(15) NOT NULL default '',
  `regdate` int(10) unsigned NOT NULL default '0',
  `lastip` char(15) NOT NULL default '0',
  `lastdate` int(10) unsigned NOT NULL default '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') default NULL,
  `avatar` tinyint(1) NOT NULL default '0',
  `ucuserid` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- 导出表中的数据 `cban_sso_members`
-- 

INSERT DELAYED IGNORE INTO `cban_sso_members` (`uid`, `username`, `password`, `random`, `email`, `regip`, `regdate`, `lastip`, `lastdate`, `appname`, `type`, `avatar`, `ucuserid`) VALUES 
(1, 'sadff', 'c57c6183bf39a41f09e42baf5f81f035', 'AjeA6C', 'sadff@qq.com', '127.0.0.1', 1408433358, '0', 1408433358, 'phpcms v9', 'app', 0, 0),
(2, 'nimaB', '4f60db2dba8b4972d7c95cd685d40ca9', 'w1FIKE', 'nimaB@qq.com', '127.0.0.1', 1408433358, '0', 1408433358, 'phpcms v9', 'app', 0, 0),
(3, 'hehe', '7f30f0b731b883d2aae66a4d4dddc366', '4sGUlJ', 'hehe@qq.com', '127.0.0.1', 1408433366, '0', 1408433366, 'phpcms v9', 'app', 0, 0),
(4, 'haha', 'e7ab8954a1db823c792e28ff228ec5a5', 'WwKE4R', 'haha@qq.com', '127.0.0.1', 1408433366, '0', 1408433366, 'phpcms v9', 'app', 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sso_messagequeue`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 19 日 15:29
-- 

DROP TABLE IF EXISTS `cban_sso_messagequeue`;
CREATE TABLE IF NOT EXISTS `cban_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL default '0',
  `totalnum` smallint(6) unsigned NOT NULL default '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `appstatus` mediumtext,
  PRIMARY KEY  (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- 
-- 导出表中的数据 `cban_sso_messagequeue`
-- 

INSERT DELAYED IGNORE INTO `cban_sso_messagequeue` (`id`, `operation`, `succeed`, `totalnum`, `noticedata`, `dateline`, `appstatus`) VALUES 
(1, 'member_add', 0, 1, 'array (\n  ''username'' => ''nima'',\n  ''password'' => ''e3cdebc9a303d1e78b623146821d6192'',\n  ''email'' => ''nima@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1406013245'',\n  ''lastdate'' => ''1406013245'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''D8IK1j'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''1'',\n  ''action'' => ''member_add'',\n)', 1406013245, '{"1":1}'),
(2, 'member_add', 0, 1, 'array (\n  ''username'' => ''hehe'',\n  ''password'' => ''7f30f0b731b883d2aae66a4d4dddc366'',\n  ''email'' => ''hehe@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1406014825'',\n  ''lastdate'' => ''1406014825'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''4sGUlJ'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''2'',\n  ''action'' => ''member_add'',\n)', 1406014825, '{"1":1}'),
(3, 'member_add', 0, 1, 'array (\n  ''username'' => ''haha'',\n  ''password'' => ''e7ab8954a1db823c792e28ff228ec5a5'',\n  ''email'' => ''haha@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1407221698'',\n  ''lastdate'' => ''1407221698'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''WwKE4R'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''3'',\n  ''action'' => ''member_add'',\n)', 1407221698, '{"1":1}'),
(4, 'member_add', 0, 1, 'array (\n  ''username'' => ''aaa'',\n  ''password'' => ''591474620785dd8e4ec40e3ab363f02b'',\n  ''email'' => ''aaa@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1407828896'',\n  ''lastdate'' => ''1407828896'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''bDYZjt'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''4'',\n  ''action'' => ''member_add'',\n)', 1407828896, '{"1":1}'),
(5, 'member_add', 0, 1, 'array (\n  ''username'' => ''lulu'',\n  ''password'' => ''176d72ebaa6f47bd563cb8b78b1a54ca'',\n  ''email'' => ''lulu@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408416942'',\n  ''lastdate'' => ''1408416942'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''QTD3fb'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''5'',\n  ''action'' => ''member_add'',\n)', 1408416942, '{"1":1}'),
(6, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408416942'',\n  ''lastdate'' => ''1408416942'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''6'',\n  ''action'' => ''member_add'',\n)', 1408416942, '{"1":1}'),
(7, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408422195'',\n  ''lastdate'' => ''1408422195'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''7'',\n  ''action'' => ''member_add'',\n)', 1408422195, '{"1":1}'),
(8, 'member_add', 0, 1, 'array (\n  ''username'' => ''hehe'',\n  ''password'' => ''7f30f0b731b883d2aae66a4d4dddc366'',\n  ''email'' => ''hehe@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408422255'',\n  ''lastdate'' => ''1408422255'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''4sGUlJ'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''8'',\n  ''action'' => ''member_add'',\n)', 1408422255, '{"1":1}'),
(9, 'member_add', 0, 1, 'array (\n  ''username'' => ''haha'',\n  ''password'' => ''e7ab8954a1db823c792e28ff228ec5a5'',\n  ''email'' => ''haha@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408422265'',\n  ''lastdate'' => ''1408422265'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''WwKE4R'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''9'',\n  ''action'' => ''member_add'',\n)', 1408422265, '{"1":1}'),
(10, 'member_add', 0, 1, 'array (\n  ''username'' => ''hehe'',\n  ''password'' => ''7f30f0b731b883d2aae66a4d4dddc366'',\n  ''email'' => ''hehe@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408422433'',\n  ''lastdate'' => ''1408422433'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''4sGUlJ'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''10'',\n  ''action'' => ''member_add'',\n)', 1408422433, '{"1":1}'),
(11, 'member_add', 0, 1, 'array (\n  ''username'' => ''haha'',\n  ''password'' => ''e7ab8954a1db823c792e28ff228ec5a5'',\n  ''email'' => ''haha@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408422509'',\n  ''lastdate'' => ''1408422509'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''WwKE4R'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''11'',\n  ''action'' => ''member_add'',\n)', 1408422509, '{"1":1}'),
(12, 'member_add', 0, 1, 'array (\n  ''username'' => ''aaa'',\n  ''password'' => ''591474620785dd8e4ec40e3ab363f02b'',\n  ''email'' => ''aaa@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408422585'',\n  ''lastdate'' => ''1408422585'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''bDYZjt'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''12'',\n  ''action'' => ''member_add'',\n)', 1408422585, '{"1":1}'),
(13, 'member_add', 0, 1, 'array (\n  ''username'' => ''lulu'',\n  ''password'' => ''176d72ebaa6f47bd563cb8b78b1a54ca'',\n  ''email'' => ''lulu@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408429770'',\n  ''lastdate'' => ''1408429770'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''QTD3fb'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''13'',\n  ''action'' => ''member_add'',\n)', 1408429770, '{"1":1}'),
(14, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408429826'',\n  ''lastdate'' => ''1408429826'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''14'',\n  ''action'' => ''member_add'',\n)', 1408429826, '{"1":1}'),
(15, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408430167'',\n  ''lastdate'' => ''1408430167'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''15'',\n  ''action'' => ''member_add'',\n)', 1408430167, '{"1":1}'),
(16, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408430547'',\n  ''lastdate'' => ''1408430547'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''16'',\n  ''action'' => ''member_add'',\n)', 1408430547, '{"1":1}'),
(17, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408430649'',\n  ''lastdate'' => ''1408430649'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''17'',\n  ''action'' => ''member_add'',\n)', 1408430649, '{"1":1}'),
(18, 'member_add', 0, 1, 'array (\n  ''username'' => ''hehe'',\n  ''password'' => ''7f30f0b731b883d2aae66a4d4dddc366'',\n  ''email'' => ''hehe@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408431426'',\n  ''lastdate'' => ''1408431426'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''4sGUlJ'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''18'',\n  ''action'' => ''member_add'',\n)', 1408431426, '{"1":1}'),
(19, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408431895'',\n  ''lastdate'' => ''1408431895'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''19'',\n  ''action'' => ''member_add'',\n)', 1408431895, '{"1":1}'),
(20, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408431895'',\n  ''lastdate'' => ''1408431895'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''20'',\n  ''action'' => ''member_add'',\n)', 1408431895, '{"1":1}'),
(21, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432065'',\n  ''lastdate'' => ''1408432065'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''21'',\n  ''action'' => ''member_add'',\n)', 1408432065, '{"1":1}'),
(22, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432065'',\n  ''lastdate'' => ''1408432065'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''22'',\n  ''action'' => ''member_add'',\n)', 1408432065, '{"1":1}'),
(23, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432128'',\n  ''lastdate'' => ''1408432128'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''1'',\n  ''action'' => ''member_add'',\n)', 1408432128, '{"1":1}'),
(24, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432128'',\n  ''lastdate'' => ''1408432128'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''2'',\n  ''action'' => ''member_add'',\n)', 1408432128, '{"1":1}'),
(25, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432400'',\n  ''lastdate'' => ''1408432400'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''1'',\n  ''action'' => ''member_add'',\n)', 1408432400, '{"1":1}'),
(26, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432400'',\n  ''lastdate'' => ''1408432400'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''2'',\n  ''action'' => ''member_add'',\n)', 1408432400, '{"1":1}'),
(27, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432493'',\n  ''lastdate'' => ''1408432493'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''1'',\n  ''action'' => ''member_add'',\n)', 1408432493, '{"1":1}'),
(28, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432493'',\n  ''lastdate'' => ''1408432493'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''2'',\n  ''action'' => ''member_add'',\n)', 1408432493, '{"1":1}'),
(29, 'member_add', 0, 1, 'array (\n  ''username'' => ''hehe'',\n  ''password'' => ''7f30f0b731b883d2aae66a4d4dddc366'',\n  ''email'' => ''hehe@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432577'',\n  ''lastdate'' => ''1408432577'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''4sGUlJ'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''3'',\n  ''action'' => ''member_add'',\n)', 1408432577, '{"1":1}'),
(30, 'member_add', 0, 1, 'array (\n  ''username'' => ''haha'',\n  ''password'' => ''e7ab8954a1db823c792e28ff228ec5a5'',\n  ''email'' => ''haha@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432577'',\n  ''lastdate'' => ''1408432577'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''WwKE4R'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''4'',\n  ''action'' => ''member_add'',\n)', 1408432577, '{"1":1}'),
(31, 'member_add', 0, 1, 'array (\n  ''username'' => ''aaa'',\n  ''password'' => ''591474620785dd8e4ec40e3ab363f02b'',\n  ''email'' => ''aaa@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432577'',\n  ''lastdate'' => ''1408432577'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''bDYZjt'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''5'',\n  ''action'' => ''member_add'',\n)', 1408432577, '{"1":1}'),
(32, 'member_add', 0, 1, 'array (\n  ''username'' => ''lulu'',\n  ''password'' => ''176d72ebaa6f47bd563cb8b78b1a54ca'',\n  ''email'' => ''lulu@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408432577'',\n  ''lastdate'' => ''1408432577'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''QTD3fb'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''6'',\n  ''action'' => ''member_add'',\n)', 1408432577, '{"1":1}'),
(33, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408433219'',\n  ''lastdate'' => ''1408433219'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''1'',\n  ''action'' => ''member_add'',\n)', 1408433219, '{"1":1}'),
(34, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408433219'',\n  ''lastdate'' => ''1408433219'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''2'',\n  ''action'' => ''member_add'',\n)', 1408433219, '{"1":1}'),
(35, 'member_add', 0, 1, 'array (\n  ''username'' => ''sadff'',\n  ''password'' => ''c57c6183bf39a41f09e42baf5f81f035'',\n  ''email'' => ''sadff@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408433358'',\n  ''lastdate'' => ''1408433358'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''AjeA6C'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''1'',\n  ''action'' => ''member_add'',\n)', 1408433358, '{"1":1}'),
(36, 'member_add', 0, 1, 'array (\n  ''username'' => ''nimaB'',\n  ''password'' => ''4f60db2dba8b4972d7c95cd685d40ca9'',\n  ''email'' => ''nimaB@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408433358'',\n  ''lastdate'' => ''1408433358'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''w1FIKE'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''2'',\n  ''action'' => ''member_add'',\n)', 1408433358, '{"1":1}'),
(37, 'member_add', 0, 1, 'array (\n  ''username'' => ''hehe'',\n  ''password'' => ''7f30f0b731b883d2aae66a4d4dddc366'',\n  ''email'' => ''hehe@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408433366'',\n  ''lastdate'' => ''1408433366'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''4sGUlJ'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''3'',\n  ''action'' => ''member_add'',\n)', 1408433366, '{"1":1}'),
(38, 'member_add', 0, 1, 'array (\n  ''username'' => ''haha'',\n  ''password'' => ''e7ab8954a1db823c792e28ff228ec5a5'',\n  ''email'' => ''haha@qq.com'',\n  ''regip'' => ''127.0.0.1'',\n  ''regdate'' => ''1408433366'',\n  ''lastdate'' => ''1408433366'',\n  ''appname'' => ''phpcms v9'',\n  ''type'' => ''app'',\n  ''random'' => ''WwKE4R'',\n  ''ucuserid'' => ''0'',\n  ''uid'' => ''4'',\n  ''action'' => ''member_add'',\n)', 1408433366, '{"1":1}');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sso_session`
-- 

DROP TABLE IF EXISTS `cban_sso_session`;
CREATE TABLE IF NOT EXISTS `cban_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `roleid` tinyint(3) unsigned default '0',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_sso_session`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_sso_settings`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_sso_settings`;
CREATE TABLE IF NOT EXISTS `cban_sso_settings` (
  `name` varchar(32) NOT NULL default '',
  `data` text NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_sso_settings`
-- 

INSERT DELAYED IGNORE INTO `cban_sso_settings` (`name`, `data`) VALUES 
('denyemail', ''),
('denyusername', ''),
('creditrate', ''),
('sp4', ''),
('ucenter', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_supply`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_supply`;
CREATE TABLE IF NOT EXISTS `cban_supply` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `goods` varchar(20) NOT NULL,
  `description` varchar(40) default NULL,
  `type` smallint(1) unsigned NOT NULL COMMENT '1供应，2求购',
  `num` smallint(6) unsigned NOT NULL,
  `diqu` smallint(5) unsigned NOT NULL,
  `img` mediumtext NOT NULL,
  `lxr` varchar(20) NOT NULL,
  `tel` char(11) NOT NULL,
  `note` varchar(100) default NULL,
  `time` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL default '1' COMMENT '1发布中，2发布成功，3撤销发布，4发布失败',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='供应信息表' AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `cban_supply`
-- 

INSERT DELAYED IGNORE INTO `cban_supply` (`id`, `userid`, `username`, `title`, `goods`, `description`, `type`, `num`, `diqu`, `img`, `lxr`, `tel`, `note`, `time`, `status`) VALUES 
(2, 1, 'nima', '111111111', '滚筒冰箱', 'dsfasdfasdf as按时发生的发送到阿萨德发撒的发生的发阿萨德发撒的发生', 1, 11, 241, 'array (\n  0 => \n  array (\n    0 => ''2014/0804/20140804095425390.jpg'',\n    1 => '']1F]~55~8JI0R1C(5VP_%L2'',\n  ),\n)', '111', '11111111111', '', 1407117277, 2);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_tag`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_tag`;
CREATE TABLE IF NOT EXISTS `cban_tag` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL default '0',
  `num` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_tag`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_template_bak`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_template_bak`;
CREATE TABLE IF NOT EXISTS `cban_template_bak` (
  `id` int(10) NOT NULL auto_increment,
  `creat_at` int(10) unsigned default '0',
  `fileid` char(50) default NULL,
  `userid` mediumint(8) default NULL,
  `username` char(20) default NULL,
  `template` text,
  PRIMARY KEY  (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_template_bak`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_times`
-- 

DROP TABLE IF EXISTS `cban_times`;
CREATE TABLE IF NOT EXISTS `cban_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL default '0',
  `isadmin` tinyint(1) NOT NULL default '0',
  `times` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_times`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_type`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_type`;
CREATE TABLE IF NOT EXISTS `cban_type` (
  `typeid` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- 
-- 导出表中的数据 `cban_type`
-- 

INSERT DELAYED IGNORE INTO `cban_type` (`typeid`, `siteid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES 
(52, 1, 'search', 0, '专题', 0, 'special', '', '', 4, '专题'),
(1, 1, 'search', 1, '新闻', 0, '', '', '', 1, '新闻模型搜索'),
(2, 1, 'search', 2, '下载', 0, '', '', '', 3, '下载模型搜索'),
(3, 1, 'search', 3, '图片', 0, '', '', '', 2, '图片模型搜索'),
(54, 1, 'search', 15, '门店信息模型', 0, '', '', '', 0, ''),
(55, 1, 'search', 16, '企业信息模型', 0, '', '', '', 0, ''),
(56, 1, 'search', 17, '展会信息模型', 0, '', '', '', 0, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_urlrule`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_urlrule`;
CREATE TABLE IF NOT EXISTS `cban_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL auto_increment,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL default '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY  (`urlruleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- 
-- 导出表中的数据 `cban_urlrule`
-- 

INSERT DELAYED IGNORE INTO `cban_urlrule` (`urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example`) VALUES 
(1, 'content', 'category', 1, '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html'),
(6, 'content', 'category', 0, 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1'),
(11, 'content', 'show', 1, '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html'),
(12, 'content', 'show', 1, '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html'),
(16, 'content', 'show', 0, 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1'),
(17, 'content', 'show', 0, 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html'),
(18, 'content', 'show', 0, 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html'),
(30, 'content', 'category', 0, 'list-{$catid}-{$page}.html', 'list-1-1.html');

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_video`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_video`;
CREATE TABLE IF NOT EXISTS `cban_video` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` smallint(5) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL default '',
  `style` char(24) NOT NULL default '',
  `thumb` char(100) NOT NULL default '',
  `keywords` char(40) NOT NULL default '',
  `description` char(255) NOT NULL default '',
  `posids` tinyint(1) unsigned NOT NULL default '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `status` tinyint(2) unsigned NOT NULL default '1',
  `sysadd` tinyint(1) unsigned NOT NULL default '0',
  `islink` tinyint(1) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `vision` varchar(255) NOT NULL default '',
  `video_category` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_video`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_video_content`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_video_content`;
CREATE TABLE IF NOT EXISTS `cban_video_content` (
  `contentid` int(10) unsigned NOT NULL default '0',
  `modelid` smallint(5) unsigned NOT NULL default '0',
  `videoid` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_video_content`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_video_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_video_data`;
CREATE TABLE IF NOT EXISTS `cban_video_data` (
  `id` mediumint(8) unsigned default '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL default '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL default '0',
  `allow_comment` tinyint(1) unsigned NOT NULL default '1',
  `relation` varchar(255) NOT NULL default '',
  `video` tinyint(3) unsigned NOT NULL default '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_video_data`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_video_store`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_video_store`;
CREATE TABLE IF NOT EXISTS `cban_video_store` (
  `videoid` int(10) unsigned NOT NULL auto_increment,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL default '0',
  `userupload` tinyint(1) NOT NULL default '0',
  `channelid` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_video_store`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_vote_data`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_vote_data`;
CREATE TABLE IF NOT EXISTS `cban_vote_data` (
  `userid` mediumint(8) unsigned default '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL default '0',
  `time` int(10) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_vote_data`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_vote_option`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_vote_option`;
CREATE TABLE IF NOT EXISTS `cban_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned default '0',
  `subjectid` mediumint(8) unsigned NOT NULL default '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) default NULL,
  `listorder` tinyint(2) unsigned default '0',
  PRIMARY KEY  (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_vote_option`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_vote_subject`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_vote_subject`;
CREATE TABLE IF NOT EXISTS `cban_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned default '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL default '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL default '0',
  `credit` smallint(5) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `fromdate` date NOT NULL default '0000-00-00',
  `todate` date NOT NULL default '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `allowguest` tinyint(1) unsigned NOT NULL default '1',
  `maxval` tinyint(2) unsigned NOT NULL default '0',
  `minval` tinyint(1) unsigned NOT NULL default '1',
  `allowview` tinyint(1) unsigned NOT NULL default '1',
  `optionnumber` tinyint(3) unsigned NOT NULL default '0',
  `votenumber` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_vote_subject`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_wap`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_wap`;
CREATE TABLE IF NOT EXISTS `cban_wap` (
  `siteid` smallint(5) unsigned NOT NULL default '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) default NULL,
  `domain` varchar(100) default NULL,
  `setting` mediumtext,
  `status` tinyint(2) default NULL,
  PRIMARY KEY  (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `cban_wap`
-- 

INSERT DELAYED IGNORE INTO `cban_wap` (`siteid`, `sitename`, `logo`, `domain`, `setting`, `status`) VALUES 
(1, 'PHPCMS手机门户', '/statics/images/wap/wlogo.gif', '', 'array (\n  ''listnum'' => ''10'',\n  ''thumb_w'' => ''220'',\n  ''thumb_h'' => ''0'',\n  ''c_num'' => ''1000'',\n  ''index_template'' => ''index'',\n  ''category_template'' => ''category'',\n  ''list_template'' => ''list'',\n  ''show_template'' => ''show'',\n)', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `cban_wap_type`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_wap_type`;
CREATE TABLE IF NOT EXISTS `cban_wap_type` (
  `typeid` smallint(5) NOT NULL auto_increment,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) default '0',
  PRIMARY KEY  (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `cban_wap_type`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `cban_workflow`
-- 
-- 创建时间: 2014 年 08 月 11 日 09:07
-- 最后更新时间: 2014 年 08 月 11 日 09:07
-- 

DROP TABLE IF EXISTS `cban_workflow`;
CREATE TABLE IF NOT EXISTS `cban_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL auto_increment,
  `siteid` smallint(5) unsigned NOT NULL default '0',
  `steps` tinyint(1) unsigned NOT NULL default '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`workflowid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- 导出表中的数据 `cban_workflow`
-- 

INSERT DELAYED IGNORE INTO `cban_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`, `flag`) VALUES 
(1, 1, 1, '一级审核', '审核一次', '', 0),
(2, 1, 2, '二级审核', '审核两次', '', 0),
(3, 1, 3, '三级审核', '审核三次', '', 0),
(4, 1, 4, '四级审核', '四级审核', '', 0);

SET FOREIGN_KEY_CHECKS=1;

COMMIT;
