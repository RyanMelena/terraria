# Start from the third-party image
FROM beardedio/terraria:latest

# Fix hard-coded root entries
RUN sed -i 's|/root|$HOME|g' /vanilla/run.sh

# Insert logic after first line using sed
RUN sed -i '1a\
set -e\n\
USER_ID=$(id -u)\n\
GROUP_ID=$(id -g)\n\
if ! getent passwd "$USER_ID" > /dev/null; then\n\
  HOME_DIR="/home/terraria"\n\
  echo "terraria:x:${USER_ID}:${GROUP_ID}:Terraria User:${HOME_DIR}:/bin/bash" >> /etc/passwd\n\
  mkdir -p "$HOME_DIR"\n\
  chown "$USER_ID:$GROUP_ID" "$HOME_DIR"\n\
fi\n\
export HOME=${HOME_DIR:-/home/terraria}' /vanilla/run.sh

RUN cat /vanilla/run.sh