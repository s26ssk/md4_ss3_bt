USE QuanLySinhVien;

SELECT * FROM Student
WHERE StudentName LIKE 'h%';

SELECT * FROM Class
WHERE MONTH(StartDate) = 12;

SELECT * FROM Subject
WHERE Credit >=3 AND Credit <=5;

UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';

SELECT * FROM Student;

SELECT Student.StudentName, Subject.SubName, Mark.Mark
FROM Student
INNER JOIN Subject ON Mark.SubId = Subject.SubId
INNER JOIN Mark ON Mark.StudentId = Student.StudentId
ORDER BY Mark.Mark DESC, Student.StudentName ASC;

