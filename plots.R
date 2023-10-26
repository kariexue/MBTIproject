library(ggplot2);
source("simplifydf.R");

df2 <- read.csv("derived_data/new_mbti_df.csv", header=TRUE,sep=',');
plot1 <- ggplot(df2)+
  geom_boxplot(aes(pminor))+
  facet_wrap(~mbti)+
  ggtitle("Percent of minor chord in each MBTI's playlist");
saveRDS(plot1, file="figure_rds/plot1.rds");

plot2 <- ggplot(df2)+
  geom_histogram(aes(pminor,fill=type3))+
  facet_wrap(~type3,nrow=2)+
  ggtitle("Percent of minor chord: T vs F");
saveRDS(plot2, file="figure_rds/plot2.rds")

