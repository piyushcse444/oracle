-- Drop tables if they already exist to ensure a clean slate
DROP TABLE OfficeStaff PURGE;
DROP TABLE Employees PURGE;
DROP TABLE Departments PURGE;
DROP TABLE Locations PURGE;

-- 1. Create Locations Table
CREATE TABLE Locations (
    location_id NUMBER(4) PRIMARY KEY,
    city VARCHAR2(30) NOT NULL
);

-- 2. Create Departments Table
CREATE TABLE Departments (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(30) NOT NULL,
    location_id NUMBER(4),
    CONSTRAINT fk_dept_loc FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- 3. Create Employees Table
CREATE TABLE Employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    manager_id NUMBER(6),
    hire_date DATE NOT NULL,
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    department_id NUMBER(4),
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 4. Create OfficeStaff Table (From Lab Page 11)
CREATE TABLE OfficeStaff (
    staff_id NUMBER(4) PRIMARY KEY,
    f_name VARCHAR2(20),
    l_name VARCHAR2(20),
    mail_id VARCHAR2(10),
    salary NUMBER(7,2)
);

-- Insert Sample Locations
INSERT INTO Locations VALUES (1400, 'Southlake');
INSERT INTO Locations VALUES (1700, 'Seattle');

-- Insert Sample Departments
INSERT INTO Departments VALUES (10, 'Administration', 1700);
INSERT INTO Departments VALUES (20, 'Marketing', 1700);
INSERT INTO Departments VALUES (30, 'Purchasing', 1700);
INSERT INTO Departments VALUES (40, 'Human Resources', 1700);
INSERT INTO Departments VALUES (50, 'Shipping', 1400);
INSERT INTO Departments VALUES (70, 'Public Relations', 1700);
INSERT INTO Departments VALUES (100, 'Finance', 1700);
INSERT INTO Departments VALUES (110, 'Accounting', 1700);

-- Insert Sample Employees
-- Top level Manager (King has no manager)
INSERT INTO Employees VALUES (100, 'Steven', 'King', 'AD_PRES', NULL, TO_DATE('17-JUN-1987', 'DD-MON-YYYY'), 24000, NULL, 90);
INSERT INTO Employees VALUES (101, 'Neena', 'Kochhar', 'AD_VP', 100, TO_DATE('21-SEP-1989', 'DD-MON-YYYY'), 17000, NULL, 90);
INSERT INTO Employees VALUES (102, 'Lex', 'De Haan', 'AD_VP', 100, TO_DATE('13-JAN-1993', 'DD-MON-YYYY'), 17000, NULL, 90);
INSERT INTO Employees VALUES (103, 'Alexander', 'Hunold', 'IT_PROG', 102, TO_DATE('03-JAN-1990', 'DD-MON-YYYY'), 9000, NULL, 60);
INSERT INTO Employees VALUES (104, 'Bruce', 'Ernst', 'IT_PROG', 103, TO_DATE('21-MAY-1991', 'DD-MON-YYYY'), 6000, NULL, 60);
INSERT INTO Employees VALUES (148, 'Gerald', 'Cambrault', 'SA_MAN', 100, TO_DATE('15-OCT-1996', 'DD-MON-YYYY'), 11000, 0.30, 80);
INSERT INTO Employees VALUES (174, 'Ellen', 'Abel', 'SA_REP', 148, TO_DATE('11-MAY-1996', 'DD-MON-YYYY'), 11000, 0.30, 80);
INSERT INTO Employees VALUES (120, 'Matthew', 'Weiss', 'ST_MAN', 100, TO_DATE('18-JUL-1996', 'DD-MON-YYYY'), 8000, NULL, 50);
INSERT INTO Employees VALUES (125, 'Julia', 'Nayer', 'ST_CLERK', 120, TO_DATE('16-JUL-1997', 'DD-MON-YYYY'), 3200, NULL, 50);
INSERT INTO Employees VALUES (200, 'Jennifer', 'Whalen', 'AD_ASST', 101, TO_DATE('17-SEP-1987', 'DD-MON-YYYY'), 4400, NULL, 10);
INSERT INTO Employees VALUES (108, 'Nancy', 'Greenberg', 'FI_MGR', 101, TO_DATE('17-AUG-1994', 'DD-MON-YYYY'), 12008, NULL, 100);
INSERT INTO Employees VALUES (109, 'Daniel', 'Faviet', 'FI_ACCOUNT', 108, TO_DATE('16-AUG-1994', 'DD-MON-YYYY'), 9000, NULL, 100);

COMMIT;

