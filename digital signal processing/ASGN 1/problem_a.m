% DSP Assignment-1 Problem A

Fs_ = 12000; % sampling rate for bandpass filter

[f, y] = myfunc1(12000);
subplot(3, 1, 1);
plot(f, y);
title('Frequency-domain representation of x(t) sampled at 12 KHz')
xticks(floor(-Fs_ / 2000) * 1000 : 1000 : ceil(Fs_ / 2000) * 1000 );
xlabel('Frequency (Hz)');
ylabel('X(f)');

[f, y] = myfunc2(5, 2000);
subplot(3, 1, 2);
plot(f, y);
title('Frequency-domain representation of x(t) sampled at 2 KHz')
xticks(floor(-Fs_ / 2000) * 1000 : 1000 : ceil(Fs_ / 2000) * 1000 );
xlabel('Frequency (Hz)');
ylabel('X(f)');

[f, y] = myfunc2(4, 2650);
subplot(3, 1, 3);
plot(f, y);
title('Frequency-domain representation of x(t) sampled at 2.65 KHz')
xticks(floor(-Fs_ / 2000) * 1000 : 1000 : ceil(Fs_ / 2000) * 1000 );
xlabel('Frequency (Hz)');
ylabel('X(f)');

function [f, y] = myfunc1(Fs)
    N = 1024;  % Number of samples for FFT
    t = 0 : 1 / Fs : 0.1; % time range
    
    % signal used is bandpass signal [4 KHz, 5 KHz]
    x = [1 1] * cos(2 * pi * [4000 5000]' * t);
    f = -Fs / 2 : Fs / (N - 1) : Fs / 2;
    y = fftshift(abs(fft(x, N)));                      % DFT
end

function [f, y] = myfunc2(n, Fs)
    N = 1024;  % Number of samples for FFT
    t = 0 : 1 / Fs : 0.1; % time range
    
    % signal used is bandpass signal [4 KHz, 5 KHz]
    x = [1 1] * cos(2 * pi * [4000 5000]' * t);
    
    % bandpassing the sampled sequence
    Fs_ = 12000;
    f = -Fs_ / 2 : Fs_ / (N - 1) : Fs_ / 2;
    z = bandpass(x,[(n - 1) * Fs / 2 n * Fs / 2],Fs_); % bandpassed signal
    y = fftshift(abs(fft(z, N)));                      % DFT
end
