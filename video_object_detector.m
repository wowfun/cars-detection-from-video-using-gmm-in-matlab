%% Objs detection lib

function video_object_detector(objName,videoReader, ... 
    foregroundDetector,foregroundFilter,se,blobAnalyzer,resultsDir)
% ���ڶ�������Ƶ�еĶ���ķ����������󣬲������ж�Ӧ��֡��ϱ����gif��ʽ���洢��ָ���ļ���
% params:
%   objName: �ַ��������ڱ�ʶ��������Ķ������ƣ������ڴ�ӡ���������޹�
%   videoReader: ��Ƶ��ȡ��
%   foregroundDetector: ǰ�������
%   foregroundFilter: ���ڶ���ȥ��ǰ���е��������ֵķ���������Ϊ����
%   se: ����ȥ��ǰ���������˲����ĽṹԪ��
%   blobAnalyzer: �����ƴ���������
%   resultsDir: gif�洢���ļ���·��

videoPlayer = vision.VideoPlayer('Name', ['Detecting ',objName]);
videoPlayer.Position(3:4) = [videoReader.Width,videoReader.Height];

frameRate=videoReader.FrameRate;
nFrames=videoReader.NumberOfFrames;
preNumObjs=0;
for iFrame=1:nFrames
    % ��ȡ��Ƶ��ǰ֡
    frame = read(videoReader,iFrame); 
    
    % ��ȡ��ǰ֡��ǰ��
    foreground = step(foregroundDetector, frame);
    
    % ����ǰ���е�����
    filteredForeground = foregroundFilter(foreground,se);
    
    % �ڹ��˺��ǰ���м��Ŀ����󣬲�������߽��
    bbox = step(blobAnalyzer, filteredForeground);

    % �ڼ�⵽�Ķ�����Χ���Ʊ߽��
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

    % ��ȡ����Ƶ֡���ҵ��Ķ�������
    currNumObjs = size(bbox, 1);
    
    result = insertText(result, [10 10], ['Num of ',objName,': ', ...
    int2str(currNumObjs)], 'BoxOpacity', 1, 'FontSize', 12);
    
    % �����Ķ�������֡�����gif
    if (currNumObjs>0)  
        [imidx,cm] = rgb2ind(result,256);
        if(preNumObjs==currNumObjs)
            imwrite(imidx,cm,gifname,'gif','WriteMode','Append','DelayTime',1/frameRate);
        else 
            currTime=videoReader.CurrentTime;
            gifname=strcat(resultsDir,'\from-',int2str(iFrame),'th-frame', ...
                '-detect-',int2str(currNumObjs),'-',objName,'-in-',num2str(currTime),'s', '.gif');
            imwrite(imidx,cm,gifname,'gif', 'Loopcount',inf);
            preNumObjs=currNumObjs;
        end 
    end
    step(videoPlayer, result);  % ��ʾ�����
end
end