dt<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")) ## Reads the  "Individual household electric power consumption Data Set" into R from Working Directory
subdt<-subset(dt,dt$Date=="1/2/2007"|dt$Date=="2/2/2007") ## Subsets the orginal dataset to what is required for the plot
rm(dt) ## Removes the original dataset from memmory as it large in size
png(filename="plot1.png",width=480,height=480) ## Initialize Graphics Device
hist(subdt$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",ylab="Frequency",col="red")
dev.off()