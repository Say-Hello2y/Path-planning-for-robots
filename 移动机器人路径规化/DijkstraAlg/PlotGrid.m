%%%%%%%%%%%%%%%%%%%%%地图绘制函数%%%%%%%%%%%%%%%%%%%%%
function PlotGrid(map,start,goal)
n = size(map,1);
b = map;
b(end+1,end+1) = 0;
figure;
colormap([0 0 0;1 1 1])
pcolor(b); % 赋予栅格颜色
set(gca,'XTick',10:10:n,'YTick',10:10:n);  % 设置坐标
axis image xy
 
% displayNum(n);%显示栅格中的数值.
 
text(start(1)+0.5,start(2)+0.5,'START','Color','red','FontSize',10);%显示start字符
text(goal(1)+0.5,goal(2)+0.5,'GOAL','Color','red','FontSize',10);%显示goal字符
 
hold on
%pin strat goal positon
scatter(start(1)+0.5,start(2)+0.5,'MarkerEdgeColor',[1 0 0],'MarkerFaceColor',[1 0 0], 'LineWidth',1);%start point
scatter(goal(1)+0.5,goal(2)+0.5,'MarkerEdgeColor',[0 1 0],'MarkerFaceColor',[0 1 0], 'LineWidth',1);%goal point
 
hold on
end