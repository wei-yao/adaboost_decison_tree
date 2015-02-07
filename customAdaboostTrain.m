function [ models ] = customAdaboostTrain( measures,labels )
%输入 measures　属性   labels :标号；
% 输出： models：分类器属性的结构体数组.
%使用adaBoost方法训练分类器
%训练集大小.
sampleSize=size(measures,1);
%训练轮数.
round=50;
% the weight of the train data;
weight=ones(sampleSize,1)/sampleSize;
% 返回值.
models=struct;
for i=1:round
 while (true)
%sample data according to their weights with replacement
    sample=datasample(1:sampleSize,sampleSize,'Replace',true,'Weight',weight);
    sampleMeasures=measures(sample,:);
    sampleLabels=labels(sample,:);
%用基分类器训练并预测.
trainModel=customBaseTrain(sampleMeasures,sampleLabels);
predictLabels=customBasePredict(measures,trainModel);
%非加权的错误率.
originErrorRate=sum(predictLabels~=labels)/sampleSize;
errorRate=sum(weight(predictLabels~=labels,:));
%如果错误率大于1/2 就重新分配权值,并继续循环.
if errorRate<=0.5
   break; 
else
   weight=ones(sampleSize,1)/sampleSize; 
end
 end
 %errorRate 为0时分母使用eps
alpha=1/2*log((1-errorRate)/max(errorRate,eps));
models(i).alpha=alpha;
models(i).model=trainModel;
models(i).errorRate=errorRate;
models(i).originEE=originErrorRate;
%更新样本weight
signs=ones(sampleSize,1);
signs(predictLabels==labels)=-1;
weight=weight.*exp(alpha.*signs);
weight=weight/sum(weight);
end
end








