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

plot2 <- function() {
    df <- read.project1.data()
    
    plot(df$Global_active_power ~ df$datetime, 
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)")
    
     dev.copy(png, 
              file = "plot2.png", 
              height = 480, 
              width = 480)
     dev.off()
}