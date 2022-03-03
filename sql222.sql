CREATE TABLE class(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT ,
	code INTEGER UNIQUE,
	number_of_students INTEGER,
	number_of_vip INTEGER,
	age_Avg INTEGER,
	most_popular_city TEXT,
	oldest_vip INTEGER,
	youngest_vip INTEGER
);

-----------------------------------

CREATE TABLE Students(
	id INTEGER ,
	name TEXT not null,
	age INTEGER,
	address_City TEXT,
	vip TEXT DEFAULT "NO",
	class_Id INTEGER,
	PRIMARY KEY (id AUTOINCREMENT),
	FOREIGN KEY (class_Id) REFERENCES class(id)
);


INSERT INTO Students (name,age,address_City,vip)
VALUES
("batman",39,"ashdod","no"),
("deadpool",57,"naharia","YES"),
("superman",29,"beersheva","no"),
("wonder woman",34,"mizraa","no"),
("green arrow",19,"telaviv","YES"),
("spiderman",69,"naura","no")

INSERT INTO class (name,code)
VALUES
("devops",10),
("aws",20),
("java",30)





UPDATE class
set number_of_students=
(SELECT count(class_Id) from Students
where class_Id=3)
where id =3 





UPDATE class
set number_of_vip=
(select count(vip) from Students where 
vip = "YES" and class_Id=3)
where id = 3




UPDATE Class
set age_Avg = (SELECT avg(age) from Students
where class_Id = 3 )
WHERE id=3



UPDATE Class 
set youngest_vip=(SELECT min(age) from Students
where Vip = "YES" and class_Id=3)
where id=3






UPDATE Class 
SET MOST_POPULAR_CITY = 
(SELECT ADDRESS_CITY from 
(SELECT ADDRESS_CITY, max(noc) from 
(SELECT *, ADDRESS_CITY, count(*) as noc from
 Students group by ADDRESS_CITY 
 having Students.Class_ID=Class.ID))) 

