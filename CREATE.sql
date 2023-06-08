CREATE TABLE HOTELS(
    HOTEL_ID SERIAL PRIMARY KEY,
    ADRESS VARCHAR(30) NOT NULL,
    CITY VARCHAR(20) NOT NULL     
);

CREATE TABLE ROOMS(
    ROOM_ID SERIAL PRIMARY KEY,
    HOTEL_ID INT REFERENCES HOTELS(HOTEL_ID),
    PRICE FLOAT CHECK(PRICE >0),
	FLOOR INT,
	MAX_PERSONS INT CHECK(MAX_PERSONS>0)
);

CREATE TABLE HOUSEMAIDS(
    HOUSEMAID_ID SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
	PASSPORT_ID INT
);

CREATE TABLE PASSPORTS(
    PASSPORT_ID SERIAL PRIMARY KEY,
	ISSUE_DATE DATE,
	SERIES INT,
	NUMBER INT
);

CREATE TABLE GUESTS(
    GUEST_ID SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
	PHONE VARCHAR(20), 
	PASSPORT_ID INT REFERENCES PASSPORTS(PASSPORT_ID)
);

CREATE TABLE BOOKING(
    BOOKING_ID SERIAL PRIMARY KEY,
	START_DATE DATE,
	END_DATE DATE,
	ROOM_ID INT REFERENCES ROOMS(ROOM_ID),
	GUEST_ID INT REFERENCES GUESTS(GUEST_ID)
);