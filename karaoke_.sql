
/* Drop Tables */

DROP TABLE follower CASCADE CONSTRAINTS;
DROP TABLE pointslog CASCADE CONSTRAINTS;
DROP TABLE replies CASCADE CONSTRAINTS;
DROP TABLE posts CASCADE CONSTRAINTS;
DROP TABLE memberInfo CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_announcement_annNo;
DROP SEQUENCE SEQ_clubs_clubNum;
DROP SEQUENCE SEQ_Files_fileno;
DROP SEQUENCE SEQ_MemberClubs_memberClubNum;
DROP SEQUENCE SEQ_NEW_TABLE_userNum;
DROP SEQUENCE SEQ_pointslog_logid;
DROP SEQUENCE SEQ_pointslog_lognum;
DROP SEQUENCE SEQ_posts_postno;
DROP SEQUENCE SEQ_replies_replyno;
DROP SEQUENCE SEQ_userinfo_userNum;





/* Drop Tables */

DROP TABLE follower CASCADE CONSTRAINTS;
DROP TABLE pointslog CASCADE CONSTRAINTS;
DROP TABLE replies CASCADE CONSTRAINTS;
DROP TABLE posts CASCADE CONSTRAINTS;
DROP TABLE memberInfo CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_announcement_annNo;
DROP SEQUENCE SEQ_clubs_clubNum;
DROP SEQUENCE SEQ_Files_fileno;
DROP SEQUENCE SEQ_MemberClubs_memberClubNum;
DROP SEQUENCE SEQ_NEW_TABLE_userNum;
DROP SEQUENCE SEQ_pointslog_logid;
DROP SEQUENCE SEQ_pointslog_lognum;
DROP SEQUENCE SEQ_posts_postno;
DROP SEQUENCE SEQ_replies_replyno;
DROP SEQUENCE SEQ_userinfo_userNum;




/* Create Sequences */

CREATE SEQUENCE followerNumSeq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE logNumSeq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE replyNoSeq BY 1 START WITH 1;
CREATE SEQUENCE postNoSeq INCREMENT BY 1 START WITH 1;




/* Create Tables */

CREATE TABLE follower
(
	followerNum number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberId varchar2(50) NOT NULL,
	followName varchar2(100) NOT NULL,
	-- 1 > follower
	-- 2 > following
	followType number,
	PRIMARY KEY (followerNum)
);


-- 회원 정보 테이블이다.
CREATE TABLE memberInfo
(
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberId varchar2(50) NOT NULL UNIQUE,
	-- 유저 비밀번호
	memberPwd varchar2(40) NOT NULL,
	-- 유저가 회원 가입할 때 입력한 실명
	memberName varchar2(30) NOT NULL,
	-- 유저 휴대폰 번호. 
	memberPhone varchar2(20) NOT NULL,
	memberBirth varchar2(20),
	-- 가입날짜
	signupDate date DEFAULT sysdate,
	memberEmail varchar2(50),
	-- 유저의 포인트 보유수 
	memberPoint number(10),
	recommender varchar2(50),
	-- 'manager', 'regular member', 'beginner' 
	-- 매니저,     정회원             ,  준회원
	memberLevel varchar2(20) DEFAULT 'beginner',
	-- t
	photo varchar2(100),
	PRIMARY KEY (memberId)
);


CREATE TABLE pointslog
(
	lognum number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberId varchar2(50) NOT NULL UNIQUE,
	theOtherId varchar2(50),
	eventdate date,
	amount number,
	-- 포인트를 상대방에게 주고 난 뒤 얼마나 남아있는지 추적하기 위한 칼럼
	balance number,
	pointtype varchar2(30),
	PRIMARY KEY (logNum)
);


CREATE TABLE posts
(
	-- 게시물번호
	postNo number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberId varchar2(50) NOT NULL UNIQUE,
	postTitle varchar2(500) NOT NULL,
	postContent varchar2(4000),
	postView number DEFAULT 0,
	postLike number DEFAULT 0,
	postDate date DEFAULT sysdate,
	isAnnouncement char(2) DEFAULT 'N',
	postType varchar2(50) NOT NULL,
	originalFile  varchar2(200),
	savedFile  varchar2(50),
	reported number,
	PRIMARY KEY (postNo)
);


CREATE TABLE replies
(
	replyNo number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberId varchar2(50) NOT NULL UNIQUE,
	-- 게시물번호
	postNo number NOT NULL,
	replyContent varchar2(500),
	replyDate date DEFAULT sysdate,
	PRIMARY KEY (replyNo)
);




/* Create Foreign Keys */

ALTER TABLE follower
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
	ON DELETE CASCADE
;



ALTER TABLE replies
	ADD CONSTRAINT delete FOREIGN KEY (postno)
	REFERENCES posts (postno)
	ON DELETE CASCADE
;



