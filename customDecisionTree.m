function [ accuracy ] = customDecisionTree( inputData )
%inputData �����ļ���
% ����ֵ��accuracy ģ���ڲ��Լ������ϵ�׼ȷ��.
accuracy=0;
round=10;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
for i=1:round
%[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,850);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
tc = fitctree(trainData,trainLabel);
predictLabel=predict(tc,testData);
[testNum,temp]=size(testData);
%stat(i)=sum(predictLabel==testLabel)/testNum;
accuracy =accuracy+sum(predictLabel==testLabel)/testNum;
end
accuracy=accuracy/round;
%plot(stat);
end

