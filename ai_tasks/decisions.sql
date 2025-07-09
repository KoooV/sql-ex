-- Блок 1: простые запросы

-- 1 задание
SELECT name FROM employees

-- 2 задание
SELECT name, salary FROME employees
WHERE salary > 50000

-- 3 задание
SELECT * FROM employees e
WHERE departament_id = 2

-- 4 задание
SELECT * FROM employees e
ORDER BY salary DESC

-- 5 задание
SELECT * FROM employees 
LIMIT 3

-- Блок 2: Агрегаты и группировка



