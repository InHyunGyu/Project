
/* Drop Tables */

DROP TABLE announcement CASCADE CONSTRAINTS;
DROP TABLE posts CASCADE CONSTRAINTS;
DROP TABLE Files CASCADE CONSTRAINTS;
DROP TABLE levels CASCADE CONSTRAINTS;
DROP TABLE pointslog CASCADE CONSTRAINTS;
DROP TABLE replies CASCADE CONSTRAINTS;
DROP TABLE memberInfo CASCADE CONSTRAINTS;
DROP TABLE clubs CASCADE CONSTRAINTS;



/* Create Sequences */

CREATE SEQUENCE seq_memberInfo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_userNum INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_logid INCREMENT BY 1 START WITH 1;




/* Create Tables */

CREATE TABLE announcement
(
	annNo number NOT NULL,
	anndate date DEFAULT sysdate,
	anntitle varchar2(500),
	anncontent varchar2(1000),
	PRIMARY KEY (annNo)
);


CREATE TABLE clubs
(
	-- 각 클럽의 일련번호. 난수를 발생시켜 일련번호를 생성할 계획. 
	clubNum varchar2(200) NOT NULL,
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


-- 회원 정보 테이블이다.
CREATE TABLE memberInfo
(
	-- 유저 아이디와 별도로 만들 user number. 시퀀스처리
	memberNum number NOT NULL PRIMARY KEY,
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
	-- 각 클럽의 일련번호. 난수를 발생시켜 일련번호를 생성할 계획. 
	clubNum varchar2(200) NOT NULL,
	--포인트 타입
	purchaseType varchar2(30)
);


CREATE TABLE pointslog
(
	logid number NOT NULL,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	theOtherId varchar2(50),
	eventdate date,
	amount number,
	-- 포인트를 상대방에게 주고 난 뒤 얼마나 남아있는지 추적하기 위한 칼럼
	balance number,
	PRIMARY KEY (logid)
);


CREATE TABLE posts
(
	-- 게시물번호
	postno number NOT NULL 게시물 번호. 기본키,
	-- 회원이 로그인할 때 쓸 아이디이다. 
	memberid varchar2(50) NOT NULL UNIQUE,
	postview number DEFAULT 0,
	postlike number DEFAULT 0,
	-- 베스트 게시물 등재 여부
	-- 
	-- 
	isBest char(2),
	filename varchar2(500) NOT NULL UNIQUE,
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

---------------------더미 데이터 CRUD 쿼리문들----------------------------
--멤버 insert
INSERT INTO memberinfo
VALUES(SEQ_memberInfo_memberNum.nextval, 'asdf', 'asdf', 'gyu', '010-9292-1919','1993-09-09', to_date(sysdate,'yyyy-mm-dd'), 
 'dididi@daum.net', 0, 0, 'hans', '45642');

--멤버 1명 select
SELECT memberid "멤버아이디", membername
FROM memberinfo
WHERE memberid = 'asdf'; 



