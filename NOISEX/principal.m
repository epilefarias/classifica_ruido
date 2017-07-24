%
%   programa que vai chamar todos os classificadores e compara-los
%
%
%

%limpa memoria e variaveis
clear all; close all; clc


% 1 - criar arquivos .mat com os audios

%para linux
if isunix
    cd ./csvs
end
%para windows
if ispc
    cd .\csvs
end

%verifica se existe. se nao, cria
if (exist('babble.mat','file') == 2)&&(exist('buccaneer1.mat','file') == 2)&&(exist('buccaneer2.mat','file') == 2)&&(exist('destroyerengine.mat','file') == 2)&&(exist('destroyerops.mat','file') == 2)&&(exist('f16.mat','file') == 2)&&(exist('factory1.mat','file') == 2)&&(exist('factory2.mat','file') == 2)&&(exist('hfchannel.mat','file') == 2)&&(exist('leopard.mat','file') == 2)&&(exist('m109.mat','file') == 2)&&(exist('machinegun.mat','file') == 2)&&(exist('pink.mat','file') == 2)&&(exist('volvo.mat','file') == 2)&&(exist('white.mat','file') == 2)
    fprintf('já há arquivos .mat com os coeficientes mel-cepstrais \n');
    cd ..
else
    fprintf('criando arquivos .mat com os coeficientes mel-cepstrais \n');
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
if (exist('dataset.mat','file') == 2)&&(exist('target.mat','file') == 2)
    fprintf('já há arquivos .mat com o dataset e target \n');
    cd ..
else
    fprintf('criando arquivos .mat com dataset e target \n');
    cd ..
    passo02_create_dataset
end


% 3 - classficadores

% aqui vão ser colocados os classificadores

fprintf('classificando os áudios segundo o knn \n');
[acc_knn,tempo_knn] = class_knn;

fprintf('acurácia é %2.2f e levou %2.2f segundos \n',acc_knn,tempo_knn);