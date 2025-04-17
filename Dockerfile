FROM n8nio/n8n:latest

# Create data directory as root first
USER root
RUN mkdir -p /data && chown -R node:node /data

# Switch back to node user
USER node
VOLUME /data
EXPOSE 8080
