# TextAnalysis

In the directory `TextClustering` I prepared an unlabeled dataset containing (among others) the `StockCode` and the `Description` of several online purchases based on dataset nr. 1 below. The aim of this prototype it to group the descriptions according to semantic similarity. My low-tech approach in `OnlineRetailAnalysisViaR.ipynb` is based on the R package https://cran.r-project.org/web/packages/tm/.

Roughly speaking, I do the following:

1. Create features out of descriptions as `DocumentTermMatrix`
2. Cluster the features via `k-means` (no. of clusters is simply a guess)

The observations belonging to the same cluster are expected to be similar. I demonstrate the results of a few clusters. In the jupyter notebook `OnlineRetailAnalysisViaSpark.ipynb` I executed the same strategy using `PySpark`. 

In the directory `TextClassification` there is a jupyter notebook `TextClassificationViaLogitSpark.ipynb`, where I performed text classification. For this purpose I suitably preprocessed the labeled dataset nr. 2 below. Then I applied a `logistic regression` model using `PySpark`. 

Modified versions of the following datasets have been used in this repository:
1. `Online Retail II` - https://archive.ics.uci.edu/ml/datasets/Online+Retail+II
2. `CLINC150` - https://archive.ics.uci.edu/ml/datasets/CLINC150

In the directory `TextSummarization` there is a jupyter notebook `TextSummarization.ipynb`, where I used `Spark NLP` and `Google T5` to summarize a text. I followed this example https://github.com/JohnSnowLabs/spark-nlp-workshop/blob/master/tutorials/streamlit_notebooks/T5TRANSFORMER.ipynb. I executed the notebook in a docker container. For completeness I have published the dockerfile and other related artifacts (like the launch script `dockerLaunchSparkNLP.sh`).