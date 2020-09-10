clc,clear all,close all

N = 10^6 % number of bits or symbols
% Transmitter
ip = rand(1,N)>0.5; % generating 0,1 with equal probability
s = 2*ip-1; % BPSK modulation 0 -> -1; 1 -> 0 

snrdB = -20:5:50; % multiple Eb/N0 values

% for L = 1 
L1 = 1
ber1 = berfading(snrdB,'psk',16,L1);

% for L = 2
L2 = 2
ber2 = berfading(snrdB,'psk',16,L2);

figure;
semilogy(snrdB,ber1,'*--','LineWidth',1)
hold on
axis([-20 50 10^-5 0.5])
grid on;
semilogy(snrdB,ber2,'r-o','LineWidth',1)
hold on
axis([-20 50 10^-5 0.5])
grid on 
legend('Rayleigh-Theory L =1','Rayleigh-Theory L =2');
xlabel('SNR, dB');
ylabel('Bit Error Rate');
title('BER for BPSK modulation in Rayleigh channel');

