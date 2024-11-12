% showSpectrum(signal, fs, plotTitle, plotDb)
% 
% Biref: Function that plots the spectrum of a given signal.
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 31/10/2024
% 
% Input arguments:
%   - signal            -> Signal whose spectrum plot is required
%   - fs                -> Sampling frequency of the given signal (in Hz)
%   - plotTitle         -> Desired title of the plot
%   - plotDb            -> (Optional) Wether to plot the signal in dB or
%   not (true for plot, false otherwise)
%

function showSpectrum(signal, fs, plotTitle, plotDb)
% ------------------------------------------------------------------
    % Handling input arguments
    if nargin<3
        error(['3 Input arguments are required (signal, fs and ' ...
            'plotTitle).'])
    end

    % Seting default values for optional parameters
    if nargin < 4
        plotDb = false;   
    end

    % Handling fs, plotTitle, plotDb, plotTimeSignal
    if ~isnumeric(fs) || fs <= 0
        error('Sampling frquency must be a positive integer');
    elseif ~isstring(plotTitle)
        error('Title of the plot must be a string');
    elseif ~islogical(plotDb)
        error('plotDb must be boolean (true or false).')
    end
    % -------------------------------------------------------------------

    % Compute Fast Fourier Transform
    fftSignal = fftshift(abs(fft(signal, length(signal)))/length(signal)); 
    fftAxis = linspace(-fs/2, fs/2, length(signal));

    % Plot the Fourier Transform. Plot dB if required
    figure 
    plot(fftAxis, abs(fftSignal))
    title(plotTitle);
    xlabel('Frequency [Hz]');
    ylabel('Magnitude');

    if plotDb
        figure 
        plot(fftAxis, 20*log10(abs(fftSignal)))
        title(plotTitle);
        xlabel('Frequency [Hz]');
        ylabel('dB');
    end
end


    

