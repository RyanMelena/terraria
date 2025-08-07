# Start from the third-party image
FROM beardedio/terraria:latest

# Create home directory
RUN mkdir -p /home/terraria

# Set HOME environment variable
ENV HOME=/home/terraria

# Fix hard-coded root entries
RUN sed -i 's|/root|$HOME|g' /vanilla/run.sh

RUN cat /vanilla/run.sh
