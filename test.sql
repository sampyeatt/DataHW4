USE `mydb`;

show tables;

describe session;

describe ownerRecord;

describe immunizationhistory;

describe animalrecord;

describe knownconditions;

describe medicalHistory;

describe surgicalHistory;

describe training;

describe trainType;

describe visitHistory;

-- part 3

insert into animalRecord (petID, ownerID, petName, breed, color, birthday, neuteredORspayed, timePercentageOutside, diet, animalType)
Values
	('666', '1', 'Reggie', 'Lab', 'Black', '2000-09-22', True , 14, 'IAMS', 'Dog'),
	('99', '3', 'Bagle', 'Border Colie', 'Black and White', '2017-06-02', True , 25, 'IAMS', 'Dog'),
	('420', '9', 'Kitty', 'Russian Blue', 'Gray', '2005-04-15', True , 1, 'Fancy Feast', 'Cat'),
	('42', '5', 'Momo', 'Mix', 'White', '2018-03-09', True , 2, 'Fancy Feast', 'Cat');

insert into ownerRecord (ownerID, ownerName, ownerNumber, ownerSign, signDate)
values 
	('1', 'Dave Burd', 6662228888, True, '2019-05-22'),
	('3', 'Michael Myers', 6666666666, True, '2016-07-02'),
	('5', 'Mable Pines', 5554443332, True, '2020-01-15'),
	('9', 'Dark Father', 8008241173, True, '2019-12-25');

insert into trainType (trainType, type, maxCap)
values 
	(1, 'Basic Skills', 20),
	(2,'Walk-Train-Play', 25),
	(3,'Off-leash Operations', 30);

insert into session (sessionID, trainCapacity, trainer, date, Training_sessionID, trainType)
values 
	(2, 15, 'Shey', '2020-03-29', 1, 1),
	(3, 13, 'Shey', '2020-04-28', 2, 2),
	(4, 14, 'Marie', '2020-03-14', 3, 3),
	(5, 17, 'Marie', '2020-03-17', 4, 3),
	(6, 18, 'Shey', '2020-03-19', 5, 2),
	(7, 23, 'Shey', '2020-03-21', 6, 1);

delete from animalRecord
	where petID = '666';