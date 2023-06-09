#read csv file
eraky <- read.csv("G3_sydney_hobart_times.csv")

#remove words from time column
eraky$Time<-gsub("day","", eraky$Time)

#convertine time column data type to integer
eraky$Time <- as.numeric(eraky$Time)
str(eraky)

#fill the missing value in time by mean time
eraky$Time[is.na(eraky$Time)] <- mean(eraky$Time, na.rm = T)

#make sure there is no missing data
complete.cases(eraky) #if there is any it will return false

#remove last column 
FinalResult <- eraky[,-5]
 
hist(FinalResult$Time)

#how many times was the number of fleet started the race was as same as the number finished
sum(FinalResult$fleet_start == FinalResult$fleet_finish)

#return in which year did it happened
year <- unique(substr(FinalResult$Year, 1, 4))
for (i in year) {
  if (sum(FinalResult$fleet_start[FinalResult$Year == i]) == sum(FinalResult$fleet_finish[FinalResult$Year == i])) {
    print(i)
  }
}


#how many years did the race take less than 3 days
sum(FinalResult$Time < 3)

#a boxplot showing the relationship between years and time
boxplot(FinalResult$Year ~ substr(FinalResult$Time, 1, 4), xlab = "Year", ylab = "time")




