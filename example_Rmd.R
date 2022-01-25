#Amadi 2022 script for reproducible research lesson 1


print ('Hello World')
#just commenting
ocean = "I love the ocean, but not the color blue." #just saying
print (ocean)
2+2
2*(9/3)
4^2+(2-3)*0.1
earth_radius_km =6371
pi_estimate = 3.14159
surface_area_km2 = 4*pi_estimate*earth_radius_km^2 # Surface area of a sphere is A = 4*pi*r^2
surface_area_oceans_km2 = surface_area_km2*0.7 # The ocean is about 70% of the Earth's surface
print(surface_area_oceans_km2)
pi
surface_area_oceans_km2
#Atomic vectors
ocean1 = "Atlantic"
oceans = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern")
num = 1
nums = c(1, 2, 3, 4)
int = 4L
answer = TRUE
typeof(num)
class(ocean)
length()#number of elements in my vector

#Atomic vector creation - shortcut
c(1:10)
seq(10)
seq(1,15)
seq(from = 2, to = 9)
seq(from = -1, to = 1, by = 0.1)
rep(3,10) # repeating the number 3 10times
c("fa", rep("la", 8))#starts with the innermost function and works thru to the outermost

#accessing vector elements
x <- 2:20 #create vector
x[1] #access 1st element of vector x, i.e., 2
x[-1]     #returns everything except the first element
x[2:4] #2nd element to the 4th element, i.e, 3 4 5
x[c(3, 5:10, 1)]#combine in a single array in a particular order, i.e., 
#the 3rd element then the 5th to the 10th and then the 1st element

#Exercise 1
v <- seq(from = 2, to = 10, by = 2)# 5-element vector
print(v)
v_by2 = v*2
print(v_by2)
v_add7 <- v+7 #adds 7 to very element
print(v_add7)
w <- seq(from = 2, to = 6, by = 2)#3-element vector
print(w)
z <- v+w #adding the two different length vectors. 
#Result 4  8 12 10 14 shows that shorter vector is recycled i.e., 2+2, 4+4, 6+6, 2+8, 4+10

#matrix
my_matrix1 = matrix(1:6, nrow = 2)
my_matrix1
my_matrix2 = matrix(1:6, nrow = 2, byrow=TRUE)
my_matrix2
class(my_matrix2)

#my matrix test
matrix(oceans, nrow = 2)#Atlantic" "Indian" "Southern"
#"Pacific"  "Arctic" "Atlantic"
matrix(oceans, nrow = 2, byrow=TRUE)# "Atlantic" "Pacific"  "Indian"  
#"Arctic"   "Southern" "Atlantic"

my_matrix1[2,1]# Get element in 2nd row, 1st column
my_matrix2[,3]  # Get all rows in 3rd column
my_matrix1[3]   # Returns 3rd element of matrix

#Array
my_array = array(c(1:18), dim=c(3,3,2))#creating 2 3x3 multidimentional arrays consisting of elements 1 to 18
my_array
class(my_array)  # the class or data structure is an "array"
typeof(my_array) # the array is filled with data of the type "integer"
my_array[3,2,1] # Best practice (3rd row, 2nd column of the 1st matrix)
my_array[4]     # Confusing
my_array[2,1] # error, incorrect number of dimensions

#lists
list1 = list(95:103, "R", list(TRUE, FALSE))
class(list1)
list1[[1]][3]#the 3rd subelement of the first element in the list i.e., 97
list1[[2]]#the 2 element in the list.i.e., 'R'
list1[[3]][[2]]#the 2nd subelement of the 3rd element in the list.i.e., FALSE

#Data frame - R's equivalent of an excel spreadsheet - vectors grouped together in a 2d table
#*Each vector is a table column, so each data frame column can have different data type but cells within same coulmn must have same data type
world_oceans = data.frame(oceans = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500)) #table with fist col as world oceans, 2nd col as their area and 3rd col as their depth
world_oceans
world_oceans[2,3] # Depth of the Pacific
world_oceans$avg_depth_m # All depths
world_oceans$avg_depth_m[2] # Depth of the Pacific
world_oceans$borders_usa = c(TRUE, TRUE, FALSE, TRUE, FALSE)#creating a new column

#Exercise 1.2 Adding new column, volume = area x depth
world_oceans$volume_km3 = world_oceans$area_km2*(world_oceans$avg_depth_m/1000)
Travelled_oceans = data.frame(oceans = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                              travelled = c(TRUE, FALSE, FALSE, FALSE, FALSE))#creating a data frame of personally travelled oceans
Travelled_oceans$wish_to_travel = c(TRUE, TRUE, TRUE, TRUE, TRUE)#adding one more column
oceans_travelled = data.frame(oceans = c("Atlantic"))#or I could do it this way

#Functions
round(9.3452)
mean(world_oceans$area_km2)
round(mean(c(9.3452, 6.234, 11.983)))

#Exercise 1.3
world_oceans$volume_km3_2 = signif(world_oceans$volume_km3, digits = 3)# reducing the ocean volume to 3 significant figures
mean_ocean_vol <- mean(world_oceans$volume_km3_2)
mean_ocean_vol_sigfig <- signif(mean_ocean_vol, digits = 3)
mean_ocean_vol <- signif(mean(world_oceans$volume_km3_2), digits = 3)#lines112&113 can be put together as this single code

#functions
install.packages('ggplot2')  # Only need to do this one time on a computer
library('ggplot2') # Include this in every script that uses this package

#object oriented programming
?summary 
class(oceans) #oceans is an atomic vector filled with the character data type
summary(oceans)
class(my_array) # my_array is an array
summary(my_array) 
class(world_oceans) # world_oceans is a data.frame
summary(world_oceans) 

#coercion
random_data = c(1,"Atlantic", 3.7, TRUE) #vectors need to have the same data type
class(random_data)# result is 'character'
random_data[1] + random_data[3]#error
my_siblings_ages = c(35,34,28)
class(my_siblings_ages)
ages_as_characters = as.character(my_siblings_ages)#function to change from one type to another
class(ages_as_characters)
as.numeric(random_data[1]) + as.numeric(random_data[3])#coersing the variable to do the wanted summation/forcing the data type to be what I need it to be

#special values
x = c(0.5, -0.2, NA, 0.7)# thhe NA holds the spot for the data which is not yet available
x
is.na(x)  # Examine your data to see if there are NAs
mean(x)
mean(x, na.rm = TRUE) # include an optional parameter to remove (or ignore) NAs in the data
1/0#infinity
0/0
Inf + 2
Inf / Inf