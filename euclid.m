function [ dist ] = euclid( data_speciality_vowel, data_average_fft_kt )
% This function is used for calculating euclidean distance between 2 vector
%   Detailed explanation goes here
%     dimens = 512:-1:1;
    V = data_speciality_vowel - data_average_fft_kt;
    dist = 0;
    distEu = sqrt(sum((V) .^ 2));

    for i=1:length(distEu)
        euclidDist = dist + distEu(i);
    end
    
    dist = squeeze(euclidDist(1,1,:));
    dist = dist/512;
end

