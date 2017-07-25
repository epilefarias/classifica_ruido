function [acc,tempo] = class_knn

%programa pra montar modelos de áudios usando knn 

%começa a contar o tempo de execução
t_knn = tic;

% lê o dataset
cd .\csvs\

dataset = csvread('dataset.csv');

cd ..

%cria vetor de classes de cada frame usando a matriz 'dataset'
classes = zeros(length(dataset),1);

length(dataset)

for i = 1:length(dataset)
    classes(i) = floor(i/(length(dataset)/15));
end
    

% seleciona aleatoriamente partes de treino e teste dos dados usando função crossvalind
[train, test] = crossvalind('holdOut',classes,0.25);

% cria matriz 'dados' com os coeficientes usados como entrada do classificador (apenas os 2 primeiros, inicialmente)
dados = [ dataset(:,1), dataset(:,2)];


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


%classifica os dados de teste utilizando um classificador KNN (apenas 1 vizinho)
c = knnclassify(dtest, dtrain, dtrain(:,3));

% verifica o desempenho do classificador
cp = classperf(dtest(:,3));
classperf(cp,c);

%imprime o resultado da classificação (acertos/total)
acc = cp.CorrectRate;

tempo = toc(t_knn);

end