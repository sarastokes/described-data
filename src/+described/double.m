classdef double < double & described.Metadata & matlab.mixin.CustomDisplay

    methods
        function obj = double(data, varargin)
            if nargin == 0
                data = [];
            end
            obj@double(data);
            obj@described.Metadata(varargin{:}); 
        end
    end
    
end