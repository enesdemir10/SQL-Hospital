--1.Which SQL statement is used to modify existing data in a table?
--Answer: UPDATE

--2.What keyword is used to sort the result set in SQL? 
--Answer: ORDER BY

--3.Question: Write a query to select the names and insurance ids of all patients in the Patient table.
SELECT Name, InsuranceID FROM Patient;

--4.Question: How would you retrieve the details of doctors from the Physician table whose position is ‘Surgical Attending Physician’?
SELECT * FROM Physician WHERE Position = 'Surgical Attending Physician';

--5.Question: Write a query to find the total number of patients in the Patient table.
SELECT COUNT(*) AS 'Total Patient' FROM Patient;

--6.Question: What is the primary affiliated physician for each department Hint: use following tables: Physician, Department, Affiliated_With?
SELECT p.Name AS Physician, d.Name AS Department 
FROM Department d
JOIN Affiliated_With a ON a.Department = d.DepartmentID
JOIN Physician p ON p.EmployeeID = a.Physician
WHERE PrimaryAffiliation = 1;

--7.Question: How many patients are assigned to each physician in the Appointment table?
SELECT p.name, COUNT(*) AS 'Total Patient'
FROM appointment AS a
JOIN physician AS p ON a.physician = p.EmployeeID 
GROUP BY physician;

--8.Question: Write a query to list all appointments along with the names of the patients and their doctors.
SELECT a.AppointmentID, p.Name AS 'Patient', d.Name AS 'Physician' 
FROM Appointment AS a
LEFT JOIN Patient AS p ON p.SSN = a.Patient
LEFT JOIN Physician AS d ON d.EmployeeID = a.Physician;

--9.Question: Write a query to find the names of patients who have more than one appointment.
SELECT p.Name, count(a.Patient) as Appointment
FROM Appointment AS a
LEFT JOIN Patient AS p ON p.SSN = a.Patient 
GROUP BY a.Patient
HAVING Appointment>1;

--10.Question: How would you find the name of the patient and the medication name that is given to them? 
--Hint: use Patient, Prescribes, Medication tables.
SELECT p.Name AS Patient, m.Name AS Medication 
FROM Prescribes AS pr
LEFT JOIN Patient AS p ON pr.Patient = p.SSN
LEFT JOIN Medication AS m ON pr.Medication = m.Code;