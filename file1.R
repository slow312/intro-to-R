# 1.1: Introduction to R and RStudio
getwd()
3+5
# 3+
x <- 3
y<-5  
y
x + y
num<-x+y
num
x<-5
num
y<-10
# 1.2: R Syntax and Data Structures
glengths <- c(4.6,3000,50000)
glengths

species <- c("ecoli","human","corn")
species

combined <- c(glengths,species)
combined

expression <- c("low","high","medium","high","low","medium","high")
expression <- factor(expression)

samplegroup <- c("CTL","CTL","CTL","KO","KO","KO","OE","OE","OE")
samplegroup <- factor(samplegroup)

df <- data.frame(species,glengths)
df

titles <- c("Catch-22","Pride and Prejudice","1984")
pages <- c(453,432,328)
favorite_books <- data.frame(titles,pages)
favorite_books

number <- 15
list1 <- list(species,df,number)
list1

list2 <- list(species,glengths,number)
list2

# 1.3: Functions and Arguements
glengths <- c(glengths,90) # add at the end
glengths
glengths <- c(30,glengths) # add to beginning
glengths

sqrt(81)
sqrt(glengths) #function performed on each element 
round(3.14159)

?round # info on function
args(round) # check arguements for function
example("round")

round(3.14159,digits=2)

mean(glengths)
test <- c(1,NA,2,3,NA,4)
mean(test,na.rm = TRUE)
args(sort)
sort(glengths,decreasing = TRUE)

square_it <- function(x){
  square <- x*x
  return(square)
}
square_it(5)

multiply_it <- function(x,y){
  return(x*y)
}
multiply_it(4,6)

# 1.4: Reading in and inspecting data
?read.csv
metadata <- read.csv(file="data/metadata.csv")
metadata

proj_summary <- read.table(file = "data/project-summary.txt",header = TRUE)
args(read.table)
proj_summary

head(metadata)
class(glengths)
class(metadata)
summary(proj_summary)
length(samplegroup)
dim(proj_summary)
rownames(metadata)
length(colnames(proj_summary))

# 2.1: Data Wrangling-Subsetting Vectors and Factors
age <- c(15,22,45,52,73,81)
age[5] #get fifth element
age[-5] #get all elements except the fifth
age[c(3,5,6)] #get multiple values from age
age[1:4] #get sequence of continuous variables
alphabets <- c("C","D","X","L","E")
alphabets[c(1,2,5)]
alphabets[-3]
rev(alphabets) #get vector but in reverse

age > 50 #check if each element is >50
age>50 | age<18 #get values >50 OR <18
age[age>50 | age<18]#get actual values not "TRUE"/"FALSE" vector
idx <- age>50 | age<18
age[idx]

which(age>50 | age<18)
age[which(age>50 | age<18)]
idx_num <- which(age>50 | age<18)
age[idx_num]

expression[expression == "high"]

samplegroup[samplegroup != "KO"]

expression
str(expression)

expression <- factor(expression, levels=c("low","medium","high"))
expression
str(expression)

samplegroup <- factor(samplegroup,levels="KO","CTL","OE")
samplegroup
str(samplegroup)

# 2.2: Packages and Libraries
sessionInfo()
search()

install.packages("ggplot2")
install.packages("BiocManager")
BiocManager::install("ggplot2")

library(tidyverse)

# 2.3: Data Wrangling-dataframes, matrices, and lists
metadata[1,1] # extract value from dataframe
metadata[1,3]
metadata[3,] # get third row
metadata[,3] #get third column
metadata[,3,drop=FALSE]#extract third column as a dataframe
metadata[,1:2] #get first two columns
metadata[c(1,3,6),]#get first,third,sixth columns
metadata[c("sample1","sample2","sample3"),"celltype"] #get celltype for first three samples
colnames(metadata)#column names of df
rownames(metadata)#row names of df
metadata$genotype #extract genotype column
metadata$genotype[1:5]#extract first five values/elements of the genotype column

metadata[c(1,3)] #get genotype and replicate column
metadata[4,3]
metadata[9,3]
metadata$replicate

metadata$celltype == "typeA"
logical_idx <- metadata$celltype == "typeA"
logical_idx
metadata[logical_idx,]#extract rows that correspond to TRUE values
which(metadata$celltype=="typeA")#return indices where logical expression is TRUE
idx <- which(metadata$celltype == "typeA")
metadata[idx,]
which(metadata$replicate >1)
idx <- which(metadata$replicate>1)#return indices for rows in replicate column that have a value of 2 or 3
metadata[idx,] #use indices to extract corresponding rows from table
metadata[which(metadata$replicate >1),]
sub_meta <- metadata[which(metadata$replicate >1),]

KO <- metadata$genotype =="KO"
metadata[KO,]

list1
list1[[2]]

comp2 <- list1[[2]]
class(comp2)
list1[[1]]
list1[[1]][1]

random <- list(metadata,age,list1,samplegroup,number)
random
random[[4]]

names(list1)
names(list1) <- c("species","df","number")
names(list1)
list1$df
names(random)<- c("metadata","age","list1","samplegroup","number")
random$age
