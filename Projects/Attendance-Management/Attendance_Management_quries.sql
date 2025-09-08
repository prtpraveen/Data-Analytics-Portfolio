1. Show total employees by Training Model
SELECT TrainingModel, COUNT(*) AS TotalEmployees
FROM EmployeeData
GROUP BY TrainingModel;
2. Find average salary and bonus by Job LevelSELECT JobLevel, 
       AVG(Salary) AS AvgSalary, 
       AVG(Bonus) AS AvgBonus
FROM EmployeeData
GROUP BY JobLevel
ORDER BY AvgSalary DESC;
3. Attendance percentage by Team
SELECT Team, 
       SUM(AttendanceStatus) * 100.0 / COUNT(*) AS AttendancePercentage
FROM EmployeeData
GROUP BY Team
ORDER BY AttendancePercentage DESC;
4. Highest-paid employee in each Team
SELECT Team, Name, Salary
FROM EmployeeData e
WHERE Salary = (
    SELECT MAX(Salary) 
    FROM EmployeeData 
    WHERE Team = e.Team
);
5. Salary expense and bonus payout by Quarter
SELECT Quarter, 
       SUM(Salary) AS TotalSalaryExpense, 
       SUM(Bonus) AS TotalBonusPayout
FROM EmployeeData
GROUP BY Quarter
ORDER BY Quarter;
6. Gender-wise salary comparison
SELECT Gender, 
       AVG(Salary) AS AvgSalary, 
       MAX(Salary) AS MaxSalary, 
       MIN(Salary) AS MinSalary
FROM EmployeeData
GROUP BY Gender;
7. Employees absent more than once (if multiple dates exist in dataset)
SELECT Name, COUNT(*) AS AbsentDays
FROM EmployeeData
WHERE AttendanceStatus = 0
GROUP BY Name
HAVING COUNT(*) > 1;

