function [ fft_vector ] = fft_calc( data_without_silence, fs, N_FFT )
%This function is used for calculating fft vector
%   Detailed explanation goes here

       
        %lay phan on dinh cua tin hieu bang cach chia tin hieu thanh 3 phan
        %bang nhau sau do lay phan o giua, f_d = 30ms
        start = floor((1/3)*length(data_without_silence));
        endd = floor((2/3)*length(data_without_silence ));
        data_without_silence  = data_without_silence (start:endd);
        f_d = 0.03;
        %framing data sau khi remove silence va lay phan o giua 3 phan
        %0.03 vi trong video thay noi la 0.03 :v
        frames = framing(data_without_silence , fs, f_d);
        %tinh vector FFT cua 1 frames voi so chieu la N_FFT = 512,1024,2048
        [r,c] = size(frames);  
        data_fft=0;
        for k = 1 : r
            %tinh fft cua 1 frames trong r frame
           data_fft = data_fft + abs(fft(frames(k,:),N_FFT));
           %fft(x,n,dim) x: data, n: length of x, dim: dimension
        end
%         tinh fft 1 nguyen am trung binh
%         cua 1 nguoi bang trung binh fft cua cac frames
        fft_vector = data_fft/r;    
end

