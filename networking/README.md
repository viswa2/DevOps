# Network Fundamentals

A computer network is a group of connected devices that communicate with each other to share data and resources.

## Table of Contents

- [Types of Networks](#types-of-networks)
- [Network Devices](#network-devices)
- [Network Protocols](#network-protocols)
- [Basic Networking Commands](#basic-networking-commands)
- [Types of IP Addresses](#types-of-ip-addresses)
- [IP Address Classes](#ip-address-classes-ipv4-only)
- [Network ID and Host ID](#ip-address---network-id-and-host-id)

---

## Types of Networks

There are different types of networks. The main two are **LAN** and **WAN**.

1. **LAN (Local Area Network)**
   - Interconnects computers within a limited area, such as residences, schools
   - Examples: Wi-Fi, Ethernet

2. **MAN (Metropolitan Area Network)**
   - Used in metropolitan areas (cities)
   - Covers larger geographic area than LAN but smaller than WAN

3. **WAN (Wide Area Network)**
   - Extends LAN over a large geographic area
   - Example: Optical fiber cable networks

4. **SONET (Synchronous Optical Network)**
   - Used in submarine communications
   - High-speed data transmission over optical fiber

---

## Network Devices

### 1. Router

A **Router** is a gateway device that connects multiple networks and directs data between them.

**Key Functions:**
- Connects local networks to the internet
- Determines the best path for data packets
- Uses IP addresses to forward data correctly

**Router Core Functionalities:**

1. **NAT (Network Address Translation)**
   - Method of remapping an IP address while in transit across a traffic routing device
   - Any device that goes outside via router/gateway gets its IP translated

2. **DMZ (Demilitarized Zone)**
   - A subnetwork that contains and exposes a device to an untrusted network (such as the internet)
   - Adds an extra layer of security

3. **Firewall**
   - Set of rules to control communication with the outside network
   - Filters traffic based on security policies

4. **Port Forwarding**
   - Redirects communication requests from one address and port number combination to another
   - Occurs while packets traverse network gateways (router or firewall)

### 2. Switch

A **Switch** connects devices within the same network and manages internal data communication.

**Key Functions:**
- Connects computers, printers, and servers
- Sends data only to the intended device
- Improves network efficiency and performance

### 3. Hub

A **Hub** is a basic device that connects multiple devices in a network.

**Key Functions:**
- Broadcasts data to all connected devices
- Does not filter or manage traffic
- Less secure and less efficient than a switch

### 4. Bridge

A **Bridge** connects two network segments and filters traffic between them.

**Key Functions:**
- Reduces unnecessary data transmission
- Improves network performance
- Works using MAC addresses

### 5. Gateway

A **Gateway** connects two different networks that use different protocols.

**Key Functions:**
- Translates data between different systems
- Enables communication between dissimilar networks
- Commonly used to connect private networks to external networks

### 6. Access Point (AP)

An **Access Point** provides wireless connectivity to devices in a network.

**Key Functions:**
- Extends a wired network into Wi-Fi
- Allows mobile devices to connect wirelessly
- Improves network coverage area

### 7. Modem

A **Modem** converts digital data into signals suitable for transmission and vice versa.

**Key Functions:**
- Connects a home or office network to the ISP
- Converts digital signals to analog and back
- Enables internet access

### 8. Firewall

A **Firewall** is a security device that monitors and controls network traffic.

**Key Functions:**
- Blocks unauthorized access
- Filters incoming and outgoing data
- Protects networks from cyber threats

---

## Network Protocols

A network protocol is a set of rules that determine how data is transmitted between different devices in the same network.

**Common Network Protocols:**



- **HTTP/HTTPS** (Hypertext Transfer Protocol / Secure)

  - Used for web browsing and website communication

  - HTTPS adds encryption for secure data transmission



- **TCP** (Transmission Control Protocol)

  - Breaks data into smaller packets

  - Ensures packets arrive safely and in order

  - Connection-oriented protocol



- **IP** (Internet Protocol)

  - Assigns addresses to devices on the network

  - Delivers packets to the correct destination

  - Works with TCP to form TCP/IP



- **SMTP** (Simple Mail Transfer Protocol)

  - Used for sending emails

  - Standard protocol for email transmission



- **FTP** (File Transfer Protocol)

  - Used for transferring files between systems

  - Supports file upload and download operations



---



## Basic Networking Commands



Here are essential networking commands for troubleshooting and network diagnostics:



### 1. ipconfig / ifconfig



**Purpose:** Display network configuration information



```bash

# Windows

ipconfig



# Linux/Mac OS

ifconfig

```



### 2. ipconfig /all



**Purpose:** Display detailed network configuration



```bash

ipconfig /all

```



### 3. nslookup



**Purpose:** Query DNS servers to obtain domain name or IP address mapping



```bash

nslookup www.google.com

```



**Output:** Fetches DNS server and underlying IP address



### 4. ping



**Purpose:** Test if a particular host is reachable



```bash

ping www.google.com

ping 8.8.8.8

```



**Use Case:** Check network connectivity and latency



### 5. tracert / traceroute



**Purpose:** Track the path packets take from source to destination



```bash

# Windows

tracert www.google.com



# Linux/Mac OS

traceroute www.google.com

```



**Use Case:** Identify network hops and diagnose intermittent performance issues



### 6. netstat



**Purpose:** Display network statistics and active connections



```bash

netstat

netstat -an  # Show all connections and listening ports

```



**Output:** Shows all open network connection statistics



### 7. telnet



**Purpose:** Test connection to a specific IP address and port



```bash

telnet [hostname or IP address] [port number]

```



**Example:**

```bash

telnet www.example.com 80

telnet 192.168.1.1 22

```



---

## Types of IP Addresses



### 1. IPv4 (Internet Protocol version 4)



**Technical Details:**

- 32-bit address format

- Written as four numbers separated by dots (e.g., `123.89.46.7`)

- Contains a combination of 32 bits (1s and 0s)

- Divided into 4 octets (groups of 8 bits each)

- Each octet represented by a decimal value (0-255)



**Binary to Decimal Conversion:**

```

1 byte = 8 bits

8 bits = 1 octet

8 bits = 2^8 = 256 possible values (0-255)

```



**Example IPv4 Address:**

```

192.168.1.1

```



![IPv4 Structure](<Screenshot 2026-04-05 at 11.52.48 AM.png>)



**Limitations:**

- Limited address space (~4.3 billion addresses)

- Exhaustion of available addresses led to IPv6 development



---



### 2. IPv6 (Internet Protocol version 6)



**Technical Details:**

- 128-bit address format

- Written in eight groups of hexadecimal numbers

- Separated by colons



**Example IPv6 Address:**

```

2001:0db8:85a3:0000:0000:8a2e:0370:7334

```



**Advantages:**

- Vastly larger pool of addresses

- Designed to replace IPv4 as it runs out of available addresses

- Enhanced security and efficiency features



![IPv6 Structure](image.png)



---



### 3. Public IP Address



**Characteristics:**

- Used to identify devices on the internet

- Assigned by Internet Service Providers (ISPs)

- Globally accessible and routable

- Required for internet-facing services



---



### 4. Private IP Address



**Characteristics:**

- Used within private networks (home, office, enterprise)

- Not accessible directly from the internet

- Must use NAT to communicate with the internet



**Reserved Private IP Ranges:**

```

Class A: 10.0.0.0 - 10.255.255.255

Class B: 172.16.0.0 - 172.31.255.255

Class C: 192.168.0.0 - 192.168.255.255

```



---



### 5. Static IP Address



**Characteristics:**

- Manually assigned to a device

- Does not change over time

- Used for servers and devices requiring consistent addressing

- Ideal for hosting services (web servers, email servers)



---



### 6. Dynamic IP Address



**Characteristics:**

- Automatically assigned by DHCP (Dynamic Host Configuration Protocol) server

- Changes periodically when lease expires

- Commonly used for home devices and clients

- More efficient use of limited IP addresses



---

## IP Address Classes (IPv4 Only)

The **IANA (Internet Assigned Numbers Authority)** divides IPv4 addresses into different classes based on the starting number, which determines their usage in networks.

> **Note:** You need to understand binary to decimal conversion to fully understand IP address classification.

### IP Address Class Overview

IPv4 addresses are divided into five classes (A through E) based on the first octet value.

| Class | IP Range                          | Purpose                                      | Default Subnet Mask |
|-------|-----------------------------------|----------------------------------------------|---------------------|
| A     | 1.0.0.0 - 126.255.255.255        | Large networks (e.g., big organizations)     | 255.0.0.0           |
| B     | 128.0.0.0 - 191.255.255.255      | Medium-sized networks                        | 255.255.0.0         |
| C     | 192.0.0.0 - 223.255.255.255      | Small networks (home or business LANs)       | 255.255.255.0       |
| D     | 224.0.0.0 - 239.255.255.255      | Reserved for multicasting                    | N/A                 |
| E     | 240.0.0.0 - 255.255.255.255      | Experimental (used for research)             | N/A                 |

![IP Address Classes](image-2.png)

---

### Special IP Address Ranges

#### 0.0.0.0
- **Not part of Class A** usable range
- Special address with specific networking purposes
- Often represents "any address" or "no particular address"

#### 127.0.0.0 - 127.255.255.255 (Loopback Range)
- **Reserved for loopback addresses** in IPv4
- Not part of the standard Class A range
- Most commonly used: `127.0.0.1` (localhost)

---

### What is Loopback?

A **loopback address** allows a device to communicate with itself.

**Key Points:**
- `127.0.0.1` is commonly known as **"localhost"**
- Any IP address in the `127.x.x.x` range loops back to the same device
- Used for testing network software on the local machine
- No external network connection required

**Common Use Cases:**
- Testing web servers locally
- Application development and debugging
- Network diagnostics
- Inter-process communication on the same machine

---

## IP Address - Network ID and Host ID

Every IP address consists of two main parts:

1. **Network ID** - Identifies the network
2. **Host ID** - Identifies the specific device (host) on that network

> **Note:** Any device that gets an IP address is called a **Host**.

---

### Network ID by IP Class

The Network ID portion differs depending on the IP address class:

| Class | Network ID Portion              | Host ID Portion           |
|-------|---------------------------------|---------------------------|
| A     | 1st octet                       | 2nd, 3rd, and 4th octets  |
| B     | 1st and 2nd octets              | 3rd and 4th octets        |
| C     | 1st, 2nd, and 3rd octets        | 4th octet only            |

---

### Network Communication Rules

#### Direct Connection (Without Router)
- Devices with the **same Network ID** can connect directly
- No routing device needed
- Communication happens at Layer 2 (Data Link layer)

#### Router Required
- Devices with **different Network IDs** need a router to connect
- Router operates at Layer 3 (Network layer)
- Enables inter-network communication

---

### Example Breakdown

**Class A Example:** `10.20.30.40`
- Network ID: `10`
- Host ID: `20.30.40`

**Class B Example:** `172.16.10.5`
- Network ID: `172.16`
- Host ID: `10.5`

**Class C Example:** `192.168.1.100`
- Network ID: `192.168.1`
- Host ID: `100`

---

## Summary

This document covers the fundamental concepts of computer networking including:

- ✅ Different types of networks (LAN, WAN, MAN, SONET)
- ✅ Essential network devices and their functions
- ✅ Key networking protocols (TCP/IP, HTTP, SMTP, FTP)
- ✅ Basic networking commands for troubleshooting
- ✅ IP addressing (IPv4 and IPv6)
- ✅ IP address classes and special ranges
- ✅ Network ID and Host ID concepts

Understanding these concepts is essential for anyone working in IT, DevOps, or network administration.

---

**Last Updated:** 2026
**Author:** DevOps Learning Resources

