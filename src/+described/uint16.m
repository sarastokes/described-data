classdef uint16 < uint16 & described.Descriptor 
% MATLAB's uint16 class with metadata
%
% Constructor:
%   obj = described.uint16(data, varargin)
%
% Inputs:
%   data        uint16
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.uint16(2)
%   obj = described.uint16(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = uint16(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@uint16(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end