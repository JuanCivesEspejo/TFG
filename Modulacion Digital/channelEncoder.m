% encodedBits = channelEncoder(bitsSequence, N)
%
% Brief: Channel encoder using Hamming C(N,1) coding
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 2/11/2024
%
% Input arguments:
%   - N                 -> Number of desired redundant bits
%   - bitsSequence      -> Array of input bits of length
%
% Return values:
%   - encodedBits       -> Array of encoded bits using C(N,1)
%

function encodedBits = channelEncoder(bitsSequence, N)

    % ------------------------------------------------------------------
    % Handling input arguments
    if any(bitsSequence ~= 0 & bitsSequence ~= 1)
        error('Bits sequence must contain only 0 and 1.')
    elseif ~isnumeric(N) || N <= 0
        error(['Number of desired redundant bits must be a positive ' ...
            'integer'])
    elseif size(bitsSequence, 1) ~= 1
        error('Bits sequence must be a one-row matrix')
    end
    % ------------------------------------------------------------------

    % Create a sequence of redundant bits
    encodedBits = repmat(bitsSequence, N, 1);                      
    encodedBits = reshape(encodedBits, 1, []); 
end