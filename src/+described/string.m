classdef string < string & described.Descriptor
% MATLAB's double class with metadata
%
% Constructor:
%   obj = described.double(data, varargin)
%
% Inputs:
%   data        double
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.double(2)
%   obj = described.double(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = string(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@string(data);
            obj@described.Descriptor(varargin{:});
        end
    end
end