clear; clc; close all;

% --- Part 1: Signal and its Z-Transform ---
x = [1 2 1];
n = 0:length(x)-1;

% Delay the signal by one sample
xDelayed = [0 x];
nDelayed = 0:length(xDelayed)-1;

figure('Name', 'Part 1: Original and Delayed Signals');
subplot(2,1,1);
stem(n, x, 'filled');
title('Original Signal x[n]');
xlabel('Sample n'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(nDelayed, xDelayed, 'filled');
title('One-Sample Delay x[n-1]');
xlabel('Sample n'); ylabel('Amplitude');
grid on;

% --- Part 2: System with One Sample Delay ---
% Original system: H(z) = 0.5 + 0.5*z^(-1)
b_original = [0.5 0.5];
a = 1;

xInput = [x 0];
y_original = filter(b_original, a, xInput);
nOutput = 0:length(y_original)-1;

figure('Name', 'Part 2: Original System Response');
subplot(2,1,1);
stem(nOutput, xInput, 'filled');
title('Input x[n]');
xlabel('Sample n'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(nOutput, y_original, 'filled');
title('Output y[n] for H(z) = 0.5 + 0.5z^{-1}');
xlabel('Sample n'); ylabel('Amplitude');
grid on;

disp('Output samples (Original H(z)):');
disp(y_original);

% --- Part 2 (Task 6): Updated System ---
% H(z) = 0.8 + 0.2*z^(-1)
b_updated = [0.8 0.2];
y_updated = filter(b_updated, a, xInput);

figure('Name', 'Part 2 (Task 6): Updated System Response');
subplot(2,1,1);
stem(nOutput, xInput, 'filled');
title('Input x[n]');
xlabel('Sample n'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(nOutput, y_updated, 'filled');
title('Output y[n] for H(z) = 0.8 + 0.2z^{-1}');
xlabel('Sample n'); ylabel('Amplitude');
grid on;

disp('Output samples (Updated H(z)):');
disp(y_updated);