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

delete from animalRecord
	where petID = '666';