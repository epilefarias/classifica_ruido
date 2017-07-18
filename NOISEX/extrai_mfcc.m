%extracao de mfcc para treino 

clear all, close all, clc;
fs=19980;

cd .\NOISEX

%----------babble------------
%load babble;
babble = wavread('babble.wav');
treino_babble=babble(1:3524928);
%sound(babble,19980,16);
c1=melcepst(treino_babble,fs); 


%---------buccaneer1----------
%load buccaneer1;
buccaneer1 = wavread('buccaneercockpit1.wav');
treino_buccaneer1=buccaneer1(1:3524928);
%sound(babble,19980,16);
c2=melcepst(treino_buccaneer1,fs);

%---------buccaneer2----------
%load buccaneer2;
buccaneer2 = wavread('buccaneercockpit2.wav');
treino_buccaneer2=buccaneer2(1:3524928);
%sound(babble,19980,16);
c3=melcepst(treino_buccaneer2,fs);

%-------destroyerengine-------
%load destroyerengine;
destroyerengine = wavread('destroyerengine.wav');
treino_destroyerengine=destroyerengine(1:3524928);
%sound(babble,19980,16);
c4=melcepst(treino_destroyerengine,fs);

%------destroyerops-----------
%load destroyerops;
destroyerops = wavread('destroyerops.wav');
treino_destroyerops=destroyerops(1:3524928);
%sound(babble,19980,16);
c5=melcepst(treino_destroyerops,fs);

%------f16---------
%load f16;
f16 = wavread('f16.wav');
treino_f16=f16(1:3524928);
%sound(babble,19980,16);
c6=melcepst(treino_f16,fs);

%------factory1-------
%load factory1;
factory1 = wavread('factoryfloor1.wav');
treino_factory1=factory1(1:3524928);
%sound(babble,19980,16);
c7=melcepst(factory1,fs);

%-----factory2-------
%load factory2;
factory2 = wavread('factoryfloor2.wav');
treino_factory2=factory2(1:3524928);
%sound(babble,19980,16);
c8=melcepst(factory2,fs);

%-----hfchannel--------
%load hfchannel;
hfchannel = wavread('hfchannel.wav');
treino_hfchannel=hfchannel(1:3524928);
%sound(babble,19980,16);
c9=melcepst(treino_hfchannel,fs);

%-----leopard--------
%load leopard;
leopard = wavread('leopard.wav');
treino_leopard=leopard(1:3524928);
%sound(babble,19980,16);
c10=melcepst(treino_leopard,fs);

%----m109----------
%load m109;
m109 = wavread('m109.wav');
treino_m109=m109(1:3524928);
%sound(babble,19980,16);
c11=melcepst(treino_m109,fs);

%-----machinegun----
%load machinegun;
machinegun = wavread('machinegun.wav');
treino_machinegun=machinegun(1:3524928);
%sound(babble,19980,16);
c12=melcepst(treino_machinegun,fs);

%------pink--------
%load pink;
pink = wavread('pinknoise.wav');
treino_pink=pink(1:3524928);
%sound(babble,19980,16);
c13=melcepst(treino_pink,fs);

%-----volvo----------
%load volvo;
volvo = wavread('volvo.wav');
treino_volvo=volvo(1:3524928);
%sound(babble,19980,16);
c14=melcepst(treino_volvo,fs);

%------white------
%load white;
white = wavread('whitenoise.wav');
treino_white=white(1:3524928);
%sound(babble,19980,16);
c15=melcepst(treino_white,fs);
