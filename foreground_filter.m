%% ǰ���˲��� lib
function filteredForeground=foreground_filter(foreground,se)
% ���ڶ���ȥ��ǰ���е��������ֵķ�����ȥ��ǰ���е��������֣�������ȥ����ǰ��
% params:
%   foreground: ͼ��ǰ��
%   se: ����ȥ��ǰ�������ĽṹԪ��
% return:
%   filteredForeground: ȥ����ǰ��

filteredForeground=imopen(foreground, se);
end