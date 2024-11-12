% dataRx = transmitReceiveSignal(rx, tx, signal)
% 
% Biref: Function for transmitting and receiving a signal using Pluto SDR
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 31/19/2024
%
% Input arguments:
%   - rx               -> Configured Pluto SDR receiver object
%   - tx               -> Configured Pluto SDR transmitter object
%   - signal           -> Signal that will be transmitted ande received
%
% Return values:
%   - dataRx           -> Received signal data in double precision
%

function dataRx = transmitReceiveSignal(rx, tx, signal)
    % ------------------------------------------------------------------
    % Handling input arguments
    if nargin < 3
        error('3 Input arguments are required (rx, tx, and signal).');
    end

    % Validate input arguments
    if ~isa(tx, 'comm.SDRTxPluto')
        error('The transmitter object (tx) must be of type SDRTxPluto.');
    elseif ~isa(rx, 'comm.SDRRxPluto')
        error('The receiver object (rx) must be of type SDRRxPluto.');
    end
    % ------------------------------------------------------------------

    % Transpose the modulated signal for transmission
    transposedSignal = signal.';

    % Begin transmission and reception of the signal
    tx.transmitRepeat(transposedSignal);
    dataRx = rx();
    dataRx = double(dataRx);

    % Stop transmission and reception
    release(tx);
    release(rx);
end

