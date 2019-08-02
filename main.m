%% ���������趨��������ѽ����в����趨ΪĬ��ֵ�������м���

videoName='visiontraffic.avi';
objName='Cars';
resultDir='detected';

disp('Initing model params...');

% ������Ƶ��ȡ������
videoReader = VideoReader(videoName);

% ������������Ƶ��ǰ�������
nGaussians=3; % ����˹���ģ���еĸ�˹ģʽ��Ϊ3��
nTrainingFrames=50; % ��ѵ��ģ�͵ĳ�ʼ��Ƶ֡����Ϊ50
foregroundDetector=foreground_detector(nGaussians,nTrainingFrames);

% ���������ڼ��������ȥ����Ƶǰ���������˲���
foregroundFilter=@foreground_filter;
se = strel('square', 3); 

% ���������ڼ�������Ķ����ƴ����(blob)������
threshold=150; % ���������ֵ
blobAnalyzer=blob_analyzer(threshold); 

disp('OK, model has inited');

disp(['Detecting ',objName]);
video_object_detector(objName,videoReader,foregroundDetector, ...
foregroundFilter,se,blobAnalyzer,resultDir);
disp(['OK. The results of detected ',objName,' have saved to gif in dir: ',resultDir]);


