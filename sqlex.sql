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




