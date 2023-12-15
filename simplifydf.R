df <- read.csv("mbti_df.csv", header=TRUE,sep=',');
df[,3:ncol(df)] <- lapply(df[,3:ncol(df)],as.numeric);
df$type1 <- substring(df$mbti,1,1);
df$type2 <- substring(df$mbti,2,2);
df$type3 <- substring(df$mbti,3,3);
df$type4 <- substring(df$mbti,4,4);
majors <- df[, grepl("Major", names(df))];
df$majorcount <- rowSums(majors);
minors <- df[, grepl("minor", names(df))];
df$minorcount <- rowSums(minors);

df2 <- cbind(df[,1:2],df[,47:52],df[, grepl("mean", names(df))]);
df2$pminor = df2$minorcount / (df2$majorcount+df2$minorcount);
write.csv(df2,file="derived_data/new_mbti_df.csv",row.names = FALSE)
