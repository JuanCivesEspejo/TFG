% [messageSignal, fs, t] = createMessageSignal(path, startSample, samples, 
% normalizeSignal)
% 
% Biref: Function that reads and generates the meesage signal that would 
% be modulated and transmitted.
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 31/10/2024
% 
% Input arguments:
%   - path              -> File for reading the song
%   - startSample       -> Initial sample
%   - samples           -> Number of samples used of the message signal
%   - normalizeSignal   -> Optional: Whether returned signal is normalized 
%   or not (true for normalize value and false otherwise).
%
% Return values:
%   - messageSignal     -> message signal (normalized or not)
%   - fs                -> sampling frequency os the message signal (in Hz)
%   - t                 -> time vector of the message signal (in s)


function [messageSignal, fs, t] = createMessageSignal(path, startSample, ...
    samples, normalizeSignal)
    
    % ------------------------------------------------------------------
    % Handling input arguments
    if nargin<3
        error(['3 Input arguments are required (path, startSample and ' ...
            'samples).'])
    end

    % Seting default values for optional parameters
    if nargin < 4
        normalizeSignal = false;   
    end

    % Handling path, startSample, samples and boolean parameters
    if ~isstring(path)
        error('The provided path must be a string.');
    elseif ~exist(path, 'file')
        error('Could not find the provided path.');
    elseif ~isnumeric(samples) || samples <= 0
        error('Samples must be a positive integer.');
    elseif ~isnumeric(startSample) || startSample <= 0
        error('Starting sample must be a positive integer.');
    elseif ~islogical(normalizeSignal)
        error('normalizeSignal must be boolean (true or false).')
    end
    % -------------------------------------------------------------------

    % Create a signal and chek if it is correct
    [x_n, fs] = audioread(path);
    lastSample = startSample + samples - 1;
    if lastSample > length(x_n)
        error('Samples are higher than the length of the signal.');
    end
    messageSignal = x_n(startSample:lastSample);

    % Create time vector. Normalize if required
    if normalizeSignal
        messageSignal = messageSignal/max(messageSignal);
    end

    t = 0:1/fs:(length(messageSignal)-1)*(1/fs);
end