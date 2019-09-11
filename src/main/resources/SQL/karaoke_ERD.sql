
/* Drop Tables */

DROP TABLE announcement CASCADE CONSTRAINTS;
DROP TABLE MemberClubs CASCADE CONSTRAINTS;
DROP TABLE posts CASCADE CONSTRAINTS;
DROP TABLE Files CASCADE CONSTRAINTS;
DROP TABLE levels CASCADE CONSTRAINTS;
DROP TABLE pointslog CASCADE CONSTRAINTS;
DROP TABLE replies CASCADE CONSTRAINTS;
DROP TABLE memberInfo CASCADE CONSTRAINTS;
DROP TABLE clubs CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_announcement_annNo;
DROP SEQUENCE SEQ_clubs_clubNum;
DROP SEQUENCE SEQ_Files_fileno;
DROP SEQUENCE SEQ_MemberClubs_memberClubNum;
DROP SEQUENCE SEQ_memberInfo_memberNum;
DROP SEQUENCE SEQ_NEW_TABLE_userNum;
DROP SEQUENCE SEQ_pointslog_logid;
DROP SEQUENCE SEQ_pointslog_lognum;
DROP SEQUENCE SEQ_posts_postno;
DROP SEQUENCE SEQ_replies_replyno;
DROP SEQUENCE SEQ_userinfo_userNum;



d
/* Create Sequences */

CREATE SEQUENCE SEQ_announcement_annNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_clubs_clubNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Files_fileno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MemberClubs_memberClubNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_memberInfo_memberNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NEW_TABLE_userNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pointslog_logid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pointslog_lognum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_posts_postno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_replies_replyno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_userinfo_userNum INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE announcement
(
	annNo number NOT NULL,
	-- 게시물번호
	postno number NOT NULL 게시물 번호. 기본키,
	anndate date DEFAULT sysdate,
	anntitle varchar2(500),
	anncontent varchar2(1000),
	PRIMARY KEY (annNo)
);


CREATE TABLE clubs
(
	-- 각 클럽의 일련번호. 
	clubNum number NOT NULL,
	-- 
	-- 
	clubName varchar2(100) NOT NULL,
	club_date date,
	-- 총 클럽멤버 수
	cbtotal number DEFAULT 0,
	PRIMARY KEY (clubNum)
);


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


CREATE TABLE levels
(
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	-- 'manager', 'regular member', 'beginner' 
	-- 매니저,     정회원             ,  준회원
	levels varchar2(20)
);


CREATE TABLE MemberClubs
(
	-- 이 테이블은 멤버들이 가입한 클럽들을 관리하도록 만든 테이블이다. 각각 튜블을 구별하기 위해 일련번호 시퀀스를 추가하였다. 
	memberClubNum number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	-- 각 클럽의 일련번호. 
	clubNum number NOT NULL,
	PRIMARY KEY (memberClubNum)
);


-- 회원 정보 테이블이다.
CREATE TABLE memberInfo
(
	-- 유저 아이디와 별도로 만들 user number. 시퀀스처리
	memberNum number NOT NULL 기본키,
	-- 각 클럽의 일련번호. 
	clubNum number,
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
	-- number타입. 
	-- 0-false / 매니저아님
	-- 1-true / 매니저
	-- 
	isManager number(1) DEFAULT 0,
	recommender varchar2(50),
	PRIMARY KEY (memberNum)
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
	-- 베스트 게시물 등재 여부
	-- 
	-- 
	isBest char(2) DEFAULT '''N''',
	PRIMARY KEY (postno)
);


CREATE TABLE replies
(
	replyno number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	replyContent varchar2(500),
	replyDate date DEFAULT sysdate,
	PRIMARY KEY (replyno)
);



/* Create Foreign Keys */

ALTER TABLE MemberClubs
	ADD FOREIGN KEY (clubNum)
	REFERENCES clubs (clubNum)
;


ALTER TABLE memberInfo
	ADD FOREIGN KEY (clubNum)
	REFERENCES clubs (clubNum)
;


ALTER TABLE posts
	ADD FOREIGN KEY (filename)
	REFERENCES Files (filename)
;


ALTER TABLE Files
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
;


ALTER TABLE levels
	ADD FOREIGN KEY (memberid)
	REFERENCES memberInfo (memberid)
;


ALTER TABLE MemberClubs
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


ALTER TABLE announcement
	ADD FOREIGN KEY (postno)
	REFERENCES posts (postno)
;


