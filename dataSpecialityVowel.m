function [ data_speciality_vowel ] = dataSpecialityVowel( data_average_fft )
%This function is used for finding the 
%   Detailed explanation goes here
    for l= 1:5
        data_speciality_vowel{l} = 0;
        for h=1:21
            data_speciality_vowel{l} = data_speciality_vowel{l} + data_average_fft{h,l}; 
        end
        data_speciality_vowel{l} =  data_speciality_vowel{l}/21;
    end

end

