-- PROJECT 01: IT HELPDESK DATABASE ANALYSIS
-- Database: SQLite

-- QUERY 1: View all helpdesk tickets
SELECT * FROM tickets;

-- QUERY 2: Average resolution time
SELECT
    ROUND(AVG(resolution_hours), 2) AS average_resolution_hours
FROM tickets
WHERE status = 'Resolved';

-- QUERY 3: Classify ticket resolution
SELECT
    ticket_id,
    employee_name,
    status,
    resolution_hours,
    CASE
        WHEN status = 'Pending' THEN 'Needs Action'
        WHEN resolution_hours <= 2 THEN 'Fast Resolution'
        ELSE 'Standard Resolution'
    END AS resolution_category
FROM tickets;

-- QUERY 4: INNER JOIN employees and tickets
SELECT
    tickets.ticket_id,
    employees.employee_name,
    employees.department,
    tickets.issue_category,
    tickets.priority,
    tickets.status,
    tickets.resolution_hours
FROM tickets
INNER JOIN employees
ON tickets.employee_name = employees.employee_name;

-- QUERY 5: LEFT JOIN employees and tickets
SELECT
    employees.employee_name,
    employees.department,
    tickets.ticket_id,
    tickets.issue_category,
    tickets.status
FROM employees
LEFT JOIN tickets
ON employees.employee_name = tickets.employee_name;

-- QUERY 6: Ticket volume by priority
SELECT
    priority,
    COUNT(*) AS total_tickets,
    CASE
        WHEN COUNT(*) >= 3 THEN 'High Volume'
        WHEN COUNT(*) = 2 THEN 'Moderate Volume'
        ELSE 'Low Volume'
    END AS volume_category
FROM tickets
GROUP BY priority
ORDER BY total_tickets DESC;

-- QUERY 7: Departments with at least 2 tickets
SELECT
    employees.department,
    COUNT(tickets.ticket_id) AS total_tickets
FROM employees
LEFT JOIN tickets
ON employees.employee_name = tickets.employee_name
GROUP BY employees.department
HAVING COUNT(tickets.ticket_id) >= 2
ORDER BY total_tickets DESC;
