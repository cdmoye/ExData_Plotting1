read.project1.data <- function() {
    require(sqldf)
    setwd("C:\\Users\\David\\Google Drive\\R Projects\\Exploratory Data Analysis\\ExData_Plotting1")
    
    df <- read.csv.sql("household_power_consumption.txt", 
                       header = TRUE,
                       sep = ";",
                       sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"')
    df$Date <- as.Date(df$Date, format="%d/%m/%Y")
    df$datetime <- as.POSIXct(paste(df$Date, df$Time))
    df
}

plot4 <- function() {
    par(mfrow = c(2,2), 
        mar = c(4,4,2,1), 
        oma = c(0,0,2,0))
    
    with(read.project1.data(),
         {
             plot(Global_active_power ~ datetime, type="l",
                  xlab = "",
                  ylab = "Global Active Power (kilowatts)")
             plot(Voltage ~ datetime, type="l",
                  xlab = "",
                  ylab = "Voltage (volt)")
             plot(Sub_metering_1 ~ datetime, 
                  type = "l",
                  xlab = "",
                  ylab = "Global Active Power (kilowatts)")
             lines(Sub_metering_2 ~ datetime,
                   col = 'red')
             lines(Sub_metering_3 ~ datetime,
                   col = 'blue')
             legend("topright", 
                    col = c("black", "red", "blue"), 
                    lty = 1, 
                    lwd = 2, 
                    bty = "n",
                    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
             plot(Global_reactive_power ~ datetime, 
                  type="l",
                  xlab = "", 
                  ylab="Global Rective Power (kilowatts)")
         })
    
    dev.copy(png, 
             file = "plot4.png", 
             height = 480, 
             width = 480)
    dev.off()
}