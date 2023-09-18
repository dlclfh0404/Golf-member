-- 주민정보 테이블 명세서 : tbl_teacher_202201
create table tbl_teacher_202201 (
	   teacher_code         char(3)      primary key,
	   teacher_name         varchar2(15),
	   class_name           varchar2(20),
	   class_price          number(8),
	   teacher_resist_date  varchar2(8)
);

desc tbl_teacher_202201;   -- 테이블 확인
delete from tbl_teacher_202201; -- 테이블 삭제

-- insert into 주민정보 샘플 데이터 입력
insert into tbl_teacher_202201 values('100', '이초급', '초급반', 100000, '20220101');
insert into tbl_teacher_202201 values('200', '김중급', '중급반', 200000, '20220102');
insert into tbl_teacher_202201 values('300', '박고급', '고급반', 300000, '20220103');
insert into tbl_teacher_202201 values('400', '정심화', '심화반', 400000, '20220104');

select * from tbl_teacher_202201; -- 테이블 조회

-- 회원정보 테이블 명세서 : tbl_member_202201
create table tbl_member_202201 (
	   c_no     char(5)      primary key,
	   c_name   varchar2(15),
	   phone    varchar2(11),
	   address  varchar2(50),
	   grade    varchar2(6)
);

desc tbl_member_202201;   -- 테이블 확인
delete from tbl_member_202201; -- 테이블 삭제

-- insert into 회원정보 샘플 데이터 입력
insert into tbl_member_202201 values('10001', '홍길동', '01011112222', '서울시 강남구', '일반');
insert into tbl_member_202201 values('10002', '장발장', '01022223333', '성남시 분당구', '일반');
insert into tbl_member_202201 values('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');
insert into tbl_member_202201 values('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');
insert into tbl_member_202201 values('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

select * from tbl_member_202201; -- 테이블 조회


-- 수강신청정보 테이블 명세서 : tbl_class_202201
create table tbl_class_202201 (
	   resist_month       varchar2(6),
	   c_no               char(5),
	   class_area         varchar2(15),
	   tuition            number(8),
	   teacher_code       char(3),
	   primary key(resist_month, c_no)
);

desc tbl_class_202201;   -- 테이블 확인
delete tbl_class_202201; -- 테이블 삭제


-- insert into 수강신청정보 샘플 데이터 입력
insert into tbl_class_202201 values('202203', '10001', '서울본원', 100000, '100');
insert into tbl_class_202201 values('202203', '10002', '성남본원', 100000, '100');
insert into tbl_class_202201 values('202203', '10003', '대전본원', 200000, '200');
insert into tbl_class_202201 values('202203', '20001', '부산본원', 150000, '300');
insert into tbl_class_202201 values('202203', '20002', '대구본원', 200000, '400');

select * from tbl_class_202201; -- 테이블 조회

-- t_search 조회문
select teacher_code, teacher_name, class_name, 
       '₩ '||to_char(to_number(class_price),'999,999') c_price,
       substr(teacher_resist_date,1,4)||'년'||
       substr(teacher_resist_date,5,2)||'월'||
       substr(teacher_resist_date,7,2)||'일' t_date
	from tbl_teacher_202201;
	
-- join_p 조인문
insert into tbl_class_202201 values(?, ?, ?, ?, ?);


-- member_list 조회문
select substr(a.resist_month,1,4)||'년'||
       substr(a.resist_month,5,2)||'월' t_date,
       b.c_no, b.c_name, c.class_name, a.class_area,
       '₩ '||to_char(to_number(c.class_price),'999,999') c_price, b.grade
	from tbl_class_202201 a, tbl_member_202201 b, tbl_teacher_202201 c
	where a.c_no = b.c_no and a.teacher_code = c.teacher_code
		order by b.c_no , a.resist_month asc;
	
-- t_sales_list 조회문
select a.teacher_code, a.class_name, 
       a.teacher_name, '₩ '||sum(b.tuition),1,3)||','||substr(sum(b.tuition),4,6) t_sales
	from tbl_teacher_202201 a, tbl_class_202201 b
		where a.teacher_code = b.teacher_code
			group by a.teacher_code, a.class_name, a.teacher_name
			order by a.teacher_code;