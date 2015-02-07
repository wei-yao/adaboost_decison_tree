function [ accuracy ] = customDecisionTree( inputData )
%inputData �����ļ���
% ����ֵ��accuracy ģ���ڲ��Լ������ϵ�׼ȷ��.
%ʹ�þ�����ѵ��ģ�Ͳ�����.
accuracy=0;
round=10;
%ʹ��k�۽�����֤��������.
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

