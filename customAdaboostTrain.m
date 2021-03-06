function [ models ] = customAdaboostTrain( measures,labels )
%输入 measures　属性   labels :标号；
%  输出： models：分类器属性的结构体数组.

%训练集大小.
sampleSize=size(measures,1);
round=50;
% the weight of the train data;
weight=ones(sampleSize,1)/sampleSize;
% 返回值.
models=struct;
for i=1:round
 while (true)
%sample data according to their weights
    sample=datasample(1:sampleSize,sampleSize,'Replace',true,'Weight',weight);
    sampleMeasures=measures(sample,:);
    sampleLabels=labels(sample,:);
trainModel=customBaseTrain(sampleMeasures,sampleLabels);
predictLabels=customBasePredict(measures,trainModel);
%[predictLabels,ac,pp] = svmpredict(labels,measures,trainModel);
originErrorRate=sum(predictLabels~=labels)/sampleSize;
errorRate=sum(weight(predictLabels~=labels,:));
%如果错误率大于1/2 就继续循环.
if errorRate<=0.5
   break; 
else
   weight=ones(sampleSize,1)/sampleSize; 
end
 end
 %防止errorRate 为0
alpha=1/2*log((1-errorRate)/max(errorRate,eps));
models(i).alpha=alpha;
models(i).model=trainModel;
models(i).errorRate=errorRate;
models(i).originEE=originErrorRate;
%更新样本weight
signs=ones(sampleSize,1);
signs(predictLabels==labels)=-1;
oldWeight=weight;
weight=weight.*exp(alpha.*signs);
weight=weight/sum(weight);
%test=sum((oldWeight>weight)-(predictLabels==labels));
%if(test>0)
%c=1;
%end
end
end








