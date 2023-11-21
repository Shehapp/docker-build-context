# pull python (9 layers)
FROM python:latest  

# create container add /app remove container (a layer)
WORKDIR /app

# create container add req.txt to /app remove container (a layer)
COPY req.txt .

# create container install all packages remove container (a layer)
RUN pip install -r req.txt

# create container add py file remove container (a layer)
COPY hello.py .

# won't create (a new layer) cuz it will change in meta-date
# execute in run time of container, not build time of image
EXPOSE 8000

# won't create (a new layer) cuz it will change in meta-date
# execute in run time of container, not build time of image
CMD python hello.py