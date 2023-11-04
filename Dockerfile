FROM rocker/verse
RUN R -e "install.packages(\"ggplot2\")"
RUN R -e "install.packages(\"matlab\")"
RUN R -e "install.packages(\"deSolve\")"
RUN R -e "install.packages(\"reshape2\")"
RUN R -e "install.packages(\"reticulate\")"
RUN R -e "install.packages(\"aricode\")"
RUN apt update && apt install -y python3 python3-pip
RUN pip3 install numpy scikit-learn pandas


