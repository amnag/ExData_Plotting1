df<-read.table('household_power_consumption.txt',sep=';',header=TRUE,as.is=TRUE)
df<-df[complete.cases(df),]
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df_sel<-df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
df_sel$dts<-paste(df_sel$Date, df_sel$Time)
plot(as.POSIXlt(df_sel$dts), as.numeric(df_sel$Sub_metering_1), type='l',xlab='',ylab='Energy sub metering')
lines(as.POSIXlt(df_sel$dts), as.numeric(df_sel$Sub_metering_2), col='red')
lines(as.POSIXlt(df_sel$dts), as.numeric(df_sel$Sub_metering_3), col='blue')
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),x.intersp=0.75,y.intersp=0.75,col=c('black','red','blue'),cex=1.0)
dev.copy(png,'plot3.png',width=480,height=480)
dev.off()
