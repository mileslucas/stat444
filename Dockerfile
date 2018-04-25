FROM jupyter/scipy-notebook

RUN pip install -U pymc3
RUN pip install -U numpy
RUN pip install -U astropy
RUN conda install mkl-service
ENV MKL_THREADING_LAYER=GNU
