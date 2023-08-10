FROM rocker/r-ubuntu

# install quarto CLI
RUN apt-get update -y && apt-get install -y \
	wget

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb && \
	dpkg -i quarto-1.3.450-linux-amd64.deb && \
	rm quarto-1.3.450-linux-amd64.deb

# install r-cran-* binary packages
RUN apt-get install -y --no-install-recommends \
	r-cran-mass \
	r-cran-vim \
	r-cran-desctools \
	r-cran-qgraph \
	r-cran-openxlsx \
	r-cran-mice \
	r-cran-caret \
	r-cran-corrplot \
	r-cran-jmvcore \
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
	'DMwR2', \
	'qreport', \
	'wesanderson', \
	'generalhoslem', \
	'UBL' \
))"

CMD bash




