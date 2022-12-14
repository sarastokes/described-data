classdef Descriptor < matlab.mixin.CustomDisplay
% Mixin for adding in metadata
%
% Description:
%   Manages metadata and custom display. Metadata is stored in a Hidden 
%   property called Metadata (must be hidden to ensure classes mixed in 
%   with still display their contents appropriately in variable viewer)
%
% Constructor:
%   obj = described.Descriptor(varargin)
%
% Inputs:
%   varargin        key/value pairs to add to metadata (see addMetadata)
%
% Hidden Properties:
%   Metadata            containers.Map
%
% Methods:
%   setMetadata(obj, key, value)
%       Add one or more key/value pairs to metadata. If a key is already 
%       present in the metadata it will be overwritten.
%   removeMetadata(obj, key)
%       Remove one or more keys from Metadata
%   clearMetadata(obj)
%       Clear all metadata
%   out = getMetadata(obj)
%       Returns the containers.Map containing metadata
%   show(obj)
%       Prints the contents of the data to command line (not just metadata)
%   revert(obj)
%       Casts to the original builtin MATLAB type with no metadata
%   disp(obj)
%       Returns datatype, size and displays metadata
%   out = count(obj)
%       Returns the number of keys in the containers.Map holding metadata
%   out = keys(obj)
%       Returns the keys from the containers.Map holding metadata
%
% See Also: 
%   describe

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    properties (Hidden, SetAccess = private)
        Metadata            % containers.Map holding the metadata
    end

    methods
        function obj = Descriptor(varargin)
            % Constructor

            obj.Metadata = containers.Map();

            if nargin > 0
                obj.addMetadata(varargin{:});
            end
        end

        function show(obj)
            % Display data contents
            %
            % Syntax:
            %   show(obj)
            % -------------------------------------------------------------

            fprintf('\n');
            disp(revert(obj));
        end

        function out = revert(obj)
            % Convert back to builtin MATLAB type
            %
            % Syntax:
            %   out = revert(obj)
            %
            % Notes:
            %   Using "cast" crashed MATLAB
            % -------------------------------------------------------------

            supers = superclasses(obj);
            out = eval(sprintf('%s(obj)', supers{1}));
        end
        
        function addMetadata(obj, key, value)
            % Add one or more key/value pairs to metadata
            %
            % Syntax:
            %   setMetadata(obj, varargin)
            %
            % Examples:
            %   setMetadata(obj, 'Units', 'mV')
            %   setMetadata(obj, 'Units', 'mV', 'SomeOtherParam', 2)
            % -------------------------------------------------------------
            arguments
                obj
            end

            arguments (Repeating)
                key         char
                value 
            end

            for i = 1:numel(key)
                obj.Metadata(key{i}) = value{i};
            end
        end

        function removeMetadata(obj, keys)
            % Remove one or more keys/value pairs from metadata
            %
            % Syntax:
            %   removeMetadata(obj, varargin)
            %
            % Examples:
            %   removeMetadata(obj, 'Units')
            %   removeMetadata(obj, 'Units', 'SomeOtherParam')
            % -------------------------------------------------------------
            arguments
                obj
            end
            
            arguments (Repeating)
                keys        char
            end

            for i = 1:numel(keys)
                if isKey(obj.Metadata, keys{i})
                    remove(obj.Metadata, keys{i});
                else
                    warning('removeMetadata:KeyNotFound',...
                        'The key %s was not found', keys{i});
                end
            end
        end

        function clearMetadata(obj)
            % Clear all metadata
            %
            % Syntax:
            %   clearMetadata(obj)
            % -------------------------------------------------------------

            keys = obj.Metadata.keys;

            for i = 1:numel(keys)
                obj.removeMetadata(keys{i});
            end
        end

        function out = getMetadata(obj)
            % Returns the containers.Map containing the metadata
            %
            % Syntax:
            %   out = getMetadata(obj)
            % -------------------------------------------------------------
            out = obj.Metadata;
        end
    end

    % Mirrors of containers.Map methods
    methods 
        function out = count(obj)
            % Returns the number of keys in metadata containers.Map
            %
            % Syntax:
            %   out = count(obj)
            % -------------------------------------------------------------
            out = obj.Metadata.Count;
        end

        function out = keys(obj)
            % Returns the keys in the metadata containers.Map
            %
            % Syntax:
            %   out = keys(obj)
            % -------------------------------------------------------------
            out = obj.Metadata.keys;
        end
    end

    % matlab.mixin.CustomDisplay methods
    methods (Access = protected)
        function propgrp = getPropertyGroups(obj)
            if ~isscalar(obj) 
                propgrp = getPropertyGroups@matlab.mixin.CustomDisplay(obj);
            elseif isempty(obj.Metadata)
                propgrp = [];
            else
                propList = map2struct(obj.Metadata);
                propgrp = matlab.mixin.util.PropertyGroup(propList);
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