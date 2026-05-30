
CREATE TABLE faculty (
    faculty_code   NUMBER PRIMARY KEY,
    faculty_name   VARCHAR2(120) NOT NULL UNIQUE
);

CREATE SEQUENCE faculty_seq START WITH 200 INCREMENT BY 1 NOCACHE;



CREATE TABLE major (
    major_code     NUMBER PRIMARY KEY,
    major_name     VARCHAR2(100) UNIQUE NOT NULL,
    faculty_code   NUMBER,
    CONSTRAINT fk_maj_fac FOREIGN KEY ( faculty_code )
        REFERENCES faculty ( faculty_code )
);


CREATE TABLE student (
    student_id      NUMBER PRIMARY KEY,
    fname           VARCHAR2(100) NOT NULL,
    lname           VARCHAR2(100) NOT NULL,
    gender          CHAR(1) CHECK ( gender IN ('M','F') ),
    bdate           DATE,
    student_level   NUMBER CHECK ( student_level IN ( 1,2,3,4)),
    major_code      NUMBER,
    CONSTRAINT fk_stu_maj FOREIGN KEY ( major_code )
        REFERENCES major ( major_code )
);

CREATE TABLE instructor (
    instructor_id   NUMBER PRIMARY KEY,
    fname           VARCHAR2(100) NOT NULL,
    lname           VARCHAR2(100) NOT NULL,
    status          VARCHAR2(100),
    faculty_code    NUMBER,
    salary          DECIMAL(10, 2) CHECK ( salary BETWEEN 5000 AND 30000 ),
    CONSTRAINT instr_fac_fk FOREIGN KEY ( faculty_code )
        REFERENCES faculty ( faculty_code )
);

CREATE TABLE course (
    major_code      NUMBER,
    course_number   NUMBER,
    course_name     VARCHAR2(100),
    credit_hours    NUMBER,
    PRIMARY KEY ( major_code,course_number ),
    CONSTRAINT fk_course_maj FOREIGN KEY ( major_code )
        REFERENCES major ( major_code )
);
CREATE TABLE section (
    major_code       NUMBER,
    course_number    NUMBER,
    section_number   NUMBER,
    semester         NUMBER,
    year_sec         NUMBER,
    weekDay          DATE,
    time_sec         VARCHAR2(100),
    instructor_id    NUMBER,
    PRIMARY KEY (major_code,course_number,section_number,semester,year_sec ),
    CONSTRAINT sec_inst_fk FOREIGN KEY ( instructor_id )
        REFERENCES instructor ( instructor_id ),
    CONSTRAINT maj_crs_fk FOREIGN KEY ( major_code,
                                        course_number )
        REFERENCES course ( major_code,
                            course_number )
);

CREATE TABLE transcript (
    student_id       NUMBER,
    major_code       NUMBER,
    course_number    NUMBER,
    section_number   NUMBER,
    semester         NUMBER,
    year_sec         NUMBER,
    grade            DECIMAL(10, 2),
    PRIMARY KEY ( student_id,major_code,course_number,section_number,semester,year_sec ),
    CONSTRAINT tran_stu_fk FOREIGN KEY ( student_id )
        REFERENCES student ( student_id ),
    CONSTRAINT trans_sec_fk FOREIGN KEY ( major_code,course_number,section_number,semester,year_sec )
        REFERENCES section ( major_code,course_number,section_number,semester,year_sec)
);



INSERT INTO faculty ( faculty_name ) VALUES ( 'Computer Science' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'science' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Business' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Arts' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Law' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Medicine' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Pharmacy' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Education' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'Engineering' );

INSERT INTO faculty ( faculty_name ) VALUES ( 'nursing' );



INSERT INTO major VALUES (301, 'Software Engineering', 211);

INSERT INTO major VALUES (302, 'Data Science', 214);

INSERT INTO major VALUES (303, 'Physics', 220);

INSERT INTO major VALUES (304, 'Chemistry', 213);

INSERT INTO major VALUES (305, 'Accounting', 215);

INSERT INTO major VALUES (306, 'Marketing', 218);

INSERT INTO major VALUES (307, 'English Literature', 219);

INSERT INTO major VALUES (308, 'Civil Law', 216);

INSERT INTO major VALUES (309, 'General Medicine', 212);

INSERT INTO major VALUES (310, 'Clinical Pharmacy', 217);  

commit;




INSERT INTO student VALUES
(21, 'Omar', 'Kamal', 'M', TO_DATE('2004-05-12','YYYY-MM-DD'), 1, 301);

INSERT INTO student VALUES
(22, 'Nada', 'Hassan', 'F', TO_DATE('2003-06-20','YYYY-MM-DD'), 2, 302);

INSERT INTO student VALUES
(23, 'Youssef', 'Ali', 'M', TO_DATE('2002-09-15','YYYY-MM-DD'), 3, 303);

INSERT INTO student VALUES
(24, 'Mariam', 'Adel', 'F', TO_DATE('2001-01-10','YYYY-MM-DD'), 4, 304);

INSERT INTO student VALUES
(25, 'Salma', 'Nabil', 'F', TO_DATE('2004-11-08','YYYY-MM-DD'), 1, 305);

INSERT INTO student VALUES
(26, 'Karim', 'Sayed', 'M', TO_DATE('2003-03-25','YYYY-MM-DD'), 2, 306);

INSERT INTO student VALUES
(27, 'Heba', 'Tarek', 'F', TO_DATE('2002-07-30','YYYY-MM-DD'), 3, 307);

INSERT INTO student VALUES
(28, 'Nour', 'Ayman', 'F', TO_DATE('2001-12-19','YYYY-MM-DD'), 4, 308);

INSERT INTO student VALUES
(29, 'Ahmed', 'Mostafa', 'M', TO_DATE('2004-02-14','YYYY-MM-DD'), 1, 309);

INSERT INTO student VALUES
(30, 'Rana', 'Mahmoud', 'F', TO_DATE('2003-08-05','YYYY-MM-DD'), 2, 310);




INSERT INTO course VALUES (301, 1, 'Introduction to Programming', 3);

INSERT INTO course VALUES (302, 1, 'Data Analysis Basics', 3);

INSERT INTO course VALUES (303, 1, 'General Physics', 4);

INSERT INTO course VALUES (304, 1, 'Organic Chemistry', 3);

INSERT INTO course VALUES (305, 1, 'Financial Accounting', 3);

INSERT INTO course VALUES (306, 1, 'Principles of Marketing', 3);

INSERT INTO course VALUES (307, 1, 'English Literature I', 2);

INSERT INTO course VALUES (308, 1, 'Introduction to Law', 3);

INSERT INTO course VALUES (309, 1, 'Human Anatomy', 4);

INSERT INTO course VALUES (310, 1, 'Pharmacology Basics', 3);



INSERT INTO section VALUES
(301, 1, 1, 2, 2020, TO_DATE('2020-03-01','YYYY-MM-DD'), '10:00 AM', 41);

INSERT INTO section VALUES
(302, 1, 1, 2, 2020, TO_DATE('2020-03-02','YYYY-MM-DD'), '11:00 AM', 42);

INSERT INTO section VALUES
(303, 1, 1, 2, 2020, TO_DATE('2020-03-03','YYYY-MM-DD'), '12:00 PM', 43);

INSERT INTO section VALUES
(304, 1, 1, 2, 2020, TO_DATE('2020-03-04','YYYY-MM-DD'), '01:00 PM', 44);

INSERT INTO section VALUES
(305, 1, 1, 2, 2020, TO_DATE('2020-03-05','YYYY-MM-DD'), '02:00 PM', 45);

INSERT INTO section VALUES
(306, 1, 1, 2, 2020, TO_DATE('2020-03-06','YYYY-MM-DD'), '03:00 PM', 46);

INSERT INTO section VALUES
(307, 1, 1, 2, 2020, TO_DATE('2020-03-07','YYYY-MM-DD'), '04:00 PM', 47);

INSERT INTO section VALUES
(308, 1, 1, 2, 2020, TO_DATE('2020-03-08','YYYY-MM-DD'), '05:00 PM', 48);

INSERT INTO section VALUES
(309, 1, 1, 2, 2020, TO_DATE('2020-03-09','YYYY-MM-DD'), '06:00 PM', 49);
INSERT INTO section VALUES
(310, 1, 1, 2, 2020, TO_DATE('2020-03-11','YYYY-MM-DD'), '07:00 PM', 50);




INSERT INTO transcript VALUES (21, 301, 1, 1, 2, 2020, 85);

INSERT INTO transcript VALUES (22, 302, 1, 1, 2, 2020, 78);

INSERT INTO transcript VALUES (23, 303, 1, 1, 2, 2020, 90);

INSERT INTO transcript VALUES (24, 304, 1, 1, 2, 2020, 88);

INSERT INTO transcript VALUES (25, 305, 1, 1, 2, 2020, 75);

INSERT INTO transcript VALUES (26, 306, 1, 1, 2, 2020, 82);

INSERT INTO transcript VALUES (27, 307, 1, 1, 2, 2020, 80);

INSERT INTO transcript VALUES (28, 308, 1, 1, 2, 2020, 95);

INSERT INTO transcript VALUES (29, 309, 1, 1, 2, 2020, 70);

INSERT INTO transcript VALUES (30, 310, 1, 1, 2, 2020, 100);


select* from student;

select * from faculty 
order by faculty_code desc;

select * from student 
where gender='M';

select * from student 
where gender='F';

select * from student 
where gender='F' and months_between(sysdate,bdate)>150;

select * from instructor
where salary between 15000 and 17550;

select * from instructor
where salary in (15000,1000,5000,8000);

select fname ||' '|| lname as full_name 
from student 
where major_code=302;

select * from section 
where instructor_id is null;

select sum(salary) as total_salary
from instructor
where faculty_code=211;

select * from student 
where student_level=4
ORDER BY  lname asc;


select student_id,fname ||' '|| lname as full_name  from student 
where gender='M' and  student_level=4;

select student_id,fname ||' '|| lname as full_name  from student 
where bdate is null;

select * from student
order by student_level asc,lname asc;

select * from section 
where semester=2 and year_sec=2020;


select * from student
order by student_level desc,fname asc;


select * from section 
where semester=2 and year_sec=2020
and instructor_id is null;


select* from student 
where fname like 'Moh%' and lname like '%sh';


select* from student 
where fname like '%n%'; 

select fname ||' '|| lname as full_name, 
trunc(months_between(sysdate,bdate)/12) as student_age
from student;

SELECT instructor_id, fname, lname,
salary + (salary * 0.10) AS salary_after_raise
FROM instructor;


SELECT SUM(salary) AS total_before,
SUM(salary + (salary * 0.15)) AS total_after
FROM instructor
WHERE faculty_code = 211;



SELECT * FROM section
WHERE instructor_id = (
SELECT instructor_id
FROM instructor
WHERE fname = 'Tarek'
)
AND semester = 2
AND year_sec = 2020;


SELECT * FROM section
WHERE instructor_id = (
SELECT instructor_id
FROM instructor
WHERE fname = 'Tarek'
)
AND year_sec in(2018,2019,2020);


SELECT fname || ' ' || lname AS full_name
FROM instructor
WHERE faculty_code = 211
AND instructor_id NOT IN (
SELECT instructor_id
FROM section
WHERE semester = 2
AND year_sec = 2020
AND instructor_id IS NOT NULL
);


SELECT major_code, COUNT(*) 
FROM student
GROUP BY major_code
HAVING COUNT(*) < 20;


SELECT section_number, year_sec, grade, COUNT(*) 
FROM transcript
WHERE year_sec IN (2019, 2020)
GROUP BY section_number, year_sec, grade
ORDER BY section_number, year_sec, grade;


SELECT fname || ' ' || lname AS FullName
FROM student;


SELECT UPPER(fname) || ' ' || LOWER(lname) AS student_name
FROM student;


SELECT fname, lname,
TRUNC(MONTHS_BETWEEN(SYSDATE, bdate) / 12) AS student_age
FROM student
WHERE bdate IS NOT NULL;


SELECT fname,
SUBSTR(fname, 1, 3),
SUBSTR(fname, -3)
FROM student;


SELECT *
FROM student
WHERE fname LIKE 'A%';


SELECT *FROM student
WHERE LENGTH(lname) > 5;


SELECT fname, lname,
30 - TRUNC(MONTHS_BETWEEN(SYSDATE, bdate) / 12)
FROM student
WHERE bdate IS NOT NULL;


SELECT student_level, COUNT(*)
FROM student
GROUP BY student_level;


SELECT major_code, COUNT(*)
FROM student
GROUP BY major_code;




SELECT MAX(salary), MIN(salary)
FROM instructor;


SELECT status, AVG(salary)
FROM instructor
GROUP BY status;


SELECT major_code, COUNT(*)
FROM course
GROUP BY major_code;


SELECT course_number, COUNT(*)
FROM section
GROUP BY course_number;


SELECT course_number, AVG(grade)
FROM transcript
GROUP BY course_number;


SELECT course_number, year_sec, COUNT(student_id)
FROM transcript
GROUP BY course_number, year_sec;


SELECT major_code, SUM(credit_hours)
FROM course
GROUP BY major_code;


SELECT student_id, MAX(grade)
FROM transcript
GROUP BY student_id;


SELECT course_number
FROM transcript
GROUP BY course_number
HAVING AVG(grade) > 80;