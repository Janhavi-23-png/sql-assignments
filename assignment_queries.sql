
-- Create Tables

DROP TABLE IF EXISTS Patients;
CREATE TABLE Patients(
    Hospital_Name VARCHAR(100),
    Location VARCHAR(100),
    Department VARCHAR(50),
    Doctors_Count INTEGER,
	Patients_Count INTEGER,
	Admission_Date DATE,
	Discharge_Date DATE,
    Medical_Expenses NUMERIC (10,2)
);
SELECT * FROM Patients;

--1. Total Number of Patients  
--Write an SQL query to find the total number of patients across all hospitals. 

SELECT SUM(Patients_Count) AS Total_Number_of_Patients 
FROM Patients; 
  
--2. Average Number of Doctors per Hospital 
--Retrieve the average count of doctors available in each hospital.  

SELECT Hospital_Name, 
       AVG(Doctors_Count) AS Average_Doctors 
FROM Patients 
GROUP BY Hospital_Name 
ORDER BY Average_Doctors DESC; 
  
--3. Top 3 Departments with the Highest Number of Patients  
--Find the top 3 hospital departments that have the highest number of patients.  

SELECT Department, 
       SUM(Patients_Count) AS Total_Patients 
FROM Patients 
GROUP BY Department 
ORDER BY Total_Patients DESC 
LIMIT 3; 
 
 
--4. Hospital with the Maximum Medical Expenses  
--Identify the hospital that recorded the highest medical expenses.  

SELECT Hospital_Name, 
       SUM(Medical_Expenses) AS Total_Expenses 
FROM Patients 
GROUP BY Hospital_Name 
ORDER BY Total_Expenses DESC 
LIMIT 1; 
  
--5. Daily Average Medical Expenses  
--Calculate the average medical expenses per day for each hospital.  
 
SELECT Hospital_Name, 
       AVG(Medical_Expenses) AS Daily_Avg_Expenses 
FROM Patients 
GROUP BY Hospital_Name 
ORDER BY Daily_Avg_Expenses DESC; 
  
--6. Longest Hospital Stay  
--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.  

SELECT Hospital_Name, 
       Department, 
       Admission_Date, 
       Discharge_Date, 
       (Discharge_Date - Admission_Date) AS Total_Stay_Days 
FROM Patients 
ORDER BY Total_Stay_Days DESC 
LIMIT 1; 
  
--7. Total Patients Treated Per City  
--Count the total number of patients treated in each city.  

SELECT Location AS City, 
       SUM(Patients_Count) AS Total_Patients_Treated 
FROM Patients 
GROUP BY Location 
ORDER BY Total_Patients_Treated DESC; 
  
--8. Average Length of Stay Per Department  
--Calculate the average number of days patients spend in each department.  

SELECT Department, 
       AVG(Discharge_Date - Admission_Date) AS Avg_Stay_Days 
FROM Patients 
GROUP BY Department 
ORDER BY Avg_Stay_Days DESC; 
 
 
 
--9. Identify the Department with the Lowest Number of Patients  
--Find the department with the least number of patients.  
 
SELECT Department, 
       SUM(Patients_Count) AS Total_Patients 
FROM Patients 
GROUP BY Department 
ORDER BY Total_Patients ASC 
LIMIT 1; 
  
--10. Monthly Medical Expenses Report  
--Group the data by month and calculate the total medical expenses for each month.  

SELECT 
    TO_CHAR(Admission_Date, 'Month') AS Month_Name, 
    EXTRACT(MONTH FROM Admission_Date) AS Month_Number, 
    SUM(Medical_Expenses) AS Total_Medical_Expenses 
FROM Patients 
GROUP BY Month_Name, Month_Number 
ORDER BY Month_Number; 



