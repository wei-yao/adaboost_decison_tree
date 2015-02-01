function [ accuracy ] = customKnnClassify( inputData )
%��knn��������������
%����ֵ���ڲ��Լ��ϵ�׼ȷ��
%input�������ļ���.
accuracy=0;
round=10;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
for i=1:round
[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,100);
mdl = fitcknn(trainData,trainLabel,'NumNeighbors',5,'Standardize',1);
[label,score,cost] = predict(mdl,testData);
testNum=size(testData,1);
accuracy =accuracy+sum(label==testLabel)/testNum;
end
accuracy=accuracy/round;
end

