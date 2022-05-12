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
	explanation long, 
	regdate date
);

create sequence product_seq;