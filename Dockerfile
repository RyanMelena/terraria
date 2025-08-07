# Start from the third-party image
FROM beardedio/terraria:latest

# Fix hard-coded root entries
RUN sed -i 's#/root#~#g' /vanilla/run.sh && cat /vanilla/run.sh
