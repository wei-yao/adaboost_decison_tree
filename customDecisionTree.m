function [ accuracy ] = customDecisionTree( inputData )
%inputData 输入文件名
% 返回值：accuracy 模型在测试集数据上的准确度.
%使用决策树训练模型并评估.
accuracy=0;
round=10;
%使用k折交叉验证方法测试.
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

