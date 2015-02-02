function  permuteData( input,output )
%�������ԭ���ݲ����� .mat �ļ�.���Ա����� measures�����У�  ��� ������ labels ������
% ���� input �������ļ���. output ����ļ���.
% ԭ�������������һ����һ�飬���Դ��������ڵ���������֤�ĳ������
%iris
%����Ϊ��ȡ�β�����ݵĴ���.
[attrib1, attrib2, attrib3, attrib4, class] = textread(input, '%f%f%f%f%s', 'delimiter', ',');
measures = [attrib1, attrib2, attrib3, attrib4];
%�����ܸ���
totalSize=size(measures,1);
labels = zeros(totalSize, 1);
labels(strcmp(class, 'Iris-setosa')) = 1;
labels(strcmp(class, 'Iris-versicolor')) = 2;
labels(strcmp(class, 'Iris-virginica')) = 3;

% ��ȡglass ����.
% [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10, labels] = textread(input, '%f%f%f%f%f%f%f%f%f%f%f', 'delimiter', ',');
% measures = [attrib1, attrib2, attrib3, attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10];

measureSize=size(measures,1);
%�������ԭ���ݣ���ԭ���ݰ�������ʱ�Խ��Ӱ��Ƚϴ�.
 permute=randsample(measureSize,measureSize);
 measures=measures(permute,:);
 labels=labels(permute);

 save(output,'measures','labels');

end

