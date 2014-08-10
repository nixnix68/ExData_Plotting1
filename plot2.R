hpc <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep =";",header=TRUE, na.strings= "?")
hpc <- na.omit(hpc)
hpc$Date <- as.Date(hpc$Date,format ="%d/%m/%Y")
hpc_sub <- hpc[hpc$Date == "2007-02-01"|hpc$Date == "2007-02-02",]
hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%Y-%m-%d %H:%M:%S") 

# Ready for plotting now

#Plot 2 Line Graph 
png(file="plot2.png",width=480,height=480)
plot(hpc_sub$DateTime, hpc_sub$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

