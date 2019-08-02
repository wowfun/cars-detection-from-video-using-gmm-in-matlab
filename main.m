%% 主函数，设定完参数后（已将所有参数设定为默认值），运行即可

videoName='visiontraffic.avi';
objName='Cars';
resultDir='detected';

disp('Initing model params...');

% 创建视频读取器对象
videoReader = VideoReader(videoName);

% 创建适用于视频的前景侦测器
nGaussians=3; % 将高斯混合模型中的高斯模式设为3个
nTrainingFrames=50; % 将训练模型的初始视频帧数设为50
foregroundDetector=foreground_detector(nGaussians,nTrainingFrames);

% 创建适用于检测汽车的去除视频前景噪声的滤波器
foregroundFilter=@foreground_filter;
se = strel('square', 3); 

% 创建适用于检测汽车的二进制大对象(blob)分析器
threshold=150; % 定义检测的阈值
blobAnalyzer=blob_analyzer(threshold); 

disp('OK, model has inited');

disp(['Detecting ',objName]);
video_object_detector(objName,videoReader,foregroundDetector, ...
foregroundFilter,se,blobAnalyzer,resultDir);
disp(['OK. The results of detected ',objName,' have saved to gif in dir: ',resultDir]);


