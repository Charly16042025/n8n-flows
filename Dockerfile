FROM n8nio/n8n:1.33.0

ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=true
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=Admin123!
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE=UTC
ENV DB_TYPE=sqlite
ENV DB_SQLITE_VACUUM_ON_STARTUP=true

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

CMD ["/usr/bin/node", "/usr/local/lib/node_modules/n8n/bin/n8n"]
