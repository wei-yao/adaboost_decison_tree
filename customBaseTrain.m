function [ model ] = customBaseTrain( measures,labels )
%基分类器的训练器
%  mesures :属性矩阵，labels  标号
% 输出  ：model 训练结果模型
%以下是svm实现的基分类器.
model = svmtrain(labels,measures);
end
