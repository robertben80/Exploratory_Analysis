
## read data with separater and na
x<-read.table("household_power_consumption.txt",sep=";",na.strings="?")
## subsetting specified dates
xsub<-subset(x,x[,1]=="1/2/2007"|x[,1]=="2/2/2007")
## changing classes of data
for (i in 1:2){
	xsub[,i]<-as.character(xsub[,i])
	}
for (i in 3:9){
	xsub[,i]<-as.numeric(xsub[,i])
	}
## creating new column with dates
xsub[,10]<-paste(xsub[,1],xsub[,2])
## naming columns
cnames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3","Date_Time")
names(xsub)<-cnames

## Setting up Time
xsub$Date_Time<-strptime(xsub$Date_Time,"%d/%m/%Y %H:%M:%S")

## histogram
dev.copy(png,file="plot3.png")
plot(xsub$Date_Time,xsub$Sub_metering_1,lty="solid",type="l",ylab="Energy sub metering",main="",xlab="")
points(xsub$Date_Time,xsub$Sub_metering_2,col="red")
points(xsub$Date_Time,xsub$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

