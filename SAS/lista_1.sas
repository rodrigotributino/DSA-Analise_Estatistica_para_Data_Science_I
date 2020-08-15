/* Lista de exercícios 1 

1 - Defina seu diretório de trabalho, onde estará o arquivo que vamos trabalhar.
2 - Carregue o dataset na área de trabalho do software.
3 - Calcule a média, mediana e moda do dataset.
4 - Calcule a temperatura (coluna temp) média por dia da semana (coluna weekday).
5 - Crie um histograma na coluna temp 

*/

* Exercício 1 ----------------------------------------------------- ;

* Criando uma biblioteca;
libname bib "/folders/myshortcuts/AnaliseEstatisticaI/cap01_e_02";

* diretório onde vamos importar o arquivo;
filename dfhours "/folders/myshortcuts/AnaliseEstatisticaI/cap01_e_02/hour.csv";

* Exercício 2 ----------------------------------------------------- ;

* Importando arquivo e salvando na biblioteca que criamos;
proc import
	datafile = dfhours
	out = bib.hours
	dbms = csv
	replace;
run; 

* Exercício 3 --------------------------------------------------------- ;

* Verificando o tipo das variáveis;
proc contents data = bib.hours;
run;

* Calculando medidas de tendência central;
proc means data = bib.hours mean median mode;
run;

* Exercício 4 --------------------------------------------------------- ;

title "Temperatura média por semana";
proc means data = bib.hours mean;
	var temp;
	class weekday;
run;

* Exercício 5 ---------------------------------------------------------- ;

title 'Distribuição de temperatura';
proc sgplot data = bib.hours;
  histogram temp;
  yaxis label = "Freq";
run;