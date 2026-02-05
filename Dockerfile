FROM rocker/rstudio:4.4.2

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio renv.lock renv.lock
COPY --chown=rstudio:rstudio .Rprofile .Rprofile
COPY --chown=rstudio:rstudio renv/activate.R renv/activate.R
COPY --chown=rstudio:rstudio renv/settings.json renv/settings.json

COPY --chown=rstudio:rstudio analysis.R analysis.R

USER rstudio

RUN Rscript -e "renv::restore(prompt = FALSE)"

USER root