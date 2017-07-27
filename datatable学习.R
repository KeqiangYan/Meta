#data.table用法学习

#创建文件
name1 <- c("Bob","Mary","Jane","Kim")
name2 <- c("Bob","Mary","Kim","Jane")
weight <- c(60,65,45,55)
height <- c(170,165,140,135)
birth <- c("1990-1","1980-2","1995-5","1996-4")
accept <- c("no","ok","ok","no")
library(data.table)
dft <- data.table(name1,weight,height,accept)
#提取
# 提取点
dft[1,2] # 这里和data.frame是有区别的，这里返回的是一个data.table，而如果是data.frame则返回一个值
dft[[1,2]] # 返回一个值,data.table中drop不能用
dft[c(1,3),3]
dft[c(1,3),weight]
dft[c(1,3),"weight"]

# 提取行
dft[1] # 注意这里和基础的不一样，只接一个数是提取行
dft[1:2,] # 也可以加一个逗号

# 提取列
dft[,2] # 这里返回的是一个DT，与基础函数中的向量不同
dft[[3]] # 这样只接一个数时提取列，返回一个向量
dft[["weight"]] 
dft$weight # 以上都是返回一个向量

dft[,"weight"]
dft[,weight] # 注意区别，配合下面例子做出解释
dft[,c("weight","height")]
dft[,weight:accept] # 返回一个数据框

dft[,c(weight,height)]
# 如果使用字符串，则会输出数据框
# 如果直接使用列名表达式（没有括号的），则会输出向量；
# 如果取多列，则会自动把多列拼接成一个向量输出。
# 使用表达式就和使用功能$是一样的，这是数据的降维

# 如果想使用expression,而数据不降维，用list(weight)
dft[,list(weight)]
dft[,.(weight)] # .是list的简写
dft[,.(weight,accept)]
#当列名字符串放在一个变量中，想要使用这个变量进行提取时，因为data.table的[]提取时，可以接受一个不加引号的对象，所以会把这个表示列名的变量直接引用，这时需要使用with参数

dft <- data.table(name1,weight,height,accept)
name1 <- "weight"
dft[,name1] # 提取出来的是name1列
dft[,(name1)] # 提取出来的是name1列
dft[,name1,with=F] # 提取出来的是weight列
k <- "weight" # 如果使用的变量名不是dft中的列名
# dft[,k] # 报错，因为此处默认寻找变量名空间为这个dft
dft[,k,with=F] # 提取出来的是weight列
dft[[name1]] # 除了使用with参数，还可以这样
# dft[[weight]] # 报错，使用双括号时，是不允许直接使用变量名不加引号的

name1 <- c("Bob","Mary","Jane","Kim") # 不要干扰到后面的代码
#这里with参数其实相当于基础的with函数，当with=T时，就相当于基础函数使用了with函数，在这里面使用列名不需要data$，直接当成变量名就可以了，也就不用加引号，如果不想这样，想让使用的变量代表一个外面定义的字符串向量，则让with=F，相当于不使用with函数。

#提取习惯

#上面我们知道，提取时可以根据坐标位置或者列名，推荐使用的是列名，坐标位置虽然方便一些，但是当你的代码要给别人来读，或者给未来的你自己来读时，每次提取都要去找第5列是哪一列。除此之外，一旦列的顺序改变，我们的代码将会是错误的。所以应该在平时就养成习惯，使用列名来提取。

#根据逻辑值提取

# 根据逻辑值提取
dft[weight > 40] # 不需要dft$weight
dft[weight>40&height<170]
dft[dft$weight>40&dft$height<170]
dft[c(T,F,T,T)]
dft[,c(T,F,T,F)] # 列不可以根据逻辑值提取

# 使用on参数提取某一列是某一个值的行（相当于用逻辑值）
dft["Bob",on="name1"]
dft["Bob",on=.(name1)]
dft[name1=="Bob"] # 等价于用逻辑值筛选
dft[c("Bob","Mary"),on="name1"] # 一列选择多种
dft[!"Bob",on="name1"] # 一列剔除某类
dft[.("Bob",60),on=.(name1,weight)] # 按照多列查找

dft[.("Bob",c(55,60)),on=.(name1,weight)] # 找不到这样的行则创造一个满足这两列，其他列设为NA
dft[.("Bob",c(55,60)),on=.(name1,weight),nomatch=0] # 找不到也不返回缺失值
dft[.("Mary",c(65,55)),on=.(name1,weight),roll=-Inf] # 填充


提取的衍生物

删除
排序
删除行列

dft <- data.table(name1,weight,height,accept)
dft[-c(2,3)] # 删除第23行
dft[,-c(2,3)] # 删除第23列
dft[,c(2,3)] <- NULL;dft # 删除第23列

# 以下是基础函数没有的功能
dft[!2:3]
dft[,!"weight"]
dft[,-"weight"]
dft[,-c("weight","height")]
dft[,!c("weight","height")]
后面讲到添加列的时候还会讲到一种删除列的方法，这是涉及到特殊符号的

排序

dft <- data.table(name1,weight,height,accept)
dft[order(weight)] # 注意，不需要dft$weight
dft[order(weight),] # 加一个逗号指明排序针对行，相同效果
setcolorder(dft,rev(names(dft))) # 接受重新排列的列名将列排序
后面讲到key的时候还会有一种排序的方法

计算

DT中的计算也是在[]中完成的，包括分组也只是通过加了一个参数，这样做我们可以非常简单地一步实现基础函数或者其他包的很多步才能实现的功能。下面说一下data.table在计算方面的使用思路。在[]中接三个参数

第一个指定哪些行要加入计算
第二个指定要进行什么样的计算
第三个指定按照哪个变量来分组计算
普通计算

dft <- data.table(name1,weight,height,accept)
dft[,sum(weight)] # 在第二个参数位置指明要对那一列做什么样的操作
dft[,weight] # 这一条提取操作其实也可以看成是使用它本身输出，不进行其他计算
dft[,.(summary(weight),mean(weight))] # 计算多种用list，结果长度不相等时会循环显示
dft[,c(summary(weight),mean(weight))] # 用向量方式展示结果
dft[,.(wm=mean(weight),ws=sum(weight))] # 对同一列计算多种,并指定计算结果列名
dft[1:2,summary(weight)] # 对前两行的weight做描述性统计
dft["Bob", weight-10, on="name1"] # 筛选计算
第二个参数提供的平台还可以给其他数据框使用

w <- dft[,c("weight","accept")]
dft[,w[,sum(weight)],by=accept]
里面的w在计算，展示时虽然看起来按照accept分组，实际上计算结果没有按照by分组

输出结果为矩阵时

上面的计算中我们会发现，输出结果自动被整理成了DT数据框，但是如果我输出的内容是两个矩阵，这怎么转成数据框？如果不加其他处理，这里会自动将变成向量，每一个作为DT的一列展示出来，这样就失去了矩阵的意义。下面，我会使用两种方法来解决这个问题，它们涉及到在第二个参数的位置的特殊用法

使用{}配合<<-改变命名空间
使用嵌套list
普通用法

dft[,weight%*%t(weight)] # 只返回一个时
dft[,.(weight%*%t(weight),height%*%t(height))] # 返回两个，使用list，但会每个自动转换成向量
dft[,c(weight%*%t(weight),height%*%t(height))] # 使用c，就会全部都转换成一个向量
使用{}

# 使用大括号运行多条命令，不过只能返回最后一条结果，像函数的返回值一样
dft[,{weight%*%t(weight)
  height%*%t(height)}]
# 但是中间可以用print打印出来，不过只能展示，无法调用
dft[,{print(weight%*%t(weight))
  height%*%t(height)}]
# 如果再里面用 <- 赋值，变量在外面的环境中找不到，要用 <<- 才可以
dft[,{u1 <- weight%*%t(weight)
u2 <<- height%*%t(height)}]
# u1;u2 # u2可以调用,u1不可以
使用多层list嵌套的方法

(l <- dft[,.(.(weight%*%t(weight)),.(height%*%t(height)))])
l[[1]]
我们可以发现矩阵被list折叠到一个元素之中，可以通过索引调用，这一点data.frame就无法做到，下面解释在这一点上DF和DT的区别

ma <- cbind(1:3,1) # 一个矩阵
ma
data.frame(a=1,b=ma)
data.table(a=1,b=ma) # 和data.frame相同
data.frame(a=1,b=list(ma)) # 上面三个都返回的是3列的数据框
(d <- data.table(a=1,b=list(ma))) # 返回两列的，即data.table形式的数据框中的元素可以是list
d[[1,2]] # 虽然创建时将ma转化成了list,但是输出时仍是matrix

# 数据框中的list
#注意里面使用了I，使data.frame()把列表看作一个单元
df<-data.frame(x=1:3,y=I(list(1:2,1:3,1:4))) # 元素个数必须和行数相同
df
df$m <- list(1:4,3:5,5:6) # 这样建立不需要I
df$y # 这一整列是一个 list 
df$y[[1]][1]

dft1 <- data.table(x=1:3,y=list(list(1:2),list(1:3),list(1:4))) # 三个元素分别放在三行上
dft1[[1,2]]
dft2 <- data.table(x=1,y=list(list(list(1:2),list(1:3),list(1:4)))) # 变成一个元素，往外嵌套多少层都没问题
dft2[[1,2]]
df<-data.table(x=1:3,y=I(list(1:2,1:3,1:4))) # data.table 也可以像df一样使用
df
分组计算

dft <- data.table(name1,weight,height,accept)
dft[,sd(weight),by=accept]
dft[,sd(weight),keyby=accept] # 按照accept的顺序排列
dft[,sd(weight),by=accept][order(accept)] # 与上面等价
dft[,mean(weight),by=height>150] # 对计算之后的变量分组
按照多列分组

DT = data.table(x=rep(c("b","a","c"),each=6), y=c(1,3,6), v=1:18)
DT[,sum(v),by=x]
DT[,sum(v),by=y]
DT[,sum(v),by=.(x,y)]
DT[,sum(v),by=c("x","y")]
DT[,sum(v),by=.(x,y)][,sum(V1),by=x]

合并

这里只讲述merge形式的合并，直接拼接形式的合并非常简单，只是这个包改写了一个更快的函数，我们在后面会介绍

dt1 <- dft[1:3]
dt1
dt2 <- data.table(name1=name2[1:3],birth[1:3],friend=name1[c(2,4,3)])
dt2
dt1[dt2,on="name1"] # 按照相同列名融合两个数据框,保留dt2中name1的所有值
dt2[dt1,on="name1"] # 这里保留dt1的，dt2中没有的填上NA
dt2[dt1,on="name1",nomatch=0] # 取交叉部分
dt1[!dt2,on="name1"] # 取dt2没有的部分

dt1[dt2,on=.(name1==friend)] # 当要融合的内容列名不相同时，用==匹配在一起
dt1[dt2,on="name1==friend"] # 与上等价
# 如果融合依据是数字，还可以用<= >=等连接，将满足这个不等式的匹配在一起

dt1[dt2,.(name1,w=weight),on="name1==friend"] #在第二个参数的位置选择返回哪些列,同时修改列名
dt1[dt2,on="name1",mult="first"] # 选择每组的第一个（按照on分组，这里没有体现出来）
dt1[dt2,on="name1",mult="last"] # 选择每组的最后一个
# 加by=.EACHI和计算的参数还可以同时分组计算
暂时总结

根据我们数据处理的框架，上面内容缺少了如下内容

增添列，另外一种删除列的方法，修改数据框
计算或分组计算时，可不可以一次对所有列进行计算，而不需要再每一列都指定(.SD)
DT中可不可以按照行名来提取（key）
普通合并数据框（改进了的函数）
融合重铸
这些内容涉及到data.table的一些特殊用法，之后我会按照特殊用法的顺序来实现这些功能

专栏信息

专栏主页：Data Analysis（https://zhuanlan.zhihu.com/Data-AnalysisR）
专栏目录：目录（https://zhuanlan.zhihu.com/p/25780082）

文末彩蛋

这里介绍一下fix和edit两个函数的作用和区别。

当我们使用这两个函数作用在数据框上时，会出现一个窗口，我们用鼠标点击就可以对数据框进行修改，初学者可能会很喜欢用这个方便的方法，下面就介绍一下使用方法和二者的区别。

fix修改之后，改变的是原数据框
edit修改后原数据框未变，需要将修改后的结果赋值给一个新的变量
df <- data.frame(a=1:5,b=letters[1:5])
df
fix(df) # 点击直接修改，之后关闭窗口
df # 发现原数据框已经被改变

edit(df) # 点击直接修改，之后关闭窗口
df # 发现原数据框未被改变
df1 <- edit(df)
df;df1 # 原数据框未被改变,新数据框是改变之后的结果
但是为了操作可复制性，建议不要使用这两个函数。因为这样你的代码中没有显示你所做的全部修改，别人无法复制你的结果；同时，当你自己某一步出错需要重来，这样的鼠标操作还需要重来一次，莫不如之前就使用代码，一劳永逸。