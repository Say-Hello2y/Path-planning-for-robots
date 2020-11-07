function [Map]=creMap()
%地图矩阵生成函数，生成的是100*100的地图矩阵
Map=ones(100)
for i=1:randi([19 21]) %障碍物个数
p=randi([1 90]);
q=randi([1 90]);
j1=randi([2 4]);
j2=randi([3 4]);
Map(p:p+j1,q:q+j2)=0;
end
end