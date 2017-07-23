function [acc,tempo] = class_knn()

%programa pra montar modelos de �udios usando knn 

% limpando tela e vari�veis anteriores

%clear all; clc;

% lendo as entradas (arquivos .csv de cada classe)

t_knn = tic;

%{
cd .\csvs\

babble = csvread('babble.csv');
buccaneer1 = csvread('buccaneer1.csv');
buccaneer2 = csvread('buccaneer2.csv');
destroyerengine = csvread('destroyerengine.csv');
destroyerops = csvread('destroyerops.csv');
f16 = csvread('f16.csv');
factory1 = csvread('factory1.csv');
factory2 = csvread('factory2.csv');
hfchannel = csvread('hfchannel.csv');
leopard = csvread('leopard.csv');
m109 = csvread('m109.csv');
machinegun = csvread('machinegun.csv');
pink = csvread('pink.csv');
volvo = csvread('volvo.csv');
white = csvread('white.csv');

cd ..

% montando as classes

% Load the data and select features for classification
n = 10;
tam = ceil(length(babble)/n)-1;


% monta o vetor 'treino' com os coeficientes mel-cepstrais de todas as matrizes e suas classes
% correspondentes

for i = 1:tam
treino(i,:) = babble(n*i,:);
classes(i) = 0;
treino(i+tam,:) = buccaneer1(n*i,:);
classes(i+tam) = 1;
treino(i+2*tam,:) = buccaneer2(n*i,:);
classes(i+2*tam) = 2;
treino(i+3*tam,:) = destroyerengine(n*i,:);
classes(i+3*tam) = 3;
treino(i+4*tam,:) = destroyerops(n*i,:);
classes(i+4*tam) = 4;
treino(i+5*tam,:) = f16(n*i,:);
classes(i+5*tam) = 5;
treino(i+6*tam,:) = factory1(n*i,:);
classes(i+6*tam) = 6;
treino(i+7*tam,:) = factory2(n*i,:);
classes(i+7*tam) = 7;
treino(i+8*tam,:) = hfchannel(n*i,:);
classes(i+8*tam) = 8;
treino(i+9*tam,:) = leopard(n*i,:);
classes(i+9*tam) = 9;
treino(i+10*tam,:) = m109(n*i,:);
classes(i+10*tam) = 10;
treino(i+11*tam,:) = machinegun(n*i,:);
classes(i+11*tam) = 11;
treino(i+12*tam,:) = pink(n*i,:);
classes(i+12*tam) = 12;
treino(i+13*tam,:) = volvo(n*i,:);
classes(i+13*tam) = 13;
treino(i+14*tam,:) = white(n*i,:);
classes(i+14*tam) = 14;
end

%}

% seleciona aleatoriamente partes de treino e teste dos dados
[train, test] = crossvalind('holdOut',classes,0.25);



% cria matriz 'dados' com os coeficientes usados como entrada do classificador
dados = [ treino(:,1), treino(:,2)];


% incorpora as classes ao vetor de dados
for i = 1:length(dados)
dados(i,3) =  classes(i);
end

%cria as matrizes 'dtreino' e 'dtest' com os dados das amostras selecionadas como treino e de teste
j = 1; k = 1;
for i = 1:length(dados)
    if train(i,1) == 1
        dtrain(j,1) = dados(i,1);dtrain(j,2) = dados(i,2);dtrain(j,3) = dados(i,3); j = j+1;
    else
        dtest(k,1) = dados(i,1);dtest(k,2) = dados(i,2);dtest(k,3) = dados(i,3); k = k+1;
    end
end

%plota os dados de treino

gscatter(dtrain(:,1),dtrain(:,2),dtrain(:,3)); hold on;


%classifica os dados de teste utilizando um classificador KNN
c = knnclassify(dtest, dtrain, dtrain(:,3));

gscatter(dtest(:,1),dtest(:,2),c);

hold off

% verifica o desempenho do classificador
cp = classperf(dtest(:,3));
classperf(cp,c);

%imprime o resultado da classifica��o (acertos/total)
acc = cp.CorrectRate;

tempo = toc(t_knn);

end