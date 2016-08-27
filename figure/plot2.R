df<-read.table('household_power_consumption.txt',sep=';',header=TRUE,as.is=TRUE)
df<-df[complete.cases(df),]
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df_sel<-df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
df_sel$dts<-paste(df_sel$Date, df_sel$Time)
plot(as.POSIXlt(df_sel$dts),as.numeric(df_sel$Global_active_power),type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()
