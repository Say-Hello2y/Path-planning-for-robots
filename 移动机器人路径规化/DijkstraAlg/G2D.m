%%%%%%%%%%%%%%%%%%%%%%%%�õ�������ͼ���ڽӾ���%%%%%%%%%%%%%%%%%%%%%%%%
function W=G2D(map)
l=size(map);
W=zeros(l(1)*l(2),l(1)*l(2));
for i=1:l(1)
    for j=1:l(2)
        if map(i,j)==1
            for m=1:l(1)
                for n=1:l(2)
                    if map(m,n)==1
                        im=abs(i-m);jn=abs(j-n);
                        if im+jn==1||(im==1&&jn==1)
                       W((i-1)*l(2)+j,(m-1)*l(2)+n)=(im+jn)^0.5;
                        end
                    end
                end
            end
        end
    end
end
 W(W==0)=Inf;     %������դ�����ֵΪInf������󣩣����Խ�Ԫ��Ҳ����Ϊ��Inf����Dijkstra�㷨��ʹ����Ӱ�졣
end