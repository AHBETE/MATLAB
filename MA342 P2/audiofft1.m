clear all
close all
clc

%import file and trim a sample
L=2^20;
[x,Fs]=audioread('test.flac',[1,L]);
audiowrite('sample.wav',x,Fs);
% t=linspace(0,L,L);
% figure(1)
% hold on
% plot(t,x(:,1)),plot(t,x(:,2))
y=fft(x(:,1));
%figure(2),plot((real(y)),t')

%lowpass filter
for i=1:L
    if i<=floor(L/6)
        y1(i)=y(i);
    end
    if (i>floor(L/6)) && (i<L-floor(L/6))
        y1(i)=0;
    end
    if i>=L-floor(L/6)
        y1(i)=y(i);
    end
end
x1=abs(ifft(y1));
audiowrite('low.wav',x1,Fs);

%highpass filter
for i=1:L
    if i<2*floor(L/6)
        y2(i)=0;
    end
    if (i>=2*floor(L/6)) && (i<=L-2*floor(L/6))
        y2(i)=y(i);
    end
    if i>L-2*floor(L/6)
        y2(i)=0;
    end
end
x2=abs(ifft(y2));
audiowrite('high.wav',x2,Fs);

%mediumpass filter
for i=1:L
    if i<floor(L/6)
        y3(i)=0;
    end
    if (i>=floor(L/6)) && (i<=L-4*floor(L/6))
        y3(i)=y(i);
    end
    if (i>L-4*floor(L/6)) && (i<L-2*floor(L/6))
        y3(i)=0;
    end
    if (i>=L-2*floor(L/6)) && (i<=L-floor(L/6))
        y3(i)=y(i);
    end
    if i>L-floor(L/6)
        y3(i)=0;
    end
end
x3=abs(ifft(y3));
audiowrite('medium.wav',x3,Fs); 