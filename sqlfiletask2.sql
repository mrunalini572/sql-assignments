CREATE DATABASE IF NOT EXISTS CourierDB;
USE CourierDB;


-- ========================
-- TASK 2: SELECT + WHERE
-- ========================

-- 1. List all customers:
SELECT * FROM Users;

-- 2. List all orders for a specific customer:
SELECT * FROM Couriers WHERE SenderName = 'priya' OR ReceiverName = 'priya';

-- 3. List all couriers:
SELECT * FROM Couriers;

-- 4. List all packages for a specific order (by CourierID):
SELECT * FROM Couriers WHERE CourierID = 1;

-- 5. List all deliveries for a specific courier (by TrackingNumber):
SELECT * FROM Couriers WHERE TrackingNumber = 'TRK12345';

-- 6. List all undelivered packages:
SELECT * FROM Couriers WHERE Status != 'Delivered';

-- 7. List all packages scheduled for delivery today:
SELECT * FROM Couriers WHERE DeliveryDate = CURRENT_DATE;

-- 8. List all packages with a specific status:
SELECT * FROM Couriers WHERE Status = 'In Transit';

-- 9. Total number of packages for each sender:
SELECT SenderName, COUNT(*) AS TotalPackages FROM Couriers GROUP BY SenderName;

-- 10. Average delivery time per courier:
SELECT CourierID, DATEDIFF(DeliveryDate, PickupDate) AS DeliveryDays FROM Couriers;

-- 11. Packages with specific weight range:
SELECT * FROM Couriers WHERE Weight BETWEEN 2.0 AND 4.0;

-- 12. Employees with 'John' in their name:
SELECT * FROM Employees WHERE Name LIKE '%John%';

-- 13. Couriers with payments > $50:
SELECT c.* FROM Couriers c JOIN Payments p ON c.CourierID = p.CourierID WHERE p.Amount > 50;



