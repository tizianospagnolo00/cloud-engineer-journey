# Networking Basics

## IP Address

An IP address identifies a network interface on a network.

Useful command:

```bash
ip addr
```

Common interfaces:

* `lo` → loopback interface
* `eth0` → network interface

`127.0.0.1` is the localhost/loopback address.

## Ports

A port identifies a network service on a host.

Example:

```text
127.0.0.1:8080
```

* `127.0.0.1` → IP address
* `8080` → port

## Listening Sockets

Useful command:

```bash
ss -tulnp
```

Options:

* `-t` → TCP
* `-u` → UDP
* `-l` → listening
* `-n` → numeric addresses and ports
* `-p` → show process information

## Local HTTP Server

Python can start a simple HTTP server:

```bash
python3 -m http.server 8080 --bind 127.0.0.1
```

The service listens only on localhost.

We can verify it with:

```bash
ss -tulnp | grep 8080
```

And test it with:

```bash
curl http://127.0.0.1:8080
```

## 127.0.0.1 vs 0.0.0.0

```text
127.0.0.1:8080
```

Accepts connections only through the loopback interface.

```text
0.0.0.0:8080
```

Listens on all IPv4 interfaces.

This does not automatically mean that the service is reachable from the Internet. Routing, firewall rules, and network configuration still matter.

## Process and Network Connection

A listening network service is associated with a process.

Example:

```text
tcp LISTEN 0 5 127.0.0.1:8080 ... users:(("python3",pid=832,fd=3))
```

The important relationship is:

```text
IP:PORT
   ↓
process
   ↓
PID
```

We can inspect the process with:

```bash
ps -p 832 -o pid,ppid,stat,cmd
```

The `PPID` identifies the parent process.

