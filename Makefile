PHONY: clean

clean:
	rm derived_data/*
	rm figure_rds/*
	rm mbtiproject.pdf

derived_data/new_mbti_df.csv: mbti_df.csv
	Rscript simplifydf.R

figure_rds/plot0.rds: simplifydf.R derived_data/new_mbti_df.csv
	Rscript plots.R
	
figure_rds/plot1.rds: simplifydf.R derived_data/new_mbti_df.csv
	Rscript plots.R
	
figure_rds/plot2.rds: simplifydf.R derived_data/new_mbti_df.csv
	Rscript plots.R
	
figure_rds/plot_PCA.rds: simplifydf.R derived_data/new_mbti_df.csv
	Rscript PCA.R
	
figure_rds/plot_cl%.rds: simplifydf.R derived_data/new_mbti_df.csv PCA.R
	Rscript cluster.R

make mbtiproject.pdf: derived_data/new_mbti_df.csv simplifydf.R plots.R PCA.R cluster.R
	R -e "rmarkdown::render(\"mbtiproject.Rmd\", output_format=\"pdf_document\")"