# What is this

If you need to run, VPN to connect to some sites, systems, eg. AWS console, and AWS cli to access corp. infra.
But you dont wanna slowdown sites that doesn't require VPN, this is the solution.

# How it works

This `docker-compose` file runs a docker container, with OpenVpn and Squid proxy in it. So you can use the proxy, to connect to sites requireing VPN.


# How to use

1. Adjust location of your `XXXX.ovpn` file in the `docker-compose.yaml`
```
    volumes:
      - ../XXX.ovpn:/vpn.ovpn
```
2. Add `redirect-gateway def1` to the VPN config file, to redirect all the traffic inside the container to the VPN.
3. Run the container `docker compose up`, or `docker compose up -d` to run it detached.
4. Set the proxy for the sites requireing the VPN, you can use for instance [FoxyProxy](https://getfoxyproxy.org/downloads/) extension to automatically enable proxy, by URL pattern. To enable the proxy for cli commands prefix it with `https_proxy="http://127.0.0.1:3128"`. For instance:  `https_proxy="http://127.0.0.1:3128" aws ssm start-session --target XXXXX`
