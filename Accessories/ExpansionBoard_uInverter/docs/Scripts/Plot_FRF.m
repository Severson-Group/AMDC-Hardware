close all
clear all
clc

%% FRF Estimation Example
%
% Given time-domain input/output data collected from a system,
% compute the estimated FRF and plot it.

%% Generate Example Input/Output Data
%
% TODO: replace this section with your own experimental data

% Load data
num = readtable('../exampleData/LOG_Id.txt');
den = readtable('../exampleData/LOG_Vd_star.txt');

num = table2array(num(:,2));
den = table2array(den(:,2));

fs = 20000;
T = 1/fs;

%% Generate FRF Data

% TODO: Appropriately update these settings per your application
lines = 5000;
win = 'rectwin'; % try 'hanning' or 'rectwin'

[freq, mag, phase, coh] = generateFRF(num, den, T, lines, win);

%% What values to put?
%{
The inputs num, den, and T are straight forward and come directly 
from the collected data. However, lines and win depend on the application.

The lines input relates to the number of averages the tfestimate()
function uses. This acts to "smooth" the resulting transfer function.
The value depends on the amount of collected data. Reasonable values for 
lines: 1e3 to 20e3. If a value too large is used, a MATLAB error will
result from the tfestimate() function. Reduce the number of lines to
resolve the error.

The win input indicates the desired FFT windowing function, see the 
MATLAB help documentation for possible values. Typically, for chirp inputs,
the hanning window can be used. For noise injections, the rectwin is often
a better fit.
%}

%% Plot Estimation

% Show coherence plot?
% 1: yes
% 0: no
SHOW_COHERENCE = 1;

figure

if SHOW_COHERENCE == 1
    tiledlayout(3,1);
    ax1 = nexttile;
    ax2 = nexttile;
    ax3 = nexttile;
else
    tiledlayout(2,1);
    ax1 = nexttile;
    ax2 = nexttile;
end

markersize = 8;

plot(ax1, freq, mag, '.', 'markersize', markersize);
plot(ax2, freq, phase, '.', 'markersize', markersize);
if SHOW_COHERENCE == 1
    plot(ax3, freq, coh, '.', 'markersize', markersize);
end

ylabel(ax1, "Magnitude (-)");
ylabel(ax2, "Phase (deg)");
if SHOW_COHERENCE == 1
    ylabel(ax3, "Coherence");
end

if SHOW_COHERENCE == 1
    xlabel(ax3, "Frequency (Hz)");
else
    xlabel(ax2, "Frequency (Hz)");
end

f1 = 1;
f2 = 0.5 * (1/T) / 2;
xlim(ax1, [f1 f2]);
xlim(ax2, [f1 f2]);

grid(ax1, 'on');
grid(ax2, 'on');

set(ax1, 'xscale', 'log');
set(ax2, 'xscale', 'log');

%ylim(ax1, [0 6]);
%ylim(ax2, [-120 10]);

if SHOW_COHERENCE == 1
    xlim(ax3, [f1 f2]);
    ylim(ax3, [0 1.1]);
    grid(ax3, 'on');
    set(ax3, 'xscale', 'log');
end

print(gcf, "-dpng", '-noui', "examplePlot", '-r300');