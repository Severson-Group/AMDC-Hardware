%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function Name: generateFRF
% Purpose: Generalized creation of FRF
% Input: 
%    num - numerator for FRF
%    den - denominator for FRF
%    T - Sample time in seconds
%    lines - number of lines for the FRF
%    winType - window type for FRF
% Output: 
%    freq - array of analyzed frequencies in Hz
%    mag - magnitude of FRF
%    phase - phase of FRF in degrees
%    coh - coherence of FRF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Changelog: 
%         Date       %   Inits  %   Reason
%   6/29/2017   %   TSS   %   Created
%   7/4/2017    %   TSS   %   Verified Functionality
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [freq, mag, phase, coh] = generateFRF(num, den, T, lines, win)

	fs = 1/T;
	overlap = lines/2;
	averages = floor(length(num)/(lines-overlap))
	windowType = window(win, lines);
	
	[FRF, freq] = tfestimate(den, num, windowType, overlap, lines, fs);
	[coh, freq] = mscohere(den, num, windowType, overlap, lines, fs);
	
	FRF = fftshift(FRF);
	coh = fftshift(coh);
	freq = freq - max(freq)/2;
	mag = abs(FRF);
	phase = angle(FRF) * 180/pi;

end