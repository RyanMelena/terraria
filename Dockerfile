# Start from the third-party image
FROM beardedio/terraria:latest

# Fix hard-coded root entries
RUN sed 's#/root#~#g' /vanilla/run.sh
RUN cat /vanilla/run.sh
