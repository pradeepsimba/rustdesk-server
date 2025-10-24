# Install bash
RUN apt-get update && apt-get install -y bash

# Default command (can be overridden by docker-compose)
CMD ["hbbs"]
