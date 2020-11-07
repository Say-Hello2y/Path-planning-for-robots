clear;
clc;
close all;
[map]=creMap()%Map采用的是按要求生成18-20个障碍物，每个障碍物占6-16格
start=[1 100]%起点的坐标
goal=[100 1]%终点的坐标
Dmap=G2D(map);%生成栅格地图的邻接矩阵
PlotGrid(map,start,goal)%画出二维栅格地图
[distance,route]=Dijkstras(Dmap,9901,100)%由算法得到最短距离和具体路先
[x y]=Get_xy(distance,route,map);%将具体路线用栅格坐标表示出来
Plot(distance,x,y)%在栅格图上画出具体路线