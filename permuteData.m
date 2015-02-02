function  permuteData( input,output )
%随机置乱原数据并生成 .mat 文件.属性保存在 measures变量中，  标号 保存在 labels 变量中
% 输入 input ：输入文件名. output 输出文件名.
% 原数据相近的类标号一般在一块，所以打乱有利于抵消交叉验证的抽样误差
%iris
%以下为读取鸢尾花数据的代码.
[attrib1, attrib2, attrib3, attrib4, class] = textread(input, '%f%f%f%f%s', 'delimiter', ',');
measures = [attrib1, attrib2, attrib3, attrib4];
%数组总个数
totalSize=size(measures,1);
labels = zeros(totalSize, 1);
labels(strcmp(class, 'Iris-setosa')) = 1;
labels(strcmp(class, 'Iris-versicolor')) = 2;
labels(strcmp(class, 'Iris-virginica')) = 3;

% 读取glass 数据.
% [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10, labels] = textread(input, '%f%f%f%f%f%f%f%f%f%f%f', 'delimiter', ',');
% measures = [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10];

measureSize=size(measures,1);
%随机置乱原数据，当原数据按类排列时对结果影响比较大.
 permute=randsample(measureSize,measureSize);
 measures=measures(permute,:);
 labels=labels(permute);

 save(output,'measures','labels');

end

