% This function is used to remove silence in audio

function [data_remove] = speech_silence_disc(data,fs)
data = data / abs(max(data));
% do framing
f_d = 0.025;
frames = framing(data, fs, f_d);
% calculate frames energy
[r,c] = size(frames);
ste = 0;
for i = 1 : r
    ste(i) = sum(frames(i,:).^2);    
end

ste = ste./max(ste); %normalize the data

f_size = round(f_d * fs); %size of frame = frame_duration * frequency_sampling

% Silence Removal
id = find(ste >= 0.01);
fr_ws = frames(id,:); % frames without silence

% reconstruct signal
data_remove = reshape(fr_ws',1,[]);
end