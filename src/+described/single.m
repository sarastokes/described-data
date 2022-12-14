classdef single < single & described.Descriptor 
% MATLAB's single class with metadata
%
% Constructor:
%   obj = described.single(data, varargin)
%
% Inputs:
%   data        single
%   varargin    key/value pairs for Metadata
%
% Examples:
%   obj = described.single(2)
%   obj = described.single(2, 'Units', 'mV');
%
% See Also:
%   describe, described.Descriptor

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    methods
        function obj = single(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@single(data);
            obj@described.Descriptor(varargin{:}); 
        end
    end
end