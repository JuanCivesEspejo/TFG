% [tx, rx] = configurationPlutoTxRx(txGain, rxGain, frequencyRF, 
%            fs, samples)
%
% Brief : configuration of Pluto SDR transmitter and receiver
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 31/19/2024
%
% Input arguments:
%   - txGain          -> Gain of the transmitter (in dB)
%   - rxGain          -> Gain of the receiver (in dB)
%   - frequencyRF     -> Center frequency for RF (in Hz)
%   - fs              -> Baseband sample rate for Pluto SDR (in Hz)
%   - samples         -> Number of samples per frame
%
% Return values:
%   - tx              -> Configured Pluto SDR transmitter object
%   - rx              -> Configured Pluto SDR receiver object
%

function [tx, rx] = configurationPlutoTxRx(txGain, rxGain, frequencyRF, ...
    fs, samples)
    % ------------------------------------------------------------------
    % Handling input arguments
    if nargin < 5
        error(['5 Input arguments are required (txGain, rxGain, ' ...
            'frequencyRF, fs, and samples).']);
    end

    % Validate inputs
    if ~isnumeric(txGain) 
        error('txGain must be numeric.');
    elseif ~isnumeric(rxGain) 
        error('rxGain must be numeric.');
    elseif (~isnumeric(frequencyRF) || ...
           (frequencyRF < 325e6 || frequencyRF > 3.8e9))
        error(['frequencyRF must be a positive numeric value between ' ...
            '325MHz and 3.8GHz.']);
    elseif ~isnumeric(fs) || fs < 200e3 || fs > 20e6
        error(['fs must be a positive numeric value between 200kHz ' ...
            'and 20MHz.']);
    elseif ~isnumeric(samples) || samples <= 0 || mod(samples,1) ~= 0
        error('samples must be a positive integer.');
    end
    % ------------------------------------------------------------------

    % Configure Pluto SDR transmitter
    tx = sdrtx('Pluto', 'Gain', txGain, 'CenterFrequency', frequencyRF);
    tx.BasebandSampleRate = fs;
    tx.SamplesPerFrame = samples;

    % Configure Pluto SDR receiver
    rx = sdrrx('Pluto', 'Gain', rxGain, 'CenterFrequency', frequencyRF);
    rx.BasebandSampleRate = fs;
    rx.SamplesPerFrame = samples;
end
