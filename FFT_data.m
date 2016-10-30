% 
%每次调用需要修改的变量为M, M决定采样点数，
% FFT
clear
clc
load cl1.dat
t = cl1(end/2:end,1);
S = cl1(end/2:end,2);
fs = 1.0 / ( t(2) - t(1) ); % 采样频率( Sample Frequency)
M = 2*log2( ceil( fs / 1024 ) * 1024 );
N = 2^M; % 采样点数( Sample Points number )
plot( t,S );
title('Original Signal!')
% 
Y = fft( S, N ); % N/2 points number FFT for signal S
Y1 = abs( Y ); % FFT 模值
Y2 = Y1 / ( N/2 ); % FFT真实信号幅值
% 
f = ( 0:N ) * fs / N; % 取横轴频率范围， fs/N代表每个采样点对应的频率间隔， (0:N)使得频率从直流分量（常量）开始%
%
Flag = find( Y2 == max(Y2(2:end)) );
plot( f(1:(2*Flag)),Y2(1:(2*Flag)),'linewidth',1.5 );
%
set(gcf,'color','w');box off
