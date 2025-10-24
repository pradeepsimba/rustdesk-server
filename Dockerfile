
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y wget ca-certificates bash

# Download RustDesk server binaries
RUN wget https://github.com/rustdesk/rustdesk/releases/download/1.3.0/rustdesk-server-linux.zip \
    && apt-get install -y unzip \
    && unzip rustdesk-server-linux.zip -d /usr/local/bin \
    && rm rustdesk-server-linux.zip

# Set PATH (if needed)
ENV PATH="/usr/local/bin:${PATH}"

CMD ["hbbs"]
