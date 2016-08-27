df<-read.table('household_power_consumption.txt',sep=';',header=TRUE,as.is=TRUE)
df<-df[complete.cases(df),]
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df_sel<-df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
hist(as.numeric(df_sel$Global_active_power), main="Global Active Power", xlab='Global Active Power (kilowatts)',col='red')
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()
