FROM data_science:0.0.1

COPY _build/setup/ /setup
WORKDIR /setup/scripts
USER root

RUN . ./cd_distro \
    && cd /setup/scripts/conda \
    && cd /setup \
        && conda env update --name base --file environment.yml \
    && cd / \
        && rm -r setup

USER normaluser
WORKDIR /home/normaluser
