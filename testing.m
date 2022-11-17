function [  ] = testing( data_speciality_vowel, data_average_fft_kt, label )
%This function is used for comparing the euclidean distance between 
%   Detailed explanation goes here

    count_correct = 0;

    confusion_matrix = cell(5);
    confusion_matrix(1:5,:) = {0};

    for i=1:5
        for h = 1:21
            mindist = euclid(data_speciality_vowel{1}, data_average_fft_kt{h,i});
            set_label = label{1};
            for j=2:5
                if(euclid(data_speciality_vowel{j}, data_average_fft_kt{h,i}) < mindist)
                    mindist = euclid(data_speciality_vowel{j}, data_average_fft_kt{h,i});
                    set_label = label{j};
                end
            end
            if(strcmp(set_label,label(i)))
                count_correct = count_correct + 1;
            end
            for k=1:5
                if(strcmp(set_label, label(k)))
                    confusion_matrix{i,k} = confusion_matrix{i,k} + 1;
                end
            end
        end
    %     confusion_matrix{i,i} = count_correct;
        disp(strcat('% nhan dang dung ', label(i), ': ', num2str(count_correct/21*100)));
        count_correct = 0;
    end
    disp(confusion_matrix);
end
   

