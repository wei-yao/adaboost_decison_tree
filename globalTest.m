function [ results ] = globalTest( inputData )
%����������ݼ����ж�������Ĳ���
%   results Ԥ�����Ľṹ�壬�����������ƺ;�ȷ��.
% ���룺 inputData Դ�����ļ�.
results=struct;
load(inputData);
measureSize=size(measures,1);
labelsSize=size(labels,1);
if(measureSize==0||labelsSize==0)
    disp('Դ���ݸ�ʽ����ȷ����ȷ�������ļ��к��� measures ��labels����!');
    return;
end
results(1).method='adaboost';
results(1).accuracy=adaBoostExample(inputData);
results(2).method='svm';
results(2).accuracy=customSvmClassify(inputData);
results(3).method='decision tree';
results(3).accuracy=customDecisionTree(inputData);
results(4).method='knn';
results(4).accuracy=customKnnClassify(inputData);
results(5).method='nativeBayes';
%��glass���ݼ�����Ҫע�͵���һ��.
results(5).accuracy=customNativeBayes(inputData);



end

