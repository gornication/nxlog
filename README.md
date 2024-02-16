# Monitoring System Journal with Docker and NXLog

Please note that due to limitations in a Docker container environment, the script provided here is for testing purposes only and may not provide actual system journal logs.
This project provides a Docker-based solution for monitoring the system journal on Linux using NXLog. 

## Dockerfile

The Dockerfile sets up the environment for running the system_journal.sh script and NXLog. It starts with a base image installs necessary packages including NXLog, and copies the system_journal.sh script into the container. The script is then configured to run as an ordinary user (not root) within the container.

## NXLog Configuration

The nxlog.conf file configures NXLog to read logs from the STDOUT of the system_journal.sh script and forward them to a destination, such as a log aggregator or SIEM system. However, please note that logs won't be available in a Docker environment without `journalctl` or an alternative logging mechanism.

## system_journal.sh Script

The system_journal.sh script follows and prints the system journal using the `journalctl` command. However, since `journalctl` and the systemd journal are not available in a Docker container environment, this script is for testing purposes only and may not provide actual system journal logs.

## Usage

To use this solution:

1. Build the Docker image:
docker build -t <name> .

2. Run the Docker container:
docker run --rm <name>


Please note that logs won't be visible in the container without `journalctl` or an alternative logging mechanism.

## Limitations

- This solution is for testing purposes only and may not provide actual system journal logs in a Docker environment.
- Logs won't be visible in the container without `journalctl` or an alternative logging mechanism.
- NXLog configuration is provided as an example and may need to be adjusted based on specific requirements and infrastructure setup.
