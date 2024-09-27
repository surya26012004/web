#!/bin/bash

# Script to demonstrate time-related functionalities

# Function to display current date and time
display_current_time() {
  echo "Current Date and Time: $(date)"
}

# Function to calculate the difference between two dates
calculate_date_difference() {
  read -p "Enter the first date (YYYY-MM-DD): " date1
  read -p "Enter the second date (YYYY-MM-DD): " date2

  # Convert dates to seconds since epoch
  seconds1=$(date -d "$date1" +%s)
  seconds2=$(date -d "$date2" +%s)

  if [[ $? -ne 0 ]]; then
    echo "Invalid date format. Please use YYYY-MM-DD."
    return
  fi

  # Calculate the difference in days
  difference=$(( (seconds2 - seconds1) / 86400 ))
  echo "The difference between $date1 and $date2 is $difference days."
}

# Function to time the execution of a command
time_command_execution() {
  read -p "Enter a command to time (e.g., sleep 2): " command
  echo "Timing the execution of: $command"
  
  # Start timer
  start=$(date +%s)
  eval "$command"  # Execute the command
  end=$(date +%s)

  # Calculate duration
  duration=$(( end - start ))
  echo "Command executed in $duration seconds."
}

# Main script execution
display_current_time
calculate_date_difference
time_command_execution
