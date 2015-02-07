function [ accuracy ] = adaBoostExample( data )
%��adaboost ����ѵ��ģ�ͣ�����k�۽�����֤�ķ�������.
%   ���룺data�����������ݵ��ļ�����.mat�ļ�����
%  ����� accuracy ���Լ��ϵ�׼ȷ��.
accuracy=0;
round=10;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
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

