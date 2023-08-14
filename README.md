
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Multinomial classification of turtles

<!-- badges: start -->
<!-- badges: end -->

This GitHub repository contains the code used in analysis of all
datasets used in **Cold-adapted Cretaceous polar turtle resolves the
trans-Antarctic radiations of Testudinata**

by Benjamin P. Kear, Márton Rabi, Martin Kundrát, Michael S. Y. Lee,
Daniel Snitting, Peter Trussler, Mohamad Bazzi, Barbara E. Wagstaff,
Dorris E. Seegets-Villiers, Thomas H. Rich, Patricia Vickers-Rich &
Lesley Kool

Code written and maintained by Mohamad Bazzi 

Contact: <bazzi@ug.kth.se>

## Load the .RData file

Access the study's .Rdata object, containing all data and results, using:
[`piggyback`](https://github.com/ropensci/piggyback)!

``` r
This R code shows how to access a .Rdata file from a GitHub release using the piggyback package.

1. First install and load the piggyback package.
2. Create a temporary directory and download the default.RData file from the specified GitHub repository release version using the pb_download() function.
3. Finally, load the downloaded .Rdata file into the R environment using the load() function.

# install.packages(piggyback)
# require(piggyback)

# Create temporar directory and load .Rdata into R environment.
# pb_download(file = "default.RData",dest = tempdir(),repo = "mohabazzi/Turtle-Project-2023",tag = "v1.0.0")
# load(file = file.path(tempdir(),"default.RData"))

No token authentication is required.
```

**Data files included:**

Measurement File.xlsx - Extant and fossil testudinatan forelimb
proportion dataset of Joyce & Gauthier 2004.
