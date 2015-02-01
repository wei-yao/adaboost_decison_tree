function [ labels ] = customAdaboostPredict( models,measures )
%��adaboost����Ԥ������.
% ���룺 models�� daboost��ѵ�����,measures: �������ݵ�����.
% �����  labels:Ԥ��ķ���.
alphas=[models.alpha];
labelClass=getLabelClass(models(1).model);
classSize=size(labelClass,1);
dataSize=size(measures,1);
% ��������������.
modelSize=size(models,2);

predictLabels=zeros(modelSize,1);
labels=zeros(dataSize,1);
for i=1:dataSize
    %����ÿ�����ݣ�����ÿ���������������.
    for j=1:modelSize
    predictLabels(j)=customBasePredict(measures(i,:),models(j).model);
    end
    for k=1:classSize
    scores(k)=dot(alphas,(predictLabels==labelClass(k)));
    end
    %Ѱ�ҵ÷���ߵ����.
    [temp,index]=max(scores);
    labels(i)=labelClass(index,:);
end
end

function [labelClass]=getLabelClass(model)
%��model ��ȡ�������
%���룺 model.
%�����  model�а���������vector

%�������libsvm ��ѵ����svm model
labelClass=model.Label;

end

