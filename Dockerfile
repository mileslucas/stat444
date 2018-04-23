FROM jupyter/scipy-notebook

RUN pip install -U pymc3
RUN pip install -U numpy
RUN pip install -U astropy
