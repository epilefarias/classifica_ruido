%###################################%
%									%
%	PREPARACAO DO DATASET E TARGET	%
%									%
%###################################%

% Limpa tela e memoria
%clear all, close all, clc;

% Carrega os coeficientes mel-cepstrais dos arquivos .csv para a memoria

%para linux
if isunix
    cd ./csvs
end
%para windows
if ispc
    cd .\csvs
end


c01 = csvread('babble.csv');
c02 = csvread('buccaneer1.csv');
c03 = csvread('buccaneer2.csv');
c04 = csvread('destroyerengine.csv');
c05 = csvread('destroyerops.csv');
c06 = csvread('f16.csv');
c07 = csvread('factory1.csv');
c08 = csvread('factory2.csv');
c09 = csvread('hfchannel.csv');
c10 = csvread('leopard.csv');
c11 = csvread('m109.csv');
c12 = csvread('machinegun.csv');
c13 = csvread('pink.csv');
c14 = csvread('volvo.csv');
c15 = csvread('white.csv');



%############################################################################

% Concatenando as matrizes dos coeficientes para formar o dataset de entrada da rede neural!
% A matriz 'dataset' possui 39 linhas por 275370 colunas.
% Cada coluna é uma 'amostra' para a rede neural, cada linha é um atributo a ser usado pela rede 
% para classificar os dados!
dataset = vertcat(c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,c13,c14,c15);

%############################################################################

% Matriz Alvo = ensina a rede neural a qual classe pertence cada amostra
target = zeros(15, 275370);

% Ajustando os campos da matriz alvo
%----------babble------------
for i=1:(1*18358)
	target(1,i) = 1;
end
%---------buccaneer1----------
for i=(1*18358+1):(2*18358)
	target(2,i) = 1;
end
%---------buccaneer2----------
for i=(2*18358+1):(3*18358)
	target(3,i) = 1;
end
%-------destroyerengine-------
for i=(3*18358+1):(4*18358)
	target(4,i) = 1;
end
%------destroyerops-----------
for i=(4*18358+1):(5*18358)
	target(5,i) = 1;
end
%------f16---------
for i=(5*18358+1):(6*18358)
	target(6,i) = 1;
end
%------factory1-------
for i=(6*18358+1):(7*18358)
	target(7,i) = 1;
end
%-----factory2-------
for i=(7*18358+1):(8*18358)
	target(8,i) = 1;
end
%-----hfchannel--------
for i=(8*18358+1):(9*18358)
	target(9,i) = 1;
end
%-----leopard--------
for i=(9*18358+1):(10*18358)
	target(10,i) = 1;
end
%----m109----------
for i=(10*18358+1):(11*18358)
	target(11,i) = 1;
end
%-----machinegun----
for i=(11*18358+1):(12*18358)
	target(12,i) = 1;
end
%------pink--------
for i=(12*18358+1):(13*18358)
	target(13,i) = 1;
end
%-----volvo----------
for i=(13*18358+1):(14*18358)
	target(14,i) = 1;
end
%------white------
for i=(14*18358+1):(15*18358)
	target(15,i) = 1;
end

% SALVA AS MATRIZES DATASET E TARGET EM ARQUIVOS .CSV
csvwrite('dataset.csv',dataset);
csvwrite('target.csv',target);

%############################################################################

cd ..