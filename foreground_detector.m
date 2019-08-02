%% ǰ������� lib
function foregroundDetector=foreground_detector(nGaussians,nTrainingFrames)
% ���ڶ����ȡ��Ƶǰ���ķ�����Ŀǰ���ڸ�˹���ģ�ͣ�GMM��������ǰ�������
% params:
%   nGaussians: ��˹���ģ���еĸ�˹ģʽ�ĸ���
%   nTrainingFrames: ����ѵ��ģ�͵ĳ�ʼ��Ƶ֡��
% return:
%   foregroundDetector: ǰ�������

% ����ǰ������������ڸ�˹���ģ�ͣ�GMM��
foregroundDetector = vision.ForegroundDetector('NumGaussians', nGaussians, ...
    'NumTrainingFrames', nTrainingFrames);
end