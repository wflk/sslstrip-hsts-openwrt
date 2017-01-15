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
python /usr/share/sslstrip2/sslstrip.py
python /usr/share/dns2proxy/dns2proxy.py
```

When running dns2proxy, it's a good idea to traverse to the directory before launching it. (Running with ./dns2proxy.py from the directory" 
If not, you might encounter errors about missing files, such as: nospoof.cfg.

## Acknowledgments

* Thanks to the authors of ssltrip2 and dns2proxy!
* Lack of updated python libraries inspired me to get this working myself.
* Do not use these tools to do anything i would do! ;)
