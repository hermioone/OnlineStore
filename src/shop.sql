/*删除商城数据库,如果存在*/
drop database if exists shop;
/*创建数据库,并设置编码*/
create database shop default character set utf8;

use shop;
/*删除管理员表*/
drop table if exists account;
/*删除商品类别表*/
drop table if exists category;

/*============================*/
/* Table: 管理员表结构 		  */
/*============================*/
create table account
(
   /* 管理员编号,自动增长 */
   id                  int not null auto_increment,
   /* 管理员登录名  */
   login               varchar(20),
   /* 管理员姓名  */
   name                varchar(20),
   /* 管理员密码 */
   pass                varchar(20),
   /* 设置编号为主键 */
   primary key (id)
);

/*=============================*/
/* Table: 商品类别表结构 		   */
/*=============================*/
create table category
(
   /* 类别编号,自动增长 */
   id                  int not null auto_increment,
   /* 类别名称 */
   type                varchar(20),
   /* 类别是否为热点类别,热点类别才有可能显示在首页 */
   hot                 bool default false,
   /* 外键,此类别由哪位管理员管理 */
   aid                  int,
   /* 设置类别编号为主键 */
   primary key (id)
);

/*插入测试用例*/
INSERT INTO account(login,name,pass) values ('admin','管理员','admin');
INSERT INTO account(login,name,pass) values ('user','客服A','user');

INSERT INTO category (type,hot,aid) VALUES ('男士休闲',true,1);
INSERT INTO category (type,hot,aid) VALUES ('女士休闲',false,2);
INSERT INTO category (type,hot,aid) VALUES ('儿童休闲',true,2);

SELECT * FROM account;
SELECT * FROM category;

select category0_.id as id0_0_, account1_.id as id1_1_, category0_.type as type0_0_, category0_.hot as hot0_0_, category0_.aid as aid0_0_, account1_.login as login1_1_, account1_.name as name1_1_, account1_.pass as pass1_1_ 
from shop.category category0_ left outer join shop.account account1_ 
on category0_.aid=account1_.id where category0_.type like '%%'

select count(category0_.id) as col_0_0_ from shop.category category0_ where category0_.type like '%%'

select category0_.id as id0_0_, account1_.id as id1_1_, category0_.type as type0_0_, category0_.hot as hot0_0_, category0_.aid as aid0_0_, account1_.login as login1_1_, account1_.name as name1_1_, account1_.pass as pass1_1_ from shop.category category0_ left outer join shop.account account1_ on category0_.aid=account1_.id where category0_.type like '%Male%'

delete from shop.category

