function [ accuracy ] = adaBoostExample( data )
%运用iris数据集测试 adaboost方法.
%   输入：data　包含有数据的文件名．
%  输出： accuracy 测试集上的准确率.
accuracy=0;
round=10;
%运行round 轮，每轮随机取训练集和测试集 ，最后结果取平均.
for i=1:round
[train_data,train_label,test_data,test_label]=randomSelectData(data,150);
models=customAdaboostTrain(train_data,train_label);
labels=customAdaboostPredict(models,test_data);
accuracy=accuracy+sum(labels==test_label)/size(test_data,1);
%errors=[models.errorRate];
%plot(errors);
end
accuracy=accuracy/round;
end

