function [yt, t] = make_sawtooth(T, numperiods, fs)

% Create a sawtooth wave... 
% T is the Time period (in s)
% numperiods is the number of periods (choose to be >1)
% fs is sampling frequency (in Hz) 

t = [0:fs:numperiods.*T];
yt = sawtooth(2*pi.*t./T);
