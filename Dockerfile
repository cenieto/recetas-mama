ARG PYTHON_IMAGE_VERSION=3.12.0-slim-bookworm

FROM python:${PYTHON_IMAGE_VERSION}

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential git
RUN pip install --upgrade pip

ARG ENTRYPOINT
WORKDIR ${ENTRYPOINT}

COPY requirements.txt /requirements.txt
COPY requirements/ /requirements

RUN pip install -r /requirements.txt
