hpc <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep =";",header=TRUE, na.strings= "?")
hpc <- na.omit(hpc)
hpc$Date <- as.Date(hpc$Date,format ="%d/%m/%Y")
hpc_sub <- hpc[hpc$Date == "2007-02-01"|hpc$Date == "2007-02-02",]
hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%Y-%m-%d %H:%M:%S") 

#Plot 3 Multi line graph

png(file="plot3.png",width=480,height=480)

plot(hpc_sub$DateTime, hpc_sub$Sub_metering_1, type ="l", ylim =c(0,38), xlab = "", ylab = "Energy sub metering")
legend('topright',lty =1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
par(new=T)
plot(hpc_sub$DateTime, hpc_sub$Sub_metering_2, col = "red", ylim =c(0,38),type ="l", xlab = "", ylab = "Energy sub metering")
par(new=T)
plot(hpc_sub$DateTime, hpc_sub$Sub_metering_3, col = "blue", ylim =c(0,38), type ="l", xlab = "", ylab = "Energy sub metering")

dev.off()

