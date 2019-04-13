#加载数据集
airquality <- read.csv(file="E:\\documents\\数据挖掘\\data\\education_data\\1_teacher.csv",sep=",",stringsAsFactors=FALSE,header=T, encoding = "UTF-8")
head(airquality)#显示前几项
summary(airquality)#显示统计项
str(airquality)  
names(airquality) 
#attach(airquality)
#选择某行，求一个学生总分
teacher_id = airquality[,"bas_id"]
term  = airquality[,"锘縯erm"]
cla_id <- airquality[,'cla_id']
sub_id <- airquality[,'sub_id']
cust_all_fnl = data.frame(teacher_id,term,cla_id,sub_id)
head(cust_all_fnl)
plot(sub_id,teacher_id, main="老师上课情况",xlab="老师id", ylab="课程id")

# 如果数据集中的变量过多,要先使用主成分分析找到影响因子在95%以上的列即可
# 选择K使得差异最小，下降幅度最小
comp = scale(cust_all_fnl[,3])

wss <- (nrow(comp)-1)*sum(apply(comp,2,var))

for (i in 2:15) wss[i] <- sum(kmeans(comp,centers=i)$withinss)
plot(1:15, wss, type="b", xlab="簇的数量",ylab="组内平方和")
 
library('cluster')
library('fpc') 
# 如果数据量较大,首先应对数据进行抽样,然后在找中心点
s = sample(1:dim(cust_all_fnl)[1],2000,replace = F)
clus = 4
medk = pam(scale(cust_all_fnl[s,3]),clus,trace=T)
plotcluster(scale(cust_all_fnl[s,3]),medk$clustering)
table(medk$clustering)
Kcenter = medk$medoids
# 每次抽取1000个点进行聚类
k = kmeans(scale(cust_all_fnl[,3]),centers = Kcenter,nstart = 25,iter.max = 1000)
plotcluster(scale(cust_all_fnl[,3]),k$cluster)

# 对每个变量求均值
mydata_mean_sd = aggregate(scale(cust_all_fnl[,3]),by=list(k$cluster),FUN=mean)
head(mydata_mean_sd)

# 写入到csv文件
write.csv(mydata_mean_sd,'E:\\documents\\数据挖掘\\data\\education_data\\mydata_mean_sd.csv')
