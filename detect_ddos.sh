#!/bin/bash

# Path to your Apache access log (adjust as needed)
ACCESS_LOG="/var/log/apache2/access.log"

# Threshold for identifying excessive requests (you can adjust this)
REQUEST_THRESHOLD=100

# Temporary file to store detected IPs
TMP_FILE="/tmp/ddos_ips.txt"

# Clear the temporary file
> "$TMP_FILE"

# Parse the access log and identify IPs with excessive requests
awk '{print $1}' "$ACCESS_LOG" | sort | uniq -c | sort -nr | while read count ip; do
    if [ "$count" -gt "$REQUEST_THRESHOLD" ]; then
        echo "$ip" >> "$TMP_FILE"
    fi
done

# Log detected IPs to a file
if [ -s "$TMP_FILE" ]; then
    echo "Potential DDoS attack detected. IPs:" > ddos_detected.txt
    cat "$TMP_FILE" >> ddos_detected.txt
else
    echo "No DDoS attack detected." > ddos_detected.txt
fi

# Clean up temporary file
rm "$TMP_FILE"

echo "Detection completed. Results logged in ddos_detected.txt."
