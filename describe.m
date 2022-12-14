function obj = describe(data, varargin)
% Convert MATLAB datatype to a described datatype with metadata options
%
% Syntax:
%   obj = describe(data, varargin)
%
% See Also:
%   described.Metadata

% By Sara Patterson, 2022 (described-data)
% -------------------------------------------------------------------------

    switch class(data)
        case 'double'
            obj = described.double(data, varargin{:});
        case 'single'
            obj = described.single(data, varargin{:});
        case 'uint8'
            obj = described.uint8(data, varargin{:});
        case 'int8'
            obj = described.int8(data, varargin{:});
        case 'uint16'
            obj = described.uint16(data, varargin{:});
        case 'int16'
            obj = described.int16(data, varargin{:});
        case 'uint32'
            obj = described.uint32(data, varargin{:});
        case 'int32'
            obj = described.int32(data, varargin{:});
        case 'uint64'
            obj = described.uint64(data, varargin{:});
        case 'int64'
            obj = described.int64(data, varargin{:});
        otherwise
            error('describe:NotYetImplemented',...
                '%s is not yet implemented.', class(data)); 
    end