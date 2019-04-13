#汇总各个科目历史考试成绩趋势，明确学生当前学科成绩分布特点以及未来成绩趋势。
#度量指标如原始分、得分率、标准分（Z以及T分）、全年级排名、全班排名、离均值等。

airquality <- read.csv(file="E:\\documents\\数据挖掘\\data\\education_data\\chengji.csv",sep=",",header=T,encoding = "UTF-8")
str(airquality)  
names(airquality) 

aver <- tapply(airquality[,"mes_Score"],airquality[,"mes_StudentID"], mean)
aver1 <- tapply(airquality[,"mes_T_Score"],airquality[,"mes_StudentID"], mean)
aver
plot(aver,type='b',ylim=c(-4,100),main="各班化学成绩平均分",xlab="班级",ylab="化学平均分")
plot(aver1, type='b', ylim=c(10,100), main="Average Of Math In Class", xlab="Class", ylab="Average Of Math")
table(airquality[,"cla_id"],airquality[,"bas_id"])


#画散点图
plot(airquality$MonDeal)
plot(airquality$MonDeal,airquality)

#箱线图
boxplot(airquality)#竖直放置
boxplot(airquality,horizontal=T)#水平放置

#直方图
hist(airquality$Temp)
hist(airquality$Temp,breaks=10)#手动定义区间段
hist(airquality$Temp,prob=T)#众轴变成比例

#密度图
plot(density(airquality$Temp))
hist(airquality$Temp,prob=T)
lines(density(airquality$Temp),col=3,lwd=4)

#柱状图
barplot(table(airquality$Month),col=rainbow(dim(table(airquality$Month))))
barplot(table(airquality$Month),col=rainbow(dim(table(airquality$Month))),horiz=T)

#饼图
pie(table(airquality$Month))

#图集
plot(airquality[,1:4])#方法1
pairs(airquality[,1:4])#方法2