
/* Drop Tables */

DROP TABLE posts CASCADE CONSTRAINTS;
DROP TABLE Files CASCADE CONSTRAINTS;
DROP TABLE pointslog CASCADE CONSTRAINTS;
DROP TABLE replies CASCADE CONSTRAINTS;
DROP TABLE memberInfo CASCADE CONSTRAINTS;
DROP TABLE follower CASCADE CONSTRAINTS;



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

CREATE SEQUENCE SEQ_announcement_annNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_clubs_clubNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Files_fileno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MemberClubs_memberClubNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NEW_TABLE_userNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pointslog_logid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pointslog_lognum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_posts_postno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_replies_replyno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_userinfo_userNum INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE Files
(
	-- 파일들을 관리하기 위한 고유 번호
	fileno number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	-- 파일크기
	filesize number,
	filename varchar2(500) UNIQUE,
	filedate date,
	-- 게시물번호
	postno number NOT NULL 게시물 번호. 기본키,
	-- 신고받은 수
	Reported number DEFAULT 0,
	PRIMARY KEY (fileno)
);


CREATE TABLE follower
(
	followerNum number NOT NULL,
	memberid varchar2(50) NOT NULL,
	-- 
	-- 
	clubName varchar2(100) NOT NULL,
	-- 1 > follower
	-- 2 > following
	followType number,
	PRIMARY KEY (followerNum)
);


-- 회원 정보 테이블이다.
CREATE TABLE memberInfo
(
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	-- 유저 비밀번호
	memberpwd varchar2(40) NOT NULL,
	-- 유저가 회원 가입할 때 입력한 실명
	membername varchar2(30) NOT NULL,
	-- 유저 휴대폰 번호. 
	memberphone varchar2(20) NOT NULL,
	memberbirth varchar2(20),
	-- 가입날짜
	signupDate date DEFAULT sysdate,
	memberEmail varchar2(50),
	-- 유저의 포인트 보유수 
	memberpoint number(10),
	recommender varchar2(50),
	-- 'manager', 'regular member', 'beginner' 
	-- 매니저,     정회원             ,  준회원
	memberLevel varchar2(20) DEFAULT '''beginner''',
	-- t
	photo varchar2(100),
	followerNum number NOT NULL,
	PRIMARY KEY (memberid)
);


CREATE TABLE pointslog
(
	lognum number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	theOtherId varchar2(50),
	eventdate date,
	amount number,
	-- 포인트를 상대방에게 주고 난 뒤 얼마나 남아있는지 추적하기 위한 칼럼
	balance number,
	pointtype varchar2(30),
	PRIMARY KEY (lognum)
);


CREATE TABLE posts
(
	-- 게시물번호
	postno number NOT NULL 게시물 번호. 기본키,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	filename varchar2(500) NOT NULL UNIQUE,
	postTitle varchar2(500) NOT NULL,
	postcontent varchar2(4000),
	postview number DEFAULT 0,
	postlike number DEFAULT 0,
	postdate date DEFAULT sysdate,
	isAnnouncement char(2) DEFAULT '''N''',
	postType varchar2(50) NOT NULL,
	originalfile  varchar2(200),
	savedfile  varchar2(50),
	-- 앙
	reported number,
	PRIMARY KEY (postno)
);


CREATE TABLE replies
(
	replyno number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	postno number NOT NULL,
	replyContent varchar2(500),
	replyDate date DEFAULT sysdate,
	PRIMARY KEY (replyno)
);



/* Create Foreign Keys */

ALTER TABLE posts
	ADD FOREIGN KEY (filename)
	REFERENCES Files (filename)
;


ALTER TABLE memberInfo
	ADD FOREIGN KEY (followerNum)
	REFERENCES follower (followerNum)
;


ALTER TABLE Files
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
;


ALTER TABLE pointslog
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
;


ALTER TABLE posts
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
;


ALTER TABLE replies
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
;



