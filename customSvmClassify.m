function [ accuracy ] = customSvmClassify( inputData)
%用支持向量机分类 使用了Chih-Chung Chang and Chih-Jen Lin 的libsvm库
%inputData 为 输入文件名.
%魏尧  2015-01-30


accuracy=0;
round=10;
%运行round 轮，采取k折交叉验证方法
for i=1:round
%[train_data,trainLabel,test_data,test_label]=randomSelectData(inputData,100);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
model = svmtrain(trainLabel,trainData);
[predict,ac,pp] = svmpredict(testLabel,testData,model);
accuracy =accuracy+ac(1,1);
end
accuracy=accuracy/round;
end

