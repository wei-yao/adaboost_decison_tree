function [ accuracy ] = adaBoostExample( data )
%����iris���ݼ����� adaboost����.
%   ���룺data�����������ݵ��ļ�����
%  ����� accuracy ���Լ��ϵ�׼ȷ��.
accuracy=0;
round=10;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
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

