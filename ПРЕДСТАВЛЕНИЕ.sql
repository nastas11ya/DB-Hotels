CREATE VIEW ADRESS_OF_HOTELS  AS
  SELECT ADRESS
  FROM HOTELS
  WHERE CITY='ВОРОНЕЖ';
  
SELECT* FROM ADRESS_OF_HOTELS;

CREATE or REPLACE VIEW ADRESS_OF_HOTELS AS
  SELECT HOTELS.ADRESS, ROOM_ID
  FROM ROOMS
  JOIN HOTELS ON ROOMS.HOTEL_ID = HOTELS.HOTEL_ID
  WHERE HOTELS.CITY='ВОРОНЕЖ';
  
SELECT* FROM ADRESS_OF_HOTELS;

SELECT* FROM ROOMS;