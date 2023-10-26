FROM rocker/r-ubuntu

# Copy the .qmd file into the image
COPY TurtleProject.qmd /app/TurtleProject.qmd

# Copy the main morphometric data file
COPY data/measurement_file.xlsx /app/data/measurement_file.xlsx

# Copy ancillary data .xlsx files. 
COPY data-raw/imputation_performance_humerus.xlsx /app/data-raw/imputation_performance_humerus.xlsx
COPY data-raw/imputation_performance_ulna.xlsx /app/data-raw/imputation_performance_ulna.xlsx
COPY data-raw/imputation_performance_digit.xlsx /app/data-raw/imputation_performance_digit.xlsx

# Docker-workflow diagram
COPY docker_workflow /app/docker_workflow.png

# Dot language text file
COPY workflow /app/workflow.gv

# install quarto CLI
RUN apt-get update -y && apt-get install -y \
	wget

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb && \
	dpkg -i quarto-1.3.450-linux-amd64.deb && \
	rm quarto-1.3.450-linux-amd64.deb

# install r-cran-* binary packages
RUN apt-get install -y --no-install-recommends \
	r-cran-tidyverse \
	r-cran-mass \
	r-cran-vim \
	r-cran-desctools \
	r-cran-qgraph \
	r-cran-openxlsx \
	r-cran-mice \
	r-cran-caret \
	r-cran-corrplot \
	r-cran-ggfortify \
	r-cran-ggally \
	r-cran-mumin \
	r-cran-tidyr \
	r-cran-nnet \
	r-cran-gridextra \
	r-cran-lmtest \
	r-cran-rcolorbrewer \
	r-cran-performance \
	r-cran-ggstance \
	r-cran-visdat \
	r-cran-naniar \
	r-cran-car \
	r-cran-ggeffects \
	r-cran-ggthemes \
	r-cran-knitr \
	r-cran-stargazer \
	r-cran-kableextra \
	r-cran-marginaleffects \
	r-cran-purrr \
	r-cran-magrittr \
	r-cran-checkpoint \
	r-cran-data.table \
	r-cran-diagrammer

# install R packages from source
RUN R -e "install.packages(c(\
	'quarto', \
	'see', \
	'kernlab', \
	'DMwR2', \
	'remotes', \
	'qreport', \
	'wesanderson', \
	'randomForest', \
	'smotefamily', \
	'modelsummary', \
	'piggyback', \
	'generalhoslem'))"

# Change the CMD to render the .qmd file using quarto
CMD R -e "quarto::quarto_render('/app/TurtleProject.qmd')"

CMD /bin/bash








