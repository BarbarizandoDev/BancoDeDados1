-- crie um script com consultas que retornem :

-- 01) Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.

select * , avg(valor) over () as mediaConsultas
from consultas
where year (dataConsulta) = 2020;

select * from consultas;

-- 02) Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

select * , avg(dataAlta) over () as dataMaior
from internaçao
where year (dataAlta) > (dataPrevistaAlta);

select* from internaçao;

-- 03) Receituário completo da primeira consulta registrada com receituário associado.
select * , avg (data_hora) over() as PrimeiraReceira
 from receitas
 where year (idreceitas) = 1;
 
 -- 04)Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).

select * , max(valor) , min(valor)
from consultas;

select * from consultas;

-- 05)Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.

select * , datediff(internaçao.dataentrada , internaçao.dataAlta) as totaldias
from internaçao
join internaçao on idquarto = fkinternaçao_idquarto
group by idquarto;

-- 06)Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

select dataentrada, procedimento , fkquarto
from internaçao
where tipo = 'apartamento' ;

-- 07)Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.

select fkpacientes , dataConsulta , especialidade 
from consultas
where dataNascimento < '01-04-2005' and especialidades != 'pediatria' ;

-- 08) Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
select  fkpacientes , fkmedicos , dataentrada , procedimento as DadosMedicosEnferm
from internaçao
inner join quarto on idquarto = iquarto.idquarto
where especialidadade = 'gastroenterologia' and tipo = 'enfermaria';


-- 09) Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou

select nome , CRM , COUNT(fkconsultas_medicos) as NumeroConsultas
from medicos
join consultas on idmedicos = fkconsultas_medicos
group by idmedicos;

-- 10)  Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

select nome, CRE, COUNT(*) as numeroInternaçoes
FROM internaçao
inner join enfermeiro on fkinternaçao_enfermeiro = idenfermeiro
group by idenfermeiro
having COUNT(*) >1 ;

