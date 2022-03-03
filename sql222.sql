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





