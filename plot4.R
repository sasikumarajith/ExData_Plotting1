dt<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) ## Reads the  "Individual household electric power consumption Data Set" into R from Working Directory
subdt<-subset(dt,dt$Date=="1/2/2007"|dt$Date=="2/2/2007") ## Subsets the orginal dataset to what is required for the plot
rm(dt) ## Removes the original dataset from memmory as it large in size
subdt$Time<-paste(subdt$Date,subdt$Time) ##Merge Date and Time together for plotting Time
subdt$Date<-as.Date(subdt$Date,"%d/%m/%Y") ## Converts Date column to Date type from Character
subdt$Time<-strptime(subdt$Time,"%d/%m/%Y %H:%M:%S") ## Converts Time column to Time type from Character

png(filename="plot4.png",width=480,height=480) ## Initialize Graphics Device
par(mfcol=c(2,2)) ## Create the structure of 2 rows and 2 columns for the Panel Plot
## First Plot
plot(subdt$Time,subdt$Global_active_power,type="l",xlab="",ylab="Global Active Power")
## Second Plot
plot(subdt$Time,subdt$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering") ##Create an empty plot
lines(subdt$Time,subdt$Sub_metering_1,col="black") ## Plot Sub_metering_1 values in black
lines(subdt$Time,subdt$Sub_metering_2,col="red")  ## Plot Sub_metering_2 values in red
lines(subdt$Time,subdt$Sub_metering_3,col="blue")  ## Plot Sub_metering_3 values in blue
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1) ## Create the legend
## Third Plot
plot(subdt$Time,subdt$Voltage ,type="l",xlab="datetime",ylab="Voltage")
## Fourth Plot
plot(subdt$Time,subdt$Global_reactive_power ,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off() ## turn of Graphics Device