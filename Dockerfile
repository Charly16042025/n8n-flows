FROM n8nio/n8n:1.33.0

ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=true
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=AdminPassword123!
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE=UTC
ENV NODE_ENV=production

RUN mkdir -p /home/node/.n8n && \
    chmod 700 /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node

ENTRYPOINT ["/usr/bin/env"]
CMD ["n8n", "start"]
