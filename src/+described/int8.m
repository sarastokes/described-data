classdef int8 < int8 & described.Descriptor 
% MATLAB's int8 class with metadata
%
% Constructor:
%   obj = described.int8(data, varargin)
%
% Inputs:
%   data        int8
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.int8(2)
%   obj = described.int8(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = int8(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@int8(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end