clear;
clc;
close all;
[map]=creMap()%Map���õ��ǰ�Ҫ������18-20���ϰ��ÿ���ϰ���ռ6-16��
start=[1 100]%��������
goal=[100 1]%�յ������
Dmap=G2D(map);%����դ���ͼ���ڽӾ���
PlotGrid(map,start,goal)%������άդ���ͼ
[distance,route]=Dijkstras(Dmap,9901,100)%���㷨�õ���̾���;���·��
[x y]=Get_xy(distance,route,map);%������·����դ�������ʾ����
Plot(distance,x,y)%��դ��ͼ�ϻ�������·��