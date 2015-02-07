#adaboost_decison_tree

使用 adaboost 方法训练模型，其中基分类器是决策树.

数据集使用 iris tic-tac-toe or glass，数据集存储在.mat文件中，这些数据相比原始的数据，做了行的随机置乱

验证使用了10折交叉验证的方法.

使用方法

  	adaBoostExample('mat 文件名').
使用目录下预置的数据，有 iris.mat,glass.mat,tic-tac-toe.mat. 

当然，你也可以使用自己的数据,只要将数据存在.mat文件中，measures变量存储属性的矩阵，labels存储类标号向量即可.
