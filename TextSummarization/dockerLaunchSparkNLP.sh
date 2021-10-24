#!/bin/bash

docker build -f ./Dockerfile.txt -t mysparknlp .

docker run -t -d -v /$(pwd)/TextSummarization:/TextSummarization -p 8888:8888 --name mysparknlp mysparknlp

docker exec -it mysparknlp jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --port=8888

# docker system prune -a -f