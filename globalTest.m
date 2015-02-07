function [ results ] = globalTest( inputData )
%对输入的数据及进行多个方法的测试
%   results 预测结果的结构体，包含方法名称和精确度.
% 输入： inputData 源数据文件.
results=struct;
load(inputData);
measureSize=size(measures,1);
labelsSize=size(labels,1);
if(measureSize==0||labelsSize==0)
    disp('源数据格式不正确，请确认数据文件中含有 measures 和labels变量!');
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
%跑glass数据集，需要注释掉这一行.
results(5).accuracy=customNativeBayes(inputData);



end

