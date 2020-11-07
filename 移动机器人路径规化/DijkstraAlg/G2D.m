%%%%%%%%%%%%%%%%%%%%%%%%得到环境地图的邻接矩阵%%%%%%%%%%%%%%%%%%%%%%%%
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
 W(W==0)=Inf;     %不相邻栅格距离值为Inf（无穷大），将对角元素也设置为了Inf，在Dijkstra算法中使用无影响。
end