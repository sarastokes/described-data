# described-data
Package enabling the addition of metadata to MATLAB data types. Numeric data types and string are supported. 

This was written to provide a MATLAB representation of an HDF5 dataset with attributes but it may be useful in other contexts too. Concatenation of described datatypes is not supported and descriptions will be removed when adding, subtracting, etc with a non-described data type.

```matlab
data = randn(3,3);  % double

% Convert to described double with metadata
describedData = describe(data, 'Units', 'mV');

% Display information about the data
disp(describedData)
% 3×3 double with metadata:
%    Units: 'mV'

% Print the data itself to the command line
show(describedData)
%    0.3252   -1.7115    0.3192
%   -0.7549   -0.1022    0.3129
%    1.3703   -0.2414   -0.8649

% Add one (or more) key/value pairs to metadata
describedData.addMetadata('AnotherParam', 2);
disp(describedData)
% 3×3 double with metadata:
%    AnotherParam: 2
%           Units: 'mV'

% Get the containers.Map holding the metadata
map = describedData.getMetadata();
disp(map)
%  Map with properties:
%        Count: 2
%      KeyType: char
%    ValueType: any

% Remove one (or more) keys from metadata
describedData.remove('AnotherParam');
disp(describedData)
% 3×3 double with metadata:
%    Units: 'mV'

% Clear all metadata
describedData.clearMetadata();
% 3×3 double with no metadata

% Revert to original MATLAB type - double() works too
out = revert(describedData);
disp(out);
%    0.3252   -1.7115    0.3192
%   -0.7549   -0.1022    0.3129
%    1.3703   -0.2414   -0.8649
```