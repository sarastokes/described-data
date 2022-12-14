classdef uint32 < uint32 & described.Descriptor 
% MATLAB's uint32 class with metadata
%
% Constructor:
%   obj = described.uint32(data, varargin)
%
% Inputs:
%   data        uint32
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.uint32(2)
%   obj = described.uint32(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = uint32(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@uint32(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end