library(ggplot2);
source("simplifydf.R");

df2 <- read.csv("derived_data/new_mbti_df.csv", header=TRUE,sep=',')
df2$type3 = ifelse(df2$type3==TRUE,"T","F");

plot1 <- ggplot(df2)+
  geom_boxplot(aes(pminor))+
  facet_wrap(~mbti,nrow=4)+
  xlab("Percent distribution of minor chords");
saveRDS(plot1, file="figure_rds/plot1.rds");

plot2 <- ggplot(df2)+
  geom_histogram(aes(pminor,fill=type3))+
  facet_wrap(~type3,nrow=2)+
  theme(legend.position = "none");
saveRDS(plot2, file="figure_rds/plot2.rds");
