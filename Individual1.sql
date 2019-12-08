-- 1. Написать команды создания таблиц заданной схемы с 
-- указанием необходимых ключей и ограничений. 
-- Все ограничения должны быть именованными 
-- (для первичных ключей имена должны начинаться с префикса "PK_", 
-- для вторичного ключа - "FK_", проверки - "CH_"). 
-- Ограничения: дата начала восхождения не может быть больше даты завершения
-- восхождения; значение высоты не может быть отрицательным; значение null
-- допустимо только в поле адрес.

-- Клуб "Альпинист"
----------------------------------------------------------------------------
-- Альпинисты
CREATE TABLE CLIMBERS
(
	CLIMBER_ID 		NUMBER(10, 0) NOT NULL,
	FULL_NAME 		VARCHAR2(100) NOT NULL,
	ADDRESS 		VARCHAR2(100),
	PHONE 			VARCHAR2(100) NOT NULL,
	BIRTHDAY_DATE 	DATE NOT NULL,
	CONSTRAINT PL_CLIMBER_ID PRIMARY KEY (CLIMBER_ID)
);
/
-- Вершины
CREATE TABLE PEAKS
(
	PEAK_ID NUMBER(10, 0) NOT NULL,
	NAME 	VARCHAR2(100) NOT NULL,
	HEIGHT 	NUMBER(10, 2) NOT NULL, 
	COUNTRY VARCHAR2(100) NOT NULL,
	REGION 	VARCHAR2(100) NOT NULL,
	CONSTRAINT PK_PEAK_ID PRIMARY KEY (PEAK_ID),
	CONSTRAINT CH_HEIGHT  CHECK (HEIGHT >= 0)
);
/
-- Восхождения
CREATE TABLE CLIMBING
(
	CLIMBING_ID NUMBER(10, 0) NOT NULL,
	START_DATE 	DATE NOT NULL,
	FINISH_DATE DATE NOT NULL,
	PEAK_ID 	NUMBER(10, 0) NOT NULL,
	CONSTRAINT PK_CLIMBING_ID PRIMARY KEY (CLIMBING_ID),
	CONSTRAINT FK_PEAK_ID 	  FOREIGN KEY (PEAK_ID) REFERENCES PEAKS(PEAK_ID),
	CONSTRAINT CH_DATES 	  CHECK (START_DATE <= FINISH_DATE)
);
/
-- Альпинист-Восхождение
CREATE TABLE CLIMBER_CLIMBING
(
	CLIMBER_ID 	NUMBER(10, 0) NOT NULL,
	CLIMBING_ID NUMBER(10, 0) NOT NULL,
	CONSTRAINT PK_CLIMBER_CLIMBING_IDS  PRIMARY KEY (CLIMBER_ID, CLIMBING_ID),
	CONSTRAINT FK_CLIMBER_ID  			FOREIGN KEY (CLIMBER_ID)  REFERENCES CLIMBERS(CLIMBER_ID),
	CONSTRAINT FK_CLIMBING_ID 			FOREIGN KEY (CLIMBING_ID) REFERENCES CLIMBING(CLIMBING_ID)
);
/
-- 2. Заполнить соданные таблицы данными, 5-10 записей для каждой таблицы.
-- Заполнение для Вершин
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(1, 'Адамелло', 3539, 'Италия', 'Средние Альпы');
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(2, 'Лискамм', 4527, 'Италия', 'Пенниские Альпы');
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(3, 'Людвигсхёэ', 58, 'Италия', 'Пенниские Альпы');
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(4, 'Скофел-Пайк', 978, 'Англия', 'Парк Лейк-Дистрикт');
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(5, 'Эльбрус', 5642, 'Россия', 'Большой Кавказ');
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(6, 'Дыхтау', 5204, 'Россия', 'Большой Кавказ');
INSERT INTO PEAKS(PEAK_ID, NAME, HEIGHT, COUNTRY, REGION) VALUES(7, 'Коштантау', 5152, 'Россия', 'Большой Кавказ');

-- Заполнение для Альпинистов
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(1, 'Аскеров Ержан Аскербурдинович', 'г.Томск, ул.Фрунзе 11, кв. 322', '8(965)1961237', TO_DATE('2002-12-17', 'YYYY-MM-DD'));
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(2, 'Бакуров Армэн Ербакурдинжонович', 'г.Томск, ул.Фрунзе 105, кв. 25', '8(907)1351307', TO_DATE('2002-12-16', 'YYYY-MM-DD'));
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(3, 'Варс Мискон Артурович', 'г.Томск, ул.Висконсона 228, кв. 323', '8(365)1256423', TO_DATE('1998-07-03', 'YYYY-MM-DD'));
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(4, 'Лихт Бисконт Армедович', 'г.Новосибирск, ул.Мясникова 228, кв. 323', '8125634635', TO_DATE('1965-03-25', 'YYYY-MM-DD'));
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(5, 'Джан Макс Вгорович', 'г.Москва, ул.Мясникова 228, кв. 323', '+7(095)7777761', TO_DATE('1978-03-25', 'YYYY-MM-DD'));
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(6, 'Рихбензонов Магомед Шизганоивоивич', 'г.Москва, ул.Арконикидзе 35, кв. 37', '+7(095)35363839', TO_DATE('1965-04-03', 'YYYY-MM-DD'));
INSERT INTO CLIMBERS(CLIMBER_ID, FULL_NAME, ADDRESS, PHONE, BIRTHDAY_DATE) VALUES(7, 'Васерман Максим Робинзонович', 'г.Волгоград ул.Лейтенанта Аскерова 27', '8(228)356578', TO_DATE('1965-12-17', 'YYYY-MM-DD'));

-- Заполнение для Восхождений
INSERT INTO CLIMBING(CLIMBING_ID, START_DATE, FINISH_DATE, PEAK_ID) VALUES(1, TO_DATE('2019-01-17', 'YYYY-MM-DD'), TO_DATE('2019-01-25', 'YYYY-MM-DD'), 1);
INSERT INTO CLIMBING(CLIMBING_ID, START_DATE, FINISH_DATE, PEAK_ID) VALUES(2, TO_DATE('2019-06-08', 'YYYY-MM-DD'), TO_DATE('2019-06-15', 'YYYY-MM-DD'), 2);
INSERT INTO CLIMBING(CLIMBING_ID, START_DATE, FINISH_DATE, PEAK_ID) VALUES(3, TO_DATE('2019-06-09', 'YYYY-MM-DD'), TO_DATE('2019-06-15', 'YYYY-MM-DD'), 2);
INSERT INTO CLIMBING(CLIMBING_ID, START_DATE, FINISH_DATE, PEAK_ID) VALUES(4, TO_DATE('2019-08-09', 'YYYY-MM-DD'), TO_DATE('2019-09-27', 'YYYY-MM-DD'), 4);
INSERT INTO CLIMBING(CLIMBING_ID, START_DATE, FINISH_DATE, PEAK_ID) VALUES(5, TO_DATE('2016-03-07', 'YYYY-MM-DD'), TO_DATE('2016-04-03', 'YYYY-MM-DD'), 5);

-- Заполнение для Альпинист-Восхождение
INSERT INTO CLIMBER_CLIMBING(CLIMBER_ID, CLIMBING_ID) VALUES(1, 1);
INSERT INTO CLIMBER_CLIMBING(CLIMBER_ID, CLIMBING_ID) VALUES(2, 1);
INSERT INTO CLIMBER_CLIMBING(CLIMBER_ID, CLIMBING_ID) VALUES(3, 2);
INSERT INTO CLIMBER_CLIMBING(CLIMBER_ID, CLIMBING_ID) VALUES(4, 4);
INSERT INTO CLIMBER_CLIMBING(CLIMBER_ID, CLIMBING_ID) VALUES(5, 1);
INSERT INTO CLIMBER_CLIMBING(CLIMBER_ID, CLIMBING_ID) VALUES(7, 5);

-- 3. Написать запросы. Устранить дублирование только для тех случаев, где это потенциально возможно.
-- 3.1. Вывести все вершины в Италии, которые выше 500 метров. Результат упорядочить по высоте.
SELECT 
	NAME AS "Название", HEIGHT AS "Высота", COUNTRY AS "Страна", REGION AS "Регион" 
FROM PEAKS 
	WHERE LOWER(COUNTRY) LIKE '%италия%' AND HEIGHT > 500;

-- 3.2. Для каждого альпиниста вывести список покорённых вершин, 
-- восхождения на которое длилось не больше месяца. В выборке 
-- присутствовать только следующие поля: имя альпиниста, название
-- вершины, длительность восхождения. Результат упорядочить по ФИО.
SELECT 
	CLIMBERS.FULL_NAME AS "Имя альпиниста",
	PEAKS.NAME AS "Название вершины",
	CLIMBING.FINISH_DATE - CLIMBING.START_DATE AS "Длительность восхождения в днях"
FROM 
	CLIMBERS 
	INNER JOIN CLIMBER_CLIMBING 
		ON CLIMBERS.CLIMBER_ID = CLIMBER_CLIMBING.CLIMBER_ID
	INNER JOIN CLIMBING 
		ON CLIMBER_CLIMBING.CLIMBING_ID = CLIMBING.CLIMBING_ID
	INNER JOIN PEAKS
		ON CLIMBING.PEAK_ID = PEAKS.PEAK_ID
WHERE MONTHS_BETWEEN(CLIMBING.FINISH_DATE, CLIMBING.START_DATE) <= 1 
ORDER BY FULL_NAME;

-- 3.3. Сформировать статистику восхождений по сезонам. В выборке должны присутствовать 
-- следующие поля: название сезона (лето, зима и т.д.) и число восхождений.
SELECT 
	CASE
		WHEN EXTRACT(MONTH FROM START_DATE) IN (12, 1, 2) THEN 'Зима'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (3, 4, 5) THEN 'Весна'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (6, 7, 8) THEN 'Лето'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (9, 10, 11) THEN 'Осень'
	END AS "Название сезона",
	COUNT(CLIMBING_ID) AS "Число восхождений"
FROM CLIMBING 
GROUP BY 
	CASE
		WHEN EXTRACT(MONTH FROM START_DATE) IN (12, 1, 2) THEN 'Зима'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (3, 4, 5) THEN 'Весна'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (6, 7, 8) THEN 'Лето'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (9, 10, 11) THEN 'Осень'
	END;

-- 3.4. Для каждой вершины найти общее число восхождений, средний возраст альпинистов, учавствоваших 
-- в восхождениях на эту вершину. Исключить из выборки горы расположенные в Англии.
SELECT 
	COUNT(CLIMBING.CLIMBING_ID) AS "Общее число восхождений",
	ROUND(AVG(MONTHS_BETWEEN(SYSDATE, CLIMBERS.BIRTHDAY_DATE) / 12)) AS "Средний возраст альпинистов",
	PEAKS.NAME AS "Название вершины",
	PEAKS.COUNTRY AS "Страна"
FROM CLIMBERS 
	INNER JOIN CLIMBER_CLIMBING 
		ON CLIMBERS.CLIMBER_ID = CLIMBER_CLIMBING.CLIMBER_ID
	INNER JOIN CLIMBING
		ON CLIMBER_CLIMBING.CLIMBING_ID = CLIMBING.CLIMBING_ID
	INNER JOIN PEAKS
		ON CLIMBING.PEAK_ID = PEAKS.PEAK_ID
	WHERE LOWER(PEAKS.COUNTRY) NOT LIKE '%англия%'
GROUP BY PEAKS.NAME, PEAKS.COUNTRY;

-- 3.5. Вывести вершины, высота которых больше средней по региону.
SELECT
	P.NAME AS "Название вершины",
	P.HEIGHT AS "Высота",
	P.COUNTRY AS "Страна",
	P.REGION AS "Регион"
	FROM PEAKS P
WHERE P.HEIGHT > (SELECT AVG(HEIGHT) FROM PEAKS GROUP BY REGION HAVING P.REGION = REGION);

-- 3.6. Для каждого альпиниста вывести число вершин, 
-- на которые кроме него никто не совершал восхождения.
WITH STATISCTICS AS
(
	SELECT
		PEAKS.PEAK_ID AS ID
	FROM
		CLIMBERS
		INNER JOIN CLIMBER_CLIMBING
			ON CLIMBERS.CLIMBER_ID = CLIMBER_CLIMBING.CLIMBER_ID
		INNER JOIN CLIMBING
			ON CLIMBER_CLIMBING.CLIMBING_ID = CLIMBING.CLIMBING_ID
		INNER JOIN PEAKS
			ON CLIMBING.PEAK_ID = PEAKS.PEAK_ID
	GROUP BY PEAKS.PEAK_ID HAVING COUNT(*) = 1
)
SELECT
	FIO AS "ФИО",
	COUNT(*) AS "Число вершин"
FROM
(
	SELECT
		CLIMBERS.FULL_NAME AS FIO
	FROM
		CLIMBERS
			INNER JOIN CLIMBER_CLIMBING
				ON CLIMBERS.CLIMBER_ID = CLIMBER_CLIMBING.CLIMBER_ID
			INNER JOIN CLIMBING
				ON CLIMBER_CLIMBING.CLIMBING_ID = CLIMBING.CLIMBING_ID
			INNER JOIN PEAKS
				ON CLIMBING.PEAK_ID = PEAKS.PEAK_ID
	WHERE PEAKS.PEAK_ID IN (SELECT ID FROM STATISCTICS)
)
GROUP BY FIO;

-- 4. Написать запросы на изменение данных.
-- 4.1. Изменить код города в номерах телефонов альпинистов из Москвы с (095)
-- на (495), если кода города нет, то добавить код Томска (3822). Кроме
-- этого во всех телефонах добавить международный код России "+7".
SELECT * FROM CLIMBERS;

UPDATE CLIMBERS SET PHONE = 
	CASE
		WHEN PHONE LIKE '%(095)%' THEN '+7' || '(495)' || SUBSTR(PHONE, INSTR(PHONE, '(095)') + 5)
		WHEN PHONE LIKE '%(%)%' THEN '+7' || SUBSTR(PHONE, INSTR(PHONE, '('))
		WHEN (PHONE NOT LIKE '%(%)%' AND PHONE LIKE '8%') THEN '+7(3822)' || SUBSTR(PHONE, 2) -- можно и без PHONE LIKE '8%' ??? Какие ограничения
		WHEN PHONE LIKE '8(%)%' THEN '+7' || SUBSTR(PHONE, 2)
	ELSE PHONE
	END;

SELECT * FROM CLIMBERS;
-- 4.2. Удалить сведения об альпинистах, не совершивших ни одного восхождения.
DELETE FROM CLIMBERS 
	WHERE NOT EXISTS 
	(
		SELECT * FROM CLIMBER_CLIMBING WHERE CLIMBER_CLIMBING.CLIMBER_ID = CLIMBERS.CLIMBER_ID);
	);

-- 5. Создать представления.
-- 5.1. Оформить запросы 3-4 в виде представления.
CREATE OR REPLACE VIEW PEAKS_CLIMBING_INFORMATION AS
	SELECT 
	CASE
		WHEN EXTRACT(MONTH FROM START_DATE) IN (12, 1, 2) THEN 'Зима'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (3, 4, 5) THEN 'Весна'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (6, 7, 8) THEN 'Лето'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (9, 10, 11) THEN 'Осень'
	END AS "Название сезона",
	COUNT(CLIMBING_ID) AS "Число восхождений"
FROM CLIMBING 
GROUP BY 
	CASE
		WHEN EXTRACT(MONTH FROM START_DATE) IN (12, 1, 2) THEN 'Зима'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (3, 4, 5) THEN 'Весна'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (6, 7, 8) THEN 'Лето'
		WHEN EXTRACT(MONTH FROM START_DATE) IN (9, 10, 11) THEN 'Осень'
	END;

CREATE OR REPLACE VIEW PEAKS_CLIMBERS_INFORMATION AS
	SELECT 
	COUNT(CLIMBING.CLIMBING_ID) AS "Общее число восхождений",
	ROUND(AVG(MONTHS_BETWEEN(SYSDATE, CLIMBERS.BIRTHDAY_DATE) / 12)) AS "Средний возраст альпинистов",
	PEAKS.NAME AS "Название вершины",
	PEAKS.COUNTRY AS "Страна"
FROM CLIMBERS 
	INNER JOIN CLIMBER_CLIMBING 
		ON CLIMBERS.CLIMBER_ID = CLIMBER_CLIMBING.CLIMBER_ID
	INNER JOIN CLIMBING
		ON CLIMBER_CLIMBING.CLIMBING_ID = CLIMBING.CLIMBING_ID
	INNER JOIN PEAKS
		ON CLIMBING.PEAK_ID = PEAKS.PEAK_ID
	WHERE LOWER(PEAKS.COUNTRY) NOT LIKE '%англия%'
GROUP BY PEAKS.NAME, PEAKS.COUNTRY;

-- 5.2. Создать представление со следующими полями: ID_Альпиниста, ФИО, телефон, 
-- дата начала восхождения (без времени), длительность восхождения в днях 
-- (если восхождение не закончено вывести число, прошедших с начала дней), 
-- название вершины, высота, страна.
CREATE OR REPLACE VIEW CLIMBERS_CLIMBING_INFORMATION AS -- В условиях ограничений сказано, что NULL все поля кроме адреса
	SELECT 
		CLIMBERS.CLIMBER_ID AS "ID_Альпиниста",
		CLIMBERS.FULL_NAME AS "ФИО",
		CLIMBERS.PHONE AS "Телефон",
		CLIMBING.START_DATE AS "Дата начала восхождения",
		CASE 
			WHEN CLIMBING.FINISH_DATE IS NOT NULL THEN CLIMBING.FINISH_DATE - CLIMBING.START_DATE
			ELSE ROUND(CURRENT_DATE - CLIMBING.START_DATE) -- Для выполнения этого кейса требуется убрать NULL в CLIMBING.FINISH_DATE
		END AS "Длительность восхождения в днях",
		PEAKS.NAME AS "Название вершины",
		PEAKS.HEIGHT AS "Высота",
		PEAKS.COUNTRY AS "Страна"
	FROM 
		CLIMBERS 
		LEFT JOIN CLIMBER_CLIMBING
			ON CLIMBERS.CLIMBER_ID = CLIMBER_CLIMBING.CLIMBER_ID
		LEFT JOIN CLIMBING
			ON CLIMBER_CLIMBING.CLIMBING_ID = CLIMBING.CLIMBING_ID
		LEFT JOIN PEAKS
			ON CLIMBING.PEAK_ID = PEAKS.PEAK_ID 
	ORDER BY CLIMBERS.CLIMBER_ID;