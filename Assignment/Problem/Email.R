library(reshape2)
library(dplyr)


setwd("C:\\Users\\Aditya Jain\\Desktop\\Trainee\\Week 3\\Day 3_Nitish\\Assignment\\Problem\\ABC High School")
name_files <- list.files()
s1 <- data.frame()


for (i in name_files){
split1 <-  strsplit(i,"-")
s2 <- read.csv(i,header = T, stringsAsFactors = FALSE)
s2 <- s2[,which(names(s2) %in% c("Type","Amount"))]
s2 <- s2[!(s2$Type==""| s2$Type=="Total"),]
s2$Category <-  substring(split1[[1]][1],1,regexpr("ABC",split1[[1]][1])-2)
s2$Customer_Id <-  gsub("[a-zA-z]","",split1[[1]][2])
s2$Invoice <-  gsub("[a-zA-z]","",split1[[1]][3])
s2$Customer <-  substring(split1[[1]][1], regexpr("ABC",split1[[1]][1]))
s2$Date <- as.Date(strptime(split1[[1]][4], "%m%d%Y"))
s1 <- rbind(s1,s2)
}

setwd("C:\\Users\\Aditya Jain\\Desktop\\Trainee\\Week 3\\Day 3_Nitish\\Assignment\\Problem\\XYZ County")
name_files <- list.files()


for (i in name_files){
  split1 <-  strsplit(i,"-")
  s2 <- read.csv(i,header = T, stringsAsFactors = FALSE)
  s2 <- s2[,which(names(s2) %in% c("Type","Amount"))]
  s2 <- s2[!(s2$Type==""| s2$Type=="Total"),]
  s2$Category <-  substring(split1[[1]][1],1,regexpr("XYZ",split1[[1]][1])-2)
  s2$Customer_Id <-  gsub("[a-zA-z]","",split1[[1]][2])
  s2$Invoice <-  gsub("[a-zA-z]","",split1[[1]][3])
  s2$Customer <-  substring(split1[[1]][1], regexpr("XYZ",split1[[1]][1]))
  s2$Date <- as.Date(strptime(split1[[1]][4], "%m%d%Y"))
  s1 <- rbind(s1,s2)
}


s1$Location <- ifelse(grepl("Location",s1$Type),'inside', 'outside')
j <- 0
for (i in s1$Location){
  j <- j+1
  if (i=="inside"){
    temp <- s1[[1]][j]
    s1[[8]][j] <-  temp
  }
  else 
    s1[[8]][j] <- temp
  }

s1 <-  s1[!(s1$Amount==""),]

View(s1)

write.csv(s1,"C:\\Users\\Aditya Jain\\Desktop\\Trainee\\Week 3\\Day 3_Nitish\\Assignment\\Problem\\Email_data.csv", row.names = FALSE)