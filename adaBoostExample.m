function [ accuracy ] = adaBoostExample( data )
%用adaboost 方法训练模型，并用k折交叉验证的方法检验.
%   输入：data　包含有数据的文件名（.mat文件）．
%  输出： accuracy 测试集上的准确率.
accuracy=0;
round=10;
%运行round 轮，每轮随机取训练集和测试集 ，最后结果取平均.
for i=1:round
%[train_data,train_label,test_data,test_label]=randomSelectData(data,850);
[trainData,trainLabel,testData,testLabel]=getCrossSample(data,i,round);
models=customAdaboostTrain(trainData,trainLabel);
labels=customAdaboostPredict(models,testData);
accuracy=accuracy+sum(labels==testLabel)/size(testData,1);
%errors=[models.errorRate];
%plot(errors);
end
accuracy=accuracy/round;
end

