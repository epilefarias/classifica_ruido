%
%   programa que vai chamar todos os classificadores e compara-los
%
%
%

%limpa memoria e variaveis
clear all; close all; clc


% 1 - criar arquivos .csv com os audios

%para linux
if isunix
    cd ./csvs
end
%para windows
if ispc
    cd .\csvs
end

%verifica se existe. se nao, cria
if (exist('babble.csv','file') == 2)&&(exist('buccaneer1.csv','file') == 2)&&(exist('buccaneer2.csv','file') == 2)&&(exist('destroyerengine.csv','file') == 2)&&(exist('destroyerops.csv','file') == 2)&&(exist('f16.csv','file') == 2)&&(exist('factory1.csv','file') == 2)&&(exist('factory2.csv','file') == 2)&&(exist('hfchannel.csv','file') == 2)&&(exist('leopard.csv','file') == 2)&&(exist('m109.csv','file') == 2)&&(exist('machinegun.csv','file') == 2)&&(exist('pink.csv','file') == 2)&&(exist('volvo.csv','file') == 2)&&(exist('white.csv','file') == 2)
    fprintf('j� h� arquivos .csv com os coeficientes mel-cepstrais \n');
    cd ..
else
    fprintf('criando arquivos .csv com os coeficientes mel-cepstrais \n');
    cd ..
    passo01_extract_mfcc
end



% 2 - criar dataset e target

%para linux
if isunix
    cd ./csvs
end
%para windows
if ispc
    cd .\csvs
end

%verifica se existe. se nao, cria
if (exist('dataset.csv','file') == 2)&&(exist('target.csv','file') == 2)
    fprintf('j� h� arquivos .csv com o dataset e target \n');
    cd ..
else
    fprintf('criando arquivos .csv com dataset e target \n');
    cd ..
    passo02_create_dataset
end


% 3 - classficadores

% aqui v�o ser colocados os classificadores

fprintf('classificando os �udios segundo o knn \n');
[acc,tempo,sens,spec,tb] = class_knn;

fprintf('acur�cia � %2.2f e levou %2.2f segundos \n',acc_knn,tempo_knn);