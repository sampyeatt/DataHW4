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
Values ('666', '1', 'Reggie', 'Lab', 'Black', '2000-09-22', True , 14, 'IAMS', 'Dog');

insert into animalRecord (petID, ownerID, petName, breed, color, birthday, neuteredORspayed, timePercentageOutside, diet, animalType)
Values ('99', '3', 'Bagle', 'Border Colie', 'Black and White', '2017-06-02', True , 25, 'IAMS', 'Dog');

insert into animalRecord (petID, ownerID, petName, breed, color, birthday, neuteredORspayed, timePercentageOutside, diet, animalType)
Values ('420', '9', 'Kitty', 'Russian Blue', 'Gray', '2005-04-15', True , 1, 'Fancy Feast', 'Cat');

insert into animalRecord (petID, ownerID, petName, breed, color, birthday, neuteredORspayed, timePercentageOutside, diet, animalType)
Values ('42', '5', 'Momo', 'Mix', 'White', '2018-03-09', True , 2, 'Fancy Feast', 'Cat');

insert into ownerRecord (ownerID, ownerName, ownerNumber, ownerSign, signDate)
values ('1', 'Dave Burd', 6662228888, True, '2019-05-22');

insert into ownerRecord (ownerID, ownerName, ownerNumber, ownerSign, signDate)
values ('3', 'Michael Myers', 6666666666, True, '2016-07-02');

insert into ownerRecord (ownerID, ownerName, ownerNumber, ownerSign, signDate)
values ('5', 'Mable Pines', 5554443332, True, '2020-01-15');

insert into ownerRecord (ownerID, ownerName, ownerNumber, ownerSign, signDate)
values ('9', 'Dark Father', 8008241173, True, '2019-12-25');

delete from animalRecord
	where petID = '666';