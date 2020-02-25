clear all
close all
clc

%hAxes = gca;
%hAxes.XRuler.Axle.LineStyle = 'none';  
%axis off

%import file and trim a sample
L=2^21;
[x,Fs]=audioread('test.flac',[1,L]);
audiowrite('sample0.wav',x,Fs);
y=fft(x(:,1));

%lowpass filter
y1=y;
y1(floor(L/30):L-floor(L/30))=zeros(L-2*floor(L/30)+1,1);
x1=real(ifft(y1));
audiowrite('low0.wav',x1,Fs);

%highpass filter
y2=y;
y2(1:2*floor(L/30))=zeros(2*floor(L/30)-1+1,1);
y2(L-2*floor(L/30):L)=zeros(L-(L-2*floor(L/30))+1,1);
x2=real(ifft(y2));
audiowrite('high0.wav',x2,Fs);

%mediumpass filter
y3=y;
y3(1:floor(L/30))=zeros(floor(L/30),1);
y3(2*floor(L/30):L-2*floor(L/30))=zeros(L-4*floor(L/30)+1,1);
y3(L-floor(L/30):L)=zeros(L-(L-floor(L/30))+1,1);
x3=real(ifft(y3));
audiowrite('medium0.wav',x3,Fs); 