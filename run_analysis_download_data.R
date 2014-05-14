if (!file.exists("data")){
	dir.create("data")
}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./data/dataset.zip",method="curl")
unzip("./data/dataset.zip",exdir = "./")
setwd("UCI HAR Dataset")
