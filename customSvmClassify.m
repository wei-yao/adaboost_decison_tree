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
round=10;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
for i=1:round
%[train_data,trainLabel,test_data,test_label]=randomSelectData(inputData,100);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
model = svmtrain(trainLabel,trainData);
[predict,ac,pp] = svmpredict(testLabel,testData,model);
accuracy =accuracy+ac(1,1);
end
accuracy=accuracy/round;
end

