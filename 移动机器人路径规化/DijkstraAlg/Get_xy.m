%%%%%%%%%%%%%%%%%%%%%根据栅格标识，得到相应的x，y坐标%%%%%%%%%%%%%%%%%%%%%

function [x y]=Get_xy(distance,path,map)
% distance 路径长度 若不可达路径不执行该函数程序
% path 路径节点向量
% map  栅格地图信息
if(distance~=Inf)                %判断路径是否可达
  n = size(map);
  N = size(path,2);
   for(i=1:N)     %根据栅格标识，得到相应的x，y坐标
    if rem(path(i),n(2))==0
       x(i)=n(2);
       y(i)= floor(path(i)/n(2));
    else
       x(i)= rem(path(i),n(2));
       y(i)= floor(path(i)/n(2))+1;
    end
   end
else
    x = 0;
    y = 0;
end
4