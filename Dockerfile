FROM biocontainers/biocontainers:latest

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="RATT"
LABEL software.version="https://gitlab.com/LPCDRP/RATT/commit/932224a5ab700a305ed42f6c8d2a98c6aad9ebb7"
LABEL description="Rapid Annotation Transfer Tool"
LABEL website="http://ratt.sourceforge.net/index.html"
LABEL documentation="http://ratt.sourceforge.net/documentation.html"
LABEL license="http://ratt.sourceforge.net/documentation.html"
LABEL tags="General,Genomics,Annotation"

MAINTAINER kusmirekwiktor@gmail.com

RUN conda install mummer blast

USER root

RUN cd /opt && \
    git clone https://gitlab.com/LPCDRP/RATT.git ratt && \
    svn co "https://svn.code.sf.net/p/ratt/code/" ratt-code

USER biodocker

ENV PATH=$PATH:/opt/ratt
ENV RATT_HOME=/opt/ratt


WORKDIR /data/

CMD ["bash"]
