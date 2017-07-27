library(dplyr)
library(Lahman)
library(hflights)
hflights_df<-tbl_df(hflights)
#filter,like subset 按给定的逻辑判断筛选出符合要求的子数据集, 类似于 base::subset() 函数
filter(hflights_df, Month == 1, DayofMonth == 1)
filter(hflights_df, Month == 1 | Month == 2)
#arrange 按给定的列名依次对行进行排序,对列名加 desc() 进行倒序:
arrange(hflights_df, DayofMonth, Month, Year)
arrange(hflights_df, desc(ArrDelay)) #descrease order
#select 用列名作参数来选择子数据集:还可以用 : 来连接列名, 没错, 就是把列名当作数字一样使用:用 - 来排除列名
select(hflights_df, Year, Month, DayOfWeek)
select(hflights_df, Year:DayOfWeek)
select(hflights_df, -(Year:DayOfWeek))
#mutate 对已有列进行数据运算并添加为新列:作用与 plyr::mutate() 相同, 与 base::transform() 相似, 优势在于可以在同一语句中对刚增加的列进行操作
mutate(hflights_df, 
       gain = ArrDelay - DepDelay, 
       speed = Distance / AirTime * 60)
mutate(hflights_df, 
       gain = ArrDelay - DepDelay, 
       gain_per_hour = gain / (AirTime / 60)
)
#summarise 对数据框调用其它函数进行汇总操作, 返回一维的结果
summarise(hflights_df, 
          delay = mean(DepDelay, na.rm = TRUE))
#分组动作 group_by() 以上5个动词函数已经很方便了, 但是当它们跟分组操作这个概念结合起来时, 那才叫真正的强大! 当对数据集通过 group_by() 
#添加了分组信息后,mutate(), arrange() 和 summarise() 函数会自动对这些 tbl 类数据执行分组操作 (R语言泛型函数的优势).
planes <- group_by(hflights_df, TailNum)
delay <- summarise(planes, 
                   count = n(), 
                   dist = mean(Distance, na.rm = TRUE), 
                   delay = mean(ArrDelay, na.rm = TRUE))
delay <- filter(delay, count > 20, dist < 2000)
ggplot(delay, aes(dist, delay)) + 
  geom_point(aes(size = count), alpha = 1/2) + 
  geom_smooth() + 
  scale_size_area()
Batting %>%
  group_by(playerID) %>%
  summarise(total = sum(G)) %>%
  arrange(desc(total)) %>%
  head(5)
