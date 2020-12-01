FROM jupyter/datascience-notebook:python-3.8.5

# Set up RStudio
RUN pip install jupyter-rsession-proxy
USER root
RUN apt-get update && \
     apt-get install -y psmisc libapparmor1 sudo lsb-release libssl-dev procps vim && \
     curl --silent -L --fail https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.5001-amd64.deb > /tmp/rstudio.deb && \
     apt-get install -y /tmp/rstudio.deb && \
     rm /tmp/rstudio.deb && \ 
     apt-get clean && rm -rf /var/lib/apt/lists/*
USER $NB_USER
ENV PATH=$PATH:/usr/lib/rstudio-server/bin

# Install conda requirements
COPY conda-requirements.txt /tmp/
RUN conda install --yes -c conda-forge --file /tmp/conda-requirements.txt

# Install pip requirements
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

# Make sure vega-cli are available for altair export
USER root
RUN apt-get update && apt-get install -y libcairo2-dev libsdl-pango-dev
USER $NB_USER
RUN npm install -g --unsafe --force vega vega-cli vega-lite canvas
