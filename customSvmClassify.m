function [ accuracy ] = customSvmClassify( inputData)
%��֧������������,�����ȡ120������ѵ����ÿ�ν�����ܲ�һ��.
%inputData Ϊ �����ļ���.
%��������Ϊ�β������.
%κҢ  2015-01-30


%test_label = a([41:50 91:100 141:150],end);
%test_data = attrib([41:50 91:100 141:150],1:end);
%train_data = attrib([1:40 51:90 101:140],1:end);
%test_label = a([41:50 91:100 141:150],end);
%test_data = attrib([41:50 91:100 141:150],1:end);
accuracy=0;
round=100;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
for i=1:round
[train_data,train_label,test_data,test_label]=randomSelectData(inputData,100);
model = svmtrain(train_label,train_data);
[predict,ac,pp] = svmpredict(test_label,test_data,model);
accuracy =accuracy+ac(1,1);
end
accuracy=accuracy/round;
end

