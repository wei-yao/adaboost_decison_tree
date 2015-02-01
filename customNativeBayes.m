function [ accuracy] = customNativeBayes( inputData )
%输出 accuracy 准确度.
%输入 inputData ：输入文件名.
accuracy=0;
round=100;
%运行round 轮，每轮随机取训练集和测试集 ，最后结果取平均.
for i=1:round
[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,100);
O1 = fitNaiveBayes(trainData,trainLabel);
%O1 = fitNaiveBayes(trainData,trainLabel,'dist',{'normal','kernel','normal','kernel'}); 
C1 = O1.predict(testData);
%confusionMatrix = confusionmat(testLabel,C1);
[testNum,temp]=size(testData);
accuracy =accuracy+sum(C1==testLabel)/testNum;
end
accuracy=accuracy/round;
end


function [labelClass]=getLabelClass(model)
%从model 获取所有类别
%输入： model.
%输出：  包含所有类别标号的vector

%以下是针对svm的.


end

