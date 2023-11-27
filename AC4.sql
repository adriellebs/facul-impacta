USE Concessionaria

--select  * from VendasAnuais

------------------1---------------------------
SELECT COUNT(*) AS REGISTROS FROM VendasAnuais

------------------2---------------------------
SELECT SUM(QTD) AS TOTAL_VENDAS FROM VendasAnuais

------------------3---------------------------
SELECT MIN(QTD) AS MENOR_VENDA, 
	   AVG(QTD) AS MEDIA_VENDAS,
	   MAX(QTD) AS MAIOR_VENDA 
FROM VendasAnuais

---------------------4---------------------------
SELECT SUM(QTD) AS VENDAS_TOTAIS_ANUAL, ANO.descricao 
FROM VendasAnuais AS VENDAS
INNER JOIN ANO 
ON ANO.idAno = VENDAS.idAnodaVenda
GROUP BY ANO.descricao
ORDER BY ANO.descricao DESC 

---------------------5---------------------------
--SELECT TOP 1 * FROM Veiculo
--SELECT TOP 1  * FROM VendasAnuais
--SELECT TOP 1 * FROM Modelo

SELECT SUM(QTD) AS VENDAS_TOTAIS, 
	   Veiculo.descricao AS VEICULO,
	   Modelo.descricao AS MODELO 
FROM VendasAnuais AS VENDAS
INNER JOIN Veiculo 
ON VENDAS.idVeiculo = Veiculo.idVeiculo
INNER JOIN Modelo
ON Veiculo.idModelo = Modelo.idModelo 
WHERE Veiculo.descricao like 'CG 125' AND Modelo.descricao LIKE 'STD'
GROUP BY Veiculo.descricao, Modelo.descricao ; 


--OU 


SELECT SUM(QTD) AS VENDAS_CG125_STD
FROM VendasAnuais AS VENDAS
INNER JOIN Veiculo 
ON VENDAS.idVeiculo = Veiculo.idVeiculo
INNER JOIN Modelo
ON Veiculo.idModelo = Modelo.idModelo 
WHERE Veiculo.descricao like 'CG 125' AND Modelo.descricao LIKE 'STD'

---------------------6---------------------------
--SELECT TOP 1* FROM Veiculo
--SELECT TOP 1 * FROM Ano
--SELECT TOP 1 * FROM Modelo
--SELECT TOP 1 * FROM Fabricante

SELECT Fabricante.Nome AS FABRICANTE,
	   Veiculo.descricao AS VEICULO,
	   Modelo.descricao AS MODELO,
	   MIN(ANO.descricao) AS PRIMEIRO_ANO_FABRICACAO
FROM Ano 
INNER JOIN Veiculo
ON Ano.idAno = Veiculo.idAnoFabricacao
INNER JOIN Modelo
ON Veiculo.idModelo = Modelo.idModelo
INNER JOIN Fabricante
ON Veiculo.idFabricante = Fabricante.idFabricante
GROUP BY Fabricante.Nome,
	     Veiculo.descricao,
		 Modelo.descricao
ORDER BY FABRICANTE ASC,
		 PRIMEIRO_ANO_FABRICACAO DESC,
		 VEICULO ASC,
		 MODELO DESC;

---------------------7---------------------------
--SELECT TOP 0 * FROM VendasAnuais
--SELECT TOP 0 * FROM Mes
--SELECT  * FROM Ano 

SELECT MES.descricao AS MES,
	   MIN(QTD) AS MENOR_VENDA,
	   MAX(QTD) AS MAIOR_VENDA,
	   AVG(QTD) AS MEDIA_VENDAS,
	   SUM(QTD) AS SOMA_VENDAS
FROM VendasAnuais AS VENDAS
INNER JOIN Ano AS ANO 
ON VENDAS.idAnodaVenda = ANO.idAno
INNER JOIN Mes AS MES
ON VENDAS.idMesdaVenda = MES.idMes
WHERE ANO.descricao LIKE '2020' 
GROUP BY MES.descricao
ORDER BY MES ASC

---------------------8---------------------------
SELECT MES.descricao AS MES,
	   AVG(QTD) AS MEDIA_VENDAS
FROM VendasAnuais AS VENDAS
INNER JOIN Ano AS ANO 
ON VENDAS.idAnodaVenda = ANO.idAno
INNER JOIN Mes AS MES
ON VENDAS.idMesdaVenda = MES.idMes
WHERE ANO.descricao LIKE '2020' 
GROUP BY MES.descricao
HAVING AVG(QTD) > 500
ORDER BY MES ASC