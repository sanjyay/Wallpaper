#!/bin/bash

# Source directory to monitor
SOURCE_DIR=""

# Destination directory where files will be saved
DEST_DIR=""

# Check interval (in seconds)
CHECK_INTERVAL=60  # Adjust as needed

# Synchronization function to copy files from source to destination
synchronize() {
  # Use rsync to copy new files without overwriting existing ones
  rsync -av --ignore-existing "$SOURCE_DIR/" "$DEST_DIR/"
}

# Loop to check for changes periodically
while true; do
  echo "Starting synchronization..."
  
  # Call the synchronization function
  synchronize
  
  echo "Synchronization complete. Next check in $CHECK_INTERVAL seconds."
  
  # Wait before the next synchronization
  sleep "$CHECK_INTERVAL"
done
