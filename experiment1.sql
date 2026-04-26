-- 1. Create a database
CREATE DATABASE college;

-- 2. Select the current database
USE college;

-- 3(a). Create Student table
CREATE TABLE Student (
    roll_no INTEGER,
    name VARCHAR(50),
    dob DATE,
    address TEXT,
    phone_no VARCHAR(15),
    blood_grp VARCHAR(10)
);

-- 3(b). Create Course table
CREATE TABLE Course (
    Course_id INTEGER,
    Course_name VARCHAR(50),
    course_duration INTEGER
);

-- 4. List all tables in the current database
SHOW TABLES;

-- 5. Display the structure of Student table
DESC Student;

-- 6. Drop the column blood_grp from Student table
ALTER TABLE Student
DROP COLUMN blood_grp;

-- 7. Add a new column Adar_no with domain number
ALTER TABLE Student
ADD Adar_no BIGINT;

-- 8. Change datatype of phone_no from varchar to int
ALTER TABLE Student
MODIFY phone_no BIGINT;

-- 9. Drop the tables
DROP TABLE Student;
DROP TABLE Course;

-- 10. Delete the database
DROP DATABASE college;

-- 11. Create a database
CREATE DATABASE organization;

-- 12. Select the current database
USE organization;

-- 13(a). Create Employee table
CREATE TABLE Employee (
    emp_no VARCHAR(10),
    emp_name VARCHAR(50),
    dob DATE,
    address TEXT,
    mobile_no BIGINT,
    dept_no VARCHAR(10),
    salary INTEGER
);

-- 13(b). Create Department table
CREATE TABLE Department (
    dept_no VARCHAR(10),
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- 14. List all tables in the current database
SHOW TABLES;

-- 15. Display the structure of Employee table
DESC Employee;

-- Display the structure of Department table
DESC Department;

-- 16. Add a new column 'Designation' to Employee table
ALTER TABLE Employee
ADD Designation VARCHAR(50);

-- 17. Drop the column 'location' from Department table
ALTER TABLE Department
DROP COLUMN location;
