function Execution(P,S)
global scom    

Path = P;
Steps = S;
num = Steps;

%左右转向在不出现别轮子的情况下 旋转90度需要 4.8 秒  
%向前行驶0.5米 以目前程序设定速度 约需要8秒

% 以下算法满足 终点相对在起点的坐标轴正方向 且 起始方向为正东方向

Cal_angle = 0;%计算出的角度
Tran_angle = 0;%需要转换的角度
Bef_angle = 0;%需要保留的上次计算的角度
L_angle_speed = 0.3544439;
R_angle_speed = 0.3561933;
S_speed = 0.05575128;
%第一个位置 在起始点处(Sx,Sy)
for i =2:num
    if(-0.05 <= Path(i).x - Path(i-1).x <= 0.05) %下一个点在上一个点的正上方
        Cal_angle = pi/2;
    else
        Tan  = (Path(i).y - Path(i-1).y)/(Path(i).x - Path(i-1).x);
        Cal_angle = atan(Tan);
    end
    Tran_angle = Cal_angle - Bef_angle;%转向角 = 计算角 - 保留角
    Bef_angle = Cal_angle;  %保留下计算出的角度
    
    step = sqrt((Path(i).y*0.5- Path(i-1).y*0.5)*(Path(i).y*0.5 - Path(i-1).y*0.5) - (Path(i).x*0.5 - Path(i-1).x*0.5)*(Path(i).x*0.5 - Path(i-1).x*0.5)); %两点之间距离
    
    %转向
    if(Tran_angle >0)%转向角大于0 左转
        Turn_time = Tran_angle/L_angle_speed;%转向时间
         hdata=['55';'aa';'01';'04';'26';'80';'fa';'00';'fa';'9e']; %左转
            ddata=hex2dec(hdata);
            fwrite(scom,ddata','uint8');
            pause(Turn_time);
    elseif(Tran_angle<0) %转向角小于0 右转
        Turn_time = abs(Tran_angle)/R_angle_speed;%转向时间
         hdata=['55';'aa';'01';'04';'26';'00';'fa';'80';'fa';'9e']; %右转
            ddata=hex2dec(hdata);
            fwrite(scom,ddata','uint8');
            pause(Turn_time);
    end       
    %前行
    walktime = step/S_speed;
    hdata=['55';'aa';'01';'04';'26';'00';'c8';'00';'c8';'bc'];  %前进
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8');
    pause(1);
    hdata=['55';'aa';'01';'04';'26';'00';'c8';'00';'ce';'c0'];  %前进
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8');
    pause(walktime-1);
    Cal_angle = 0;
end
    hdata=['55';'aa';'01';'00';'21';'21'];  %停止
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8');
    pause(1);

end