create table Department (
    Dep_ID NUMBER(5) PRIMARY KEY,
    Dep_Name VARCHAR2(50) NOT NULL,
    HOD_Name VARCHAR2(100) NOT NULL,
    HOD_Salary NUMBER(10, 2) 
);
create table Employee (
    Emp_ID NUMBER(5) PRIMARY KEY,
    Emp_Name VARCHAR2(100) NOT NULL,
    Dep_ID NUMBER(5) NOT NULL,
    Emp_Salary NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_dep_id FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID)
);


INSERT INTO Department (Dep_ID, Dep_Name, HOD_Name, HOD_Salary) VALUES (10, 'Marketing', 'Alice Johnson', 110000.00);
INSERT INTO Department (Dep_ID, Dep_Name, HOD_Name, HOD_Salary) VALUES (20, 'Finance', 'Bob Williams', 135000.00);
INSERT INTO Department (Dep_ID, Dep_Name, HOD_Name, HOD_Salary) VALUES (30, 'IT', 'Charlie Davis', 150000.00);
INSERT INTO Department (Dep_ID, Dep_Name, HOD_Name, HOD_Salary) VALUES (40, 'HR', 'Diana Evans', 95000.00);
INSERT INTO Department (Dep_ID, Dep_Name, HOD_Name, HOD_Salary) VALUES (50, 'Operations', 'Eve Green', 125000.00);
INSERT INTO Department (Dep_ID, Dep_Name, HOD_Name, HOD_Salary) VALUES (60, 'Research', 'Frank Hall', 140000.00);


INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (101, 'Garry King', 10, 60000.00);
INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (102, 'Hannah Lee', 10, 55000.00);
INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (103, 'Ian Miller', 20, 80000.00);
INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (104, 'Jessica Nolan', 30, 95000.00);
INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (105, 'Kyle Owens', 30, 85000.00);
INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (106, 'Laura Perez', 30, 75000.00);
INSERT INTO Employee (Emp_ID, Emp_Name, Dep_ID, Emp_Salary) VALUES (107, 'Mike Quinn', 70, 70000.00); 

SELECT Dep_Name, HOD_Name FROM Department;


SELECT * FROM Department WHERE HOD_Salary > 120000.00;


SELECT Dep_Name, HOD_Salary FROM Department ORDER BY HOD_Salary DESC, Dep_Name ASC;

SELECT Dep_ID, COUNT(Emp_ID) AS Total_Employees, AVG(Emp_Salary) AS Average_Employee_Salary
FROM Employee GROUP BY Dep_ID HAVING COUNT(Emp_ID) > 1
ORDER BY Average_Employee_Salary DESC;

SELECT e.Emp_Name, d.Dep_Name FROM Employee e 
INNER JOIN Department d ON e.Dep_ID = d.Dep_ID;

SELECT d.Dep_Name, e.Emp_Name FROM Department d 
LEFT JOIN Employee e ON d.Dep_ID = e.Dep_ID;

SELECT d.Dep_Name, e.Emp_Name FROM Department d
RIGHT JOIN Employee e ON d.Dep_ID = e.Dep_ID;

SELECT d.Dep_Name, d.HOD_Name, (SELECT COUNT(Emp_ID) FROM Employee e 
WHERE e.Dep_ID = d.Dep_ID) AS Employee_Count FROM Department d;

SELECT SUM(HOD_Salary) AS Total_HOD_Payroll FROM Department;

SELECT AVG(HOD_Salary) AS Average_HOD_Salary FROM Department;

SELECT Dep_Name,HOD_Name,HOD_Salary FROM Department
WHERE HOD_Salary >= 130000.00;
