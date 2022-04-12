Create DataBase SQL_Relations

use SQL_Relations

Create Table Teacher(
Id int Primary Key Identity,
Name NVarChar(20), 
Surname NVarChar(20)
)

Create Table Student(
Id int Primary Key Identity,
Name NVarChar(20), 
Surname NVarChar(20),
TeacherId int Foreign Key References Teacher (Id)
)

Create Table [Group](
Id int Primary Key Identity,
Name NVarChar(20), 
TeacherId int Foreign Key References Teacher (Id),
StudentId int Foreign Key References Student (Id)
)

Create Table Classroom(
Id int Primary Key Identity,
Number int, 
GroupId int Foreign Key References [Group] (Id)
)

Insert into Student
Values ('Murad', 'Alizada', 1), ('Adil', 'Rasulov', 1), ('Ilknur', 'Azizov', 2), ('Emil', 'Gahramanov', 2)

Insert into Teacher
Values ('Farid', 'Mammadov'), ('Yusif', 'Guluzade')

Insert into [Group]
Values ('AP', 1, 1), ('Yupiter', 1, 2), ('AP', 2, 3),('Yupiter', 2, 4)

Insert into Classroom
Values (102, 1), (105, 2), (102, 3),(105, 4)

Select s.Id, s.Name, s.Surname, g.Name as 'Group Name', c.Number as 'Class Number',t.Id as 'Teacher Id' from Student s
Join [Group] g on s.Id = g.StudentId
Join Teacher t on g.TeacherId = t.Id
join Classroom c on g.Id = c.GroupId