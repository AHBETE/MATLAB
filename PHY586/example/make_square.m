function [yt, t] = make_square(T, numperiods, fs)

% Create a sawtooth wave... 
% T is the Time period (in s)
% numperiods is the number of periods (choose to be >1)
% fs is sampling frequency (in Hz) 

t = [0:fs:numperiods.*T-1];
yt = square(2*pi.*t./T, 50);
