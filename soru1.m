% Alitalip SEVER
% Soru 1

clc; clear all; close all;

%%% a bolumu
pay1 = [1 1];
payda1 = 1;

hn1 = pay1;
N1 = length(hn1);

hn1_w = fftshift(fft(hn1,N1));
w1 = -pi:2*pi/N1:pi-2*pi/N1;

hn1_wt_abs = @(w) abs(exp(0) + exp(-j*w));
hn1_wt_angle = @(w) angle(1 + exp(-j*w));

subplot 211
fplot(hn1_wt_abs,[-pi +pi]);
hold on
stem(w1,abs(hn1_w));
hold off
subplot 212
fplot(hn1_wt_angle,[-pi +pi]);

%%% b 
pay2 = [1 0 -1];
payda2 = 1;

hn2 = pay2;
N2 = length(hn2);

hn2_w = fftshift(fft(hn2,N2));
w2 = -pi:2*pi/N2:pi-2*pi/N2;

hn2_wt_abs = @(w2) abs(1 + exp(-2*j*w2));
hn2_wt_angle = @(w2) angle(1 + exp(-2*j*w2));

figure;
subplot 211
fplot(hn2_wt_abs,[-pi +pi]);
hold on
stem(w2,abs(hn2_w));
hold off
subplot 212
fplot(hn2_wt_angle,[-pi +pi]);

%%%

pay3 = [1 -1];
payda3 = 1;

hn3 = pay3;
N3 = length(hn3);

hn3_w = fftshift(fft(hn3,N3));
w3 = -pi:2*pi/N3:pi-2*pi/N3;

hn3_wt_abs = @(w3) abs(1 + exp(-j*w3));
hn3_wt_angle = @(w3) angle(1 + exp(-j*w3));

figure;
subplot 211
fplot(hn3_wt_abs,[-pi +pi]);
hold on
stem(w3,abs(hn3_w));
hold off
subplot 212
fplot(hn3_wt_angle,[-pi +pi]);

%%%