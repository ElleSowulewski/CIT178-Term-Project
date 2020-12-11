/* ----SUM----
SUM OF ALL RECORDED CUSTOMERS

USE Restaurants;
SELECT SUM(RecordedEmployees) AS 'All Employees'
FROM RestaurantInfo;


----AVG----
ESTIMATED AVERAGE PROFIT

SELECT AVG(EstimatedProfit) AS 'Estimated Average Profit'
FROM RestaurantInfo;


----Min/Max----
LARGEST AND SMALLEST BILL 

SELECT MIN(MonthlyBillAmount) AS [Smallest Monthly Bill], MAX(MonthlyBillAmount) AS [Largest Monthly Bill]
FROM RestaurantInfo;


----COUNT----
COUNT OF MANAGERS

SELECT COUNT(ManagerID) AS [Number of Managers]
FROM Managers;

SELECT * FROM Managers;*/