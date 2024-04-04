# DDoS Attack and Detection Project

## Overview
This project focuses on creating a web server with Apache on Ubuntu and simulating a DDoS attack using zombie machines controlled via SSH. The attack is carried out using the `hping3` tool. Additionally, we implement a Bash script to analyze web server logs and identify suspicious IPs that send excessive requests simultaneously. If such IPs are detected, they are logged in a text file for further investigation.

## Features
- **Web Server Setup**: We set up an Apache web server on an Ubuntu machine.
- **Zombie Machines**: Ubuntu machines act as zombies, controlled remotely via SSH.
- **Attack Simulation**: The `hping3` tool is used to simulate DDoS attacks.
- **Log Analysis**: A Bash script examines web server logs for suspicious IP activity.
- **IP Logging**: Detected attacking IPs are logged in a text file.

## Installation
1. **Web Server Setup**:
   - Install Apache on your Ubuntu machine:
     ```
     sudo apt update
     sudo apt install apache2
     ```
   - Configure Apache to serve your web content.

2. **Zombie Machines**:
   - Set up additional Ubuntu machines as zombies.
   - Install SSH server on each zombie machine:
     ```
     sudo apt install openssh-server
     ```
   - Ensure proper network connectivity between the control machine and zombies.

3. **Attack Simulation**:
   - Use `hping3` to simulate DDoS attacks from zombie machines:
     ```
     sudo apt install hping3
     hping3 <target_ip> -S -p <target_port> -c <num_packets>
     ```

4. **Log Analysis Script**:
   - Create a Bash script (e.g., `detect_ddos.sh`) to parse web server logs.
   - Check for IPs with unusually high request rates.
   - Detection completed. Results logged in `ddos_detected.txt`

## SSH Configuration
### Server Configuration
1. **Install OpenSSH Server**:
   - Install the OpenSSH server on your web server machine:
     ```
     sudo apt install openssh-server
     ```

2. **Configure SSH Server**:
   - Edit the SSH server configuration file:
     ```
     sudo nano /etc/ssh/sshd_config
     ```
   - Customize settings as needed (e.g., port, authentication methods, etc.).

3. **Restart SSH Service**:
   ```
   sudo systemctl restart ssh
   ```

### Client Configuration
1. **Generate SSH Key Pair**:
   - On the client machine (your control machine), generate an SSH key pair (if not already done):
     ```
     ssh-keygen
     ```

2. **Copy Public Key to Server**:
   - Copy the public key to the server for passwordless authentication:
     ```
     ssh-copy-id <username>@<server_ip>
     ```

3. **Test SSH Connection**:
   - Verify that you can SSH into the server without a password prompt:
     ```
     ssh <username>@<server_ip>
     ```

## Parallel SSH (PSSH)
- **Installation**:
  - Install `pssh` (or `parallel-ssh`) on your control machine:
    ```
    sudo apt install parallel-ssh
    ```

- **Usage**:
  - Execute commands on multiple hosts in parallel:
    ```
    pssh -i -h /path/to/hosts_file "command"
    ```

## Contributing
Contributions are welcome! Feel free to enhance the project, add new features, or improve existing ones.

## Note
- This project is for educational purposes only. Ensure you have proper authorization before testing on real systems.
- Be responsible and ethical when conducting any security-related experiments.
