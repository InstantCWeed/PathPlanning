function Load3(environment,S_Position,E_Position)



%%所需参数信息
wx=environment(1);% wx=10;
wy=environment(2);% wy=10;
Sx=S_Position(1);% Sx=0;
Sy=S_Position(2);% Sy=0;
Ex=E_Position(1);% Ex=8;
Ey=E_Position(2);% Ey=8;


%%展示模拟结果
figure (1)
h1=figure(1);
clf(h1);
set(h1,'name','QPSO展示');  %设置窗口名称
axis image ij
set(gca,'YDir','normal');
set(gca,'XDir','normal');
axis manual     %图片固定大小
axis([0 wx 0 wy]);
grid on
hold on
plot(Sx,Sy,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','c', 'MarkerSize',5);
plot(Ex,Ey,'r o','MarkerEdgeColor','b', 'MarkerFaceColor','r', 'MarkerSize',5);

%%更新地图所需参数信息
edge = (sqrt((Ey - Sy)*(Ey - Sy) + (Ex - Sx)*(Ex - Sx)));%起点终点连线
cos =  ((Ex-Sx)/edge);
sin =  ((Ey-Sy)/edge);

%第3种情况
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

end

