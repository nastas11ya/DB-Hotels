ALTER TABLE HOTELS
ADD CHECK (ADRESS != '');
--btrim

ALTER TABLE HOTELS
ADD CHECK (CITY != '');

ALTER TABLE HOUSEMAIDS
ADD CHECK (FIRST_NAME != '');

ALTER TABLE HOUSEMAIDS
ADD CHECK (LAST_NAME != '');

ALTER TABLE GUESTS
ADD CHECK (FIRST_NAME != '');

ALTER TABLE GUESTS
ADD CHECK (LAST_NAME != '');

ALTER TABLE PASSPORTS
ADD CHECK (SERIES >0);

ALTER TABLE PASSPORTS
ADD CHECK (NUMBER >0);

ALTER TABLE ROOMS
ADD HOUSEMAID_ID INT REFERENCES HOUSEMAIDS(HOUSEMAID_ID);

ALTER TABLE HOUSEMAIDS
ADD FOREIGN KEY (PASSPORT_ID)REFERENCES PASSPORTS(PASSPORT_ID);

ALTER TABLE GUESTS
ADD UNIQUE (PHONE);
