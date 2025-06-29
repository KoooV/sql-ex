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




	

