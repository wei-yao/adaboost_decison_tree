function [ labels ] = customBasePredict(measures,model )
%基分类器的预测函数
%   mesures 属性矩阵   model 预测模型.
% 输出  labels: 预测属性vector.

%以下是svm实现的基分类器.
test_label=zeros(size(measures,1),1);
test_label(:,:)=model.Label(1);
[labels,ac,pp] = svmpredict(test_label,measures,model);


end

