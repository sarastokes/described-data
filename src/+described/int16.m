classdef int16 < int16 & described.Descriptor 
% MATLAB's int16 class with metadata
%
% Constructor:
%   obj = described.int16(data, varargin)
%
% Inputs:
%   data        int16
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.int16(2)
%   obj = described.int16(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = int16(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@int16(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end