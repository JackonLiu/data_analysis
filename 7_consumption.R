#对学生一卡通消费数据，分析学生消费情况；支持消费分布数据统计分析；
#如消费趋势对比，对消费进行预警，便于了解学生生活方式尤其是贫困生，并及时干预支持消费明细的查询。

consumption <- read.csv(file="E:\\documents\\数据挖掘\\data\\education_data\\7_consumption.csv",header = F,stringsAsFactors=FALSE, sep=",", encoding = "UTF-8")
head(consumption$锘緿ealTime.MonDeal.bf_StudentID.AccName)#显示前几项
summary(consumption$锘緿ealTime.MonDeal.bf_StudentID.AccName)#显示统计项
str(consumption)  
names(consumption) 

aver <- tapply(consumption[,"bf_StudentID"],consumption[,"MonDeal"], mean)

plot(aver,type='b',ylim=c(40,50),main="各班化学成绩平均分",xlab="班级",ylab="化学平均分")
plot(aver, type='b', ylim=c(10,100), main="Average Of Math In Class", xlab="Class", ylab="Average Of Math")
table(consumption[,"cla_id"],consumption[,"bas_id"])
