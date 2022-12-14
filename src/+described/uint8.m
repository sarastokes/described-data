classdef uint8 < uint8 & described.Descriptor 
% MATLAB's uint8 class with metadata
%
% Constructor:
%   obj = described.uint8(data, varargin)
%
% Inputs:
%   data        uint8
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.uint8(2)
%   obj = described.uint8(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = uint8(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@uint8(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end