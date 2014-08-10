# Code to read power consumption data and select the 2 days required

hpc <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep =";",header=TRUE, na.strings= "?")
hpc <- na.omit(hpc)
hpc$Date <- as.Date(hpc$Date,format ="%d/%m/%Y")
hpc_sub <- hpc[hpc$Date == "2007-02-01"|hpc$Date == "2007-02-02",]
hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%Y-%m-%d %H:%M:%S") 


# Plot 1 histogram

png(file="Plot1.png",width=480,height=480)
hist(hpc_sub$Global_active_power,col="red", main ="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
