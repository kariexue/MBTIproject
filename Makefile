PHONY: clean

clean:
	rm derived_data/*
	rm figure_rds/*

derived_data/new_mbti_df.csv: mbti_df.csv
	Rscript simplifydf.R

figure_rds/plot%.rds: simplifydf.R derived_data/new_mbti_df.csv
	Rscript plots.R

make mbtiproject.pdf: derived_data/new_mbti_df.csv simplifydf.R plots.R
	R -e "rmarkdown::render(\"mbtiproject.Rmd\", output_format=\"pdf_document\")"