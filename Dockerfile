FROM ubuntu:18.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version
RUN mkdir /test
RUN conda install -y -c conda-forge -c bioconda pyfastx=0.8.4
RUN python --version
RUN python -c "import pyfastx; print('PyFastx version:', pyfastx.version())"
COPY test.fa /test
COPY test.py /test
RUN python /test/test.py /test/test.fa

