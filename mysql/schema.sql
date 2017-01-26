# ------------------------------------------------------------

DROP TABLE IF EXISTS `short_url`;

CREATE TABLE `short_url` (
  `shortcut_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `shortcut` varchar(32) NOT NULL DEFAULT '',
  `destination_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `set_referrer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shortcut_id`),
  UNIQUE KEY `shortcut` (`shortcut`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# ------------------------------------------------------------

DROP TABLE IF EXISTS `short_url_tracking`;

CREATE TABLE `short_url_tracking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shortcut_id` smallint(3) unsigned DEFAULT '0',
  `request_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip_address` int(10) unsigned NOT NULL DEFAULT '0',
  `source` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `shortcut_id` (`shortcut_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
