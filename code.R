
setwd("/home/maria_dev")
cmd <- system("which hadoop", intern=TRUE)
Sys.setenv(HADOOP_CMD=cmd) #setting HADOOP_CMD
stream <- system("find /usr -name hadoop-streaming*jar", intern=TRUE)
Sys.setenv(HADOOP_STREAMING=stream[1]) 
library(rmr2)
library(rhdfs)
library(plyrmr)
hdfs.init()
file7 <- dir(getwd(), pattern = "data4.csv", full.names = TRUE)
file8 <- dir(getwd(), pattern = " data5.csv ", full.names = TRUE)
file9 <- dir(getwd(), pattern = " data6.csv ", full.names = TRUE)
file10 <- dir(getwd(), pattern = "positive-words.txt", full.names = TRUE)
file11 <- dir(getwd(), pattern = "negative-words.txt", full.names = TRUE)
#hdfs.mkdir("Project")
hdfs.ls("Project")
hdfs.put(file7, "Project")
hdfs.put(file8, "Project")
hdfs.put(file9, "Project")
hdfs.put(file10, "Project")
hdfs.put(file11, "Project")
hdfs.ls("Project")
project.path <- hdfs.ls("Project")$file
head(check$V2)pos.words
col.classes = c(tweetid ="character", date= "character", username ="character", text ="character", retweets ="numeric", location ="character")
tweet.format = make.input.format("csv", header= FALSE, sep =",",col.names=names(col.classes),colClasses=col.classes)
map1 <-function(k,v) { keyval(v$location,1)}
reduce1 <-function(k,vv) { keyval(k,sum(vv))}
pos.words <- 
  nrow(check)
ncol(check)

from.dfs(out <-mapreduce(input = to.dfs(check),  map=map1,reduce=reduce1))
df <-as.data.frame(from.dfs(out))
df$key
df$val
https://cran.r-project.org/src/contrib/RColorBrewer_1.1-2.tar.gz
system("wget --no-check-certificate https://cran.r-project.org/src/contrib/RColorBrewer_1.1-2.tar.gz
       ")
install.packages("RColorBrewer_1.1-2.tar.gz ", repos = NULL, type="source")
system("wget --no-check-certificate https://cran.r-project.org/src/contrib/slam_0.1-40.tar.gz")
install.packages("slam_0.1-40.tar.gz", repos = NULL, type="source")
system("wget --no-check-certificate https://cran.r-project.org/src/contrib/wordcloud_2.5.tar.gz ")
install.packages("wordcloud_2.5.tar.gz ", repos = NULL, type="source")
map3 <-function(k,v){
  words<-unlist(strsplit(v$text, " \\ ")) 
  keyval(words,1)
}
reduce2 <- function(k,vv) { keyval(k, sum(vv)}

from.dfs(out1 <-mapreduce(input = to.dfs(check),  map=map2,reduce=reduce1))
df.words<-as.data.frame(from.dfs(out))

#to extract hashtags
Library(stringr)
map5 <-function(k,v){ keyval(str_extract_all(v$text, perl("(?<=^|\\s)#\\S+")),1) }

#to extract words in text
Map6 <-function(k,v){ keyval(unlist(strsplit(v$text, " ")),1) }

#wordcloud visualization of hashtags
library("RColorBrewer")
Library("wordcloud")
pal2 <-brewer.pal(8,"Dark2")
wordcloud(out$key,out$val, min.freq =1, random.order =T, colors =pal2)

#Performing sentiment analysis
pos.words <-read.csv("/home/maria_dev/positive-words.txt")
neg.words <-read.csv("/home/maria_dev/negative-words.txt")
map <- function(k,v){return(keyval(v$tweetid, unlist(strsplit(tolower(v$text), " "))))}
reduce <- function(k,vv){return(keyval(k, ((sapply(vv,function(x){sum(!is.na(match(x,pos.words)))})) - (sapply(vv,function(x){sum(!is.na(match(x,neg.words)))})))))}

# modified sentiment analysis
Map <-function
y <- (x == (pos[pos==x]))

map1 <-function(k,v) { return(keyval(strsplit(str_replace_all(v$text, "!", ""), "\\s"),1))}
map5 <-function(k,v) { 
  x<- strsplit(str_replace_all(v$text, "!", ""), " ")
  keyval(x,1)
}
reduce1 <- function(k,v){
  x<- (k==(pos[pos==k]))
  return(keyval(k,x))
}


