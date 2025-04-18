# Use the official n8n image
FROM n8nio/n8n:latest

# Hardcode credentials and disable setup wizard
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin  # Change to your desired username
ENV N8N_BASIC_AUTH_PASSWORD=YourSecurePassword123  # Change to a strong password
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=8080

# Disable setup wizard (critical!)
ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=false

# Create data directory (required for persistence)
RUN mkdir -p /home/node/.n8n
RUN chown -R node:node /home/node/.n8n

# Run as non-root user
USER node

# Start n8n
CMD ["n8n"]
