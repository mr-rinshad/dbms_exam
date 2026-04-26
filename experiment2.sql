-- 1. Create Persons table
CREATE TABLE Persons (
    PersonID INTEGER PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Aadhar BIGINT NOT NULL UNIQUE,
    Age INTEGER CHECK (Age > 18)
);

-- 2. Create Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    OrderNumber INTEGER NOT NULL,
    PersonID INTEGER,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-- 3. Display structure of Persons table
DESC Persons;

-- 4. Display structure of Orders table
DESC Orders;

-- 5. Add emp_no as primary key of Employee table
ALTER TABLE Employee
ADD PRIMARY KEY (emp_no);

-- 6. Add dept_no as primary key of Department table
ALTER TABLE Department
ADD PRIMARY KEY (dept_no);

-- 7. Add dept_no in Employee as foreign key referencing Department with ON DELETE CASCADE
ALTER TABLE Employee
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_no)
REFERENCES Department(dept_no)
ON DELETE CASCADE;

-- 8. Drop primary key of Orders table
ALTER TABLE Orders
DROP PRIMARY KEY;
