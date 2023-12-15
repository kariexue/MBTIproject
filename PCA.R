library(dplyr);
library(ggplot2);
source("simplifydf.R");

df <- read.csv2("derived_data/new_mbti_df.csv",header=TRUE,sep=",");
df$type3 <- ifelse(df$type3==TRUE,"T","F");
na.rows <- which(rowSums(is.na(df)) > 0);
df <- df[-na.rows,];
df2 <- df[,c(9:19)];
df2 <- as.data.frame(sapply(df2,as.numeric));

results <- prcomp(df2 %>% as.matrix(),
                  center=T, scale=T);
plot_PCA <- ggplot(results$x %>% as_tibble(), aes(PC1,PC2)) + 
  geom_point(aes(color=factor(df$type1)))+
  labs(color = "MBTI")+
  ggtitle("Principal Component Analysis by E/I type");
saveRDS(plot_PCA, file="figure_rds/plot_PCA.rds")