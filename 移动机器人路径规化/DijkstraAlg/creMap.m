function [Map]=creMap()
%��ͼ�������ɺ��������ɵ���100*100�ĵ�ͼ����
Map=ones(100)
for i=1:randi([19 21]) %�ϰ������
p=randi([1 90]);
q=randi([1 90]);
j1=randi([2 4]);
j2=randi([3 4]);
Map(p:p+j1,q:q+j2)=0;
end
end