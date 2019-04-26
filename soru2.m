% Alitalip SEVER
% Soru 2-3

clc; clear all; close all;

num1 = load('C:\Users\ATS\Desktop\DSP_LAB4\filters\filter1.mat');
num2 = load('C:\Users\ATS\Desktop\DSP_LAB4\filters\filter2.mat');
num3 = load('C:\Users\ATS\Desktop\DSP_LAB4\filters\filter3.mat');
num4 = load('C:\Users\ATS\Desktop\DSP_LAB4\filters\filter4.mat');

N=60;
w = linspace(0,2*pi-2*pi/N,N);

h1 = filter(num1.Num,1,[1 zeros(1,59)]);
h2 = filter(num2.Num,1,[1 zeros(1,59)]);
h3 = filter(num3.b,num3.a,[1 zeros(1,59)]);
h4 = filter(num4.Num,1,[1 zeros(1,59)]);

hw1 = fft(h1,N);
hw2 = fft(h2,N);
hw3 = fft(h3,N);
hw4 = fft(h4,N);

abs_hw1 = abs(hw1);
abs_hw2 = abs(hw2);
abs_hw3 = abs(hw3);
abs_hw4 = abs(hw4);

angle_hw1 = unwrap(angle(hw1));
angle_hw2 = unwrap(angle(hw2));
angle_hw3 = unwrap(angle(hw3));
angle_hw4 = unwrap(angle(hw4));

Hw_angle_unwrap1 = unwrap(angle(hw1));
Hw_angle_unwrap2 = unwrap(angle(hw2));
Hw_angle_unwrap3 = unwrap(angle(hw3));
Hw_angle_unwrap4 = unwrap(angle(hw4));

tau_w1 = -diff(Hw_angle_unwrap1)*(N/(2*pi));
tau_w2 = -diff(Hw_angle_unwrap2)*(N/(2*pi));
tau_w3 = -diff(Hw_angle_unwrap3)*(N/(2*pi));
tau_w4 = -diff(Hw_angle_unwrap4)*(N/(2*pi));

figure;
subplot 311; plot(w/pi,abs_hw1); title('abs_hw1');
subplot 312; plot(w/pi,angle_hw1);
subplot 313; plot(w(2:end)/pi,tau_w1);

figure;
subplot 311; plot(w/pi,abs_hw2); title('abs_hw2');
subplot 312; plot(w/pi,angle_hw2);
subplot 313; plot(w(2:end)/pi,tau_w2);

figure;
subplot 311; plot(w/pi,abs_hw3); title('abs_hw3');
subplot 312; plot(w/pi,angle_hw3);
subplot 313; plot(w(2:end)/pi,tau_w3);

figure;
subplot 311; plot(w/pi,abs_hw4); title('abs_hw4');
subplot 312; plot(w/pi,angle_hw4);
subplot 313; plot(w(2:end)/pi,tau_w4);


%%%%%%%%%%%%%%%%%%%%% SOEU 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w0 = 0.2*pi;
n = 0:N-1;
xn = cos(w0*n);


xw1 = fft(xn,N);

yw1 = xw1.*hw1;
yw2 = xw1.*hw2;
yw3 = xw1.*hw3;
yw4 = xw1.*hw4;

yn1 = ifft(yw1);
yn2 = ifft(yw2);
yn3 = ifft(yw3);
yn4 = ifft(yw4);

figure;
subplot 211; stem(n,xn);  title('xn1');
subplot 212; stem(n,yn1); title('yn1');

figure;
subplot 211; stem(n,xn);  title('xn1');
subplot 212; stem(n,yn2); title('yn2');

figure;
subplot 211; stem(n,xn);  title('xn1');
subplot 212; stem(n,yn3); title('yn3');

figure;
subplot 211; stem(n,xn);  title('xn1');
subplot 212; stem(n,yn4); title('yn4');



