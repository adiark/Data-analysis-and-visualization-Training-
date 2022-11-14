library(reshape2)
library(dplyr)

paths= list("C:\\Users\\Aditya Jain\\Desktop\\Trainee\\Week 3\\Day 3_Nitish\\Assignment\\Problem\\ABC High School","C:\\Users\\Aditya Jain\\Desktop\\Trainee\\Week 3\\Day 3_Nitish\\Assignment\\Problem\\XYZ County")
s1 <- data.frame()
for (j in paths){
setwd(j)
name_files <- list.files()



for (i in name_files){
  split1 <-  strsplit(i,"-")
  s2 <- read.csv(i,header = T)
  s2 <- s2[,which(names(s2) %in% c("Type","Amount"))]
  s2 <- s2[!(s2$Type==""| s2$Type=="Total"),]
  s2$Category <-  substring(split1[[1]][1],1,regexpr(pattern = "ABC|XYZ",split1[[1]][1])-2)
  s2$Customer_Id <-  gsub("[a-zA-z]","",split1[[1]][2])
  s2$Invoice <-  gsub("[a-zA-z]","",split1[[1]][3])
  s2$Customer <-  substring(split1[[1]][1], regexpr(pattern = "ABC|XYZ",split1[[1]][1]))
  s2$Date <- as.Date(strptime(split1[[1]][4], "%m%d%Y"))
  s1 <- rbind(s1,s2)
}
}
View(s1)