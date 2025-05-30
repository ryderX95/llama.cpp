FROM ubuntu:24.04

RUN apt update && \
    apt install -y build-essential cmake git curl libcurl4-openssl-dev libopenblas-dev libomp-dev

WORKDIR /app

# Copy llama.cpp source into container
COPY . /app

# Build llama.cpp
RUN mkdir build && cd build && cmake .. && cmake --build . --config Release

WORKDIR /app/build/bin

# Copy entrypoint script into container
COPY entrypoint.sh /app/build/bin/entrypoint.sh
RUN chmod +x /app/build/bin/entrypoint.sh

# Run server via entrypoint to bind to 0.0.0.0
ENTRYPOINT ["/app/build/bin/entrypoint.sh"]
