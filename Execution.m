function Execution(P,S)
global scom    

Path = P;
Steps = S;
num = Steps;

%����ת���ڲ����ֱ����ӵ������ ��ת90����Ҫ 4.8 ��  
%��ǰ��ʻ0.5�� ��Ŀǰ�����趨�ٶ� Լ��Ҫ8��

% �����㷨���� �յ���������������������� �� ��ʼ����Ϊ��������

Cal_angle = 0;%������ĽǶ�
Tran_angle = 0;%��Ҫת���ĽǶ�
Bef_angle = 0;%��Ҫ�������ϴμ���ĽǶ�
L_angle_speed = 0.3544439;
R_angle_speed = 0.3561933;
S_speed = 0.05575128;
%��һ��λ�� ����ʼ�㴦(Sx,Sy)
for i =2:num
    if(-0.05 <= Path(i).x - Path(i-1).x <= 0.05) %��һ��������һ��������Ϸ�
        Cal_angle = pi/2;
    else
        Tan  = (Path(i).y - Path(i-1).y)/(Path(i).x - Path(i-1).x);
        Cal_angle = atan(Tan);
    end
    Tran_angle = Cal_angle - Bef_angle;%ת��� = ����� - ������
    Bef_angle = Cal_angle;  %�����¼�����ĽǶ�
    
    step = sqrt((Path(i).y*0.5- Path(i-1).y*0.5)*(Path(i).y*0.5 - Path(i-1).y*0.5) - (Path(i).x*0.5 - Path(i-1).x*0.5)*(Path(i).x*0.5 - Path(i-1).x*0.5)); %����֮�����
    
    %ת��
    if(Tran_angle >0)%ת��Ǵ���0 ��ת
        Turn_time = Tran_angle/L_angle_speed;%ת��ʱ��
         hdata=['55';'aa';'01';'04';'26';'80';'fa';'00';'fa';'9e']; %��ת
            ddata=hex2dec(hdata);
            fwrite(scom,ddata','uint8');
            pause(Turn_time);
    elseif(Tran_angle<0) %ת���С��0 ��ת
        Turn_time = abs(Tran_angle)/R_angle_speed;%ת��ʱ��
         hdata=['55';'aa';'01';'04';'26';'00';'fa';'80';'fa';'9e']; %��ת
            ddata=hex2dec(hdata);
            fwrite(scom,ddata','uint8');
            pause(Turn_time);
    end       
    %ǰ��
    walktime = step/S_speed;
    hdata=['55';'aa';'01';'04';'26';'00';'c8';'00';'c8';'bc'];  %ǰ��
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8');
    pause(1);
    hdata=['55';'aa';'01';'04';'26';'00';'c8';'00';'ce';'c0'];  %ǰ��
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8');
    pause(walktime-1);
    Cal_angle = 0;
end
    hdata=['55';'aa';'01';'00';'21';'21'];  %ֹͣ
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8');
    pause(1);

end