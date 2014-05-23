DROP TABLE bbs;
DROP TABLE calendar;
DROP TABLE album;

CREATE TABLE bbs(
	seq	int not null primary key auto_increment,
	subject	varchar(200),
	name varchar(100),
	content text,
	filename varchar(50),
	grp varchar(20) not null,
	grpname varchar(100) not null,
	regdate date
);

CREATE TABLE calendar(
	seq	int not null primary key auto_increment,
	subject varchar(200) not null,
	content text,
	year int,
	month int,
	day int,
	regdate date
);

CREATE TABLE album(
	seq	int not null primary key auto_increment,
	subject varchar(200),
	typ varchar(20) not null,
	grp varchar(200),
	photoname varchar(50),
	regdate date
);


SHOW TABLES;