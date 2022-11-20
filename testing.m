function [  ] = testing( data_speciality_vowel, data_average_fft_kt, label, nguoikt, nguyenam, N_FFT )
    count_correct = zeros(1:5);
    confusion_matrix = cell(5);
    confusion_matrix(1:5,:) = {0};
    for i=1:5
        for h = 1:21
            mindist = euclid(data_speciality_vowel{1}, data_average_fft_kt{h,i}, N_FFT);
            set_label = label{1};
            for j=2:5
                if(euclid(data_speciality_vowel{j}, data_average_fft_kt{h,i}, N_FFT) < mindist)
                    mindist = euclid(data_speciality_vowel{j}, data_average_fft_kt{h,i}, N_FFT);
                    set_label = label{j};
                end
            end
            if(strcmp(set_label,label(i)))
                count_correct(i) = count_correct(i) + 1;
                disp(strcat(nguoikt{h}, ' ', nguyenam{i}, ' - Doan nhan duoc thanh: ', set_label, ' -> Dung'));
            else 
                disp(strcat(nguoikt{h}, ' ', nguyenam{i}, ' - Doan nhan duoc thanh: ', set_label, ' -> Sai'));
            end
            for k=1:5
                if(strcmp(set_label, label(k)))
                    confusion_matrix{i,k} = confusion_matrix{i,k} + 1;
                end
            end
        end
        disp(' ');
    end
    disp(' ');   
    for i=1:5
        disp(strcat('% NHAN DANG DUNG ', label(i), ': ', num2str(count_correct(i)/21*100)));
    end
    disp(' ');
    disp('MA TRAN NHAM LAN:');
    disp(confusion_matrix);
end
   

