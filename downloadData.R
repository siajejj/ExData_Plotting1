## Script name: downloadData.R
## Created with: R-studio v 0.98.1091/ R v 3.1.2
## Description: Downloads the data used in Course Project 1 for Exploratory Data Analysis
##              to a subdirectory "data" in the working directory

## Download data
if(!file.exists("./data")) {dir.create("./data")}
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
td <- tempdir()
tf <- tempfile(tmpdir=td, fileext=".zip")
download.file(zipUrl, tf, method = "curl")
unzip(tf, exdir = "./data", overwrite=TRUE)

