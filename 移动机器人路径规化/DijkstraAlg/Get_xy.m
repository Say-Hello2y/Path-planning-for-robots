%%%%%%%%%%%%%%%%%%%%%����դ���ʶ���õ���Ӧ��x��y����%%%%%%%%%%%%%%%%%%%%%

function [x y]=Get_xy(distance,path,map)
% distance ·������ �����ɴ�·����ִ�иú�������
% path ·���ڵ�����
% map  դ���ͼ��Ϣ
if(distance~=Inf)                %�ж�·���Ƿ�ɴ�
  n = size(map);
  N = size(path,2);
   for(i=1:N)     %����դ���ʶ���õ���Ӧ��x��y����
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