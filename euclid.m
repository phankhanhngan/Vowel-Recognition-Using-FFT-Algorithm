function [ dist ] = euclid( data_speciality_vowel, data_average_fft_kt)
% This function is used for calculating euclidean distance between 2 vector
%   Detailed explanation goes here
    V = data_speciality_vowel - data_average_fft_kt;
    dist = sqrt(sum((V) .^ 2));
end

