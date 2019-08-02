%% 二进制大对象(blob)分析器 lib
function blobAnalyzer=blob_analyzer(threshold)
% 用于定义二进制大对象分析器的方法。返回二进制大对象分析器
% params:
%   threshold: 二进制大对象的阈值
% return:
%   blobAnalyzer: 二进制大对象分析器
blobAnalyzer=vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', threshold);
end