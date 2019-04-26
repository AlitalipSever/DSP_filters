% Alitalip SEVER
% Soru 4

clc; clear all; close all;

N = 100;
n1 = 0 : N-1;

wc = 0.4*pi;

w = linspace(-pi,pi-2*pi/N,N);

M1 = 20; M2 = 30; M3 = 50;

hid_M1 = sin(wc*n1-wc*M1).*(pi*n1-pi*M1+pi*eps).^(-1);
hid_M2 = sin(wc*n1-wc*M2).*(pi*n1-pi*M2+pi*eps).^(-1);
hid_M3 = sin(wc*n1-wc*M3).*(pi*n1-pi*M3+pi*eps).^(-1);

figure;
subplot 311; stem(n1,hid_M1); title(' M = 20');
subplot 312; stem(n1,hid_M2); title(' M = 30');
subplot 313; stem(n1,hid_M3); title(' M = 50');

Hw = fftshift(fft(hid_M1,N));
Hw2 = fftshift(fft(hid_M2,N));
Hw3 = fftshift(fft(hid_M3,N));

figure;
subplot 311; plot(w,abs(Hw));   title(' M = 20');
subplot 312; plot(w,abs(Hw2)); title(' M = 30');
subplot 313; plot(w,abs(Hw3)); title(' M = 50');

Ham1 = hamming(M1);
Ham2 = hamming(M2);
Ham3 = hamming(M3);

Ham_w3 = fftshift(fft(Ham3,M3));

Yw = Ham_w3.*Hw3;

figure; stem(w,abs(Yw));
