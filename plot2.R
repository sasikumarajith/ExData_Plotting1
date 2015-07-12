dt<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) ## Reads the  "Individual household electric power consumption Data Set" into R from Working Directory
subdt<-subset(dt,dt$Date=="1/2/2007"|dt$Date=="2/2/2007") ## Subsets the orginal dataset to what is required for the plot
rm(dt) ## Removes the original dataset from memmory as it large in size
subdt$Time<-paste(subdt$Date,subdt$Time)
subdt$Date<-as.Date(subdt$Date,"%d/%m/%Y") ## Converts Date column to Date type from Character
subdt$Time<-strptime(subdt$Time,"%d/%m/%Y %H:%M:%S") ## Converts Time column to Time type from Character
png(filename="plot2.png",width=480,height=480) ## Initialize Graphics Device
plot(subdt$Time,subdt$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()