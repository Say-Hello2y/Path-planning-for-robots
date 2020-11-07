%%%%%%%%%%%%%%%%%%%%%绘制具体路径%%%%%%%%%%%%%%%%%%%%%
function  Plot(distance,x,y)
if(distance~=Inf)            %判断路径是否可达
     plot(x+0.5,y+0.5,'r');
    axis image xy
    hold on
else
    disp('路径不可达');
    hold on
end