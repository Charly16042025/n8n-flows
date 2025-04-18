FROM n8nio/n8n:1.33.0

ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=true
ENV DB_TYPE=sqlite
ENV DB_SQLITE_VACUUM_ON_STARTUP=true
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=Admin123!
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    touch /home/node/.n8n/database.sqlite && \
    chown node:node /home/node/.n8n/database.sqlite && \
    sqlite3 /home/node/.n8n/database.sqlite \
    "CREATE TABLE user (\
      id INTEGER PRIMARY KEY AUTOINCREMENT,\
      email TEXT NOT NULL,\
      firstName TEXT,\
      lastName TEXT,\
      password TEXT NOT NULL,\
      globalRoleId INTEGER NOT NULL\
    );" && \
    sqlite3 /home/node/.n8n/database.sqlite \
    "INSERT INTO user (email, firstName, lastName, password, globalRoleId) \
     VALUES ('admin@example.com', 'Admin', 'User', '\$2a\$10\$hashedpassword', 1);"

USER node

CMD ["n8n", "start"]
