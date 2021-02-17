# TextAnalysis

I prepared a dataset containing (among others) the `StockCode` and the `Description` of several online purchases based on dataset nr. 1 below. The aim of this prototype it to classify the descriptions according to semantic similarity. My low-tech approach in `OnlineRetailAnalysisViaRTM.R` is based on the R package https://cran.r-project.org/web/packages/tm/

Roughly speaking, I do the following:

1. Create features out of descriptions as `DocumentTermMatrix`
2. Cluster the features via `k-means` (no. of clusters is simply a guess)

The observations belonging to the same cluster are expected to be similar. I demonstrate the results of a few clusters. In the jupyter notebook `OnlineRetailAnalysisViaSpark.ipynb` I executed the same strategy via `PySpark`. 

In the jupyter notebook `TextClassificationViaLogitSpark.ipynb` I used a `logistic regression` model to perform text classification via `PySpark`. For this purpose I suitably preprocessed the dataset nr. 2 below.

Modified versions of the following datasets have been used in this repository:
1. `Online Retail II` - https://archive.ics.uci.edu/ml/datasets/Online+Retail+II
2. `CLINC150` - https://archive.ics.uci.edu/ml/datasets/CLINC150