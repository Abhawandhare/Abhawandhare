CREATE DATABASE StudentDB;
USE StudentDB;
CREATE TABLE Students
(
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(100) NOT NULL,
address VARCHAR(255),
dob DATE,
department_id INT
);
CREATE TABLE Departments
(
department_id INT AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL
);
CREATE TABLE Performance
(
performance_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
subject VARCHAR(100),
marks INT,
grade CHAR(2),
FOREIGN KEY (student_id)
REFERENCES Students(student_id)
);
CREATE TABLE Attendance 
(
attendance_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
date DATE,
status ENUM('Present' , 'Absent' ),
FOREIGN KEY (student_id)
REFERENCES Students(student_id)
);
-- Inserting data into Departments table
INSERT INTO Departments(department_name) VALUES ('Computer Science'), ('Mechanical Engineer'), ('Electrical Engineer'), ('Civil Engineer');
-- Inserting data into students table
INSERT INTO Students (student_name, address, dob, department_id) VALUES ('aabha wandhare','123 main st,nagpur', '2000-05-15', 1), ('Dipesh Adlak', '456 Elm st,nagpur', '1999-08-22', 2), ('Aadhish adlak', '158 ntl st,nagpur', '1998-07-04', 3);
-- Inserting data into performance table
INSERT INTO Performance (student_id, subject, marks, grade) VALUES (1, 'Mathematics' , 85, 'A'), (2, 'Physics', 78, 'B'), (3, 'Mathematics', 92, 'A'), (3, 'Chemistry', 88 , 'B');
-- Inserting data into Attendance table
INSERT INTO Attendance (student_id, date, status) VALUES (1, '2024-08-10', 'Present'), (2, '2024-08-10', 'Absent'), (3, '2024-08-10', 'Present');

SELECT 
s.student_name,
s.address,
s.dob,
d.department_name,
FROM 
Students s
JOIN 
   Departments d ON 
   s.department_id = d.department_id;
   
   SELECT
   s.student_name,
   p.subject,
   p.marks,
   p.grade
   FROM
   performance p
   JOIN 
   Students s ON p.student_id = s.student_id;
   
   SELECT 
   s.student_name,
   a.date,
   a.status
   FROM
   Attendance a
   JOIN 
   Students s ON a.student_id = S.student_id;