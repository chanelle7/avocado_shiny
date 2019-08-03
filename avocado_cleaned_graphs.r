library(dplyr)
library(ggplot2)

avocado = read.csv('avocado_cleaned.csv', stringsAsFactors = F)
avocado$Date = as.Date(avocado$Date)

f =avocado %>%
  group_by(Date) %>%
  summarise(Price_for_Date = mean(Avg_Price))
ggplot(f,aes(x=Date, y= Price_for_Date)) + geom_line()

c = avocado %>%
  group_by(Type,Date) %>%
  summarise(Price_for_Date = mean(Avg_Price))

ggplot(c,aes(x=Date,y=Price_for_Date)) + geom_line(aes(colour=Type))


#type
#difference in volume and bags year to year
b = avocado %>%
  group_by(Type,Year) %>%
  summarise(Volume = sum(as.numeric(Total_Volume)),
            Bags = sum(as.numeric(Total_Bags)))

ggplot(b, aes(x=Year,y=Volume, fill=Type)) + geom_col(position = 'dodge')
ggplot(b, aes(x=Year,y=Bags, fill=Type)) + geom_col(position = 'dodge')


  
#percent breakdowns
# double pie chart over time

percentage_breakdown = avocado %>%
  summarise(small_vol_per = Small_4046/Total_Volume,
            medium_vol_per = Medium_4225/Total_Volume,
            large_vol_per = Large_4770/Total_Volume,
            other_vol_per = Other_PLU/Total_Volume,
            small_bag_per = Small_Bags/Total_Bags,
            medium_bag_per = Medium_Bags/Total_Bags,
            large_bag_per = Large_Bags/Total_Bags)


#regional analysis
which region sold most volume/bags each year?
which region has highest concentration of types/plu types?
which region has highest standard deviation of avg prices?