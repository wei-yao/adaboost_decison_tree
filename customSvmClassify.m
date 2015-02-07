function [ accuracy ] = customSvmClassify( inputData)
%��֧������������ ʹ����Chih-Chung Chang and Chih-Jen Lin ��libsvm��
%inputData Ϊ �����ļ���.
%κҢ  2015-01-30


accuracy=0;
round=10;
%����round �֣���ȡk�۽�����֤����
for i=1:round
%[train_data,trainLabel,test_data,test_label]=randomSelectData(inputData,100);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
model = svmtrain(trainLabel,trainData);
[predict,ac,pp] = svmpredict(testLabel,testData,model);
accuracy =accuracy+ac(1,1);
end
accuracy=accuracy/round;
end

