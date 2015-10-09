## Script name: plot3.R
## Created with: R-studio v 0.99.486/ R v 3.2.2
## Dependencies: packages data.table, lubridate, dplyr
## Assumes the data used is placed in a subfolder "data" to the working directory.
## Data can be downloaded by running the script "downloadData.R".

## Load packages needed
libraries <- c("data.table", "lubridate", "dplyr")
lapply(libraries, library, character.only = TRUE)
rm(libraries)

## Load data, use data from period 2007-02-01 and 2007-02-02
allData <- fread("data/household_power_consumption.txt",
                 na.strings="?")
subsetData <- as.data.frame(filter(allData,
                                   Date == "1/2/2007" | Date == "2/2/2007"))
subsetData$datetime = dmy_hms(paste(subsetData$Date, subsetData$Time))

## Plot
png(filename="plot3.png", width = 480, height = 480, units = "px")
with(subsetData, plot(datetime,
                      Sub_metering_1,
                      type = "l",
                      xlab = "",
                      ylab = "Energy sub metering"))
with(subsetData, lines(datetime,
                      Sub_metering_2,
                      type = "l",
                      col = "red"))
with(subsetData, lines(datetime,
                       Sub_metering_3,
                       type = "l",
                       col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = "solid",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


