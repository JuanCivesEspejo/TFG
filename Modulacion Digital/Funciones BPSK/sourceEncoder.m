% encodedText = sourceEncoder(text)
%
% Brief: Encodes an array of characters ('A', 'B', 'C', 'D') into binary 
% using the following mapping (0, 10, 110, 111).
%
% Author: Juan Orlando Cives Espejo
% Rev: 1.0
% Date: 2/11/2024
%
% Input arguments:
%   - text          -> Array of characters ('A', 'B', 'C', 'D')
%
% Return values:
%   - encodedText   -> Encoded binary sequence as an array of 0 and 1
%

function encodedText = sourceEncoder(text)

    % ------------------------------------------------------------------
    % Handling input arguments
    if ~ischar(text) || isempty(text)
        error('Input must be a non-empty array of characters.');
    elseif any(~ismember(text, ['A', 'B', 'C', 'D']))
        error('Input must only contain characters A, B, C, or D.');
    end
    % ------------------------------------------------------------------

    % Create encoding dictionary
    letters     = {'A', 'B', 'C', 'D'};
    encoding    = {'0', '10', '110', '111'};
    encodingMap = containers.Map(letters, encoding);

    % Create intermidiate variable encodedStr
    encodedStr = '';
    for i = 1:length(text)
        encodedStr = strcat(encodedStr, encodingMap(text(i)));
    end

    % Convert encodedStr in the output variable with a numeric format
    % This code is like a comprhension python list to avoid loop
    encodedText = arrayfun(@(x) str2double(x), encodedStr);
end