create table users(
	num number primary key,
	id varchar2(100),
	pwd varchar2(100),
	email varchar2(100),
	regdate date
);

create sequence users_seq;

