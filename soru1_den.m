% Alitalip SEVER
% Soru 1

clc; clear all; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%% H1(z)%%%%%%%%%%%%%%%%%%%%%%%%%%%
hn = [1 1];
N=50;

w = linspace(-pi,pi-2*pi/N,N);
Hw = fftshift(fft(hn,N));

Hw_genlik = abs(Hw);
Hw_angle = angle(Hw);

figure;
subplot 211; plot(w/pi, Hw_genlik); title('bant geçiren H1(z)');
subplot 212; plot(w/pi, Hw_angle);


%%%%%%%%%%%%%%%%%%%%%%%%%% H2(z)%%%%%%%%%%%%%%%%%%%%%%%%%%%
hn2 = [1 0 1];
N2=50;

w2 = linspace(-pi,pi-2*pi/N2,N2); 
Hw2 = fftshift(fft(hn2,N2));

Hw_genlik2 = abs(Hw2);
Hw_angle2 = angle(Hw2);

figure;
subplot 211; plot(w2/pi, Hw_genlik2); title('bant söndüren H2(z)');
subplot 212; plot(w2/pi, Hw_angle2);

%%%%%%%%%%%%%%%%%%%%%%%%%% H3(z)%%%%%%%%%%%%%%%%%%%%%%%%%%%
hn3 = [1 -1];
N3=50;

w3 = linspace(-pi,pi-2*pi/N3,N3); 
Hw3 = fftshift(fft(hn3,N3));

Hw_genlik3 = abs(Hw3);
Hw_angle3 = angle(Hw3);

figure;
subplot 211; plot(w3/pi, Hw_genlik3); title('yüksek geçiren H3(z)');
subplot 212; plot(w3/pi, Hw_angle3);

%%%%%%%%%%%%%%%%%%%%%%%%%% H4(z)%%%%%%%%%%%%%%%%%%%%%%%%%%%
hn4 = [1 0 -1];
N4=50;

w4 = linspace(-pi,pi-2*pi/N4,N4);
Hw4 = fftshift(fft(hn4,N4));

Hw_genlik4 = abs(Hw4);
Hw_angle4 = angle(Hw4);

figure;
subplot 211; plot(w4/pi, Hw_genlik4); title('bant geçiren H4(z)');
subplot 212; plot(w4/pi, Hw_angle4);

%%%%%%%%%%%%%%%%%%% Grup Gecikmeleri %%%%%%%%%%%%%%%%%%%%%%

Hw_angle_unwrap = unwrap(angle(Hw));
Hw_angle_unwrap2 = unwrap(angle(Hw2));
Hw_angle_unwrap3 = unwrap(angle(Hw3));
Hw_angle_unwrap4 = unwrap(angle(Hw4));

tau_w = -diff(Hw_angle_unwrap)*(N/(2*pi));
tau_w2 = -diff(Hw_angle_unwrap2)*(N2/(2*pi));
tau_w3 = -diff(Hw_angle_unwrap3)*(N3/(2*pi));
tau_w4 = -diff(Hw_angle_unwrap4)*(N4/(2*pi));

figure;
subplot 411; plot(w(2:end)/pi,tau_w); title('tau H1(z)');
subplot 412; plot(w2(2:end)/pi,tau_w2); title('tau H2(z)');
subplot 413; plot(w3(2:end)/pi,tau_w3); title('tau H3(z)');
subplot 414; plot(w4(2:end)/pi,tau_w4); title('tau H4(z)');

%%%%%%%%%%%%%%%%%%% C bölümü %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xn_N = 50;
n = 0:xn_N-1;

xn = cos((pi/3)*n);

Xw = fftshift(fft(xn,xn_N));
Xw_w = linspace(-pi,pi-2*pi/xn_N,xn_N);

Xw_genlik = abs(Xw);
Xw_angle = angle(Xw);

figure;
subplot 211; plot(Xw_w/pi, Xw_genlik); title('X(w)');
subplot 212; plot(Xw_w/pi, Xw_angle);

Yw = Xw.*Hw;
Yw2 = Xw.*Hw2;
Yw3 = Xw.*Hw3;
Yw4 = Xw.*Hw4;

%%%%%%%%%%%%%%%%%%% C bölümü y1[n] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Yw_genlik = abs(Yw);
Yw_angle = angle(Yw);

Yw_w = linspace(-pi,pi-2*pi/xn_N,xn_N);

figure;
subplot 211; plot(Yw_w/pi, Yw_genlik); title('Y(w)');
subplot 212; plot(Yw_w/pi, Yw_angle);

yn_ters = ifft(ifftshift(Yw));

%%%%%%%%%%%%%%%%%%% C bölümü y2[n] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Yw_genlik2 = abs(Yw2);
Yw_angle2 = angle(Yw2);

Yw_w = linspace(-pi,pi-2*pi/xn_N,xn_N);

figure;
subplot 211; plot(Yw_w/pi, Yw_genlik2); title('Y2(w)');
subplot 212; plot(Yw_w/pi, Yw_angle2);

yn_ters2 = ifft(ifftshift(Yw2));
%%%%%%%%%%%%%%%%%%% C bölümü y3[n] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Yw_genlik3 = abs(Yw3);
Yw_angle3 = angle(Yw3);

Yw_w = linspace(-pi,pi-2*pi/xn_N,xn_N);

figure;
subplot 211; plot(Yw_w/pi, Yw_genlik3); title('Y3(w)');
subplot 212; plot(Yw_w/pi, Yw_angle3);

yn_ters3 = ifft(ifftshift(Yw3));
%%%%%%%%%%%%%%%%%%% C bölümü y4[n] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Yw_genlik4 = abs(Yw4);
Yw_angle4 = angle(Yw4);

Yw_w = linspace(-pi,pi-2*pi/xn_N,xn_N);

figure;
subplot 211; plot(Yw_w/pi, Yw_genlik4); title('Y4(w)');
subplot 212; plot(Yw_w/pi, Yw_angle4);

yn_ters4 = ifft(ifftshift(Yw4));
%%%%%%%%%%%%%%%%%%% C bölümü using CONV %%%%%%%%%%%%%%%%%%%%%%%%

yn = conv(xn,hn);
yn2 = conv(xn,hn2);
yn3 = conv(xn,hn3);
yn4 = conv(xn,hn4);

figure;
subplot 411; stem(0:50,yn); title('y1[n]');
subplot 412; stem(0:51,yn2); title('y2[n]');
subplot 413; stem(0:50,yn3); title('y3[n]');
subplot 414; stem(0:51,yn4); title('y4[n]');

figure;
subplot 411; stem(n,yn_ters); title('y1[n] tersF');
subplot 412; stem(n,yn_ters2); title('y2[n] tersF');
subplot 413; stem(n,yn_ters3); title('y3[n] tersF');
subplot 414; stem(n,yn_ters4); title('y4[n] tersF');


