function [ accuracy ] = customDecisionTree( inputData )
%inputData 输入文件名
% 返回值：accuracy 模型在测试集数据上的准确度.
accuracy=0;
round=100;
%运行round 轮，每轮随机取训练集和测试集 ，最后结果取平均.
for i=1:round
[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,850);
tc = fitctree(trainData,trainLabel);
predictLabel=predict(tc,testData);
[testNum,temp]=size(testData);
accuracy =accuracy+sum(predictLabel==testLabel)/testNum;
end
accuracy=accuracy/round;
end

