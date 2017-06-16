FROM centos:6.7

ENV LANG=en_US.UTF-8

RUN yum install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 tar cyrus-sasl-devel gcc-c++ \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

ADD requirements.txt /

RUN conda create -n wb_env python=2 python anaconda -y && source activate wb_env && pip install -r /requirements.txt && \
    source deactivate && conda create -n wb_env_offline --clone wb_env --offline && \
    tar -cvzf /opt/conda/envs/wb_env_offline.tar.gz /opt/conda/envs/wb_env_offline/

CMD /bin/mv /opt/conda/envs/wb_env_offline.tar.gz /extract/