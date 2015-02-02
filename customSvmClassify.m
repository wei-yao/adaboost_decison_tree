function [ accuracy ] = customSvmClassify( inputData)
%用支持向量机分类,随机抽取120个样本训练，每次结果可能不一样.
%inputData 为 输入文件名.
%测试数据为鸢尾花数据.
%魏尧  2015-01-30


%test_label = a([41:50 91:100 141:150],end);
%test_data = attrib([41:50 91:100 141:150],1:end);
%train_data = attrib([1:40 51:90 101:140],1:end);
%test_label = a([41:50 91:100 141:150],end);
%test_data = attrib([41:50 91:100 141:150],1:end);
accuracy=0;
round=10;
%运行round 轮，每轮随机取训练集和测试集 ，最后结果取平均.
for i=1:round
%[train_data,trainLabel,test_data,test_label]=randomSelectData(inputData,100);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
model = svmtrain(trainLabel,trainData);
[predict,ac,pp] = svmpredict(testLabel,testData,model);
accuracy =accuracy+ac(1,1);
end
accuracy=accuracy/round;
end

