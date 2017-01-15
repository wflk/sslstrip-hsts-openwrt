# SSLstrip2 + DNS2Proxy - For WiFi Pineapple NANO + TETRA

Working version of SSLstrip2 with HSTS bypassing.

## Getting Started

SSH to your Pineapple. Download/launch the INSTALL.sh script to install SSLstrip2.

### Installing

```bash
wget -qO- https://raw.githubusercontent.com/adde88/sslstrip-hsts-openwrt/master/INSTALL.sh | bash -s -- -v -v
```

## Running the tools

```bash
sslstrip -h
dns2proxy -h
```

## Acknowledgments

* Thanks to the authors of ssltrip2 and dns2proxy!
* Lack of updated python libraries inspired me to get this working myself.
* Do not use these tools to do anything i would do! ;)
