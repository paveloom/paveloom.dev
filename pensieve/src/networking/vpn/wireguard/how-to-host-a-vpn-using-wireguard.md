# How to host a VPN using WireGuard?

#### Updated: 24-Mar-2022

First of all, you need a private server. Depending on your needs, you can host a VPN (Virtual Private Network) either locally or by renting a VPS (Virtual Private Server), either at home or abroad. The latter case is often used to avoid censoring at home. In case you go this route, you should also make sure you're choosing a *private* VPS provider. I can personally recommend [1984](https://www.1984hosting.com).

It is important to clarify that WireGuard is a *point-to-point* VPN. That is, by default, you only get an encrypted tunnel. To actually work as a private network, you need to forward all of the clients' traffic through the local network interface of your server. Thankfully, that's already automated in the [`wireguard-install`](https://github.com/angristan/wireguard-install) script, which I highly recommend using.

On your server, run this script. Running if for the first time will walk you through the installation process. Using the default inputs is usually fine, but do note that the script puts in the IP addresses of the [AdGuard DNS](https://adguard-dns.com) (Domain Name System) servers by default. You may also consider using other [options](https://privacyguides.org/providers/dns), or you can use the IP addresses of the DNS servers that your server's ISP (Internet Service Provider) provides. You can get those by either running

```bash
grep "nameserver" /etc/resolv.conf
```

in a terminal (if you rent a server), checking your router settings (if you're hosting at home), or using other means.

During the installation, the script will ask you to create a client. You will be able to add or revoke clients later by rerunning the script. Give the client a name, then choose their IPs in the interface (defaults are fine). You will now have a QR code printed in the terminal and a configuration file created in the current working directory. Share these with a client so they can connect to the server. Here are instructions for a client:

First, [install](https://www.wireguard.com/install) WireGuard. Then,
- Linux: copy (as root) the configuration file to `/etc/wireguard/wg0.conf`, restart the service using `sudo systemctl restart wg-quick@wg0`;
- Windows, macOS: import the configuration file;
- Android, iOS: scan the QR code or input the values from the configuration file manually.

That's it. You should now have everything up and working.

Troubleshooting:
- If your home network doesn't support IPv6, stop the local service, remove the IPv6 addresses from the configuration file, and restart the connection.

See also:
- [How to set up a firewall for services behind WireGuard?](how-to-set-up-a-firewall-for-services-behind-wireguard.md)
