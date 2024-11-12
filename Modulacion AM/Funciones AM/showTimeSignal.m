% showTimeSignal(signal, t, plotTitle)
% 
% Biref: Function that plots the a signal in time domain
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 31/10/2024
% 
% Input arguments:
%   - signal            -> Signal whose time plot is required
%   - t                 -> Time vector of the given signal (in s)
%   - plotTitle         -> Desired title of the plot
%

function showTimeSignal(signal, t, plotTitle)
    % Handling input arguments
    if nargin<3
        error(['3 Input arguments are required (signal, t and ' ...
            'plotTitle).'])
    end

    % Handling signal, t and plotTitle
    if length(signal) ~= length(t)
        error('Time vector and signal do not have the same length');
    elseif ~isstring(plotTitle)
        error('Title of the plot must be a string');
    end
    % -------------------------------------------------------------------
    % Plot time signal
    figure
    plot(t, signal)
    title(plotTitle);
    xlabel('Time [s]');
    ylabel('Magnitude');
end