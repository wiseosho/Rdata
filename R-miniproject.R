dust_data <- read.csv("./dust_seoul.csv", header = TRUE)
head(dust_data)
summary(dust_data)

#Extract monthly info into the month column (substr())
dust_data$month <- substr(dust_data[,1], 5,6)
unique(dust_data$month)

#filter by month for 01, 08 (%in%)
dust_data_18 <- subset(dust_data, dust_data$month %in% c('01', '08') )
length(dust_data_18)

dust_data_18
summary(dust_data_18[,c(7,8)])
#0~30 	31~80 	81~150 	151~
names(dust_data_18) <- c("date","station","Co2.ppm", "Ozone.ppm", "Co.ppm", "SO3.ppm", "Fine.dust", "Ultrafine.dust","month")

dust_data_soup <- dust_data_18[,c("month","Fine.dust","Ultrafine.dust")]
dust_data_soup <- na.omit(dust_data_soup)
dust_data_soup$Fine.dust2[dust_data_soup$Fine.dust <=30] <- 'good'
dust_data_soup$Fine.dust2[dust_data_soup$Fine.dust >=31 & dust_data_soup$Fine.dust <=80] <- 'normal'
dust_data_soup$Fine.dust2[dust_data_soup$Fine.dust >=81 & dust_data_soup$Fine.dust <=150] <- 'bad'
dust_data_soup$Fine.dust2[dust_data_soup$Fine.dust >=151 ] <- 'bad'
dust_data_soup
table(dust_data_soup$month, dust_data_soup$Fine.dust2)

jan <- dust_data_soup$Fine.dust[dust_data_soup$month == '01']
shapiro.test(jan)
aug <- dust_data_soup$Fine.dust[dust_data_soup$month == '08']
shapiro.test(aug)

t.test(jan, aug, alternative = "two.sided")
t.test(jan, aug, alternative = "greater")
t.test(jan, aug, alternative = "less")

library(gmodels)
month <- dust_data_soup$month
finedust<- dust_data_soup$Fine.dust2
table(month, finedust)
CrossTable(month, finedust, chisq = TRUE)
