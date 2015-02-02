function [ trainData,trainLabel,testData,testLabel ] = getCrossSample( input,iterations,total )
%用交叉验证的方法抽样
%  输入：input 输入文件名  iterations 当前的轮数 范围是1到total ，total 总轮数.
% [measures,labels]=getData(input);
%假设原数据在mat文件中，measures是属性，labels是类标， .mat 文件中的数据相比原数据做了列的混淆置乱.
load(input);
dataSize=size(measures,1);
%每次抽取的样本大小.
sampleSize=floor(dataSize/total);
curSampleSize=sampleSize;
%对于样本数量不能整除总轮数的情况，最后一次要取走所有剩余的样本.
if(iterations==total)
    curSampleSize=curSampleSize+mod(dataSize,total);
end
%抽取测试集的下界和上界(不含).
lb=1+(iterations-1)*sampleSize;
ub=lb+curSampleSize;
%选择向量: 为true的那些位被选为测试数据.
testSelected=false(dataSize,1);
testSelected(lb:ub-1)=true;
testData=measures(testSelected,:);
testLabel=labels(testSelected,:);
trainData=measures(~testSelected,:);
trainLabel=labels(~testSelected,:);

end

function [measures,labels]=getData(input)
% 从文件获取属性还有 标号,此函数对上层屏蔽了具体输入数据的细节.
%输入：含有数据的文件名
%输出  measures :属性   labels： 标号

% %以下为读取鸢尾花数据的代码.
% [attrib1, attrib2, attrib3, attrib4, class] = textread(input, '%f%f%f%f%s', 'delimiter', ',');
% measures = [attrib1, attrib2, attrib3, attrib4];
% %数组总个数
% totalSize=size(measures,1);
% labels = zeros(totalSize, 1);
% labels(strcmp(class, 'Iris-setosa')) = 1;
% labels(strcmp(class, 'Iris-versicolor')) = 2;
% labels(strcmp(class, 'Iris-virginica')) = 3;

% 读取glass 数据.
% [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10, labels] = textread(input, '%f%f%f%f%f%f%f%f%f%f%f', 'delimiter', ',');
% measures = [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10];

%读取 tic tac toe 数据.
% [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9, labels] = textread(input, '%f%f%f%f%f%f%f%f%f%f', 'delimiter', ',');
%  measures = [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9];
% measureSize=size(measures,1);
% %随机置乱原数据，当原数据按类排列时对结果影响比较大.
%  permute=randsample(measureSize,measureSize);
%  measures=measures(permute,:);
%  labels=labels(permute);
%  save('tic-tac-toe','measures','labels');
end

