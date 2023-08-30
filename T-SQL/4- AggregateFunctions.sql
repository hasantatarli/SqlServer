--SUM(): Bir sütundaki değerlerin toplamını hesaplar.

--SELECT SUM(StandardCost) AS TotalCost 
--FROM [Production].[Product];


--AVG(): Bir sütundaki değerlerin ortalamasını hesaplar.

--SELECT AVG(DATEDIFF(YEAR,BirthDate,GETDATE())) AS AverageAge 
--FROM HumanResources.Employee;


--COUNT(): Bir sütundaki değerlerin sayısını hesaplar.

--SELECT COUNT(*) AS TotalCustomers 
--FROM Sales.Customer;

--MIN(): Bir sütundaki en küçük değeri döndürür.

--SELECT MIN(ListPrice) AS LowestPrice 
--FROM Production.Product
--where ListPrice <> 0;

--MAX(): Bir sütundaki en büyük değeri döndürür.

--SELECT MAX(Quantity) AS HighestQuantity 
--FROM Production.ProductInventory;

--GROUP BY: Bu ifade, verileri belirli bir sütuna göre gruplamak ve daha sonra aggregate fonksiyonları ile gruplar üzerinde işlem yapmak için kullanılır.

SELECT Department, AVG(DATEDIFF(YEAR,StartDate,GETDATE())) AS AverageSalary
FROM [HumanResources].[vEmployeeDepartment]
GROUP BY Department;