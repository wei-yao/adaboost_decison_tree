function [ accuracy ] = customDecisionTree( inputData )
%inputData �����ļ���
% ����ֵ��accuracy ģ���ڲ��Լ������ϵ�׼ȷ��.
accuracy=0;
round=100;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
for i=1:round
[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,850);
tc = fitctree(trainData,trainLabel);
predictLabel=predict(tc,testData);
[testNum,temp]=size(testData);
accuracy =accuracy+sum(predictLabel==testLabel)/testNum;
end
accuracy=accuracy/round;
end

