/*SELECT GETDATE() AS CurrentDateTime;
*/

--select CURRENT_TIMESTAMP as "Current_TimeStamp", SYSDATETIME() as "Sysdatetime", GETUTCDATE() as "getutcdate"


--SELECT DATEADD(DAY, 7, GETDATE()) AS OneWeekLater;


--DECLARE @StartDate DATETIME = '2023-08-01';
--DECLARE @EndDate DATETIME = '2023-08-15';
--SELECT DATEDIFF(DAY, @StartDate, @EndDate) AS DayDifference;




--SELECT CONVERT(VARCHAR, GETDATE(), 103) AS DateInBritishFormat;



--SELECT FORMAT(GETDATE(), 'dd/MM/yyyy') AS FormattedDate;

/*
SELECT YEAR(GETDATE()) AS CurrentYear,
       MONTH(GETDATE()) AS CurrentMonth,
       DAY(GETDATE()) AS CurrentDay;
	   */

	   /*
SELECT DATEPART(YEAR, GETDATE()) AS CurrentYear,
       DATEPART(MONTH, GETDATE()) AS CurrentMonth,
       DATEPART(DAY, GETDATE()) AS CurrentDay;*/


--SELECT EOMONTH(GETDATE()) AS LastDayOfMonth;



--SELECT DATEFROMPARTS(2023, 8, 29) AS CustomDate;

SELECT ISDATE('2023-05-12') AS "IsDate";



--ISDATE(): Fonksiyon içine girilen ifadenin geçerli bir tarih olup olmadığını kontrol eder. Girilen ifade geçerli bir tarih ise 1, geçerli bir tarih değilse 0 değerini döndürür. Temel kullanımı aşağıdaki gibidir.