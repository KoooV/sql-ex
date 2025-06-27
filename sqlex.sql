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
