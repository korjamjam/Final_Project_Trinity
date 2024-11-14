-- 기존 테이블 및 시퀀스 삭제
    DROP SEQUENCE SEQ_USER_NO;
    DROP TABLE HOSPITAL CASCADE CONSTRAINTS;
    DROP TABLE MEDICAL_FIELD CASCADE CONSTRAINTS;
    DROP TABLE USER_TABLE CASCADE CONSTRAINTS;
    DROP TABLE MEMBER CASCADE CONSTRAINTS;
    DROP TABLE BOARD CASCADE CONSTRAINTS;
    DROP TABLE FILE_TABLE CASCADE CONSTRAINTS;
    DROP TABLE COMMENTS_TABLE CASCADE CONSTRAINTS;
    DROP TABLE TREATMENT CASCADE CONSTRAINTS;
    DROP TABLE RESERVATION CASCADE CONSTRAINTS;
    DROP TABLE DOCTOR_REVIEW CASCADE CONSTRAINTS;
    DROP TABLE HOSPITAL_KID CASCADE CONSTRAINTS;

-- Drop sequences
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_HNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_MNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_UNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_RNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_BNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_FNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_CNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TNO';
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_RESNO';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- 시퀀스 생성
CREATE SEQUENCE SEQ_USER_NO
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

-- HOSPITAL 테이블 생성
CREATE TABLE HOSPITAL (
    HOS_NO VARCHAR2(2000) NOT NULL PRIMARY KEY,
    HOS_ID VARCHAR2(20) NOT NULL,
    HOS_PWD VARCHAR2(20) NOT NULL,
    HOS_NAME VARCHAR2(50) NOT NULL,
    HOS_ADDRESS VARCHAR2(200) NOT NULL,
    HOS_TEL VARCHAR2(20) NOT NULL,
    HOS_YEAR DATE DEFAULT SYSDATE,
    HOS_TIME VARCHAR2(20) NOT NULL,
    HOS_INFO VARCHAR2(2000),
    HOS_LATITUDE NUMBER,
    HOS_LONGITUDE NUMBER,
    HOS_ONDUTY VARCHAR2(20),
    HOS_PARKING VARCHAR2(100)
);

COMMENT ON COLUMN HOSPITAL.HOS_NO IS '병원 고유 번호';
COMMENT ON COLUMN HOSPITAL.HOS_ID IS '병원 아이디';
COMMENT ON COLUMN HOSPITAL.HOS_PWD IS '병원 비밀번호';
COMMENT ON COLUMN HOSPITAL.HOS_NAME IS '병원 이름';
COMMENT ON COLUMN HOSPITAL.HOS_ADDRESS IS '병원 주소';
COMMENT ON COLUMN HOSPITAL.HOS_TEL IS '병원 전화번호';
COMMENT ON COLUMN HOSPITAL.HOS_YEAR IS '병원 개설일자';
COMMENT ON COLUMN HOSPITAL.HOS_TIME IS '병원 진료시간';
COMMENT ON COLUMN HOSPITAL.HOS_INFO IS '병원 정보';
COMMENT ON COLUMN HOSPITAL.HOS_LATITUDE IS '병원 위도';
COMMENT ON COLUMN HOSPITAL.HOS_LONGITUDE IS '병원 경도';
COMMENT ON COLUMN HOSPITAL.HOS_ONDUTY IS '병원 당직';
COMMENT ON COLUMN HOSPITAL.HOS_PARKING IS '주차 정보';

-- MEDICAL_FIELD 테이블 생성
CREATE TABLE MEDICAL_FIELD (
    MED_NO NUMBER NOT NULL PRIMARY KEY,
    JOB VARCHAR2(50) NOT NULL,
    MEDICAL_FIELD_ID VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN MEDICAL_FIELD.MED_NO IS '의사 고유 번호';
COMMENT ON COLUMN MEDICAL_FIELD.JOB IS '직업';
COMMENT ON COLUMN MEDICAL_FIELD.MEDICAL_FIELD_ID IS '전공과';

-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    USER_NO VARCHAR2(100) PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(100) NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    BIRTHDAY DATE NOT NULL,
    GENDER CHAR(1) DEFAULT 'M' CHECK (GENDER IN ('M', 'F')),
    ADDRESS VARCHAR2(200),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    ISADMIN VARCHAR2(10) DEFAULT 'N',
    MED_KEY NUMBER,
    HOS_NO VARCHAR2(2000),

    FOREIGN KEY (MED_KEY) REFERENCES MEDICAL_FIELD (MED_NO),
    FOREIGN KEY (HOS_NO) REFERENCES HOSPITAL (HOS_NO)
);

COMMENT ON COLUMN MEMBER.USER_NO IS '사용자 고유 번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '사용자 비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '사용자 이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '사용자 이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '사용자 전화번호';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '사용자 생일';
COMMENT ON COLUMN MEMBER.GENDER IS '성별';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '등록 일자';
COMMENT ON COLUMN MEMBER.STATUS IS '사용자 상태';
COMMENT ON COLUMN MEMBER.ISADMIN IS '관리자 여부';
COMMENT ON COLUMN MEMBER.MED_KEY IS '의사 고유 번호 (외래 키)';
COMMENT ON COLUMN MEMBER.HOS_NO IS '병원 고유 번호 (외래 키)';

-- DOCTOR_REVIEW 테이블 생성
CREATE TABLE DOCTOR_REVIEW (
    REVIEW_NO NUMBER NOT NULL PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL,
    REVIEW_TITLE VARCHAR2(200) NOT NULL,
    REVIEW_CONTENT VARCHAR2(2000) NOT NULL,
    REVIEW_CREATED_AT DATE DEFAULT SYSDATE,
    REVIEW_UPDATED_AT DATE DEFAULT SYSDATE,
    REVIEW_VIEWS NUMBER,
    REVIEW_RATING NUMBER,
    USER_ID2 VARCHAR2(20),

    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_NO IS '리뷰 번호';
COMMENT ON COLUMN DOCTOR_REVIEW.USER_ID IS '작성자 아이디';
COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_TITLE IS '리뷰 제목';
COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_CREATED_AT IS '리뷰 작성일';
COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_UPDATED_AT IS '리뷰 수정일';
COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_VIEWS IS '리뷰 조회수';
COMMENT ON COLUMN DOCTOR_REVIEW.REVIEW_RATING IS '리뷰 평점';
COMMENT ON COLUMN DOCTOR_REVIEW.USER_ID2 IS '의사 아이디';

-- RESERVATION 테이블 생성
CREATE TABLE RESERVATION (
    RES_NO NUMBER NOT NULL PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL,
    HOS_NO VARCHAR2(2000) NOT NULL,
    RES_DATE DATE DEFAULT SYSDATE,
    RES_TIME DATE NOT NULL,
    RES_CATEGORY VARCHAR2(20) NOT NULL,
    RES_CONTENT VARCHAR2(2000)
);

COMMENT ON COLUMN RESERVATION.RES_NO IS '예약 번호';
COMMENT ON COLUMN RESERVATION.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN RESERVATION.HOS_NO IS '병원 고유 번호';
COMMENT ON COLUMN RESERVATION.RES_DATE IS '예약 일자';
COMMENT ON COLUMN RESERVATION.RES_TIME IS '진료 시간';
COMMENT ON COLUMN RESERVATION.RES_CATEGORY IS '진료 카테고리';
COMMENT ON COLUMN RESERVATION.RES_CONTENT IS '진료 내용';

-- TREATMENT 테이블 생성
CREATE TABLE TREATMENT (
    TREATMENT_NO NUMBER NOT NULL PRIMARY KEY,
    RES_NO NUMBER NOT NULL,
    VACCINE_CATEGORY VARCHAR2(20),
    HEALTH_SELECT VARCHAR2(20),
    RES_SELECT VARCHAR2(20)
);

COMMENT ON COLUMN TREATMENT.TREATMENT_NO IS '진료 번호';
COMMENT ON COLUMN TREATMENT.RES_NO IS '예약 번호';
COMMENT ON COLUMN TREATMENT.VACCINE_CATEGORY IS '백신 종류';
COMMENT ON COLUMN TREATMENT.HEALTH_SELECT IS '건강 검진 선택';
COMMENT ON COLUMN TREATMENT.RES_SELECT IS '진료 요청';

-- BOARD 테이블 생성
CREATE TABLE BOARD (
    BOARD_NO NUMBER NOT NULL PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFIED_DATE DATE DEFAULT SYSDATE,
    VIEWS NUMBER,
    BOARD_CATEGORY VARCHAR2(20),
    CONSTRAINT FK_BOARD_USER_ID FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN BOARD.USER_ID IS '작성자 아이디';
COMMENT ON COLUMN BOARD.TITLE IS '게시글 제목';
COMMENT ON COLUMN BOARD.CONTENT IS '게시글 내용';
COMMENT ON COLUMN BOARD.ENROLL_DATE IS '게시글 작성일';
COMMENT ON COLUMN BOARD.MODIFIED_DATE IS '게시글 수정일';
COMMENT ON COLUMN BOARD.VIEWS IS '게시글 조회수';
COMMENT ON COLUMN BOARD.BOARD_CATEGORY IS '게시글 카테고리';


CREATE TABLE FILE_TABLE (
    FILE_NO NUMBER NOT NULL PRIMARY KEY,
    BOARD_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    ORIGIN_NAME VARCHAR2(200),
    CHANGE_NAME VARCHAR2(200)
);

COMMENT ON COLUMN FILE_TABLE.FILE_NO IS '파일 번호';
COMMENT ON COLUMN FILE_TABLE.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN FILE_TABLE.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN FILE_TABLE.ORIGIN_NAME IS '파일 원본 이름';
COMMENT ON COLUMN FILE_TABLE.CHANGE_NAME IS '파일 변경 이름';

-- COMMENTS 테이블 생성 
CREATE TABLE COMMENTS_TABLE (
    COMMENT_NO NUMBER NOT NULL PRIMARY KEY,
    BOARD_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    CONTENT VARCHAR2(2000),
    CREATED_AT DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN COMMENTS_TABLE.COMMENT_NO IS '댓글 번호';
COMMENT ON COLUMN COMMENTS_TABLE.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN COMMENTS_TABLE.USER_ID IS '작성자 아이디';
COMMENT ON COLUMN COMMENTS_TABLE.CONTENT IS '댓글 내용';
COMMENT ON COLUMN COMMENTS_TABLE.CREATED_AT IS '댓글 작성일';

INSERT INTO MEDICAL_FIELD
VALUES (1 , '간호사', '소아과');

INSERT INTO MEDICAL_FIELD
VALUES (2 , '의사', '내과');

INSERT INTO MEDICAL_FIELD
VALUES (3, '의사', '소아과');

INSERT INTO MEDICAL_FIELD
VALUES (4, '간호사', '안과');

INSERT INTO MEDICAL_FIELD
VALUES (5, '의사', '소아과');


CREATE TABLE HOSPITAL_KID (
    name VARCHAR2(100),               -- 병원 이름
    address VARCHAR2(200),            -- 병원 주소
    division VARCHAR2(50),            -- 병원 구분 (예: 의원, 병원 등)
    department VARCHAR2(50),          -- 진료 과목
    start_time VARCHAR2(10),          -- 진료 시작 시간
    end_time VARCHAR2(10),            -- 진료 종료 시간
    hpid VARCHAR2(20) PRIMARY KEY,    -- 병원 ID, 각 병원을 구분하는 고유 식별자
    latitude NUMBER(10, 7),           -- 병원의 위도
    longitude NUMBER(10, 7)           -- 병원의 경도
);

-- BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 100개
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (1, 'user43', '무좀은 무슨과를 가야되나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2023.07.19', 'YYYY.MM.DD'), TO_DATE('2024.01.08', 'YYYY.MM.DD'), 539, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (2, 'user9', '감기와 독감의 차이점이 무엇인가요?', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.02.08', 'YYYY.MM.DD'), TO_DATE('2023.01.21', 'YYYY.MM.DD'), 852, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (3, 'user17', '아토피 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2023.11.10', 'YYYY.MM.DD'), TO_DATE('2023.10.03', 'YYYY.MM.DD'), 936, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (4, 'user5', '코로나 백신 접종 후 주의사항이 있나요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2024.04.10', 'YYYY.MM.DD'), TO_DATE('2023.09.22', 'YYYY.MM.DD'), 915, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (5, 'user70', '천식 환자에게 좋은 운동이 있을까요?', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2024.12.03', 'YYYY.MM.DD'), TO_DATE('2024.06.20', 'YYYY.MM.DD'), 402, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (6, 'user54', '독감 예방 접종 시기를 알고 싶어요.', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2023.07.24', 'YYYY.MM.DD'), TO_DATE('2023.10.02', 'YYYY.MM.DD'), 549, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (7, 'user29', '유아 발열 시 응급 조치 방법은?', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2023.12.11', 'YYYY.MM.DD'), TO_DATE('2024.12.10', 'YYYY.MM.DD'), 692, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (8, 'user21', '병원 예약 없이 방문할 수 있는지요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2024.09.04', 'YYYY.MM.DD'), TO_DATE('2023.02.14', 'YYYY.MM.DD'), 998, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (9, 'user18', '위내시경 검사를 언제 받아야 할까요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2023.11.28', 'YYYY.MM.DD'), TO_DATE('2023.01.29', 'YYYY.MM.DD'), 333, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (10, 'user11', '혈압 약 복용 시간은 언제가 좋나요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2023.08.01', 'YYYY.MM.DD'), TO_DATE('2024.02.12', 'YYYY.MM.DD'), 286, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (11, 'user27', '코피가 자주 나는데 어떤 과로 가야 하나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.08.02', 'YYYY.MM.DD'), TO_DATE('2024.03.15', 'YYYY.MM.DD'), 45, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (12, 'user13', '임신 초기 증상에 대해 알고 싶어요.', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.06.01', 'YYYY.MM.DD'), TO_DATE('2023.03.03', 'YYYY.MM.DD'), 801, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (13, 'user93', '편두통 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2023.01.10', 'YYYY.MM.DD'), TO_DATE('2024.04.18', 'YYYY.MM.DD'), 239, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (14, 'user48', '간염 예방을 위한 방법은 무엇인가요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2024.04.11', 'YYYY.MM.DD'), TO_DATE('2023.04.21', 'YYYY.MM.DD'), 373, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (15, 'user13', '건강검진 항목에 대한 설명 부탁드립니다.', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2023.05.08', 'YYYY.MM.DD'), TO_DATE('2023.09.26', 'YYYY.MM.DD'), 649, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (16, 'user12', '허리디스크 치료병원은 어디가 좋나요?', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2023.01.25', 'YYYY.MM.DD'), TO_DATE('2023.09.30', 'YYYY.MM.DD'), 29, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (17, 'user82', '수면무호흡증 치료 방법이 궁금해요.', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2024.02.12', 'YYYY.MM.DD'), TO_DATE('2023.06.13', 'YYYY.MM.DD'), 992, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (18, 'user19', '알레르기 검사는 어디서 하나요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2023.03.29', 'YYYY.MM.DD'), TO_DATE('2023.05.08', 'YYYY.MM.DD'), 201, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (19, 'user17', '기억력 감퇴 예방에 좋은 식품이 있나요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2023.09.16', 'YYYY.MM.DD'), TO_DATE('2024.08.07', 'YYYY.MM.DD'), 556, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (20, 'user18', '소아과에서 상담 가능한 질환은 무엇인가요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2023.10.26', 'YYYY.MM.DD'), TO_DATE('2023.03.31', 'YYYY.MM.DD'), 819, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (21, 'user90', '무좀은 무슨과를 가야되나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.12.27', 'YYYY.MM.DD'), TO_DATE('2024.09.02', 'YYYY.MM.DD'), 405, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (22, 'user97', '감기와 독감의 차이점이 무엇인가요?', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.02.18', 'YYYY.MM.DD'), TO_DATE('2024.11.03', 'YYYY.MM.DD'), 104, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (23, 'user33', '아토피 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2024.07.15', 'YYYY.MM.DD'), TO_DATE('2023.12.03', 'YYYY.MM.DD'), 169, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (24, 'user62', '코로나 백신 접종 후 주의사항이 있나요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2023.07.29', 'YYYY.MM.DD'), TO_DATE('2024.03.27', 'YYYY.MM.DD'), 397, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (25, 'user8', '천식 환자에게 좋은 운동이 있을까요?', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2024.10.07', 'YYYY.MM.DD'), TO_DATE('2024.09.04', 'YYYY.MM.DD'), 701, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (26, 'user76', '독감 예방 접종 시기를 알고 싶어요.', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2024.09.19', 'YYYY.MM.DD'), TO_DATE('2023.12.22', 'YYYY.MM.DD'), 284, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (27, 'user64', '유아 발열 시 응급 조치 방법은?', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2024.08.25', 'YYYY.MM.DD'), TO_DATE('2023.03.05', 'YYYY.MM.DD'), 102, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (28, 'user54', '병원 예약 없이 방문할 수 있는지요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2023.12.09', 'YYYY.MM.DD'), TO_DATE('2023.09.20', 'YYYY.MM.DD'), 828, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (29, 'user57', '위내시경 검사를 언제 받아야 할까요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2023.09.06', 'YYYY.MM.DD'), TO_DATE('2024.10.02', 'YYYY.MM.DD'), 772, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (30, 'user33', '혈압 약 복용 시간은 언제가 좋나요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2024.05.25', 'YYYY.MM.DD'), TO_DATE('2023.06.30', 'YYYY.MM.DD'), 993, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (31, 'user73', '코피가 자주 나는데 어떤 과로 가야 하나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.08.30', 'YYYY.MM.DD'), TO_DATE('2023.05.19', 'YYYY.MM.DD'), 693, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (32, 'user1', '임신 초기 증상에 대해 알고 싶어요.', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.04.22', 'YYYY.MM.DD'), TO_DATE('2023.02.25', 'YYYY.MM.DD'), 503, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (33, 'user77', '편두통 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2023.08.11', 'YYYY.MM.DD'), TO_DATE('2024.05.10', 'YYYY.MM.DD'), 214, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (34, 'user37', '간염 예방을 위한 방법은 무엇인가요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2023.03.20', 'YYYY.MM.DD'), TO_DATE('2024.03.07', 'YYYY.MM.DD'), 146, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (35, 'user40', '건강검진 항목에 대한 설명 부탁드립니다.', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2024.08.29', 'YYYY.MM.DD'), TO_DATE('2023.12.18', 'YYYY.MM.DD'), 101, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (36, 'user43', '허리디스크 치료병원은 어디가 좋나요?', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2024.06.18', 'YYYY.MM.DD'), TO_DATE('2024.06.20', 'YYYY.MM.DD'), 598, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (37, 'user44', '수면무호흡증 치료 방법이 궁금해요.', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2024.09.28', 'YYYY.MM.DD'), TO_DATE('2023.07.22', 'YYYY.MM.DD'), 803, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (38, 'user26', '알레르기 검사는 어디서 하나요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2023.08.04', 'YYYY.MM.DD'), TO_DATE('2023.12.17', 'YYYY.MM.DD'), 881, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (39, 'user26', '기억력 감퇴 예방에 좋은 식품이 있나요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2024.07.14', 'YYYY.MM.DD'), TO_DATE('2024.05.31', 'YYYY.MM.DD'), 205, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (40, 'user73', '소아과에서 상담 가능한 질환은 무엇인가요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2024.09.06', 'YYYY.MM.DD'), TO_DATE('2023.11.03', 'YYYY.MM.DD'), 510, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (41, 'user94', '무좀은 무슨과를 가야되나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.12.27', 'YYYY.MM.DD'), TO_DATE('2024.05.06', 'YYYY.MM.DD'), 570, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (42, 'user93', '감기와 독감의 차이점이 무엇인가요?', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2023.11.01', 'YYYY.MM.DD'), TO_DATE('2024.10.19', 'YYYY.MM.DD'), 817, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (43, 'user17', '아토피 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2023.03.28', 'YYYY.MM.DD'), TO_DATE('2023.09.02', 'YYYY.MM.DD'), 896, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (44, 'user60', '코로나 백신 접종 후 주의사항이 있나요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2023.12.10', 'YYYY.MM.DD'), TO_DATE('2023.09.14', 'YYYY.MM.DD'), 693, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (45, 'user94', '천식 환자에게 좋은 운동이 있을까요?', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2023.02.08', 'YYYY.MM.DD'), TO_DATE('2024.02.01', 'YYYY.MM.DD'), 140, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (46, 'user66', '독감 예방 접종 시기를 알고 싶어요.', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2023.11.08', 'YYYY.MM.DD'), TO_DATE('2023.11.16', 'YYYY.MM.DD'), 546, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (47, 'user26', '유아 발열 시 응급 조치 방법은?', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2023.03.23', 'YYYY.MM.DD'), TO_DATE('2023.11.23', 'YYYY.MM.DD'), 796, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (48, 'user96', '병원 예약 없이 방문할 수 있는지요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2024.12.24', 'YYYY.MM.DD'), TO_DATE('2023.02.24', 'YYYY.MM.DD'), 505, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (49, 'user14', '위내시경 검사를 언제 받아야 할까요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2024.03.01', 'YYYY.MM.DD'), TO_DATE('2023.10.26', 'YYYY.MM.DD'), 914, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (50, 'user67', '혈압 약 복용 시간은 언제가 좋나요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2024.09.14', 'YYYY.MM.DD'), TO_DATE('2023.11.12', 'YYYY.MM.DD'), 357, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (51, 'user21', '코피가 자주 나는데 어떤 과로 가야 하나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.08.28', 'YYYY.MM.DD'), TO_DATE('2023.08.21', 'YYYY.MM.DD'), 143, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (52, 'user47', '임신 초기 증상에 대해 알고 싶어요.', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.05.13', 'YYYY.MM.DD'), TO_DATE('2023.02.01', 'YYYY.MM.DD'), 10, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (53, 'user35', '편두통 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2023.08.29', 'YYYY.MM.DD'), TO_DATE('2024.06.10', 'YYYY.MM.DD'), 157, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (54, 'user36', '간염 예방을 위한 방법은 무엇인가요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2023.07.30', 'YYYY.MM.DD'), TO_DATE('2024.10.24', 'YYYY.MM.DD'), 74, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (55, 'user44', '건강검진 항목에 대한 설명 부탁드립니다.', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2023.08.05', 'YYYY.MM.DD'), TO_DATE('2023.12.06', 'YYYY.MM.DD'), 50, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (56, 'user4', '허리디스크 치료병원은 어디가 좋나요?', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2023.07.29', 'YYYY.MM.DD'), TO_DATE('2023.07.20', 'YYYY.MM.DD'), 108, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (57, 'user5', '수면무호흡증 치료 방법이 궁금해요.', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2023.06.04', 'YYYY.MM.DD'), TO_DATE('2024.11.10', 'YYYY.MM.DD'), 120, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (58, 'user10', '알레르기 검사는 어디서 하나요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2023.02.13', 'YYYY.MM.DD'), TO_DATE('2023.05.29', 'YYYY.MM.DD'), 166, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (59, 'user9', '기억력 감퇴 예방에 좋은 식품이 있나요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2024.11.04', 'YYYY.MM.DD'), TO_DATE('2024.10.17', 'YYYY.MM.DD'), 136, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (60, 'user85', '소아과에서 상담 가능한 질환은 무엇인가요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2024.10.18', 'YYYY.MM.DD'), TO_DATE('2024.01.05', 'YYYY.MM.DD'), 903, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (61, 'user5', '무좀은 무슨과를 가야되나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.09.09', 'YYYY.MM.DD'), TO_DATE('2024.02.27', 'YYYY.MM.DD'), 844, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (62, 'user52', '감기와 독감의 차이점이 무엇인가요?', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.09.09', 'YYYY.MM.DD'), TO_DATE('2023.07.06', 'YYYY.MM.DD'), 480, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (63, 'user60', '아토피 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2023.02.18', 'YYYY.MM.DD'), TO_DATE('2024.12.06', 'YYYY.MM.DD'), 817, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (64, 'user81', '코로나 백신 접종 후 주의사항이 있나요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2024.02.28', 'YYYY.MM.DD'), TO_DATE('2023.05.24', 'YYYY.MM.DD'), 66, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (65, 'user49', '천식 환자에게 좋은 운동이 있을까요?', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2024.07.09', 'YYYY.MM.DD'), TO_DATE('2023.05.17', 'YYYY.MM.DD'), 826, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (66, 'user78', '독감 예방 접종 시기를 알고 싶어요.', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2023.02.16', 'YYYY.MM.DD'), TO_DATE('2023.04.01', 'YYYY.MM.DD'), 804, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (67, 'user81', '유아 발열 시 응급 조치 방법은?', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2023.09.22', 'YYYY.MM.DD'), TO_DATE('2023.02.19', 'YYYY.MM.DD'), 221, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (68, 'user11', '병원 예약 없이 방문할 수 있는지요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2024.05.03', 'YYYY.MM.DD'), TO_DATE('2023.02.23', 'YYYY.MM.DD'), 81, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (69, 'user17', '위내시경 검사를 언제 받아야 할까요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2024.06.07', 'YYYY.MM.DD'), TO_DATE('2024.07.15', 'YYYY.MM.DD'), 589, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (70, 'user94', '혈압 약 복용 시간은 언제가 좋나요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2024.12.07', 'YYYY.MM.DD'), TO_DATE('2024.09.19', 'YYYY.MM.DD'), 250, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (71, 'user90', '코피가 자주 나는데 어떤 과로 가야 하나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2023.09.24', 'YYYY.MM.DD'), TO_DATE('2024.07.29', 'YYYY.MM.DD'), 951, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (72, 'user99', '임신 초기 증상에 대해 알고 싶어요.', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2023.12.12', 'YYYY.MM.DD'), TO_DATE('2023.12.11', 'YYYY.MM.DD'), 386, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (73, 'user2', '편두통 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2024.09.23', 'YYYY.MM.DD'), TO_DATE('2024.06.12', 'YYYY.MM.DD'), 326, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (74, 'user5', '간염 예방을 위한 방법은 무엇인가요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2023.08.31', 'YYYY.MM.DD'), TO_DATE('2023.09.28', 'YYYY.MM.DD'), 873, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (75, 'user29', '건강검진 항목에 대한 설명 부탁드립니다.', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2024.12.23', 'YYYY.MM.DD'), TO_DATE('2023.04.19', 'YYYY.MM.DD'), 855, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (76, 'user95', '허리디스크 치료병원은 어디가 좋나요?', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2024.10.26', 'YYYY.MM.DD'), TO_DATE('2024.01.11', 'YYYY.MM.DD'), 796, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (77, 'user92', '수면무호흡증 치료 방법이 궁금해요.', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2023.07.07', 'YYYY.MM.DD'), TO_DATE('2024.09.13', 'YYYY.MM.DD'), 242, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (78, 'user69', '알레르기 검사는 어디서 하나요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2024.11.24', 'YYYY.MM.DD'), TO_DATE('2024.01.20', 'YYYY.MM.DD'), 656, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (79, 'user66', '기억력 감퇴 예방에 좋은 식품이 있나요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2023.03.28', 'YYYY.MM.DD'), TO_DATE('2024.08.17', 'YYYY.MM.DD'), 184, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (80, 'user29', '소아과에서 상담 가능한 질환은 무엇인가요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2023.12.09', 'YYYY.MM.DD'), TO_DATE('2024.01.17', 'YYYY.MM.DD'), 435, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (81, 'user84', '무좀은 무슨과를 가야되나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2024.03.18', 'YYYY.MM.DD'), TO_DATE('2023.04.11', 'YYYY.MM.DD'), 379, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (82, 'user10', '감기와 독감의 차이점이 무엇인가요?', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2023.09.20', 'YYYY.MM.DD'), TO_DATE('2024.04.07', 'YYYY.MM.DD'), 164, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (83, 'user73', '아토피 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2024.10.06', 'YYYY.MM.DD'), TO_DATE('2024.07.30', 'YYYY.MM.DD'), 134, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (84, 'user14', '코로나 백신 접종 후 주의사항이 있나요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2024.10.21', 'YYYY.MM.DD'), TO_DATE('2024.05.28', 'YYYY.MM.DD'), 926, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (85, 'user8', '천식 환자에게 좋은 운동이 있을까요?', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2023.09.03', 'YYYY.MM.DD'), TO_DATE('2023.05.15', 'YYYY.MM.DD'), 239, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (86, 'user38', '독감 예방 접종 시기를 알고 싶어요.', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2024.05.09', 'YYYY.MM.DD'), TO_DATE('2024.12.08', 'YYYY.MM.DD'), 722, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (87, 'user78', '유아 발열 시 응급 조치 방법은?', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2024.07.06', 'YYYY.MM.DD'), TO_DATE('2024.05.08', 'YYYY.MM.DD'), 813, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (88, 'user16', '병원 예약 없이 방문할 수 있는지요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2023.07.09', 'YYYY.MM.DD'), TO_DATE('2023.03.06', 'YYYY.MM.DD'), 81, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (89, 'user63', '위내시경 검사를 언제 받아야 할까요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2023.03.01', 'YYYY.MM.DD'), TO_DATE('2023.08.18', 'YYYY.MM.DD'), 778, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (90, 'user43', '혈압 약 복용 시간은 언제가 좋나요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2023.04.07', 'YYYY.MM.DD'), TO_DATE('2023.05.20', 'YYYY.MM.DD'), 438, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (91, 'user37', '코피가 자주 나는데 어떤 과로 가야 하나요?', '해당 증상에 대한 정확한 진단을 받으려면 병원을 방문하여 전문의와 상담하는 것이 좋습니다.', TO_DATE('2023.01.10', 'YYYY.MM.DD'), TO_DATE('2024.03.08', 'YYYY.MM.DD'), 531, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (92, 'user45', '임신 초기 증상에 대해 알고 싶어요.', '치료 및 예방 방법에 대한 구체적인 정보가 필요합니다.', TO_DATE('2024.01.10', 'YYYY.MM.DD'), TO_DATE('2024.03.18', 'YYYY.MM.DD'), 504, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (93, 'user91', '편두통 치료는 어디서 받아야 하나요?', '증상 완화와 관련된 다양한 정보를 알고 싶습니다.', TO_DATE('2024.03.02', 'YYYY.MM.DD'), TO_DATE('2023.11.15', 'YYYY.MM.DD'), 645, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (94, 'user88', '간염 예방을 위한 방법은 무엇인가요?', '전문적인 상담이 가능한 병원을 알고 싶어요.', TO_DATE('2024.03.19', 'YYYY.MM.DD'), TO_DATE('2023.02.20', 'YYYY.MM.DD'), 697, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (95, 'user77', '건강검진 항목에 대한 설명 부탁드립니다.', '현재 나타나는 증상에 대해 어떤 진료과목을 방문해야 하는지 궁금합니다.', TO_DATE('2023.02.05', 'YYYY.MM.DD'), TO_DATE('2024.12.08', 'YYYY.MM.DD'), 404, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (96, 'user13', '허리디스크 치료병원은 어디가 좋나요?', '예방과 관리를 위한 일상 생활 속 팁을 알고 싶습니다.', TO_DATE('2024.07.30', 'YYYY.MM.DD'), TO_DATE('2023.07.21', 'YYYY.MM.DD'), 703, '이벤트');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (97, 'user58', '수면무호흡증 치료 방법이 궁금해요.', '적절한 약물 복용과 생활 관리 방법에 대해 상담받고 싶습니다.', TO_DATE('2024.09.06', 'YYYY.MM.DD'), TO_DATE('2023.04.08', 'YYYY.MM.DD'), 438, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (98, 'user43', '알레르기 검사는 어디서 하나요?', '자주 나타나는 증상에 대해 원인과 치료 방법을 알고 싶습니다.', TO_DATE('2024.11.08', 'YYYY.MM.DD'), TO_DATE('2024.02.07', 'YYYY.MM.DD'), 891, '메디톡');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (99, 'user15', '기억력 감퇴 예방에 좋은 식품이 있나요?', '주변에 위치한 병원 및 진료 방법을 알고 싶어요.', TO_DATE('2023.11.11', 'YYYY.MM.DD'), TO_DATE('2024.08.13', 'YYYY.MM.DD'), 865, '자유');
INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, ENROLL_DATE, MODIFIED_DATE, VIEWS, BOARD_CATEGORY) VALUES (100, 'user17', '소아과에서 상담 가능한 질환은 무엇인가요?', '건강 유지와 예방을 위한 생활 습관을 알고 싶습니다.', TO_DATE('2023.07.14', 'YYYY.MM.DD'), TO_DATE('2024.01.11', 'YYYY.MM.DD'), 394, '이벤트');
-- BOARD 더미데이터  BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터 BOARD 더미데이터


<<<<<<< HEAD
=======

>>>>>>> 1a19f4f72f0f5be474542a3366a0a94e64a2ccb7
