%%%%%%%%%%%%%%%%%%%%%���ƾ���·��%%%%%%%%%%%%%%%%%%%%%
function  Plot(distance,x,y)
if(distance~=Inf)            %�ж�·���Ƿ�ɴ�
     plot(x+0.5,y+0.5,'r');
    axis image xy
    hold on
else
    disp('·�����ɴ�');
    hold on
end