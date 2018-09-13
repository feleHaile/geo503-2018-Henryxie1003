#' ---
#' title: "Homework #1: Graphics and Data Wrangling"
#' output: github_document
#' ---
#' 
#' 
#' 
#' 
#' ## Question 1
#' Load the iris dataset by running
## ------------------------------------------------------------------------
data(iris)

#' And read about the dataset in the documentation:
## ------------------------------------------------------------------------
?iris

#' 
#' > How many observations (rows) are there for the _setosa_ species?
#' >50
#' 
setosa<-subset(iris,iris$Species=='setosa')
#' 
#' Create a new object named `n_setosa` with this value.
#' 
n_setosa<-50
#' 
#' Hint: you answer will probably use logical comparisons (e.g. `>`, `<`, or `==`).  You could also use the `filter()` function in the dplyr package.
#' 
#' 
#' _______________________
#' 
#' ## Question 2
#' Create a vector with the following values:  23, 45, 12, 56, 1, 13, 28, 18.  Then multiply each element of the vector by 15.  
#' 
v<-15*c(23,45,12,56,1,13,28,18)
#' 
#' > What is the standard deviation of the new vector? Call this value `sdx`.
#' >272.4885
sdx<-sd(v)
#' 
#' ## Question 3
#' Start with a vector containing missing values
## ------------------------------------------------------------------------
x=c(12,23,NA,34,12,67,12,NA,23)

#' > What is the mean (excluding the NA values)?
#' >26.14286
x2<-x[which(x!='NA')]
mean(x2)
#' 
#' ## Question 4
#' 
#' > What is the mean `Petal.Length" for the _setosa_ species?
#' >1.462
mean(iris$Petal.Length[iris$Species=='setosa'])
#' 
#' Hint: you will need to filter (using `[]`s or `filter()`) the iris data to keep only the correct rows or values, then calculate the mean.
#' 
#' 
#' 
#' ## Question 5
#' Create a `data.frame` with the following three columns (e.g. make a data.frame with 3 columns and 8 rows):
#' 
#' * 11, 12, 14, 23, 213, 43, 123, 12
#' * 19, 20, 21, 12, 543, 12, 654, 12
#' * 10, 9, 7, 23, 78, 456, 23, 12
#' 
#' and name the columns `x`, `y`, and `z`.  
#' 
data<-data.frame('X'=c(11, 12, 14, 23, 213, 43, 123, 12),'Y'=c(19, 20, 21, 12, 543, 12, 654, 12),'Z'=c(10, 9, 7, 23, 78, 456, 23, 12))
#' 
#' Filter the dataset to rows where `y>15`,
#' 
data2<-subset(data,data$Y>15)
#' 
#' > What is the mean of `x` in the filtered dataset?
#' >74.6
#' 
mean(data2$X)
#' 
#' ## Question 6
#' Load the complete monthly average CO2 record from the Mona Loa station directly from the [National Oceanographic and Atmospheric Administration website](http://www.esrl.noaa.gov/gmd/ccgg/trends/).
#' 
## ------------------------------------------------------------------------
co2=read.table("ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt")
#' 
#' Look at the top of the `data.frame` with `head()`:
## ------------------------------------------------------------------------
head(co2)

#' 
#' The column names did not succesfully transfer. Check the text file available at that link ([ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt](ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt)) and edit the column names of the `co2` data.frame to the following (hint, check `?colnames`):
#' 
#' `"year","month","decimaldate","average","interpolated","trend","Ndays"`
#' 
colnames(co2)<-c("year","month","decimaldate","average","interpolated","trend","Ndays")
#' 
#' Use ggplot to make a graph of the `interpolated` value on the y-axis and the `decimaldate` on the x-axis:
#' 
p<-ggplot(co2)
p+geom_point(aes(decimaldate,interpolated))
#' 
#' > Save the graphic as a .png and upload it to UBlearns.
#' 
#' ## Question 7
#' 
#' > What was the `decimaldate` did the interpolated CO2 concentration first hit 360ppm?  
#' >1993.375
#' 
co2_360<-subset(co2,co2$interpolated>=360)
View(co2_360)
min(co2_360$decimaldate)
#' 
#' ## Question 8
#' 
#' > How many years has the interpolated CO2 concentration gone above 350ppm? Call this `years_above_350`.
#' >33 years
#' 
years_above_350<-subset(co2,co2$interpolated>350)
length(unique(years_above_350$year))
#' 
#' Hint, check out `unique` and `length`.
#' 
#' 
#' ## Question 9
#' 
#' > What is the standard deviation of interpolated CO2 values since the beginning of 2000?
#' >11.82649
#' 
years_2000<-subset(co2,co2$year>=2000)
sd(years_2000$interpolated)
#' 
