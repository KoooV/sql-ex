-- 1 задание
SELECT model,speed,hd FROM PC 
WHERE price < 500

-- 2 задание
SELECT DISTINCT maker FROM Product
WHERE type = 'Printer'

-- 3 задание
SELECT l.model, l.ram, l.screen FROM Laptop l
WHERE price > 1000

-- 4 задание
SELECT * FROM Printer
WHERE color = 'y'

-- 5 задание
SELECT p.model, p.speed, p.hd FROM PC p
WHERE (cd = '12x' OR cd = '24x') AND price < 600

-- 6 задание
SELECT DISTINCT p.maker, l.speed
FROM Product p
JOIN Laptop l ON l.model = p.model
WHERE l.hd >= 10

-- 7 задание
SELECT DISTINCT pr.model, pc.price FROM Product pr
JOIN PC pc ON pc.model = pr.model AND pr.maker = 'B'

UNION

SELECT DISTINCT pr.model, l.price FROM Product pr
JOIN Laptop l ON l.model = pr.model AND pr.maker = 'B'

UNION

SELECT DISTINCT pr.model, p.price FROM Product pr
JOIN Printer p ON p.model = pr.model AND pr.maker = 'B'

-- 8 задание
SELECT DISTINCT p.maker
FROM Product p
WHERE p.type = 'PC' AND p.maker NOT IN(
	SELECT p.maker FROM Product p
	WHERE p.type = 'Laptop')
	
-- 9 задание
SELECT DISTINCT pr.maker FROM Product pr
JOIN PC p ON p.speed >= 450 AND p.model = pr.model

-- 10 задание
SELECT p.model, p.price FROM Printer p
WHERE p.price = (SELECT MAX(p.price) FROM Printer p)

-- 11 задания
SELECT AVG(p.speed) FROM PC p

-- 12 задания
SELECT AVG(p.speed) FROM Laptop p
WHERE p.price > 1000

-- 13 задание
SELECT DISTINCT AVG(p.speed) FROM PC p
JOIN Product pr ON pr.maker = 'A' AND pr.model = p.model

-- 14 задание
SELECT s.class, s.name, c.country FROM Ships s
JOIN Classes c ON c.class = s.class AND c.numGuns >= 10

--15 задание
SELECT p.hd
FROM PC p
GROUP BY p.hd
HAVING COUNT(*) >= 2

-- 16 задание
SELECT DISTINCT a.model, b.model, a.speed, a.ram
FROM PC a, PC b
WHERE a.model > b.model AND a.ram = b.ram AND a.speed = b.speed

--17 задание
SELECT DISTINCT pr.type, l.model, l.speed
FROM Product pr, Laptop l
WHERE l.speed < ALL(
	SELECT p.speed FROM PC p
	JOIN Product prod ON p.model = prod.model
) AND pr.type = 'Laptop'

--18 задание
SELECT DISTINCT pr.maker, p.price
FROM Product pr
JOIN Printer p ON pr.model = p.model
WHERE p.price <= (SELECT MIN(print.price) FROM Printer print
WHERE print.color = 'y') AND p.color = 'y'

-- 19 задание
SELECT pr.maker, AVG(l.screen) AS average FROM Product pr
JOIN Laptop l ON pr.model = l.model
GROUP BY pr.maker

-- 20 задание
SELECT DISTINCT pr.maker, COUNT(pr.model) FROM Product pr
WHERE pr.type = 'PC'
GROUP BY pr.maker
HAVING COUNT(pr.model) >=3

-- 21 задание
SELECT DISTINCT pr.maker, MAX(p.price) AS max_price FROM Product pr
JOIN PC p ON pr.model = p.model
GROUP BY pr.maker

-- 22 задание
SELECT DiSTINCT p.speed, AVG(p.price) FROM PC p
WHERE p.speed > 600
GROUP BY p.speed

-- 23 задание
SELECT DISTINCT pr.maker FROM Product pr
WHERE pr.type = 'PC' AND pr.model IN (SELECT p.model FROM PC p WHERE p.speed >= 750)

INTERSECT
	
SELECT DISTINCT pr.maker FROM Product pr
WHERE pr.type = 'Laptop' AND pr.model IN (SELECT l.model FROM Laptop l WHERE l.speed >= 750)

-- 24 задание
WITH maximum AS(
	SELECT model, price FROM PC
	WHERE price = (SELECT MAX(price) FROM PC)
	
	UNION
	
	SELECT model, price FROM Laptop
	WHERE price = (SELECT MAX(price) FROM Laptop)
	
	UNION
	
	SELECT model, price FROM Printer
	WHERE price = (SELECT MAX(price) FROM Printer)
)
SELECT model FROM maximum
WHERE price = (SELECT MAX(price) FROM maximum)

-- 25 задание
SELECT DISTINCT pr.maker FROM Product pr
WHERE pr.type = 'Printer' AND pr.maker IN (
	SELECT prod.maker FROM Product prod
	JOIN PC pc ON pc.model = prod.model
	WHERE pc.ra m = (SELECT MIN(ram) FROM PC) 
		AND pc.speed = (SELECT MAX(speed) FROM PC
		WHERE pc.ram = (SELECT MIN(ram) FROM PC))
	)

-- 26 задание
WITH average AS(
	SELECT price FROM PC 
	WHERE model IN (SELECT model FROM Product WHERE type = 'PC' AND maker = 'A')

	UNION ALL
	
	SELECT price FROM Laptop
	WHERE model IN (SELECT model FROM Product WHERE type = 'Laptop' AND maker = 'A'))
SELECT AVG(price) AS avg_price FROM average

-- 27 задание
WITH makers AS(
	SELECT maker FROM Product
	WHERE type = 'Printer'
	
	INTERSECT
	
	SELECT maker FROM Product
	WHERE type = 'PC')
SELECT maker, AVG(hd) AS avg_hd FROM PC pc
JOIN Product pr ON pr.model = pc.model
WHERE pr.maker IN (SELECT maker FROM makers)
GROUP BY pr.maker

-- 28 задание
WITH all_data AS(
	SELECT COUNT(*) AS all_data FROM Product
	GROUP BY maker
	HAVING COUNT(model) = 1
)
SELECT COUNT(all_data) AS qty FROM all_data

-- 29 задание
SELECT i.point, i.date, i.inc, o.out FROM Income_o i
LEFT JOIN Outcome_o o ON i.date = o.date AND i.point = o.point

UNION

SELECT o.point, o.date, i.inc, o.out FROM Outcome_o o
LEFT JOIN Income_o i ON i.date = o.date AND i.point = o.point

-- 30 задание
WITH inc_sum AS (
    SELECT point, date, SUM(inc) AS total_inc
    FROM Income
    GROUP BY point, date
),
out_sum AS (
    SELECT point, date, SUM(out) AS total_out
    FROM Outcome
    GROUP BY point, date
)
SELECT 
    COALESCE(i.point, o.point) AS point,
    COALESCE(i.date, o.date) AS date,
    o.total_out AS out,
    i.total_inc AS inc
FROM inc_sum i
FULL OUTER JOIN out_sum o
    ON i.point = o.point AND i.date = o.date
ORDER BY point, date;


























	

