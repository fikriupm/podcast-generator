FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# Create a virtual environment and install dependencies
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install PyYAML

# Copy script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set virtual environment as default
ENV PATH="/opt/venv/bin:$PATH"

ENTRYPOINT ["/entrypoint.sh"]
