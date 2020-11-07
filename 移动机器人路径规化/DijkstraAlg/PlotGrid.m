%%%%%%%%%%%%%%%%%%%%%��ͼ���ƺ���%%%%%%%%%%%%%%%%%%%%%
function PlotGrid(map,start,goal)
n = size(map,1);
b = map;
b(end+1,end+1) = 0;
figure;
colormap([0 0 0;1 1 1])
pcolor(b); % ����դ����ɫ
set(gca,'XTick',10:10:n,'YTick',10:10:n);  % ��������
axis image xy
 
% displayNum(n);%��ʾդ���е���ֵ.
 
text(start(1)+0.5,start(2)+0.5,'START','Color','red','FontSize',10);%��ʾstart�ַ�
text(goal(1)+0.5,goal(2)+0.5,'GOAL','Color','red','FontSize',10);%��ʾgoal�ַ�
 
hold on
%pin strat goal positon
scatter(start(1)+0.5,start(2)+0.5,'MarkerEdgeColor',[1 0 0],'MarkerFaceColor',[1 0 0], 'LineWidth',1);%start point
scatter(goal(1)+0.5,goal(2)+0.5,'MarkerEdgeColor',[0 1 0],'MarkerFaceColor',[0 1 0], 'LineWidth',1);%goal point
 
hold on
end