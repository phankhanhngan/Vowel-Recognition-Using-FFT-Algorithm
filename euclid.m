function [ dist ] = euclid( data_speciality_vowel, data_average_fft_kt, N_FFT )
% This function is used for calculating euclidean distance between 2 vector
%   Detailed explanation goes here
    V = data_speciality_vowel - data_average_fft_kt;
    distEu = sqrt(sum((V) .^ 2));

    dist = squeeze(distEu(1,1,:));
    dist = dist/N_FFT;
end

