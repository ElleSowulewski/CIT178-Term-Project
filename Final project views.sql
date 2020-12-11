/* Final Project Views 

--UPDATABLE VIEW--

USE Restaurants;
GO
CREATE VIEW Inventory_view
AS
SELECT RestaurantID, StockSourceID, StockLow
FROM RestaurantInventory
GO

UPDATE Inventory_View
SET StockLow = 'No'
WHERE RestaurantID = 2;

SELECT * FROM Inventory_View;

--------------------------------------

CREATE VIEW Manager_Limited_View
AS
SELECT ManagerID, ContactNumber, Manager#, LocationID
FROM Managers
JOIN RestaurantInfo ON Managers.ContactNumber = RestaurantInfo.Manager#
WITH CHECK OPTION;
GO

SELECT * FROM Manager_Limited_View;

---------------------------------------

CREATE VIEW RestaurantInfo_View
AS
SELECT LocationID, EstimatedProfit, Location.ID, City
FROM RestaurantInfo
JOIN Location ON RestaurantInfo.LocationID = Location.ID
GO

SELECT * FROM RestaurantInfo_View;

---------------------------------------

CREATE VIEW Delivery_View
AS
SELECT Delivery.DriverID, Name, StockSourceID, DeliveryDate
FROM Delivery
JOIN RestaurantInventory ON Delivery.DriverID = RestaurantInventory.DriverID
GO

SELECT * FROM Delivery_View;*/