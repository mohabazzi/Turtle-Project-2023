FROM rocker/r-ubuntu

RUN apt-get update -y && apt-get install -y wget

# Install Quarto Cli
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb && \
    dpkg -i quarto-1.3.450-linux-amd64.deb && \
    rm quarto-1.3.450-linux-amd64.deb

# Install binary R packages
RUN apt-get update -y && apt-get install -y r-cran-tidyverse

# Copy the list of R packages to a separate file
COPY R-packages.txt /app/R-packages.txt

# Install necessary R packages from the list
RUN R -e "install.packages(readLines('/app/R-packages.txt'), repos='http://cran.rstudio.com/')"

COPY ./TurtleProject.qmd /app/TurtleProject.qmd

WORKDIR /app

RUN quarto render TurtleProject.qmd

CMD bash




