function [ accuracy ] = customKnnClassify( inputData )
%用knn分类器处理数据
%返回值是在测试集上的准确度
%input是输入文件名.
[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,120);
mdl = fitcknn(trainData,trainLabel,'NumNeighbors',5,'Standardize',1);
[label,score,cost] = predict(mdl,testData);
[testNum,temp]=size(testData);
accuracy =sum(label==testLabel)/testNum;
end

