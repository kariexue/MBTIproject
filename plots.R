library(ggplot2);
source("simplifydf.R");

df2 <- read.csv("derived_data/new_mbti_df.csv", header=TRUE,sep=',')
df2$type3 = ifelse(df2$type3==TRUE,"T","F");

plot0 <- ggplot(df)+
geom_bar(aes(mbti,fill=mbti))+
  theme(legend.position = "none")+
  ylab("Count of playlists")+
  xlab("MBTI Type")+
  ggtitle("Total number of playlists includes in this dataset");
saveRDS(plot0, file="figure_rds/plot0.rds");

plot1 <- ggplot(df2)+
  geom_boxplot(aes(pminor))+
  facet_wrap(~mbti,nrow=4)+
  xlab("Percent distribution")+
  ylab("MBTI types")+
  ggtitle("Minor chord proportion in the playlists by MBTI type");
saveRDS(plot1, file="figure_rds/plot1.rds");

plot2 <- ggplot(df2)+
  geom_histogram(aes(pminor,fill=type3))+
  facet_wrap(~type3,nrow=2)+
  theme(legend.position = "none")+
  xlab("Percent distribution")+
  ylab("Count of playlists")+
  ggtitle("Proportion distribution of minor chords by T/F type");
saveRDS(plot2, file="figure_rds/plot2.rds")


