# 100 Days of KodeKloud DevOps Practice

This repository contains my solutions and execution steps for various DevOps tasks from KodeKloud practice labs.

## Table of Contents
- [Task 1: Create Non-Interactive User](#task-1-create-non-interactive-user)
- [Task 2: Create User with Expiry Date](#task-2-create-user-with-expiry-date)
- [Task 3: Disable SSH Root Login](#task-3-disable-ssh-root-login)
- [Task 4: Grant Executable Permissions](#task-4-grant-executable-permissions)
- [Task 5: Install and Disable SELinux](#task-5-install-and-disable-selinux)
- [Task 6: Setup Crontab](#task-6-setup-crontab)
- [Task 7: Create User with Custom UID and Home Directory](#task-7-create-user-with-custom-uid-and-home-directory)
- [Task 8: Create Group and Add User](#task-8-create-group-and-add-user)
- [Task 9: Setup Password-less SSH Authentication](#task-9-setup-password-less-ssh-authentication)

---

## Task 1: Create Non-Interactive User

**Objective:** Create a user named `james` with a non-interactive shell on App Server.

### Steps:
```bash
# Connect to the app server
ssh banner@172.16.238.12

# Create user with non-interactive shell
sudo useradd james -s /sbin/nologin

# Verify user creation
id james
# OR
grep james /etc/passwd
```

**Expected Output:**
```
james:x:1001:1001::/home/james:/sbin/nologin
```

---

## Task 2: Create User with Expiry Date

**Objective:** Create a user in app server with expiry date.

### Steps:
```bash
# Connect to the app server
ssh steve@172.16.238.11

# Create user with expiry date
sudo useradd mariyam -e 2025-09-30

# Verify user creation
id mariyam
# OR
grep mariyam /etc/passwd
```

---

## Task 3: Disable SSH Root Login

**Objective:** Disable direct SSH root login on all app servers.

### Steps:
```bash
# Connect to the app server
ssh tony@172.16.238.10

# Switch to root user
sudo su -

# Edit SSH configuration
vi /etc/ssh/sshd_config
```

**Configuration Change:**
```
# Change this line:
PermitRootLogin yes
# To:
PermitRootLogin no
```

```bash
# Restart SSH service
sudo systemctl restart sshd

# Check service status
sudo systemctl status sshd

# Verify root login is disabled by attempting SSH as root (should fail)
ssh root@172.16.238.10
```

---

## Task 4: Grant Executable Permissions

**Objective:** Grant executable permissions to the `/tmp/xfusioncorp.sh` script on App Server 2.

### Steps:
```bash
# Connect to app server 2
ssh steve@stapp02.stratos.xfusioncorp.com

# Switch to root user
sudo su -

# Navigate to the directory and check current permissions
cd /tmp
ls -lrt

# Grant executable permissions
chmod 755 xfusioncorp.sh

# Verify permissions
ls -l xfusioncorp.sh
```

**Expected Output:**
```
-rwxr-xr-x 1 root root 40 Sep 23 07:47 xfusioncorp.sh
```

---

## Task 5: Install and Disable SELinux

**Objective:** 
- Install the required SELinux packages
- Permanently disable SELinux for the time being
- No reboot required as maintenance reboot is scheduled

### Steps:
```bash
# Check Linux distribution
cat /etc/os-release
# OR
uname -a

# Install SELinux packages
sudo yum install -y policycoreutils selinux-policy selinux-policy-targeted libselinux-utils

# Edit SELinux configuration
vi /etc/selinux/config
```

**Configuration Change:**
```
# Change from:
SELINUX=enforcing
# To:
SELINUX=disabled
```

```bash
# Check SELinux status
sestatus
```

**Expected Output:**
```
SELinux status: disabled
```

---

## Task 6: Setup Crontab

**Objective:** Create crontab entries on all app servers.

### Steps:
```bash
# Connect to app server
ssh tony@172.16.238.10

# Install cron service if not present
sudo yum install cronie -y

# Check and start cron service if not running
sudo systemctl status crond
sudo systemctl start crond
sudo systemctl enable crond

# Edit crontab
sudo crontab -e
```

**Crontab Entry:**
```
# Run every 5 minutes
*/5 * * * * echo hello > /tmp/cron_text
```

---

## Task 7: Create User with Custom UID and Home Directory

**Objective:** Create a user named `ammar` with UID 1729 and home directory `/var/www/ammar`.

### Steps:
```bash
# Create user with custom UID and home directory
sudo useradd ammar -m -u 1729 -d /var/www/ammar

# Verify user creation
id ammar
ls -la /var/www/
```

### Command Explanation:
- `sudo` → Super user permissions
- `useradd` → Command to create new user accounts
- `-m` → Creates the user's home directory if it doesn't exist
- `-u 1729` → Assigns UID 1729 to user ammar
- `-d /var/www/ammar` → Sets custom home directory path

> **Note:** To create a user without home directory, use: `useradd username -M`

---

## Task 8: Create Group and Add User

**Objective:** 
- Create a group named `nautilus_sftp_users` across all App servers
- Add user `stark` to the group (create user if doesn't exist)

### Steps:
```bash
# Connect to app server
ssh tony@172.16.238.10

# Create group
sudo groupadd nautilus_sftp_users

# Create user and add to group
sudo useradd stark -G nautilus_sftp_users

# Verify user and group membership
id stark
```

**Expected Output:**
```
uid=1002(stark) gid=1002(stark) groups=1002(stark),1001(nautilus_sftp_users)
```

---

## Task 9: Setup Password-less SSH Authentication

**Objective:** Set up password-less authentication from user `thor` on jump host to all app servers through their respective sudo users.

### Steps:

#### On Jump Host (as thor user):
```bash
# Generate SSH key pair
ssh-keygen -t rsa

# Copy public key to app server
scp ~/.ssh/id_rsa.pub tony@172.16.238.10:/tmp/id_rsa.pub
```

#### On App Server:
```bash
# Connect to app server
ssh tony@172.16.238.10

# Check if public key was copied
ls /tmp

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh

# Add public key to authorized_keys
cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

# Set proper permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Exit from app server
exit
```

#### Verify Password-less Authentication:
```bash
# Test connection (should not prompt for password)
ssh tony@172.16.238.10
```

> **Note:** Repeat these steps for all app servers with their respective sudo users.

---

## Environment Details

**Common App Server IPs:**
- App Server 1: `172.16.238.10` (user: tony)
- App Server 2: `172.16.238.11` (user: steve)  
- App Server 3: `172.16.238.12` (user: banner)

**Alternative Hostnames:**
- App Server 2: `stapp02.stratos.xfusioncorp.com`

---

## Tips and Best Practices

1. **Always verify your changes after implementation**
2. **Check service status after configuration changes**
3. **Use `id username` or `grep username /etc/passwd` to verify user creation**
4. **Keep backups of configuration files before editing**
5. **Test SSH connections from a separate terminal session before closing current session**
6. **Use `systemctl enable service_name` to ensure services start on boot**
7. **Set proper file permissions for SSH keys (700 for .ssh directory, 600 for authorized_keys)**

---

## Common Commands Reference

### User Management
```bash
# Create user with options
sudo useradd username -s /shell -u UID -d /home/dir -e YYYY-MM-DD

# Add user to group
sudo usermod -aG groupname username

# Check user info
id username
grep username /etc/passwd
```

### File Permissions
```bash
# Set executable permissions
chmod +x filename
chmod 755 filename

# Check permissions
ls -l filename
```

### Service Management
```bash
# Check service status
sudo systemctl status servicename

# Start/stop/restart service
sudo systemctl start servicename
sudo systemctl stop servicename
sudo systemctl restart servicename

# Enable service at boot
sudo systemctl enable servicename
```

---

*Last updated: September 30, 2025*