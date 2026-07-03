SELECT COUNT(*) AS total_students
FROM student_performance;

SELECT ROUND(AVG(gpa)::numeric,2) AS average_gpa
FROM student_performance;

SELECT ROUND(AVG(attendance_percentage)::numeric,2) AS average_attendance
FROM student_performance;

SELECT probation_status,
COUNT(*) AS student_count
FROM student_performance
GROUP BY probation_status;

SELECT department,
COUNT(*) AS total_students
FROM student_performance
GROUP BY department
ORDER BY total_students DESC;

SELECT student_name, gpa
FROM student_performance
ORDER BY gpa DESC
LIMIT 10;

SELECT COUNT(*) AS students_with_backlogs
FROM student_performance
WHERE backlog_count > 2;

SELECT department,
ROUND(AVG(gpa)::numeric,2) AS avg_gpa
FROM student_performance
GROUP BY department
ORDER BY avg_gpa DESC;

SELECT department,
ROUND(AVG(attendance_percentage)::numeric,2) AS avg_attendance
FROM student_performance
GROUP BY department;

SELECT COUNT(*) AS probation_students
FROM student_performance
WHERE probation_status = 'Yes';