% This function is used to split entire speech in frames of specific time
% duration in msec.
% 
% 

function [frames] = framing(x,fs,f_d)

% x:input speech signal
% fs: Sampling Frequency
% f_d: Frame duration (in sec)

f_size = round(f_d * fs);  % frame size

l_s = length(x);    % speech length
n_f = floor(l_s/f_size); % num of frames

% creating frmes
temp = 0;
for i = 1 : n_f
    frames(i,:) = x(temp + 1 : temp + f_size);
    temp = temp + f_size;
end

end