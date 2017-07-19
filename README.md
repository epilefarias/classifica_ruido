# classifica ruido

Programa pra classificar áudios segundo o tipo de ruído presente neles


## Base de dados

Noisex-92  **(na pasta)**

## Tarefa

Classificação

## Métodos utilizados

 - [Classificador Estocástico (GMM)](https://github.com/epilefarias/classifica_ruido/blob/master/classificadores/01classificador_estocastico.md)
 - [SVM](https://github.com/epilefarias/classifica_ruido/blob/master/classificadores/02svm.md)
 - [Regressão Logística](https://github.com/epilefarias/classifica_ruido/blob/master/classificadores/03logistic_regression.md)
 - [KNN](https://github.com/epilefarias/classifica_ruido/blob/master/classificadores/04knn.md)
 - [C 4.5](https://github.com/epilefarias/classifica_ruido/blob/master/classificadores/05C45.md)
 - [Rede Neural Profunda](https://github.com/epilefarias/classifica_ruido/blob/master/classificadores/06redeneural.md)
 
 - **Comitê de aprendizado**
 
 ## Avaliação da Classificação
 
 O que vamos utilizar para comparar e avaliar os classificadores?
 
 ## Todo List
 
 - [X] Obter e extrair informações da base de dados
 - [X] Descobrir atributos úteis para classificação (coeficientes mel-cepstrais)
 - [ ] Obter implementações em ~~Python~~ (agora usaremos Matlab) dos classificadores
   - [ ] extrair Mel-Cepstrais
   - [ ] GMM
   - [ ] [SVM](https://github.com/epilefarias/classifica_ruido/blob/master/NOISEX/class_svm.m)
   - [X] [KNN](https://github.com/epilefarias/classifica_ruido/blob/master/NOISEX/class_knn.m)
   - [ ] Regress Log
   - [ ] C 4.5
   - [ ] Rede Neural
 - [ ] Adaptar implementações para o nosso problema
 - [ ] Compilar resultados e escrever artigo
