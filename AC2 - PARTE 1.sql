use Concessionaria

insert Fabricante (nome, endereco, cidade, uf, telefone, contato) 
values
('Fiat', 'Avenida do Contorno, 3455', 'Betim', 'MG','08007071000', 'Herlander Zola'),
('GM', 'Avenida do Estado, 2880', 'São Caetano do Sul', 'SP', '1142347046','Monica Siqueira'),
('VW', 'Rua Vinte e Três de Maio, 5','São Bernardo do Campo', 'SP', '1132208531', 'Ailton Lima')

insert Modelo (descricao)
values
('Standard'),
('Premium'),
('Executive')

insert Ano (descricao)
values
(2025),
(2026),
(2027),
(2028),
(2029),
(2030),
(2031),
(2032)

insert Veiculo (descricao,valor,dataCompra,idModelo,idFabricante, idAnoFabricacao)
values
('Artic',35000,'2023-03-25',10, 10,12),
('Voltz',30000,'2022-07-31',12,11,14),
('Zeo',37500,'2023-02-27',11,12,15),
('Bjorn',28200,'2022-10-23', 11,11,15),
('Duntzen',50000,'2023-08-31', 10,10,13),
('Tungsten', 31800, '2023-02-24', 12,12,14)

insert VendasAnuais (qtd,idVeiculo,idAnodaVenda,idMesdaVenda)
values
(3,112,16,21), (3,112,16,15),(3,113,16,45),(3,113,16,18),
(3,114,16,30),(3,114,16,27),(3,115,16,33),(3,115,16,42),
(3,116,16,24),(3,116,16,48),(3,117,16,36),(3,117,16,39)

UPDATE	Veiculo 
SET		idAnoFabricacao = 13
WHERE descricao = 'Zeo' or descricao ='Bjorn'
UPDATE	Veiculo 
SET		idAnoFabricacao = 17
where idVeiculo IN ('112','113','116','117')

UPDATE VendasAnuais
SET idMesdaVenda=48, idAnodaVenda=17
WHERE idVeiculo=114 or idVeiculo=115
UPDATE VendasAnuais
SET idMesdaVenda=15, idAnodaVenda=18
WHERE idVeiculo=112 or idVeiculo=116
UPDATE VendasAnuais
SET idMesdaVenda=21, idAnodaVenda=19
WHERE idVeiculo=113 or idVeiculo=117

select * from Veiculo
select * from Modelo
select * from Fabricante
select * from VendasAnuais
select * from Ano
select * from Mes


