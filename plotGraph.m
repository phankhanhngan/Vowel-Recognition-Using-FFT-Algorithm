function [  ] = plotGraph( data_speciality_vowel, fs, label, N_FFT)
%PLOT Summary of this function goes here
%   Detailed explanation goes here
    line_color = ['b' 'g' 'y' 'c' 'm'];
    
    N=fs*0.025;
    bin_vals = [0 : N-1];
    f_axis = bin_vals*fs/N;
    N_2 = ceil(N/2);
    ca = cell(1, length(line_color));
   
    figure;
    
    for k = 1 : length(line_color)
      ca{k} = sprintf('%s', label{k});
      hold on;
      plot(f_axis(1:N_2),data_speciality_vowel{k}(1:N_2),'-', 'Color', line_color(k),'LineWidth',0.5)
      grid on;
    end
    hold off;
    
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title(strcat('Vector dac trung bieu dien 5 nguyen am (N-FFT=',num2str(N_FFT),')'));
    legend(ca, 'Location', 'northeast');
end  
%     figure;
%     subplot(5,1,1);
%     plot(f_axis(1:N_2),data_speciality_vowel{1}(1:N_2));
%     xlabel('Frequency (Hz)');
%     ylabel('Magnitude');
%     title('Vector dac trung bieu dien nguyen am a');
%     subplot(5,1,2);
%     plot(f_axis(1:N_2),data_speciality_vowel{2}(1:N_2));
%     xlabel('Frequency (Hz)');
%     ylabel('Magnitude');
%     title('Vector dac trung bieu dien nguyen am e');
%     subplot(5,1,3);
%     plot(f_axis(1:N_2),data_speciality_vowel{3}(1:N_2));
%     xlabel('Frequency (Hz)');
%     ylabel('Magnitude');
%     title('Vector dac trung bieu dien nguyen am i');
%     subplot(5,1,4);
%     plot(f_axis(1:N_2),data_speciality_vowel{4}(1:N_2));
%     xlabel('Frequency (Hz)');
%     ylabel('Magnitude');
%     title('Vector dac trung bieu dien nguyen am o');
%     subplot(5,1,5);
%     plot(f_axis(1:N_2),data_speciality_vowel{5}(1:N_2));
%     xlabel('Frequency (Hz)');
%     ylabel('Magnitude');
%     title('Vector dac trung bieu dien nguyen am u');


