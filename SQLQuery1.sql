--1
SELECT e.FirstName, e.LastName, e.DepartmentId, d.[Name] AS DepartmentName, e.IsSupervisor 
FROM EMPLOYEE e
LEFT JOIN Department d ON e.DepartmentId = d.Id
ORDER BY DepartmentName, e.LastName, e.FirstName 

--2
SELECT * FROM Department
ORDER BY Budget DESC

--3
SELECT e.FirstName, e.LastName, d.[Name] AS DepartmentName, e.IsSupervisor 
FROM EMPLOYEE e
LEFT JOIN Department d ON e.DepartmentId = d.Id
WHERE e.IsSupervisor = 1

--4
SELECT d.[Name] as DepartmentName, COUNT(e.DepartmentId) as EmployeeCount
FROM EMPLOYEE e
LEFT JOIN Department d ON e.DepartmentId = d.Id
GROUP BY d.[Name]

--5
SELECT * FROM Department

UPDATE Department
SET Budget = (Budget * 1.20)

--6
SELECT e.FirstName, e.LastName, et.EmployeeId, et.TrainingProgramId, t.[Name]
FROM EMPLOYEE e
LEFT JOIN EmployeeTraining et ON e.Id = et.EmployeeId
LEFT JOIN TrainingProgram t ON et.TrainingProgramId = t.Id
WHERE et.TrainingProgramId is NULL

--7
SELECT e.FirstName, e.LastName, COUNT(et.TrainingProgramId) as TrainingCount
FROM EMPLOYEE e
LEFT JOIN EmployeeTraining et ON e.Id = et.EmployeeId
WHERE et.TrainingProgramId is NOT NULL
GROUP BY e.FirstName, e.LastName

--8
SELECT t.[Name], COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et on t.Id = et.TrainingProgramId
GROUP BY t.[Name]

--9
SELECT t.[Name], t.MaxAttendees, COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et on t.Id = et.TrainingProgramId
GROUP BY t.[Name], t.MaxAttendees
HAVING COUNT(et.EmployeeId) < t.MaxAttendees 

--10
SELECT t.[Name], t.StartDate 
FROM TrainingProgram t
ORDER BY t.StartDate ASC

--11
INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId)
OUTPUT INSERTED.Id
VALUES (3, 12)

--12
SELECT TOP 3 t.[Name], t.[Id], COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et on t.Id = et.TrainingProgramId
GROUP BY t.[Id], t.[Name]
ORDER BY AttendeeCount DESC

--13
SELECT TOP 3 t.[Name], COUNT(et.EmployeeId) as AttendeeCount
FROM TrainingProgram t
LEFT JOIN EmployeeTraining et on t.Id = et.TrainingProgramId
GROUP BY t.[Name]
ORDER BY AttendeeCount DESC

--14
SELECT e.FirstName, e.LastName, ce.ComputerId
FROM EMPLOYEE e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
WHERE ce.ComputerId IS NULL

--15
--Can use ISNULL in place of COALESCE, syntax does not change
SELECT e.FirstName, e.LastName, ce.ComputerId, COALESCE(c.Manufacturer + ' ' + c.Make, 'N/A') as ComputerInfo 
FROM EMPLOYEE e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
LEFT JOIN Computer c ON ce.ComputerId = c.Id

--16
SELECT c.Id, c.Make, c.Manufacturer, c.PurchaseDate 
FROM COMPUTER c
WHERE c.PurchaseDate < '20190701' AND c.DecomissionDate is NULL

--17
SELECT e.FirstName, e.LastName, c.Make, c.Manufacturer, c.DecomissionDate
FROM Employee e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
LEFT JOIN Computer c on ce.ComputerId = c.Id
GROUP BY e.FirstName, e.LastName, c.Make, c.Manufacturer, c.DecomissionDate
HAVING c.Make is NOT NULL

--18
SELECT * FROM PaymentType

--19

--20

--21

--22

--23
