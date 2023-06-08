ALTER TABLE BOOKING
ADD UPDATE_TIME TIME;

--Новые  значения полей записи базы данных, обновленной командой UPDATE, при срабатывании триггера 
--уровня записи (ROW). Переменная используется для модификации новых записей. Внимание !!! 
--Переменная NEW доступна только при операциях INSERT и UPDATE. Поля записи NEW могут быть 
--изменены триггером.

--создание триггера
CREATE TRIGGER update_time_modtime1
BEFORE UPDATE ON BOOKING 
FOR EACH ROW EXECUTE PROCEDURE update_column1();

--триггерная функция
CREATE FUNCTION update_column1()   
RETURNS TRIGGER AS $$
BEGIN
    NEW.UPDATE_TIME = now();
    RETURN NEW;   
END;
$$ LANGUAGE plpgsql;

--Триггер, помеченный FOR EACH ROW, вызывается один раз для каждой строки, изменяемой операцией.
UPDATE BOOKING 
	   SET START_DATE = '2023-04-10' 
	   WHERE START_DATE = '2023-05-10';
  
select *from BOOKING;

--ДОБАВИТЬ DEFAULT

ALTER TABLE ONLY BOOKING ALTER COLUMN UPDATE_TIME SET DEFAULT now() at time zone 'utc';
ALTER TABLE ONLY BOOKING ALTER COLUMN UPDATE_TIME SET DEFAULT CURRENT_DATE;