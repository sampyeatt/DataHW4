USE `mydb`;

show tables;

describe session;

describe ownerRecord;

describe immunizationhistory;

describe animalrecord;

describe knownconditions;

describe medicalHistory;

describe surgicalHistoy;

describe training;

describe trainType;

describe visitHistory;

-- part 3

insert into animalRecord (petID, ownerID, petName, breed, color, birthday, neuteredORspayed, timePercentageOutside, diet, animalType, gender)
Values
	('666', '1', 'Reggie', 'Lab', 'Black', '2000-09-22', True , 14, 'IAMS', 'Dog', 'Male'),
	('99', '3', 'Bagle', 'Border Colie', 'Black and White', '2017-06-02', True , 25, 'IAMS', 'Dog', 'Female'),
	('420', '9', 'Kitty', 'Russian Blue', 'Gray', '2005-04-15', True , 1, 'Fancy Feast', 'Cat', 'Female'),
	('42', '5', 'Momo', 'Mix', 'White', '2018-03-09', True , 2, 'Fancy Feast', 'Cat', 'Female');

insert into ownerRecord (ownerID, ownerName, ownerNumber, ownerSign, signDate)
values 
	('1', 'Dave Burd', 2228888, True, '2019-05-22'),
	('3', 'Michael Myers', 6666666, True, '2016-07-02'),
	('5', 'Mable Pines', 4443332, True, '2020-01-15'),
	('9', 'Dark Father', 8241173, True, '2019-12-25');

insert into trainType (trainType, type, maxCap)
values 
	(1, 'Basic Skills', 20),
	(2,'Walk-Train-Play', 25),
	(3,'Off-leash Operations', 30);

insert into training (sessionID, animalRecord_petID, Signed)
values
	(1, 666, True),
    (2, 42, True),
    (3, 420, True),
    (4, 420, True),
    (5, 666, True),
    (6, 99, True);

insert into session (sessionID, trainCapacity, trainer, date, time, Training_sessionID, trainType_trainType)
values 
	(2, 15, 'Shey', '2020-03-29', '10:00:00', 1, 1),
	(3, 13, 'Shey', '2020-04-28', '11:00:00', 2, 2),
	(4, 14, 'Marie', '2020-03-14', '12:00:00', 3, 3),
	(5, 17, 'Marie', '2020-03-17', '13:00:00', 4, 3),
	(6, 18, 'Shey', '2020-03-19', '14:00:00', 5, 2),
	(7, 23, 'Shey', '2020-03-21', '15:00:00', 6, 1);

delete from animalRecord
	where petID = '666';

SELECT * from animalRecord;

SELECT O.ownerName, A.petID, A.petName, A.animalType, A.breed, A.gender, A.birthday
	FROM animalRecord A, ownerRecord O
    Where O.ownerID = A.ownerID;
    
SELECT S.date, S.time, S.trainer, T.type, O.ownerName, P.petName
	FROM session S, trainType T, ownerRecord O, animalRecord P, training TR
    where TR.sessionID = S.Training_sessionID and O.ownerID = P.ownerID and TR.animalRecord_petID = P.petID and S.trainType_trainType = T.trainType;
    