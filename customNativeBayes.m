function [ accuracy] = customNativeBayes( inputData )
%��� accuracy ׼ȷ��.
%���� inputData �������ļ���.
accuracy=0;
round=100;
%����round �֣�ÿ�����ȡѵ�����Ͳ��Լ� �������ȡƽ��.
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
%��model ��ȡ�������
%���룺 model.
%�����  ������������ŵ�vector

%���������svm��.


end

