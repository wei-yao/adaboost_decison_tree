function [ trainData,trainLabel,testData,testLabel ] = randomSelectData(input, num )
%��iris���ݼ������ȡnum��������trainData
%input �����ļ�   num trainData ��С
[attrib1, attrib2, attrib3, attrib4, class] = textread(input, '%f%f%f%f%s', 'delimiter', ',');
attrib = [attrib1, attrib2, attrib3, attrib4];
%�����ܸ���
totalSize=150;
%ѵ�����ݸ���
trainSize=num;
%�������ݸ���.
testSize=totalSize-trainSize;
sample=randsample(totalSize,trainSize);
trainSelect=false(150,1);
testSelect=true(150,1);
%Ϊtrue����Щλ�õ����ݱ�ѡ��ѵ����.
trainSelect(sample)=true;
testSelect(sample)=false;
a = zeros(150, 1);
a(strcmp(class, 'Iris-setosa')) = 1;
a(strcmp(class, 'Iris-versicolor')) = 2;
a(strcmp(class, 'Iris-virginica')) = 3;
trainLabel=a(trainSelect,:);
trainData = attrib(trainSelect,1:end);
testLabel=a(testSelect,:);
testData=attrib(testSelect,:);
end

