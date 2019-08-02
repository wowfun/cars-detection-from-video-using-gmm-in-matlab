%% 前景滤波器 lib
function filteredForeground=foreground_filter(foreground,se)
% 用于定义去除前景中的噪声部分的方法。去除前景中的噪声部分，并返回去噪后的前景
% params:
%   foreground: 图像前景
%   se: 用于去除前景噪声的结构元素
% return:
%   filteredForeground: 去噪后的前景

filteredForeground=imopen(foreground, se);
end