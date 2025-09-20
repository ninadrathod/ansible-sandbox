#!/bin/sh
ENV_FILE="./.env"

# Check if the .env file exists
if [ -f "$ENV_FILE" ]; then
  # Read the .env file, filter out comments and empty lines, and export variables
  export $(grep -vE '^\s*#|^\s*$' "$ENV_FILE" | xargs)
  echo "Environment variables loaded from $ENV_FILE (filtered)"
else
  echo "Error: .env file not found at $ENV_FILE"
  exit 1
fi

apk add --no-cache openssh

# Add a new user with a home directory and a specific shell.
adduser -h /home/$SSH_USER -s /bin/sh -D $SSH_USER

# Set the user's password using the value from the SSH_PASSWORD variable.
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

# Generate all standard SSH host keys for the server.
ssh-keygen -A

# Run the SSH Daemon 
exec /usr/sbin/sshd -D -e "$@"