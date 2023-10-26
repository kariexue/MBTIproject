.PHONY: clean

clean:
	rm -f figure_rds/*
	rm -f derived_data/*

derived_data/new_mbti_df.csv: mbti_df.csv
	Rscript simplifydf.R

figure_rds/plot1.rds: derived_data/new_mbti_df.csv simplifydf.R
	Rscript plots.R simplifydf.R

figure_rds/plot2.rds: derived_data/new_mbti_df.csv simplifydf.R
	Rscript plots.R simplifydf.R

mbtiproject.pdf: derived_data/new_mbti_df.csv simplifydf.R plots.R
	R -e "rmarkdown::render('mbtiproject.Rmd', output_format='pdf_document')"
