function [ accuracy ] = customDecisionTree( inputData )
%inputData 输入文件名
% 返回值：accuracy 模型在测试集数据上的准确度.
accuracy=0;
round=10;
%运行round 轮，每轮随机取训练集和测试集 ，最后结果取平均.
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

