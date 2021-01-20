drop database if exists `ZeroGravity`;

create database `ZeroGravity`;

use  `ZeroGravity`;


--用户信息表(user)
create table `tbl_user` (
   `user_id`          int unsigned  not null               comment "用户id" ,       
   `account_password` varchar2(20)      null               comment "账户密码",
   `account`          varchar2(20)      null               comment "Q Q账号",
   `nickname`         varchar2(20)      null               comment "昵称",
   `avatar`           varchar2(255)     null               comment "头像",
   `energy`           int               null  default 0    comment "能量值"  ,   
--添加约束
primary key                         (`id`),
key  `account_password`             (`account_password`),
key  `account`                      (`account`),
key  `nickname`                     (`nickname`),
key  `avater`                       (`avater`),
key  `energy`                       (`energy`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;




--想法表(idea)
create table `tbl_idea`(
    `id`              int           not null comment "想法id",
    `content`         varchar(255)      null comment "想法内容",
    `releaseDate`     date              null comment "发布日期",
    `publisher_id `   int               null comment "发布者ID",
    `likes_sum`       int               null comment "点赞数",
    `comments_sum`    int               null comment "评论数",
    `collection_sum`  int               null comment "收藏数",
--添加约束
primary key                         (`id`),
foreign key                         (`publisher_id`),
key   `content`                     (`content`),
key   `releaseDate`                 (`releaseDate`),
key   `likes_sum`                   (`likes_sum`),
key   `comments_sum`                (`comments_sum`),
key   `collection_sum`              (`collection_sum`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;





--评论表(comments)
create table `tbl_comments`(
    `id`               int          not null comment "评论id" ,
    `commenter_id`     int              null comment "评论者id",
    `commented_id`     int              null comment "被评论者id",
    `likes_sum`        int              null comment "赞数",
    `release_date`     date default sysdate  comment "发布日期",
    `content`          varchar(255)     null comment "内容",
--添加约束
primary key                          (`id`),
foreign key                          (`commenter_id`),
foreign key                          (`commented_id`),
key           `likes_sum`            (`likes_sum`),
key           `release_date`         (`release_date`),
key           `content`              (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;




--收藏表(favorite_records)
create table `tbl_favorite_records`(
    `id`               int           not null comment "收藏记录序号",
    `collector_id`     int               null comment "收藏者id",
    `idea_id`          int               null comment "想法id",
--添加约束
primary key                           (`id`),
foreign key                           (`collector_id`),
foreign key                           (`idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


 

----想法点赞记录表(like_record_idea)
create table `tbl_like_record_idea`(
    `id`               int            not null comment "点赞记录序号",
    `idea_id`          int                     comment "想法id",
    `likers_id`        int                     comment "点赞者id",
    `beliked_id`       int                     comment "被点赞者id",
--添加约束
primary key                           (`id`),
foreign key                           (`idea_id`),
foreign key                           (`likers_id`),
foreign key                           (`beliked_id`)

) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;



--评论点赞记录表(comment_record_idea)
create table `tbl_comment_record_idea`(
    `id`               int            not null comment "点赞记录序号",
    `comment_id`       int                null comment "评论id",
    `likers_id`        int                null comment "点赞者id",
    `beliked_id`       int                null comment "被点赞者id",
--添加约束
primary key                            (`id`),
foreign key                            (`comment_id`),
foreign key                            (`likers_id`),
foreign key                            (`beliked_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

