weather <- c("Good", "Good", "Good", "Bad", "Bad","Good",'Bad','GOOD')
golf <- c("Yes","No","Yes","No","Yes","Yes",'Yes','Yes')
df <- data.frame(weather, golf) #Training dataset

df[] <- lapply(df, factor) #changing df to factor variables
df_new <- data.frame(weather = "Good")
df_new1 <- data.frame(weather = df$weather[nrow(df)]) 
df_new2 <- data.frame(weather = factor("Good", levels = levels(df$weather)))

library(e1071)
model <- naiveBayes(golf ~.,data=df)
predict(model, df_new, type ="class")
predict(model, df_new1)
lapply(c(df_new, df_new1, df_new2), levels)

