library(tidyverse)
getwd()
# -----------------------------------------------------------------------------------------------
# Read in data and understand data
# ---------------------------------------------------------------------------------------------
# feature data
feature <- read.table("./UCI HAR Dataset/features.txt")
dim(feature)

# test data

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(X_test)
str(X_test)

Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
dim(Y_test)
str(Y_test)

sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dim(sub_test)
str(sub_test)

filelist <- list.files(path="./UCI HAR Dataset/test/Inertial Signals",full.names = T)
raw1 <- lapply(filelist, read.table)

dim(raw1[[1]])
dim(raw1[[2]])
dim(raw1[[3]])
dim(raw1[[4]])
dim(raw1[[5]])
dim(raw1[[6]])
dim(raw1[[7]])
dim(raw1[[8]])
dim(raw1[[9]])

# train data

X_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
dim(X_train)
str(X_train)

Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
dim(Y_train)
str(Y_train)

sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
dim(sub_train)
str(sub_train)


filelist <- list.files(path="./UCI HAR Dataset/train/Inertial Signals",full.names = T)
raw2<- lapply(filelist, read.table)

dim(raw2[[1]])
dim(raw2[[2]])
dim(raw2[[3]])
dim(raw1[[4]])
dim(raw1[[5]])
dim(raw1[[6]])
dim(raw1[[7]])
dim(raw1[[8]])
dim(raw1[[9]])


# -----------------------------------------------------------------------------------------------
# Tidy Data
# ---------------------------------------------------------------------------------------------

# 1. Merges the training and the test sets to create one data set.
# ---test data
sub_test1 <- sub_test %>% mutate(ID=rownames(sub_test)) %>% rename(SUBJECT=V1)
X_test1 <- X_test %>% mutate(ID=rownames(X_test))
Y_test1 <- Y_test %>% mutate(ID=rownames(Y_test))%>% rename(TEST=V1)

test_tmp <- merge(sub_test1, Y_test1, by="ID")
test <- merge(test_tmp,X_test1, by="ID")

# ---train data
sub_train1 <- sub_train %>% mutate(ID=rownames(sub_train)) %>% rename(SUBJECT=V1)
X_train1 <- X_train %>% mutate(ID=rownames(X_train))
Y_train1 <- Y_train %>% mutate(ID=rownames(Y_train))%>% rename(TEST=V1)

train_tmp <- merge(sub_train1, Y_train1, by="ID")
train <- merge(train_tmp,X_train1, by="ID")

# rbind test and train data
data <- rbind(test, train)
nrow(data)
n_distinct(data$SUBJECT)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

varname <- as.character(feature$V2)
varname_less <- grep("mean|std",varname, value=TRUE)
# Notes: "mean|std" is regular expression where "|" means "or";value augument in grep will gives the true value instead of index. Do not use fixed= argument since "|" is megacharacter and we do not want it to be as is. 



# 3. Uses descriptive activity names to name the activities in the data set
data$TEST <- recode(data$TEST,`1`="WALKING",`2`="WALKING_UPSTAIRS",`3`="WALKING_DOWNSTAIRS",`4`="SITTING",`5`="STANDING",`6`="LAYING")
View(data)
names(data)

# 4. Appropriately labels the data set with descriptive variable names.

names(data) <- c("ID", "SUBJECT", "TEST",varname)
names(data)
ncol(data)

data_less <- data[c("ID","SUBJECT","TEST", varname_less)] #only column of measurements with mean and std are selected
View(data_less)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data_avg <-  data_less %>% arrange(SUBJECT,TEST) %>% group_by(SUBJECT, TEST) %>% summarise_at(varname_less, mean,na.rm=TRUE)
View(data_avg)
dim(data_avg)
