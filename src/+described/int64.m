classdef int64 < int64 & described.Descriptor 
% MATLAB's int64 class with metadata
%
% Constructor:
%   obj = described.int64(data, varargin)
%
% Inputs:
%   data        int64
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.int64(2)
%   obj = described.int64(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = int64(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@int64(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end