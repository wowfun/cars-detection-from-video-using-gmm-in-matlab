%% Objs detection lib

function video_object_detector(objName,videoReader, ... 
    foregroundDetector,foregroundFilter,se,blobAnalyzer,resultsDir)
% 用于定义检测视频中的对象的方法。检测对象，并将其中对应的帧组合保存成gif格式，存储到指定文件夹
% params:
%   objName: 字符串，用于标识检测器检测的对象名称，仅用于打印，与其他无关
%   videoReader: 视频读取器
%   foregroundDetector: 前景侦测器
%   foregroundFilter: 用于定义去除前景中的噪声部分的方法，类型为函数
%   se: 用于去除前景噪声的滤波器的结构元素
%   blobAnalyzer: 二进制大对象分析器
%   resultsDir: gif存储的文件夹路径

videoPlayer = vision.VideoPlayer('Name', ['Detecting ',objName]);
videoPlayer.Position(3:4) = [videoReader.Width,videoReader.Height];

frameRate=videoReader.FrameRate;
nFrames=videoReader.NumberOfFrames;
preNumObjs=0;
for iFrame=1:nFrames
    % 获取视频当前帧
    frame = read(videoReader,iFrame); 
    
    % 获取当前帧的前景
    foreground = step(foregroundDetector, frame);
    
    % 过滤前景中的噪声
    filteredForeground = foregroundFilter(foreground,se);
    
    % 在过滤后的前景中检测目标对象，并计算其边界框
    bbox = step(blobAnalyzer, filteredForeground);

    % 在检测到的对象周围绘制边界框
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

    % 获取在视频帧中找到的对象数量
    currNumObjs = size(bbox, 1);
    
    result = insertText(result, [10 10], ['Num of ',objName,': ', ...
    int2str(currNumObjs)], 'BoxOpacity', 1, 'FontSize', 12);
    
    % 将检测的对象连续帧保存成gif
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
    step(videoPlayer, result);  % 显示检测结果
end
end