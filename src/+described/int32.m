classdef int32 < int32 & described.Descriptor 
% MATLAB's int32 class with metadata
%
% Constructor:
%   obj = described.int32(data, varargin)
%
% Inputs:
%   data        int32
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.int32(2)
%   obj = described.int32(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = int32(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@int32(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end