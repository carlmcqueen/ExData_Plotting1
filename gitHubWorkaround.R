makeWorkSpace <- function()
{
        # work-around for a basic git hub size limit
        unzip("data/household_power_consumption.zip", list=FALSE, overwrite=TRUE, exdir="data")
        # now run the assignment
        print("Plot 1 -- Begin")
        source("Plot1.R")
        print("Plot 2 -- begin")
        source("Plot2.R")
        print("Plot 3 -- begin")
        source("Plot3.R")
        print("last plot, commence...")
        source("Plot4.R")
}