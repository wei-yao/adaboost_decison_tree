function [ model ] = customBaseTrain( measures,labels )
%����������ѵ����
%  mesures :���Ծ���labels  ���
% ���  ��model ѵ�����ģ��
%������svmʵ�ֵĻ�������.
%model = svmtrain(labels,measures);
model=fitctree(measures,labels);
end