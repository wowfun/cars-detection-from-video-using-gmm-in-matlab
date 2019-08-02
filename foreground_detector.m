%% 前景侦测器 lib
function foregroundDetector=foreground_detector(nGaussians,nTrainingFrames)
% 用于定义获取视频前景的方法（目前基于高斯混合模型，GMM），返回前景侦测器
% params:
%   nGaussians: 高斯混合模型中的高斯模式的个数
%   nTrainingFrames: 用于训练模型的初始视频帧数
% return:
%   foregroundDetector: 前景侦测器

% 创建前景检测器（基于高斯混合模型，GMM）
foregroundDetector = vision.ForegroundDetector('NumGaussians', nGaussians, ...
    'NumTrainingFrames', nTrainingFrames);
end