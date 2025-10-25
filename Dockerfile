FROM debian:bookworm-slim

# Install a minimal runtime and bash so `docker exec -it <container> bash` works
RUN apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates bash curl \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy prebuilt binaries if you provide them in ./bin when building locally.
# If you don't provide binaries, start will fail (no hbbs/hbbr), but the image
# will be valid and include a shell for debugging.
COPY bin/hbbs /usr/local/bin/hbbs
COPY bin/hbbr /usr/local/bin/hbbr
RUN chmod +x /usr/local/bin/hbbs /usr/local/bin/hbbr || true

# Default command — can be overridden by docker-compose or `docker run`.
CMD ["hbbs"]
