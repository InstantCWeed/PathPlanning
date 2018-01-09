function [Path Step]=QPSO3(environment,S_Position,E_Position,Parameter)

global  Obst dimen Y P Pg Mbest Before fitness Min

%%���������Ϣ
wx=environment(1);% wx=10;
wy=environment(2);% wy=10;
Sx=S_Position(1);% Sx=0;
Sy=S_Position(2);% Sy=0;
Ex=E_Position(1);% Ex=8;
Ey=E_Position(2);% Ey=8;
M=Parameter(1);% M=15;
N=Parameter(2);% N=20;
iter=Parameter(3);% iter=500;
Y = zeros(N,M+2);%���Ӹ�ά����
P = zeros(N,M+2);%�ֲ���ֵ
Pg = zeros(1,M+2);%ȫ�ּ�ֵ

%%���µ�ͼ���������Ϣ
edge = (sqrt((Ey - Sy)*(Ey - Sy) + (Ex - Sx)*(Ex - Sx)));%����յ�����
cos =  ((Ex-Sx)/edge);
sin =  ((Ey-Sy)/edge);
tan =  (Ey-Sy)/(Ex-Sx);
cot = 1/tan;
dimen = edge /(M+1);%���Ӻ������� ��ֵd

%ת������������ķ�Χ ֻ��Ҫ�����귶Χ [Ymin,Ymax]
%��ʱ�� ���Ͻǿ�ʼ
y(1) = (-sin)* 0  + cos *wy + Sy;
y(2) = (-sin)* 0  + cos *0  + Sy;
y(3) = (-sin)* wx + cos *0  + Sy;
y(4) = (-sin)* wx + cos *wy + Sy;
Ymin = min(y);
Ymax = max(y);

%%չʾģ����
figure (1)
h1=figure(1);
clf(h1);
set(h1,'name','QPSOչʾ');  %���ô�������
axis image ij
set(gca,'YDir','normal');
set(gca,'XDir','normal');
axis manual     %ͼƬ�̶���С
axis([0 wx 0 wy]);
grid on
hold on
plot(Sx,Sy,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','c', 'MarkerSize',5);
plot(Ex,Ey,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','r', 'MarkerSize',5);

%%��������ϰ�����
% obstaclex = round(rand(1,wx));%�����ϰ�������x����
% obstacley = round(rand(1,wy));%�����ϰ�������y����
% count = 0; %��ס�ϰ���ĸ���
% for i =1:wx
%    for j=1:wy
%        if(obstaclex(i) == 1 && obstacley(j) == 1)
%            count = count+1;
%            Obst(count).x = i;
%            Obst(count).y = j;
% %            Obst(count).tranx  = cos * i + sin *j + Sx;
% %            Obst(count).trany = (-sin)* i + cos *j + Sy;
%            Obst(count).tranx  = cos * i + sin *j + Ex;
%            Obst(count).trany = (-sin)* i + cos *j + Ey;
%            plot(Obst(count).x,Obst(count).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
%        end
%    end
% end

%��3�����
Obst(1).x = 1;
Obst(1).y = 1;
Obst(1).tranx = cos*1 + sin*1 +Sx;
Obst(1).trany = (-sin)*1 + cos*1 +Sy;
plot(Obst(1).x,Obst(1).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(2).x = 2;
Obst(2).y = 2;
Obst(2).tranx = cos*2 + sin*2 +Sx;
Obst(2).trany = (-sin)*2 + cos*2 +Sy;
plot(Obst(2).x,Obst(2).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(3).x = 3;
Obst(3).y = 3;
Obst(3).tranx = cos*3 + sin*3 +Sx;
Obst(3).trany = (-sin)*3 + cos*3 +Sy;
plot(Obst(3).x,Obst(3).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(4).x = 4;
Obst(4).y = 4;
Obst(4).tranx = cos*4 + sin*4 +Sx;
Obst(4).trany = (-sin)*4 + cos*4 +Sy;
plot(Obst(4).x,Obst(4).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(5).x = 5;
Obst(5).y = 5;
Obst(5).tranx = cos*5 + sin*5 +Sx;
Obst(5).trany = (-sin)*5 + cos*5 +Sy;
plot(Obst(5).x,Obst(5).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(6).x = 6;
Obst(6).y = 6;
Obst(6).tranx = cos*6 + sin*6 +Sx;
Obst(6).trany = (-sin)*6 + cos*6 +Sy;
plot(Obst(6).x,Obst(6).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(7).x = 7;
Obst(7).y = 7;
Obst(7).tranx = cos*7 + sin*7 +Sx;
Obst(7).trany = (-sin)*7 + cos*7 +Sy;
plot(Obst(7).x,Obst(7).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(8).x = 1;
Obst(8).y = 4;
Obst(8).tranx = cos*1 + sin*4 +Sx;
Obst(8).trany = (-sin)*1 + cos*4 +Sy;
plot(Obst(8).x,Obst(8).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(9).x = 2;
Obst(9).y = 5;
Obst(9).tranx = cos*2 + sin*5 +Sx;
Obst(9).trany = (-sin)*2 + cos*5 +Sy;
plot(Obst(9).x,Obst(9).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);
Obst(10).x = 6;
Obst(10).y = 7;
Obst(10).tranx = cos*6 + sin*7 +Sx;
Obst(10).trany = (-sin)*6 + cos*7 +Sy;
plot(Obst(10).x,Obst(10).y,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',5);

count = 10;


%%��ʼ����Ⱥλ��   N�����ӵ�λ������  ��Mά
Y(:,1) = 0;
P(:,1) = Y(:,1);%��һά�������

P(:,M+2) = (-sin)* Ex + cos * Ey + Sy;%���һά�� Ϊ�յ�
Y(:,M+2) = (-sin)* Ex + cos * Ey + Sy;
i = 1; %��ǰ�������
j = 2; %�Ӷ���ʼ ���ѵ�һά������� �����һά�����յ�
k = 1; %ɨ���ϰ����� ȷ��������Ч��
tt = 0;%ά��������
while(i <= N)
    while(j <= M+1)
        %��ǰ��ͼΪ��һ���� ��Ϊ����  ���� ���½��û�е��Ｋֵ ����Ͻ��ȴﵽ��ֵ ֮�� �½��ٴﵽ��ֵ
        up = (j-1)*dimen*cot;
        down = (j-1)*dimen*tan;
        if((-down)<Ymin)
            tt = tt+1;
            distance = (M+1-tt)*dimen;
            up_var = tan*distance + (wy-Ey)/cos;
            down_var = cot*distance + (wx-Ex)/sin;
            tempy = rand(1,1)*((up_var)+(down_var)-(dimen/4))-(down_var)+(dimen/4);%������
        elseif(up>Ymax)
            tt = tt+1;
            distance = (M+1-tt)*dimen;
            up_var = tan*distance + (wy-Ey)/cos;
            tempy = rand(1,1)*((up_var)+down-(dimen/4))-down+(dimen/4);%�ڶ���
        else
            tempy = rand(1,1)*(up+down)-down;%��һ��  ���һ��
            tt=tt+1;
        end
        while(k<=count)
            %�����ɵĵ㲻���ϰ����غ� �� ����б�ʲ�ͬ б�ʲ����ܲ�����
            if(((Obst(k).tranx-(dimen/2))<=(j-1)*dimen <=(Obst(k).tranx + (dimen/2))&&(Obst(k).trany -(dimen/2))<= tempy <= (Obst(k).trany+(dimen/2))) && (((Obst(k).trany - (dimen/2) - Y(i,j-1))/(Obst(k).tranx -((j-2)*dimen))) <= ((tempy - Y(i,j-1))/dimen) <= ((Obst(k).trany + (dimen/2) -Y(i,j-1))/(Obst(k).tranx -((j-2)*dimen)))))                
                if((-down)<Ymin)
                    tt = tt+1;
                    distance = (M+1-tt)*dimen;
                    up_var = tan*distance + (wy-Ey)/cos;
                    down_var = cot*distance + (wx-Ex)/sin;
                    tempy = rand(1,1)*((up_var)+(down_var)-(dimen/5.5))-(down_var)+(dimen/5.5);%������
                elseif(up>Ymax)
                    tt = tt+1;
                    distance = (M+1-tt)*dimen;
                    up_var = tan*distance + (wy-Ey)/cos;
                    tempy = rand(1,1)*((up_var)+down-(dimen/5.5))-down+(dimen/5.5);%�ڶ���
                else
                    tempy = rand(1,1)*(up+down)-down;%��һ��  ���һ��
                    tt=tt+1;
                end
            else
                k= k+1;
            end
        end
        Y(i,j) = tempy; %��ʼ��X���� N��Mά����
        P(i,j) = tempy; %��ʼ��P���� �ֲ���ֵ����
        j = j+1;
    end
    j = 2;
    i = i+1;
end

%%Pg��ʼ�� ���ֲ���ֵ���еĵ�һ������Pg
Pg = P(1,:);
%%���������㷨��ʼ
Position = 1;%ȫ�ּ�ֵ������λ��
Min = zeros(1,iter);%ȫ������ֵ�仯
fitness = zeros(1,iter);%·����Ӧ�Ⱥ����仯
Mbest = zeros(1,M+2);%�ֲ����λ�õ�ƽ��ֵ
B = zeros(1,iter);
for k = 1:iter
    B(k) = 1- 0.85*(k/iter);%B����ϵ�����Դ�1��Ϊ0.5
    for i = 1:N
        Result = zeros(1,2);%���������
        for d =1:M+1
            Result(1) = Result(1) + sqrt(dimen*dimen +(abs(Y(i,d) - Y(i,d+1))));%��һ�����X������
            Result(2) = Result(2) + sqrt(dimen*dimen +(abs(P(i,d) - P(i,d+1))));%�ڶ������P������
        end
        if(Result(1)<Result(2))
            P(i,:) = Y(i,:);
            fitness(k) = Result(1);
        end
        fitness(k) = Result(2);
        
        %����Pg
        Temp = 0;
        for d = 1:M+1
            Min(k) = Min(k) + sqrt(dimen*dimen +(abs(P(1,d)- P(1,d+1))));
        end
        for t = 2:N
            for d = 1:M+1
                Temp = Temp + sqrt(dimen*dimen +(abs(P(t,d)- P(t,d+1))));
            end
            if(Min(k) > Temp)
                Min(k) = Temp;
                Position = t;
            end
            Temp = 0;
        end
        Pg = P(Position,:);
        
        
        %�õ�mbest
        for d = 1:M+2
            for t = 1:N
                Mbest(d) = Mbest(d) + P(t,d);
            end
            Mbest(d) = (1/N) * Mbest(d);
        end
        
        %��ʼ��������
        for d = 2:M+1
            r1 = rand(1,1);
            r2 = rand(1,1);
            p = (r1 * P(i,d) + r2 * Pg(d))/(r1+r2);
            o = 1;%�����ϰ�����
            u = rand(1,1);
             if (rand(1,1) > 0.5)
                    Y(i,d) = p - B(k) * abs(Mbest(d)-Y(i,d))*log10(1/u);
                else
                    Y(i,d) = p + B(k) * abs(Mbest(d)-Y(i,d))*log10(1/u);
                end
        end
    end
end
Xtick =zeros(1,M+2);
%%������
for i =1:M+2
    Path(i).x = (i-1)*dimen;
    Path(i).y = Pg(i);
    
end
for i =1:M+2
    Xtick(i) = (i-1)*dimen;
end

%%��������ת��
Before(1).x = Sx;
Before(1).y = Sy;
Before(M+2).x = Ex;
Before(M+2).y = Ey;
for i =2:M+1
    Before(i).x = (1/(sin*tan+cos)) * (i*dimen - Sx + tan*Sy - tan*Pg(i));
    Before(i).y = (1/(sin*tan+cos)) * (Pg(i) + tan*i*dimen - Sy - tan*Sx);
    plot(Before(i).x,Before(i).y,'r o','MarkerEdgeColor','g', 'MarkerFaceColor','g', 'MarkerSize',3);
end
%%չʾ����
figure (2)
h2=figure(2);
clf(h2);
set(h2,'name','ȫ������ֵ�仯');  %���ô�������
axis image ij
set(gca,'YDir','normal');
set(gca,'XDir','normal');
axis manual     %ͼƬ�̶���С
plot(Min);

figure (3)
h3=figure(3);
clf(h3);
set(h3,'name','·����Ӧ�Ⱥ����仯');  %���ô�������
axis image ij
set(gca,'YDir','normal');
set(gca,'XDir','normal');
axis manual     %ͼƬ�̶���С
plot(fitness);

figure (4)
h4=figure(4);
clf(h4);
set(h4,'name','ת���Ļ�����ͼ');  %���ô�������
axis image ij
set(gca,'YDir','normal');
set(gca,'XDir','normal');
axis([0 edge Ymin Ymax]);
set(gca, 'XGrid','on'); % X�������
set(gca,'Xtick',Xtick);
set(gca,'XTickLabel',{})
axis manual     %ͼƬ�̶���С
hold on
plot(0,0,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','c', 'MarkerSize',5);
plot(edge,0,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','r', 'MarkerSize',5);
for o =1:count
    plot(Obst(o).tranx,Obst(o).trany,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','k', 'MarkerSize',2);
end
plot(Xtick,Pg,'g-');

Step = M+2;
disp('�����������н�����');

end

