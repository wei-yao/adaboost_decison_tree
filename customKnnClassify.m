function [ accuracy ] = customKnnClassify( inputData )
%用knn分类器处理数据
%返回值是在测试集上的准确度
%input是输入文件名.
accuracy=0;
round=10;
%运行round 轮，采取k折交叉验证方法
for i=1:round
% [trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,100);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
mdl = fitcknn(trainData,trainLabel,'NumNeighbors',5,'Standardize',1);
[label,score,cost] = predict(mdl,testData);
testNum=size(testData,1);
accuracy =accuracy+sum(label==testLabel)/testNum;
end
accuracy=accuracy/round;
end

