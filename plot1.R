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

plot1 <- function() {
    df <- read.project1.data()
    
    hist(df$Global_active_power, 
         col = "red", 
         xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power")
    
    dev.copy(png, 
             file = "plot1.png", 
             height = 480, 
             width = 480)
    dev.off()
}