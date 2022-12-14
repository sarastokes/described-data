classdef uint64 < uint64 & described.Descriptor 
% MATLAB's uint64 class with metadata
%
% Constructor:
%   obj = described.uint64(data, varargin)
%
% Inputs:
%   data        uint64
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.uint64(2)
%   obj = described.uint64(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = uint64(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@uint64(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end