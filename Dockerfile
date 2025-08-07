# Start from the third-party image
FROM beardedio/terraria:latest

# Set HOME environment variable
ENV HOME=/home/terraria

# Create home directory
RUN mkdir -p $HOME/.local/share/Terraria

# Fix hard-coded root entries
RUN sed -i 's|/root|$HOME|g' /vanilla/run.sh

RUN cat /vanilla/run.sh
