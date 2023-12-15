FROM rocker/verse
RUN R -e "install.packages(\"ggplot2\")"
RUN R -e "install.packages(\"dplyr\")"
RUN R -e "install.packages(\"reshape2\")"
RUN apt update && apt install -y python3 python3-pip
RUN pip3 install numpy scikit-learn pandas


