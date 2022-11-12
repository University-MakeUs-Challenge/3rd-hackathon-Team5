
CREATE TABLE `Applicant` (
   `idx`   int  auto_increment NOT NULL primary key ,
   `matchStatus`   varchar(10)   NOT NULL,
   `status`   varchar(10)   NOT NULL   DEFAULT 'ACTIVE',
   `createdAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP,
   `updatedAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
   `userIdx`   int   NOT NULL,
   `postIdx`   int   NOT NULL
);

CREATE TABLE `Project` (
   `idx`   int auto_increment   NOT NULL primary key ,
   `time`   timestamp   NOT NULL,
   `location`   varchar(50)   NOT NULL,
   `matchType`   varchar(10)   NOT NULL,
   `isOffline`   varchar(10)   NOT NULL,
   `projectStatus`   varchar(10)   NOT NULL   COMMENT '진행중 또는 완료 둘 중 하나',
   `status`   varchar(10)   NOT NULL   DEFAULT 'ACTIVE',
   `createdAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP,
   `updatedAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `User` (
   `idx`   int  auto_increment NOT NULL primary key ,
   `loginId`   varchar(20)   NOT NULL,
   `profileImgUrl`   text   NULL,
   `password`   text   NOT NULL,
   `nickName`   varchar(20)   NOT NULL,
   `university`   varchar(20)   NOT NULL,
   `createdAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP,
   `updatedAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
   `status`   varchar(10)   NOT NULL   DEFAULT 'ACTIVE'
);

CREATE TABLE `Post` (
   `postIdx`   int auto_increment  NOT NULL primary key ,
   `title`   varchar(30)   NOT NULL,
   `content`   text   NOT NULL,
   `headCount`   int   NOT NULL,
   `position`   varchar(10)   NOT NULL,
   `framework`   varchar(10)   NOT NULL,
   `matchStatus`   varchar(10)   NOT NULL,
   `status`   varchar(10)   NOT NULL   DEFAULT 'ACTIVE'   COMMENT '게시글 삭제 시 DELETED',
   `createdAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP,
   `updatedAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
   `userIdx`   int   NOT NULL,
   `projectIdx`   int   NOT NULL
);

CREATE TABLE `Grade` (
   `idx`   int  auto_increment  NOT NULL primary key ,
   `grade`   int   NOT NULL,
   `time`   varchar(20)   NOT NULL,
   `communication`   varchar(20)   NOT NULL,
   `skill`   varchar(20)   NOT NULL,
   `status`   varchar(10)   NOT NULL   DEFAULT 'ACTIVE',
   `createdAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP,
   `updatedAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
   `graderIdx`   int   NOT NULL,
   `gradeeIdx`   int   NOT NULL
);

CREATE TABLE `Portfolio` (
   `idx`   int  auto_increment NOT NULL primary key ,
   `userIdx`   int   NOT NULL,
   `position`   varchar(30)   NOT NULL   COMMENT '디자이너
프론트엔드 개발자
백엔드 개발자
기획자',
   `framework`   varchar(30)   NULL   COMMENT 'IOS
SPRING 등',
   `info`   varchar(100)   NOT NULL   COMMENT '간단한 소개',
   `createdAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP,
   `updatedAt`   datetime   NOT NULL   DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `Member` (
   `idx`   int   NOT NULL primary key ,
   `userIdx`   int   NOT NULL,
   `proejctIdx`   int   NOT NULL
);



ALTER TABLE `Applicant` ADD CONSTRAINT `FK_User_TO_Applicant_1` FOREIGN KEY (
   `userIdx`
)
REFERENCES `User` (
   `idx`
);

ALTER TABLE `Applicant` ADD CONSTRAINT `FK_Post_TO_Applicant_1` FOREIGN KEY (
   `postIdx`
)
REFERENCES `Post` (
   `postIdx`
);

ALTER TABLE `Post` ADD CONSTRAINT `FK_User_TO_Post_1` FOREIGN KEY (
   `userIdx`
)
REFERENCES `User` (
   `idx`
);

ALTER TABLE `Post` ADD CONSTRAINT `FK_Project_TO_Post_1` FOREIGN KEY (
   `projectIdx`
)
REFERENCES `Project` (
   `idx`
);

ALTER TABLE `Grade` ADD CONSTRAINT `FK_Member_TO_Grade_1` FOREIGN KEY (
   `graderIdx`
)
REFERENCES `Member` (
   `idx`
);

ALTER TABLE `Grade` ADD CONSTRAINT `FK_Member_TO_Grade_2` FOREIGN KEY (
   `gradeeIdx`
)
REFERENCES `Member` (
   `idx`
);

ALTER TABLE `Portfolio` ADD CONSTRAINT `FK_User_TO_Portfolio_1` FOREIGN KEY (
   `userIdx`
)
REFERENCES `User` (
   `idx`
);

ALTER TABLE `Member` ADD CONSTRAINT `FK_User_TO_Member_1` FOREIGN KEY (
   `userIdx`
)
REFERENCES `User` (
   `idx`
);

ALTER TABLE `Member` ADD CONSTRAINT `FK_Project_TO_Member_1` FOREIGN KEY (
   `proejctIdx`
)
REFERENCES `Project` (
   `idx`
);
