library(dplyr);
library(ggplot2);
library(reshape2);
source("simplifydf.R");
source("PCA.R");

plot_cluster <- ggplot(results$x %>% as_tibble(), aes(PC1,PC2)) + 
  geom_point(alpha=0.3,size=0.8)+
  geom_rect(inherit.aes = FALSE, data=tibble(
    xmin = c(-2, 0.5),  # X-coordinate of the left side of the rectangle
    xmax = c(0, 3),  # X-coordinate of the right side of the rectangle
    ymin = c(-1,-1.5),  # Y-coordinate of the bottom side of the rectangle
    ymax = c(1,0.5)),   # Y-coordinate of the top side of the rectangle),
    mapping=aes(xmin=xmin, ymin=ymin,
                xmax=xmax, ymax=ymax),
    fill="yellow",
    alpha=0.25)+
  theme(legend.position = "none")+
  ggtitle("Selecting two clusters in the PCA plot");
saveRDS(plot_cluster, file="figure_rds/plot_cluster.rds");

df3 = as.data.frame(results$x) %>% select(PC1, PC2)
df3$trial <- seq(nrow(df3));
df2$trial <- seq(nrow(df2));
s1 <- df3 %>% filter(PC1 >= -2 & PC1 <= 0 &
                       PC2 >= -1 & PC2 <= 1) %>% mutate(label="Box 1");
s2 <- df3 %>% filter(PC1 >= 0.5 & PC1 <= 3 &
                       PC2 >= -1.5 & PC2 <= 0.5) %>% mutate(label="Box 2");

s <- rbind(s1 %>% head(100),s2 %>% head(100));

traces <- df2 %>% inner_join(s, by="trial");


label_names <- list(
  'danceability_mean'="Danceability",
  'energy_mean'="Energy",
  'mode_mean'="Mode",
  'speechiness_mean'="Speechiness",
  'acousticness_mean'="Acousticness",
  'liveness_mean'="Liveness",
  'valence_mean'="Valence",
  'instrumentalness_mean'="Instrumentalness",
  'pminor'="Minor chords(%)"
)

music_labeller <- function(variable,value){
  return(label_names[value])
}

df2$dtset <- "original";
traces$dtset <- "clusters";
trace2 <- traces %>% select(-PC1,-PC2,-label,-loudness_mean,-tempo_mean,-trial);
df3 <- df2 %>% select(-loudness_mean,-tempo_mean,-trial);
combined <- rbind(df3, trace2);
meltdf <- melt(combined, id.var="dtset");
plot_cl1<-ggplot(meltdf,aes(value)) + 
  geom_density(aes(fill=dtset),alpha=0.5)+
  facet_wrap(~variable,labeller=music_labeller)+
  xlab("Music features")+
  ylab("Density distributions")+
  ggtitle("Comparing the distributions for Original vs Clustered data")+
  labs(fill = "Datasets");
saveRDS(plot_cl1,file="figure_rds/plot_cl1.rds");

trace4 <- traces %>% select(-trial,-PC1,-PC2,-loudness_mean,-tempo_mean,-dtset);
meltdf3 <- melt(trace4, id.var="label");
plot_cl2 <-ggplot(meltdf3,aes(value)) +
  geom_density(aes(fill=label),alpha=0.5)+
  facet_wrap(~variable,labeller=labeller(variable=music_labeller))+
  xlab("Music features")+
  ylab("Density distributions")+
  ggtitle("Comparing the distributions for the two Clusters")+
  labs(fill = "Clusters"); 
saveRDS(plot_cl2, file="figure_rds/plot_cl2.rds")
