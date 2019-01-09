%�����ȡ150����
X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),-ones(50,1)]];
 
opts = statset('Display','final');
 
%����Kmeans����
%X N*P�����ݾ���
%Idx N*1������,�洢����ÿ����ľ�����
%Ctrs K*P�ľ���,�洢����K����������λ��
%SumD 1*K�ĺ�����,�洢����������е���������ĵ����֮��
%D N*K�ľ��󣬴洢����ÿ�������������ĵľ���;
 
[Idx,Ctrs,SumD,D] = kmeans(X,4,'Replicates',4);
 
Point1=X(Idx==1,:);
Point2=X(Idx==2,:);
Point3=X(Idx==3,:);
Point4=X(Idx==4,:);
Dis1=sqrt(sum((bsxfun(@minus,Point1,Ctrs(1,:))).^2,2));
Dis2=sqrt(sum((bsxfun(@minus,Point2,Ctrs(2,:))).^2,2));
Dis3=sqrt(sum((bsxfun(@minus,Point3,Ctrs(3,:))).^2,2));
Dis4=sqrt(sum((bsxfun(@minus,Point4,Ctrs(4,:))).^2,2));
%��������Ϊ1�ĵ㡣X(Idx==1,1),Ϊ��һ��������ĵ�һ�����ꣻX(Idx==1,2)Ϊ�ڶ���������ĵڶ�������
plot(X(Idx==1,1),X(Idx==1,2),'r.','MarkerSize',14)
hold on
plot(X(Idx==2,1),X(Idx==2,2),'b.','MarkerSize',14)
hold on
plot(X(Idx==3,1),X(Idx==3,2),'g.','MarkerSize',14)
 hold on
plot(X(Idx==4,1),X(Idx==4,2),'g.','MarkerSize',14)
%����������ĵ�,kx��ʾ��Բ��
plot(Ctrs(1,1),Ctrs(1,2),'kx','MarkerSize',14,'LineWidth',4)
plot(Ctrs(2,1),Ctrs(2,2),'kx','MarkerSize',14,'LineWidth',4)
plot(Ctrs(3,1),Ctrs(3,2),'kx','MarkerSize',14,'LineWidth',4)
 plot(Ctrs(4,1),Ctrs(4,2),'kx','MarkerSize',14,'LineWidth',4)
legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
%  
% Ctrs
% SumD