* Primeiros comandos em SAS;

* carregando um dataset e incluindo uma nova variável;
data mycars;
	set sashelp.cars;
	media_mpg=mean(mpg_city, mpg_highway);
run;

* Selecionando algumas variáveis e fazendo filtro;
proc print data =  mycars;
	var make model type media_mpg;
	where media_mpg > 30;
run;

* Estatísticas com a procedure means;
title 'Média, valor mínimo e valor máximo de mpg_city';
proc means data=mycars mean min max std;
	var mpg_city;
	class type;
run;

* Informações sobre o dataset;
proc contents data = mycars;
run;

/* Em SAS os dados são organizados em bibliotecas.
   A biblioteca WORK é onde serão salvos os arquivos temporários. 
  
  Temos algumas bibliotecas criadas por padrão, como a WORK por exemplo. 
  Também podemos criar as nossas próprias bibliotecas e, para isso, precisamos
  definir o nome da biblioteca e o seu diretório conforme comandos abaixo. */
 
* Definindo uma biblioteca; 
LIBNAME cap01e02 "/folders/myshortcuts/AnaliseEstatisticaI/cap01_e_02";

* Salvando o dataset na biblioteca criada;
data cap01e02.mycars;
	set sashelp.cars;
	media_mpg = mean(mpg_city, mpg_highway);
run;