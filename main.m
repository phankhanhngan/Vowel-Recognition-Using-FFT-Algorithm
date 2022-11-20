url = 'NguyenAmHuanLuyen-16k\';
nguoi = {'01MDA\','02FVA\','03MAB\','04MHB\','05MVB\','06FTB\','07FTC\','08MLD\','09MPD\','10MSD\','11MVD\','12FTD\','14FHH\','15MMH\','16FTH\','17MTH\','18MNK\','19MXK\','20MVK\','21MTL\','22MHL\'};
nguyenam = {'a.wav','e.wav','i.wav','o.wav','u.wav'};
label = {'(nguyen am a)', '(nguyen am e)', '(nguyen am i)', '(nguyen am o)', '(nguyen am u)'};
nameFigure = { ' 1',' 2',' 3',' 4',' 5',' 6',' 7',' 8',' 9',' 10',' 11',' 12',' 14',' 15',' 16',' 17',' 18',' 19',' 20',' 21',' 22',};

urlkt = 'NguyenAmKiemThu-16k\';
nguoikt = {'23MTL\','24FTL\','25MLM\','27MCM\','28MVN\','29MHN\','30FTN\','32MTP\','33MHP\','34MQP\','35MMQ\','36MAQ\','37MDS\','38MDS\','39MTS\','40MHS\','41MVS\','42FQT\','43MNT\','44MTT\','45MDV\'};


N_FFT = {512,1024,2048};

%================================== TINH TOAN ============================

% Khoi tao cell array voi 21 hang, 5 cot, moi cell la vecto trong
data_remove_silence=cell(21,5);
data_average_fft=cell(21,5);
data_speciality_vowel = cell(5);

% chung ta co 21 nguoi va 5 nguyen am, tuong ung voi 2 mang nguoi{} va 
% nguyenam{}

for i=1:21
    for j=1:5
         %Tao duong dan toi file
        url1 = strcat(url,nguoi{i},nguyenam{j});
        %Doc data tu file
        [data,fs] = audioread(url1);
        %remove silence nguoi thu i, nguyen am thu j
        data_remove_silence{i,j} = speech_silence_disc(data,fs);
    end
end

for loop=1:3
    disp(' ');
    disp(strcat('N_FFT = ', num2str(N_FFT{loop})));
    for i=1:21
        for j=1:5
            % calc fft
            data_average_fft{i,j} = fft_calc(data_remove_silence{i,j},fs, N_FFT{loop});
        end
    end

    % tinh vector fft dac trung cua 1 nguyen am bang trung binh 21 nguoi
    % data_speciality_vowel{i} : vector dac trung cua nguyenam{i}
    %data_average_fft{i,j}: vector dac trung cua nguoi thu i, i:1->21, nguyen
    % am thu j j:1->5

    data_speciality_vowel = dataSpecialityVowel(data_average_fft);

    % Bieu dien vector dac trung cua 5 nguyen am bang do thi voi N_FFT =
    % 512,1024,2048
    plotGraph(data_speciality_vowel,fs,label, N_FFT{loop});

 %================================== KIEM THU ============================
 
% Khoi tao cell array voi 21 hang, 5 cot, moi cell la vecto trong
data_remove_silence_kt=cell(21,5);
data_average_fft_kt=cell(21,5);

 for i=1:21
    for j=1:5
         %Tao duong dan toi file
        url1kt = strcat(urlkt,nguoikt{i},nguyenam{j});
        %Doc data tu file
        [datakt,fskt] = audioread(url1kt);
        %remove silence nguoi thu i, nguyen am thu j
        data_remove_silence_kt{i,j} = speech_silence_disc(datakt,fskt);
    end
 end

    for i=1:21
        for j=1:5
            % calc fft
            data_average_fft_kt{i,j} = fft_calc(data_remove_silence_kt{i,j},fskt, N_FFT{loop});
        end
    end

    testing(data_speciality_vowel,data_average_fft_kt, label, nguoikt, nguyenam, N_FFT{loop});
    disp(' ');
    disp(' ');
end




