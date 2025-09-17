FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y git fortune-mod cowsay curl netcat && \
    rm -rf /var/lib/apt/lists/*

# Ensure cowsay is discoverable (it's usually in /usr/games)
ENV PATH="/usr/games:${PATH}"

# Clone your app
RUN git clone https://github.com/dsaikrishna2612/wisecow.git /opt/wisecow
WORKDIR /opt/wisecow

# Make the script executable
RUN chmod +x wisecow.sh

# Copy the startup wrapper
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 4499

# Start the app
CMD ["/start.sh"]
