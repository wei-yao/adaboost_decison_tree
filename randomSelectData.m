function [ trainData,trainLabel,testData,testLabel ] = randomSelectData(input, num )
%从iris数据集随机抽取num个数据做trainData
%input 输入文件   num trainData 大小
[attrib1, attrib2, attrib3, attrib4, class] = textread(input, '%f%f%f%f%s', 'delimiter', ',');
attrib = [attrib1, attrib2, attrib3, attrib4];
%数组总个数
totalSize=150;
%训练数据个数
trainSize=num;
%测试数据个数.
testSize=totalSize-trainSize;
sample=randsample(totalSize,trainSize);
trainSelect=false(150,1);
testSelect=true(150,1);
%为true的那些位置的数据被选作训练集.
trainSelect(sample)=true;
testSelect(sample)=false;
a = zeros(150, 1);
a(strcmp(class, 'Iris-setosa')) = 1;
a(strcmp(class, 'Iris-versicolor')) = 2;
a(strcmp(class, 'Iris-virginica')) = 3;
trainLabel=a(trainSelect,:);
trainData = attrib(trainSelect,1:end);
testLabel=a(testSelect,:);
testData=attrib(testSelect,:);
end

