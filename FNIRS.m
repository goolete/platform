% FNIRS 表示一个近红外打标设备，包含TriggerBox和近红外的设备号
% 仅在Windows10及以上，matlab2016及以上进行测试
%   此类提供以下方法:
%     FNIRS - 构造函数
%     mark_device - 设备打标
%
%   示例:
%     % 近红外设备打标初始化
%     fnirs = FNIRS('COM1');
%     % 近红外设备打mark
%     fnirs.mark_device(1);

classdef FNIRS

    properties
        TriggerBox
        Port
        Baudrate
    end

    methods
        function obj = FNIRS(port)
         % 近红外设备打标初始化
        %   fnirs = FNIRS(port); 初始化近红外打标设备，即triggerbox
        %   输入:
        %     port - 达标设备（打标盒）在计算机设备上映射的虚拟串口名称
        %   输出:
        %     obj - 已经初始化后的fnirs
        %   示例:
        %     eeg = FNIRS('COM1'); 
        %     eeg = FNIRS('COM4');  
            obj.Baudrate = 9600;
            obj.Port = port;
            obj.TriggerBox = serial(port,'BaudRate',obj.Baudrate,'Timeout',4,'DataBits',8,'StopBits',1,'Parity','none','OutputBufferSize',1024,'InputBufferSize',1024);

            try
                fopen(obj.TriggerBox);
            catch e
                msgbox('串口打开失败');
                return;
            end
        end

        function  obj = mark_device(obj,index)
        % 近红外设备打mark
        %   fnirs.mark_device(index); 使用设备mark
        %   输入:
        %     index - mark序列，范围1-255整形
        %   输出:
        %     obj - fnirs
        %   示例:
        %     eeg.mark_device(1);
        %     eeg.mark_device(255);  
            fwrite(obj.TriggerBox,index);
        end

    end

end