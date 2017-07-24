%#######################%
%						%
%	EXTRAÇÃO DOS MFCC	%
%						%
%#######################%

% Limpa tela e memoria
%clear all, close all, clc;

% Frequencia de amostragem dos audios da base de dados
fs=19980;

% Carregando na memoria todos as amostras de audio

%para linux
if isunix
    cd ./audios
end
%para windows
if ispc
    cd .\audios
end

babble = wavread('babble.wav');
buccaneer1 = wavread('buccaneercockpit1.wav');
buccaneer2 = wavread('buccaneercockpit2.wav');
destroyerengine = wavread('destroyerengine.wav');
destroyerops = wavread('destroyerops.wav');
f16  = wavread('f16.wav');
factory1 = wavread('factoryfloor1.wav');
factory2 = wavread('factoryfloor2.wav');
hfchannel = wavread('hfchannel.wav');
leopard = wavread('leopard.wav');
m109 = wavread('m109.wav');
machinegun = wavread('machinegun.wav');
pink = wavread('pinknoise.wav');
volvo = wavread('volvo.wav');
white = wavread('whitenoise.wav');

cd ..

% Calculando os coeficientes MFCC para cada uma das amostras de áudio
c01=melcepst(babble,fs,'dD',13);  
c02=melcepst(buccaneer1,fs,'dD',13); 
c03=melcepst(buccaneer2,fs,'dD',13); 
c04=melcepst(destroyerengine,fs,'dD',13); 
c05=melcepst(destroyerops,fs,'dD',13); 
c06=melcepst(f16,fs,'dD',13); 
c07=melcepst(factory1,fs,'dD',13); 
c08=melcepst(factory2,fs,'dD',13); 
c09=melcepst(hfchannel,fs,'dD',13); 
c10=melcepst(leopard,fs,'dD',13); 
c11=melcepst(m109,fs,'dD',13); 
c12=melcepst(machinegun,fs,'dD',13); 
c13=melcepst(pink,fs,'dD',13); 
c14=melcepst(volvo,fs,'dD',13); 
c15=melcepst(white,fs,'dD',13); 

% Salva os coeficientes mel-cepstrais em arquivos .mat

%para linux
if isunix
    cd ./csvs
end
%para windows
if ispc
    cd .\csvs
end

save('babble.mat','c01');
save('buccaneer1.mat','c02');
save('buccaneer2.mat','c03');
save('destroyerengine.mat','c04');
save('destroyerops.mat','c05');
save('f16.mat','c06');
save('factory1.mat','c07');
save('factory2.mat','c08');
save('hfchannel.mat','c09');
save('leopard.mat','c10');
save('m109.mat','c11');
save('machinegun.mat','c12');
save('pink.mat','c13');
save('volvo.mat','c14');
save('white.mat','c15');

cd ..

%############################################################################

