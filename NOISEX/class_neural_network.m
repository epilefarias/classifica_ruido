%###########################################%
%											%
%	CRIACAO E TREINAMENTO DA REDE NEURAL	%
%											%
%###########################################%

% Limpa tela e memoria
clear all, close all, clc;

% Frequencia de amostragem dos audios da base de dados
fs=19980;

% Carrega os dados na memoria para execucao da classificacao

%para linux
if isunix
    cd ./csvs
end
%para windows
if ispc
    cd .\csvs
end

dataset = load('dataset.csv');
target = load('target.csv');

cd ..

% Criando e Treinando a Rede Neural
net = patternnet(40);
[net,tr] = train(net,dataset,target);
view(net)
testDataset = dataset(:,tr.testInd);
testTarget = target(:,tr.testInd);
testResults = net(testDataset);
testIndices = vec2ind(testResults);
plotconfusion(testTarget,testResults);
[c,cm] = confusion(testTarget,testResults);
fprintf('Porcentagem de Classificação  Correta  : %f%%\n', 100*(1-c));
fprintf('Porcentagem de Classificação Incorreta : %f%%\n', 100*c);
figure;
plotroc(testTarget,testResults);