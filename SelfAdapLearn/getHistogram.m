%���ص�F��ά��Ϊd*5��
%����Ϊ�����ص��е�ȫ��RGB���طֲ�, Ϊһ��sp*3�ľ�������spΪ��ǰ�����ص������������ظ���

function [F] = getHistogram(X,d)

%��ʼ������
%X = abs(X - 0.0000001);
%d = 5;
row = size(X,1);

span = 1/d;
R = floor(X./span)+1;

for i=1:size(X,2)
    H{i} = zeros(1,d);%�洢histogram
end


%ͳ��R�и��������Ĵ���
for i=1:row
    for j=1:size(X,2)
        H{j}(1,R(i,j)) = H{j}(1,R(i,j)) + 1;
    end
end
for j=1:size(X,2)
    temp = (H{j});
    maxValue = max((temp));
    minValue = min((temp));
    if((maxValue-minValue)~=0)
        temp = (temp-minValue)./(maxValue-minValue);
    end
    H{j} = temp;
end


F=[];
for i=1:size(X,2)%����һ������
    F=[F H{i}];%���ؽ��
end

%��һ������
%{
temp = cell2mat(H);
maxValue = max(max(temp));
minValue = min(min(temp));
F=[];
for i=1:size(X,2)%����һ������
    if(maxValue-minValue~=0)
        H{i} = (H{i}-minValue)/(maxValue-minValue);
    end
    F=[F H{i}];%���ؽ��
end
%}
