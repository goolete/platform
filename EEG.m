% EEG 表示一个脑电打标设备，包含TriggerBox和TriggerBox的设备号
% 仅在Windows10及以上，matlab2016及以上进行测试
%   此类提供以下方法:
%     EEG - 构造函数
%     mark_device - 设备打标
%
%   示例:
%     % 脑电设备打标初始化
%     eeg = EEG('COM1');
%     % 脑电设备打mark
%     eeg.mark_device(1);

classdef EEG

    properties
        TriggerBox
        Port
    end

    methods
        function obj = EEG(port)
         % 脑电设备打标初始化
        %   eeg = EEG(port); 初始化脑电打标设备，即triggerbox
        %   输入:
        %     port - 达标设备（打标盒）在计算机设备上映射的虚拟串口名称
        %   输出:
        %     obj - 已经初始化后的EEG
        %   示例:
        %     eeg = EEG('COM1'); 
        %     eeg = EEG('COM4');  
            obj.Port = port;
            obj.TriggerBox = TriggerBox(port);
        end

        function  obj = mark_device(obj,index)
        % 脑电设备打mark
        %   eeg.mark_device(index); 使用设备mark
        %   输入:
        %     index - mark序列，范围1-255整形
        %   输出:
        %     obj - EEG
        %   示例:
        %     eeg.mark_device(1);
        %     eeg.mark_device(255);  
            obj.TriggerBox.OutputEventData(index);
        end

    end

end