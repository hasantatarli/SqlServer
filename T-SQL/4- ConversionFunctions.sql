--CAST(): Bu fonksiyon, bir veri değerini belirtilen veri türüne dönüştürmek için kullanılır.
--SELECT CAST('123' AS INT) AS IntegerValue;



--CONVERT(): Bu fonksiyon, bir veri değerini belirtilen veri türüne veya belirli bir format biçimine dönüştürmek için kullanılır.

--SELECT CONVERT(INT, '456') AS IntegerValue,
--       CONVERT(VARCHAR, GETDATE(), 103) AS FormattedDate;

--TRY_CAST() ve TRY_CONVERT(): Bu fonksiyonlar, dönüşüm işleminin başarılı olup olmadığını kontrol eder. Eğer dönüşüm başarılı değilse, hata yerine NULL değeri döner.

--SELECT TRY_CAST('ABC' AS INT) AS CastResult,
--       TRY_CONVERT(DATE, '2023-08-29') AS ConvertResult;




--PARSE(): Bu fonksiyon, bir metin değerini belirli bir veri türüne dönüştürmek için kullanılır. SQL Server 2012 ve sonraki sürümlerde kullanılabilir.

--PARSE(): Bu fonksiyon, bir metin değerini belirli bir veri türüne dönüştürmek için kullanılır. SQL Server 2012 ve sonraki sürümlerde kullanılabilir.
--SELECT PARSE('2023-08-29' AS DATE) AS ParsedDate;


--FORMAT(): Bir veriyi belirli bir format biçimine dönüştürmek için kullanılır. Bu fonksiyon aslen formatlama amacıyla kullanılırken, belirli dönüşümler de gerçekleştirebilir.


--SELECT FORMAT(123.456, 'N2') AS FormattedNumber,
--       FORMAT(GETDATE(), 'dd/MM/yyyy') AS FormattedDate;


	   
	
--CONVERT_IMPLICIT(): SQL Server, bazı durumlarda otomatik olarak veri dönüşümleri yapabilir. Bu tür dönüşümlere "otomatik dönüşüm" veya "örtük dönüşüm" denir. Örneğin, bir tamsayı ve bir ondalık sayıyı toplarsanız, tamsayı otomatik olarak ondalık sayıya dönüştürülür.


SELECT 5 + 2.5 AS Result;
