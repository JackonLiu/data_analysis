student_info <- read.csv(file="E:\\documents\\数据挖掘\\data\\education_data\\2_student_info.csv",header = F,stringsAsFactors=FALSE, sep=",", encoding = "UTF-8")
#去掉不需要的列
#selectresult=subset(x,select=c(-bf_Name))

head(student_info,n=5)

str(student_info)
names(student_info) 

bf_BornDate<-student_info[,"bf_sex"]
sort(bf_BornDate)
qinshihao<-student_info[,"bf_zhusu"]

bf_NativePlace<-student_info[,"bf_BornDate"]
cla_id<-student_info[8]
student_info[8]
## 降序
order(cla_id)

for(i in 1:nrow(x))
{
  s[i]<-x[which(cla_id!=2018-2019-1),]
}
#noNegs<- subset(student_info,student_info[8]=='2018-2019-1')
s
cor(s)
cor(x,y,use="pairwise.complete.obs")

num_ninbo=sum(student_info$bf_BornDate=='宁波')
num_zhejiang=sum(student_info$bf_BornDate=='浙江省宁波')



#柱状图
#生源地分布
barplot(table(student_info$bf_BornDate),col=rainbow(dim(table(student_info$bf_BornDate))))
#出生年份分布
barplot(table(student_info$bf_sex),col=rainbow(dim(table(student_info$bf_sex))))
#每个班级人口数量

library(sqldf)
sqldf("select* from mtcars where am=1 and vs=1") 
barplot(table(cla_id),col=rainbow(dim(table(cla_id))))
#每个寝室人口数量
barplot(table(student_info$bf_zhusu),col=rainbow(dim(table(student_info$bf_zhusu))))

#出生年份分布饼图
pie(table(student_info$bf_sex))

plot(num_nan,num_nv,type='b',ylim=c(40,50),main="各班化学成绩平均分",xlab="班级",ylab="化学平均分")

