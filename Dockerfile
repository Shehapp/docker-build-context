# pull python (9 layers)
FROM python:latest  


#just meta data in image
LABEL maintainer "shehapoo"
LABEL desc="first dockerfile"
LABEL is_dev="true"

ENV sql_user=shehapoo
ENV sql_password=p@ssword


# create container add /app remove container (a layer)
WORKDIR /app

# create container add all build context except files in .dockerignore
# to /app remove container (a layer)
COPY . .

# after this line all commands will execute in bash in sh
SHELL [ "/bin/bash","-c" ]

# create container install all packages remove container (a layer)
RUN pip install -r req.txt


# won't create (a new layer) cuz it will change in meta-date
# execute in run time of container, not build time of image
EXPOSE 8000

# won't create (a new layer) cuz it will change in meta-date
# execute in run time of container, not build time of image
CMD python hello.py