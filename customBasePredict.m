function [ labels ] = customBasePredict(measures,model )
%����������Ԥ�⺯��
%   mesures ���Ծ���   model Ԥ��ģ��.
% ���  labels: Ԥ������vector.

%������svmʵ�ֵĻ�������.
test_label=zeros(size(measures,1),1);
test_label(:,:)=model.Label(1);
[labels,ac,pp] = svmpredict(test_label,measures,model);


end

