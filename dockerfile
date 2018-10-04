# miniconda image with conda
FROM continuumio/miniconda

# Install basic packages
RUN apt-get update && apt-get install -y libltdl7 && rm -rf /var/lib/apt/lists/*
RUN conda update -y conda
RUN conda install -c anaconda dill networkx numpy scipy pandas seaborn matplotlib statsmodels pyyaml pytables scikit-learn
RUN conda install -c bioconda pysam pyvcf
RUN conda install -c conda-forge pypdf2 pika
RUN pip install azure-storage azure-batch futures azure-mgmt
# Make port 80 available to the world outside this container
EXPOSE 80

# Run python when the container launches
CMD ["python"]