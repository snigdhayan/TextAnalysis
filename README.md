# TextAnalysis

I have a dataset containing (among others) the 'StockCode' and the 'Description' of several online purchases. The aim of this prototype it to classify the descriptions according to semantic similarity. My low-tech approach in 'OnlineRetailAnalysisViaRTM.R' is based on the R package https://cran.r-project.org/web/packages/tm/

Roughly speaking, I do the following:

1. Create features out of descriptions as DocumentTermMatrix
2. Cluster the features via k-means (no. of clusters is simply a guess)

The observations belonging to the same cluster are expected to be similar. I demonstrate this in a few clusters. I plan to try out the R package https://cran.r-project.org/web/packages/lsa/index.html in future. In the jupyter notebook 'OnlineRetailAnalysisViaSpark.ipynb' I tried to execute the same strategy via PySpark in Docker.