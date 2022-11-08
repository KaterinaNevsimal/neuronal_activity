% Signal 1 (fs=20kHz)
signal_20 = fs203;
fs_20 = 20000;
t_20 = signal_20(:,1);
voltage_20 = signal_20(:,2);
figure("Name","Electrode 17 (fs=20kHz)");
plot(t_20/1000,voltage_20);
xlabel("time(s)");
ylabel("voltage(mV)");
title("MEA signal (fs=20kHz)");


% Filtering signal 1
[b,a] =  butter(3,(300)/(fs_20/2), "high");
filtered_s20 = filtfilt(b,a,signal_20);  % filtering
figure("Name","Filtered signal 1");
plot(t_20/1000, filtered_s20);
xlabel("time(s)");
ylabel("voltage(mV)");
title("MEA filtered signal (fs=20kHz)");

%%
[y,d] = bandpass(signal_20,[300 3000],fs_20);
filtered_BP = filtfilt(y,d,signal_20);
plot(t_20/1000,filtered_BP);

