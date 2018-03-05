CREATE TABLE `desk` (
  `did` int(11) NOT NULL,
  `dName` varchar(32) DEFAULT NULL,
  `seatNum` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `dState` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `desk_users_FK` (`uid`),
  CONSTRAINT `desk_users_FK` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `goods` (
  `gid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `gName` varchar(32) DEFAULT NULL,
  `gPrice` varchar(32) DEFAULT NULL,
  `gImage` varchar(32) DEFAULT NULL,
  `gStyle` varchar(32) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `gState` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `goods_style_FK` (`sid`),
  CONSTRAINT `goods_style_FK` FOREIGN KEY (`sid`) REFERENCES `style` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order` (
  `oid` varchar(64) NOT NULL,
  `oDate` date DEFAULT NULL,
  `totalPrice` decimal(10,0) DEFAULT NULL,
  `oState` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `order_desk_FK` (`did`),
  KEY `order_users_FK` (`uid`),
  CONSTRAINT `order_desk_FK` FOREIGN KEY (`did`) REFERENCES `desk` (`did`),
  CONSTRAINT `order_users_FK` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orderItem` (
  `oiid` varchar(32) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `oid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`oiid`),
  KEY `orderItem_goods_FK` (`gid`),
  KEY `orderItem_order_FK` (`oid`),
  CONSTRAINT `orderItem_goods_FK` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `orderItem_order_FK` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `style` (
  `sid` int(11) NOT NULL,
  `sName` varchar(32) DEFAULT NULL,
  `spid` int(11) DEFAULT NULL,
  `sPath` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `userPwd` varchar(128) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `userState` int(11) DEFAULT NULL,
  `userImage` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `messages` (
  `mId` varchar(32) NOT NULL,
  `mEmail` varchar(128) NOT NULL,
  `message` text NOT NULL,
  `mSubject` varchar(32) NOT NULL,
  `mState` int(11) NOT NULL DEFAULT '0',
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;