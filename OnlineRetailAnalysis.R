library(tm)

# read data and preprocess data
setwd('/Users/ibatu/Documents/MyProgramsWindows/R/TextAnalysis/')
data <- read.csv(file = './online_retail.csv', header = TRUE)

set.seed(123)
myData <- data[c('StockCode','Description')] # extract relevant columns
myData <- myData[complete.cases(myData),] # remove incomplete rows

# reduce the size of dataset for rapid prototyping and create corpus
prototype_size <- 50000
myData <- myData[sample(1:length(myData[,1]),size = prototype_size),] 
corpus = tm::Corpus(tm::VectorSource(myData$Description))

# build the feature matrices
dtm <- tm::DocumentTermMatrix(corpus)
dtm.tfidf <- tm::weightTfIdf(dtm)

# remove features for optimization
dtm.tfidf <- tm::removeSparseTerms(dtm.tfidf, 0.99)

# There is the memory-problem part
# - Native matrix isn't "sparse-compliant" in the memory
# - Sparse implementations aren't necessary compatible with clustering algorithms
matrix.tfidf <- as.matrix(dtm.tfidf)

# cluster descriptions according to similarity
n_clusters = prototype_size/50
clustering.kmeans <- kmeans(matrix.tfidf, n_clusters)
Clusters <- clustering.kmeans$cluster


# add cluster column to the dataframe
myData_cluster <- cbind("Code" = myData$StockCode, 
                        "Cluster" = Clusters, 
                        "Description" = myData$Description)
myDataFrame_cluster <- as.data.frame(myData_cluster)
attach(myDataFrame_cluster)
clustered_descriptions <- myDataFrame_cluster[order(as.numeric(Cluster)),]
detach(myDataFrame_cluster)

# histogram of cluster column
hist(Clusters)

# print observations belonging to 10 random clusters
for (i in sample(c(1:n_clusters),5)) {
  print(clustered_descriptions[clustered_descriptions$Cluster==i,])
}