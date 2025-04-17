FROM n8nio/n8n:latest
RUN mkdir -p /data && chown -R node:node /data
VOLUME /data
USER node
EXPOSE 8080
