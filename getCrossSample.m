function [ trainData,trainLabel,testData,testLabel ] = getCrossSample( input,iterations,total )
%�ý�����֤�ķ�������
%  ���룺input �����ļ���  iterations ��ǰ������ ��Χ��1��total ��total ������.
[measures,labels]=getData(input);
dataSize=size(measures,1);
%ÿ�γ�ȡ��������С.
sampleSize=floor(dataSize/total);
curSampleSize=sampleSize;
%������������������������������������һ��Ҫȡ������ʣ�������.
if(iterations==total)
    curSampleSize=curSampleSize+mod(dataSize,total);
end
%��ȡ���Լ����½���Ͻ�(����).
lb=1+(iterations-1)*sampleSize;
ub=lb+curSampleSize;
%ѡ������: Ϊtrue����Щλ��ѡΪ��������.
testSelected=false(dataSize,1);
testSelected(lb:ub-1)=true;
testData=measures(testSelected,:);
testLabel=labels(testSelected,:);
trainData=measures(~testSelected,:);
trainLabel=labels(~testSelected,:);

end

function [measures,labels]=getData(input)
% ���ļ���ȡ���Ի��� ���,�˺������ϲ������˾����������ݵ�ϸ��.
%���룺�������ݵ��ļ���
%���  measures :����   labels�� ���

%����Ϊ��ȡ�β�����ݵĴ���.
[attrib1, attrib2, attrib3, attrib4, class] = textread(input, '%f%f%f%f%s', 'delimiter', ',');
measures = [attrib1, attrib2, attrib3, attrib4];
%�����ܸ���
totalSize=size(measures,1);
labels = zeros(totalSize, 1);
labels(strcmp(class, 'Iris-setosa')) = 1;
labels(strcmp(class, 'Iris-versicolor')) = 2;
labels(strcmp(class, 'Iris-virginica')) = 3;
end

