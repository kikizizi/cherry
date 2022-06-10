create table users(
	num number primary key,
	id varchar2(100),
	pwd varchar2(100),
	email varchar2(100),
	regdate date
);

create sequence users_seq;

create table products(
	num number primary key,
	title varchar2(200),
	priceWon varchar2(50),
	id varchar2(100),
	isSaled number,
	viewCount number,
	wishCount number,
	category varchar2(100),
	imgPaths varchar2(300),
	explanation varchar2(4000), 
	regdate date
);

create sequence product_seq;

create table chatLog (roomId varchar2(200),talker varchar2(100),text varchar2(2000),regdate number);

create table chatRoom (roomId varchar2(200),talker varchar2(100),text varchar2(100),regdate number,isRead number,listener varchar2(100));

create table wishlist(num number,id varchar2(100),regdate date);