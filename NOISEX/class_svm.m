%programa pra montar modelos de áudios usando knn 

% limpando tela e variáveis anteriores

clear all; clc;

% lendo as entradas (arquivos .csv de cada classe)

cd .\NOISEX

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
tam = ceil(length(babble)/100)-1;

for i = 1:tam
treino(i,:) = babble(100*i,:);
classes(i) = 0;
treino(i+tam,:) = buccaneer1(100*i,:);
classes(i+tam) = 1;
treino(i+2*tam,:) = buccaneer2(100*i,:);
classes(i+2*tam) = 2;
treino(i+3*tam,:) = destroyerengine(100*i,:);
classes(i+3*tam) = 3;
treino(i+4*tam,:) = destroyerops(100*i,:);
classes(i+4*tam) = 4;
treino(i+5*tam,:) = f16(100*i,:);
classes(i+5*tam) = 5;
treino(i+6*tam,:) = factory1(100*i,:);
classes(i+6*tam) = 6;
treino(i+7*tam,:) = factory2(100*i,:);
classes(i+7*tam) = 7;
treino(i+8*tam,:) = hfchannel(100*i,:);
classes(i+8*tam) = 8;
treino(i+9*tam,:) = leopard(100*i,:);
classes(i+9*tam) = 9;
treino(i+10*tam,:) = m109(100*i,:);
classes(i+10*tam) = 10;
treino(i+11*tam,:) = machinegun(100*i,:);
classes(i+11*tam) = 11;
treino(i+12*tam,:) = pink(100*i,:);
classes(i+12*tam) = 12;
treino(i+13*tam,:) = volvo(100*i,:);
classes(i+13*tam) = 13;
treino(i+14*tam,:) = white(100*i,:);
classes(i+14*tam) = 14;
end



dados = [ treino(:,1), treino(:,2)];
%dados = treino;

% Extract the Setosa class
%groups = ismember(species,'setosa');

% Randomly select training and test sets
[train, test] = crossvalind('holdOut',classes,0.25);
cp = classperf(classes);
% Use a linear support vector machine classifier
svmStruct = svmtrain(dados(train,:),classes(train),'showplot',true);
% Add a title to the plot
title(sprintf('Kernel Function: %s',...
func2str(svmStruct.KernelFunction)),...
'interpreter','none');
% Classify the test set using svmclassify
clas = svmclassify(svmStruct,dados(test,:),'showplot',true);
% See how well the classifier performed
classperf(cp,clas,test);
cp.CorrectRate