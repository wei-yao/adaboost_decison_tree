function [ accuracy ] = customKnnClassify( inputData )
%��knn��������������
%����ֵ���ڲ��Լ��ϵ�׼ȷ��
%input�������ļ���.
[trainData,trainLabel,testData,testLabel]=randomSelectData(inputData,120);
mdl = fitcknn(trainData,trainLabel,'NumNeighbors',5,'Standardize',1);
[label,score,cost] = predict(mdl,testData);
[testNum,temp]=size(testData);
accuracy =sum(label==testLabel)/testNum;
end

