# How to set up a firewall for services behind WireGuard?

#### Updated: 16-Mar-2022

This guide expects that you've already set up WireGuard as a VPN. That is, you forward the traffic through the network interface of your server (e.g., the [`wireguard-install`](https://github.com/angristan/wireguard-install) script adds `PostUp` and `PostDown` rules for that automatically).

This guide also expects that you run your services in Podman containers.

One of the easiest ways to set up a firewall is using [`ferm`](http://ferm.foo-projects.org). Install it on your server and change the contents of the `/etc/ferm/ferm.conf` file to the following:

```
table filter {
    chain INPUT {
        # Drop every incoming connection by default
        policy DROP;

        # Allow only known and related connections
        mod state state INVALID DROP;
        mod state state (ESTABLISHED RELATED) ACCEPT;

        # Allow local connections
        interface lo ACCEPT;

        # Respond to ping
        proto icmp icmp-type echo-request ACCEPT;

        # Accept SSH connections
        proto tcp dport ssh ACCEPT;

        # Accept Wireguard clients' connections
        proto udp dport <WIREGUARD LISTENING PORT> ACCEPT;

        # Allow connections from the server
        saddr <SERVER SUBNET> ACCEPT;

        # Allow connections to the server, but only for Wireguard clients
        interface wg0 { daddr <SERVER SUBNET> ACCEPT; }
    }

    # Accept all outgoing connections
    chain OUTPUT policy ACCEPT;

    chain FORWARD {
        # Drop every forward by default
        policy DROP;

        # Allow only known and related connections
        mod state state INVALID DROP;
        mod state state (ESTABLISHED RELATED) ACCEPT;

        # Forward Wireguard clients
        interface wg0 ACCEPT;

        # Forward Podman subnet connections
        saddr <PODMAN SUBNET> ACCEPT;
    }
}
```

Change the angle bracketed pieces to the correct values for your server. You can find the WireGuard's listening port by issuing `wg` in the terminal when the service is active or by checking the configuration file (usually, `/etc/wireguard/wg0.conf`) otherwise. You can find the Podman's subnet by issuing `podman network inspect podman` in the terminal.

Then, restart the `ferm` service.
