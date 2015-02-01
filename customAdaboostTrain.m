function [ models ] = customAdaboostTrain( measures,labels )
%���� measures������   labels :��ţ�
%  ����� models�����������ԵĽṹ������.

%ѵ������С.
sampleSize=size(measures,1);
round=50;
% the weight of the train data;
weight=ones(sampleSize,1)/sampleSize;
% ����ֵ.
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
%��������ʴ���1/2 �ͼ���ѭ��.
if errorRate<=0.5
   break; 
else
   weight=ones(sampleSize,1)/sampleSize; 
end
 end
 %��ֹerrorRate Ϊ0
alpha=1/2*log((1-errorRate)/max(errorRate,eps));
models(i).alpha=alpha;
models(i).model=trainModel;
models(i).errorRate=errorRate;
models(i).originEE=originErrorRate;
%��������weight
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







