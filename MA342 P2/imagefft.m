clear all
close all
clc

%load an image
M = imread('test.jpg');
n = size(M);

%add noise to the image
M = imnoise(M,'salt & pepper',0.2);
imwrite(M,'noise.jpg')

%denoise in one direction
for i=1:n(1)
    x = fft(M(i,:));
    for j = 1:length(x)
        if (j>floor(length(x)/10)) && (j<length(x)-floor(length(x)/10))
            x(j) = 0;
        end
    end
    M(i,:) = real(ifft((x),n(2)));
    clear x
end

%denoise in the other direction
for i=1:n(2)
    y = fft(M(:,i));
    for j = 1:length(y)
        if (j>floor(length(y)/10)) && (j<length(y)-floor(length(y)/10))
            y(j) = 0;
        end
    end
    M(:,i) = real(ifft((y),n(1)));
    clear y
end

%save denoised image
imwrite(M,'denoise.jpg')