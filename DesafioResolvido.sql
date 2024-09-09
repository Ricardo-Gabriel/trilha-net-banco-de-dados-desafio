
-- Analisando as tabelas
--select * from Atores
--select * from ElencoFilme
--select * from Filmes
--select * from FilmesGenero
--select * from Generos


--1 - Buscar o nome e ano dos filmes

SELECT 
	Nome,
	Ano
FROM Filmes


--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT 
	Nome,
	Ano
FROM Filmes
ORDER BY Ano ASC


--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o

SELECT 
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Nome = 'De Volta para o Futuro'



-- 4 - Buscar os filmes lan�ados em 1997

SELECT 
	*
FROM Filmes
WHERE Ano = 1997


--5 - Buscar os filmes lan�ados AP�S o ano 2000

SELECT 
	*
FROM Filmes
WHERE Ano >= 2000

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

SELECT
	*
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao ASC


--7 - Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente


SELECT 
	Ano , 
	 COUNT(Nome) as Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC


--8 - Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome
--OBS: Apesar do enunciado pedir apenas o Primeiro e ultimo nome, a imagem do desasafio mostra todos os campos , por isso utilizei o * 

SELECT 
	*
FROM Atores
WHERE Genero = 'M'


--9 - Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
--OBS: Apesar do enunciado pedir apenas o Primeiro e ultimo nome, a imagem do desasafio mostra todos os campos , por isso utilizei o * 

SELECT 
	*
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome


--10 - Buscar o nome do filme e o g�nero

SELECT 
	F.Nome as Nome,
	G.Genero as Genero
FROM FilmesGenero Fg
Inner join Filmes F
ON Fg.IdFilme = F.Id
Inner Join Generos G
ON Fg.IdGenero = G.Id


--11 - Buscar o nome do filme e o g�nero do tipo "Mist�rio"

SELECT 
	F.Nome as Nome,
	G.Genero as Genero
FROM FilmesGenero Fg
Inner join Filmes F
ON Fg.IdFilme = F.Id
Inner Join Generos G
ON Fg.IdGenero = G.Id
WHERE G.Genero = 'Mist�rio'


--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT 
	F.Nome,
	A.PrimeiroNome,
	A.UltimoNome,
	E.Papel
FROM Filmes F
INNER JOIN ElencoFilme E
ON F.Id = E.IdFilme
INNER JOIN Atores A
ON E.IdAtor = A.Id