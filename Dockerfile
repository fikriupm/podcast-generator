FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3.10-venv # Install python venv

RUN python3 -m venv /venv  # Create a virtual environment
RUN /venv/bin/pip install PyYAML # Install PyYAML in the virtual environment

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENV PATH="/venv/bin:$PATH" # Update PATH to use the virtual environment's pip and python

ENTRYPOINT ["/entrypoint.sh"]