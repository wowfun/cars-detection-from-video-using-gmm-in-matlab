%% �����ƴ����(blob)������ lib
function blobAnalyzer=blob_analyzer(threshold)
% ���ڶ�������ƴ����������ķ��������ض����ƴ���������
% params:
%   threshold: �����ƴ�������ֵ
% return:
%   blobAnalyzer: �����ƴ���������
blobAnalyzer=vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', threshold);
end