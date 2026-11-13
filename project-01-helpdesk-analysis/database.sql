-- PROJECT 01: IT HELPDESK DATABASE ANALYSIS
-- Database: SQLite

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name TEXT,
    department TEXT,
    job_title TEXT
);

INSERT INTO employees VALUES
(1, 'John', 'Finance', 'Accountant'),
(2, 'Mary', 'HR', 'HR Assistant'),
(3, 'Peter', 'IT', 'IT Specialist'),
(4, 'Anna', 'Sales', 'Sales Associate'),
(5, 'Mark', 'Finance', 'Finance Analyst'),
(6, 'Sarah', 'HR', 'HR Manager');

CREATE TABLE tickets (
    ticket_id INTEGER PRIMARY KEY,
    employee_name TEXT,
    department TEXT,
    issue_category TEXT,
    priority TEXT,
    status TEXT,
    resolution_hours REAL
);
