# Start from a base image
FROM centos:7

# Copy the scripts into the container
COPY generate_logs.sh /usr/local/bin/
COPY system_journal.sh /usr/local/bin/

# Set the working directory
WORKDIR /usr/local/bin/

# Make the scripts executable
RUN chmod +x generate_logs.sh system_journal.sh

# Run the scripts
CMD ["./generate_logs.sh"]
