/* Final Project Procedures 
-- Retrieves and displays data
USE Restaurants;
GO
CREATE PROC spManagers
AS
SELECT * FROM Managers
ORDER BY ManagerID;
GO

EXEC spManagers;

-- Takes an input parameter*/
GO
CREATE PROC spGetDriver
	@DriverID int
AS
BEGIN
	SELECT * FROM Delivery
	WHERE DriverID = @DriverID;
END
GO
EXEC spGetDriver 2

/*-- Takes one input parameter and returns three output parameters
GO
CREATE PROC spRestaurantContact
	@ID int,
	@Phone# nvarchar(10) OUTPUT,
	@LocationID int OUTPUT,
	@Manager# int OUTPUT 
AS
SELECT @ID = ID, @Phone# = PhoneNumber, @LocationID = LocationID, @Manager# = Manager#
FROM RestaurantInfo 
WHERE ID = @ID;
GO

-- Run the procedure
DECLARE @Phone# nvarchar(10);
DECLARE @LocationID int;
DECLARE @Manager# int;
EXEC spRestaurantContact 1, @Phone# OUTPUT, @LocationID OUTPUT, @Manager# OUTPUT;
SELECT @Phone# AS 'Phone Number', @LocationID AS 'LocationID', @Manager# AS 'Manager Phone Number';

-- Stored procedure that has a return value 
GO
CREATE PROC spEmployeeCount
AS
DECLARE @EmployeeCount int;
SELECT @EmployeeCount = SUM(RecordedEmployees)
FROM RestaurantInfo 
RETURN @EmployeeCount;
GO

DECLARE @EmployeeCount int;
EXEC @EmployeeCount = spEmployeeCount;
PRINT 'There are ' + CONVERT(varchar, @EmployeeCount) + ' recorded employees working in our restaurant chain.';
GO*/


/* Final Project User Defined Functions 

-- creates the function
GO
CREATE FUNCTION fnGetID
    (@Location text = '%')
    RETURNS int
BEGIN
    RETURN (SELECT ID FROM Location WHERE City Like @Location);
END; 

-- uses the function
GO
SELECT ID, City FROM Location 
WHERE ID = dbo.fnGetID('Flint');

GO
CREATE FUNCTION fnLocation
	(@LocationID int = '%')
	RETURNS table
RETURN
	(SELECT * FROM RestaurantInfo WHERE LocationID LIKE @LocationID);
GO
SELECT * FROM dbo.fnLocation('1');*/


/*Final Project Triggers

 -- create archive table
 GO
 SELECT RestaurantID, StockSourceID, ReOrderDate INTO RestaurantStock
 FROM RestaurantInventory


 -- update table and add column for status
 ALTER TABLE RestaurantStock
 ADD Status varchar(50);
 GO

  -- create insert trigger
 CREATE TRIGGER RestaurantStock_INSERT ON RestaurantInventory
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @RestID int
	DECLARE @StockSource int
	DECLARE @ReOrderDate nchar(10)

    SELECT @RestID =INSERTED.RestaurantID, @StockSource = INSERTED.StockSourceID,
	@ReOrderDate = INSERTED.ReOrderDate
	FROM INSERTED

    INSERT INTO RestaurantStock VALUES(@RestID, @StockSource, @ReOrderDate, 'Inserted' )
END
GO

-- add row to test insert trigger
INSERT INTO RestaurantInfo VALUES(0, 1, '2345666676', 23, 6, 12345, 1234, 'no', NULL);
INSERT INTO RestaurantInventory VALUES(0, 1323, 'yes', '12/8/2020', '12/12/2020', 3);
GO
-- view data
SELECT * FROM RestaurantInfo;
GO

-- create delete trigger
 CREATE TRIGGER RestaurantStock_DELETE ON RestaurantInventory
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @RestID int
	DECLARE @StockSource int
	DECLARE @ReOrderDate nchar(10)

    SELECT @RestID = DELETED.RestaurantID, @StockSource = DELETED.StockSourceID,
	@ReOrderDate = DELETED.ReOrderDate
	FROM DELETED

    INSERT INTO RestaurantStock VALUES(@RestID, @StockSource, @ReOrderDate, 'Deleted')
END
GO

-- delete row to test delete trigger
DELETE FROM RestaurantStock WHERE RestaurantID = 0;
GO

-- view data
SELECT * FROM RestaurantStock;
GO

 -- create update trigger
 CREATE TRIGGER RestaurantStock_Update ON RestaurantInventory
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @RestID int
	DECLARE @StockSource int
	DECLARE @ReOrderDate nchar(10)

    SELECT @RestID = INSERTED.RestaurantID, @StockSource = INSERTED.StockSourceID,
	@ReOrderDate = INSERTED.ReOrderDate
	FROM INSERTED

    INSERT INTO RestaurantStock VALUES(@RestID, @StockSource, @ReOrderDate, 'Updated' )
END
GO*/




