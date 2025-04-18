# Use official n8n image
FROM n8nio/n8n:latest

# ===== Core Configuration =====
# Disable setup wizard (MUST be false to skip owner setup)
ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=false

# Authentication (username/password)
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=YourSecurePass123!  # Change to your password (8+ chars, 1 number, 1 uppercase)

# Network settings
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=8080

# Timezone (required for some installations)
ENV GENERIC_TIMEZONE=UTC

# ===== Database Setup =====
# Create persistent data directory
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# ===== Optional: Pre-Create Admin User (Nuclear Option) =====
# Uncomment if setup wizard still appears
# USER root
# RUN apt-get update && apt-get install -y sqlite3
# USER node
# RUN sqlite3 /home/node/.n8n/database.sqlite \
#   "CREATE TABLE IF NOT EXISTS users ( \
#     id INTEGER PRIMARY KEY AUTOINCREMENT, \
#     email TEXT NOT NULL, \
#     firstName TEXT, \
#     lastName TEXT, \
#     password TEXT NOT NULL, \
#     globalRoleId INTEGER NOT NULL \
#   );"
# RUN sqlite3 /home/node/.n8n/database.sqlite \
#   "INSERT INTO users (email, firstName, lastName, password, globalRoleId) \
#    VALUES ('admin@example.com', 'Admin', 'User', '\$2a\$12\$YOUR_BCRYPT_HASH', 1);"

# ===== Startup =====
# Switch to non-root user for security
USER node

# Launch n8n (using absolute path to avoid 'command not found')
CMD ["/usr/local/bin/n8n"]
