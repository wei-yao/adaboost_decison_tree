function [ accuracy] = customNativeBayes( inputData )
%��� accuracy ׼ȷ��.
%���� inputData �������ļ���.
%bayes����
accuracy=0;
round=100;
%����round �֣���ȡk�۽�����֤����
for i=1:round
% [trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,100);
[trainData,trainLabel,testData,testLabel]=getCrossSample(inputData,i,round);
 O1 = fitNaiveBayes(trainData,trainLabel);
%O1 = NaiveBayes.fit(trainData, trainLabel, 'Distribution', 'mn');
%O1 = fitNaiveBayes(trainData,trainLabel,'dist',{'normal','kernel','normal','kernel'}); 
C1 = O1.predict(testData);
%confusionMatrix = confusionmat(testLabel,C1);
[testNum,temp]=size(testData);
accuracy =accuracy+sum(C1==testLabel)/testNum;
end
accuracy=accuracy/round;
end




