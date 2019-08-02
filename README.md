# Cars Detection From Video Using GMM in Matlab

使用高斯混合模型（GMM）从视频中检测车辆

Detect vehicles in video and then save video fragments detected cars as GIF in the specified folder (default is "detected").

主要用于检测视频中的车辆，并将检测到车辆的视频片段保存成gif在指定的文件夹（默认为"detected"）。

Note:
> Inspired by [MathWorks Examples](https://www.mathworks.com/help/vision/examples/detecting-cars-using-gaussian-mixture-models.html).  
The .m files are encoded using **GBK**.  
So if you get garbled when reading them, please re-open with the corresponding encoding.

## Getting Started

run `main.m` with Matlab.

## Gif Saved Demo

`detected/from-324th-frame-detect-2-Cars-in-10.8108s.gif`

![cars](detected/from-324th-frame-detect-2-Cars-in-10.8108s.gif)

## 函数说明

    main                        主函数，已设定好参数，运行即可。
    blob_analyzer               lib, 用于定义二进制大对象（blob）分析器的方法。返回二进制大对象分析器。
    foreground_detector         lib, 用于定义获取视频前景的方法（目前基于高斯混合模型，GMM），返回前景侦测器。
    video_object_detector       lib, 用于定义检测视频中的对象的方法。检测对象，并将其中对应的帧组合保存成gif格式，存储到指定文件夹。

## 参数说明

    blob_analyzer
        params:
            threshold:          二进制大对象的阈值
        return:
            blobAnalyzer:       二进制大对象分析器
    foreground_detector
        params:
            nGaussians:         高斯混合模型中的高斯模式的个数
            nTrainingFrames:    用于训练模型的初始视频帧数
        return:
            foregroundDetector: 前景侦测器
    video_object_detector
        params:
            objName:            字符串，用于标识检测器检测的对象名称，仅用于打印，与其他无关
            videoReader:        视频读取器
            foregroundDetector: 前景侦测器
            foregroundFilter:   用于定义去除前景中的噪声部分的方法，类型为函数
            se:                 用于去除前景噪声的滤波器的结构元素
            blobAnalyzer:       二进制大对象分析器
            resultsDir:         gif存储的文件夹路径

## 其他说明

    detected                    保存gif的目录
    .gif                        自动保存的命名格式：
                                    from-（第几帧）th-frame-detect-（检测到的对象数量）-（对象名）-in-（在视频的第几秒）s
                                    例如： from-95th-frame-detect-1-Cars-in-3.1698s.gif
