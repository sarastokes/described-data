classdef DescribedData < matlab.mixin.CustomDisplay

    properties (Hidden, SetAccess = private)
        Metadata
    end

    methods
        function obj = DescribedData(varargin)
            obj.Metadata = aod.util.Parameters();
            if nargin > 0
                obj.setMetadata(varargin{:});
            end
        end
        
        function setMetadata(obj, varargin)
            % ADDMETADATA
            % -------------------------------------------------------------
            for i = 2:2:numel(varargin)
                obj.Metadata(varargin{i-1}) = varargin{i};
            end
        end

        function removeMetadata(obj, varargin)
            for i = 1:numel(varargin)
                if isKey(obj.Metadata, varargin{i})
                    remove(obj.Metadata, varargin{i});
                else
                    warning('removeMetadata:KeyNotFound',...
                        'The key %s was not found', varargin{i});
                end
            end
        end

        function clearMetadata(obj)
            obj.Metadata = aod.util.Parameters();
        end
    end

    methods (Access = protected)
        function propgrp = getPropertyGroups(obj)
            if ~isscalar(obj) 
                propgrp = getPropertyGroups@matlab.mixin.CustomDisplay(obj);
            else % Show metadata, if it exists
                if isempty(obj.Metadata)
                    propgrp = [];
                else
                    propList = map2struct(obj.Metadata);
                    propgrp = matlab.mixin.util.PropertyGroup(propList);
                end
            end
        end

        function header = getHeader(obj)
            if ~isscalar(obj)
                header = getHeader@matlab.mixin.CustomDisplay;
            else
                classStr = matlab.mixin.CustomDisplay.getClassNameForHeader(obj);
                dimStr = matlab.mixin.CustomDisplay.convertDimensionsToString(obj);
                if isempty(obj.Metadata)
                    headerStr = [dimStr, ' ', classStr, ' with no metadata'];
                else
                    headerStr = [dimStr, ' ', classStr, ' with metadata:'];
                end
                header = sprintf('%s\n',headerStr);
            end
        end
    end
end 