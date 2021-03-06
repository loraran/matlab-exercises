%%% Week 09 - Final Assignment 3: Echo Generator
% Add an echo to an audio file.

% Write a function called 'echo_gen' that adds an echo effect to an audio recording.
% An echo is the original signal delayed and attenuated.
% You will first need to compute the echo and then add it to the original signal with the correct offset.
% The function is to be called like this:  output = echo_gen(input, fs, delay, amp);
% where 'input' is a column vector with values between -1 and 1 representing a time series of digitalized sound data.
% The input argument 'fs' is the sampling rate. The sampling rate specifies how many samples we have in the data each second.
% For example: an audio CD uses 44,100 samples per second (44,1 kHz).
% The input argument 'delay' represent the delay of the echo in seconds.
% That is, the echo should start after 'delay' seconds have passed from the stard of the audio signal.
% Finally, 'amp' specifies the amplification of the echo. While typically this is a value less than 1
% because the echo is not as loud, your function should work if 'amp' is greater than 1.

% The output of the function is a column vector containing the original sound with the echo superimposed.
% The output vector will be longer than the input vector if the delay is not zero.
% Round to the nearest number of points needed to get the delay, as opposed to floor or ceil.
% A sound recording has values between -1 and 1, so if the echo causes some values to be outside of this range,
% you will need to scale the entire vector, so that all values are within the range while retaining their relative amplitudes.

% MATLAB has several sample audio files included that you can try, like 'splat', 'gong' and 'handel'.
% Try the following:
%   load gong % loads two variables, y and Fs
%   sound(y,Fs) % outputs sound

% (Note that we are assuming mono audiofiles. If the audio data has two columns, it is a stereo file, so use only one column of the data when testing your file.)

function [output] = echo_gen(input,fs,delay,amp)
    if numel(input(1,:)) > 1  % if the input is a stereo audio file, use only one column
        input = input(:,1);
    end

    if delay == 0 && amp == 0
        output = input;  % input == y
    else
        % amplify the audio
        echoed = input*amp;
        
        % determine the starting point of delay using sampling rate: 1 * Fs = 1 sec of data
        startecho = round(delay*fs);  % startecho is also the extra duration (extra samples) of the audio file
        
        % new audio file extended by the echo
        input = [input ; zeros(startecho,1)];  % newlength = numel(input(:,1)) + startecho
        echoed = [zeros(startecho,1) ; echoed];
        
        notnorm_output = input + echoed;
        
        if max(notnorm_output) > 1
            norm_output = notnorm_output/(max(notnorm_output));
            output = norm_output;
        else
            output = notnorm_output;
        end
    end
