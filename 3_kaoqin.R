#加载数据集
library(arules)
xingge <- read.csv(file="E:\\documents\\数据挖掘\\data\\education_data\\3_kaoqin.csv",header=T)
head(xingge)#显示前几项
summary(xingge)#显示统计项
str(xingge)  
names(xingge) 
mode(xingge)
#均值  
mean(xingge[,"control_task_order_id"])
table(xingge$control_task_order_id)
table(xingge$bf_studentID)
bf_studentID=xingge[,"bf_studentID"]
control_task_order_id=xingge[,'control_task_order_id']
#求比例
mean(xingge$control_task_order_id=='100000')
sum(xingge$control_task_order_id=='100000') / length(xingge$control_task_order_id)
is.na(xingge$control_task_order_id)             #检验缺失值
mean(is.na(xingge$control_task_order_id))   #查看缺失值占比

plot(bf_studentID,control_task_order_id,type='b', main="考勤情况",xlab="学生", ylab="考勤比例")

rules=apriori(xingge,parameter=list(support=0.3,confidence=0.4))
summary(rules)
frequentsets=eclat(xingge,parameter=list(support=0.3,maxlen=10))
inspect(frequentsets[1:10])
