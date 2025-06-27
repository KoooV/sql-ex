-- 1 задание
SELECT model,speed,hd FROM PC 
WHERE price < 500;

-- 2 задание
SELECT DISTINCT maker FROM Product
WHERE type = 'Printer';

-- 3 задание
SELECT l.model, l.ram, l.screen FROM Laptop l
WHERE price > 1000;

-- 4 задание
SELECT * FROM Printer
WHERE color = 'y'; 

-- 5 задание
SELECT p.model, p.speed, p.hd FROM PC p
WHERE (cd = '12x' OR cd = '24x') AND price < 600

-- 6 задание
SELECT DISTINCT p.maker, l.speed
FROM Product p
JOIN Laptop l ON l.model = p.model
WHERE l.hd >= 10;

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
	WHERE p.type = 'Laptop');
