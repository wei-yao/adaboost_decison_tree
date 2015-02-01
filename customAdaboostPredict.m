function [ labels ] = customAdaboostPredict( models,measures )
%用adaboost方法预测属性.
% 输入： models： daboost的训练结果,measures: 测试数据的属性.
% 输出：  labels:预测的分类.
alphas=[models.alpha];
labelClass=getLabelClass(models(1).model);
classSize=size(labelClass,1);
dataSize=size(measures,1);
% 基分类器的数量.
modelSize=size(models,2);

predictLabels=zeros(modelSize,1);
labels=zeros(dataSize,1);
for i=1:dataSize
    %对于每个数据，计算每个基分类器的类标.
    for j=1:modelSize
    predictLabels(j)=customBasePredict(measures(i,:),models(j).model);
    end
    for k=1:classSize
    scores(k)=dot(alphas,(predictLabels==labelClass(k)));
    end
    %寻找得分最高的类标.
    [temp,index]=max(scores);
    labels(i)=labelClass(index,:);
end
end

function [labelClass]=getLabelClass(model)
%从model 获取所有类别
%输入： model.
%输出：  model中包含的类别的vector

%以下针对libsvm 中训练的svm model
labelClass=model.Label;

end

