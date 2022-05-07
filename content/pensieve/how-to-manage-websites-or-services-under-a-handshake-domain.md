+++
title = "How to manage websites or services under a Handshake domain?"
description = "How would one manage websites or services under a Handshake domain?"
+++

# {{ title() }} {#}
#### Updated: 07-May-2022 {#}

This note is a rewrite of a [series of articles](https://blog.htools.work/posts/hns-pdns-nginx) on a similar theme by [Rithvik Vibhu](https://github.com/rithvikvibhu). I mirror those for redundancy (this knowledge is too niche to have only one decent source, so let there be a copy!), but also I show how to achieve the same results with [Caddy](https://caddyserver.com) and expand on how to deal with subdomains. So, alternative title: HNS + PowerDNS + Caddy + DANE.


### Requirements

- A Handshake name: get one of those from [Namebase](https://www.namebase.io) or with a non-custodial wallet like [Bob Wallet](https://bobwallet.io);
- A server: rent one or host locally (this guide expects Ubuntu as an OS);
- A site or a service: prepare something to share with others;
- A DANE-enabled HNS resolver (e.g., [Fingertip](https://impervious.com/fingertip)): a way to access your site.

### Components

In this tutorial, you're expected to host

- A DNS server, which has records that point to a web server;
- A web server that hosts websites/services.

The Handshake domain you own will point to the DNS server.

### 1. DNS

##### Disable Stub Resolver

As root, run `lsof -i :53` to see if the DNS port is already bound by `systemd-resolved`. If it is, open `/etc/systemd/resolved.conf` and set `DNS` and `FallbackDNS` to your server's DNS's, and set `DNSStubListener` to `no`.

Replace `/etc/resolv.conf` with a symbolic link to the `systemd`'s version:

```bash
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
```

Reboot and check that the output of `lsof -i :53` doesn't mention `systemd-resolved`.

##### Install PowerDNS

Follow the official [instructions](https://doc.powerdns.com/authoritative/installation.html). We will use the `sqlite3` backend, so run

```bash
apt install sqlite3 pdns-server pdns-backend-sqlite3
```

Check that the server is running by issuing `systemctl status pdns`.

##### Configure PowerDNS

Edit `/etc/powerdns/pdns.conf` to have


```conf
launch=gsqlite3
gsqlite3-database=/var/lib/powerdns/pdns.sqlite3
gsqlite3-dnssec=yes
```

Then,

```bash
# Initialize the SQLite database with a schema
sqlite3 /var/lib/powerdns/pdns.sqlite3 < /usr/share/doc/pdns-backend-sqlite3/schema.sqlite3.sql

# Change ownership of the directory to the `pdns` user and group
chown -R pdns:pdns /var/lib/powerdns

# Allow for the `pdns` use to read the PowerDNS confing
chmod o+r /etc/powerdns/pdns.conf

# Restart PowerDNS
systemctl restart pdns
```

Check that there are no errors by issuing `systemctl status pdns`.

##### Create a zone

In the following snippets replace `domain` with your TLD. Run

```bash
# Create an empty zone
sudo -u pdns pdnsutil create-zone domain ns1.domain

# Enable DNSSEC for the zone
sudo -u pdns pdnsutil secure-zone domain

# Add a TXT record for testing
# Name: @ (root of domain)
# Type: TXT
# Value: "first-record!"
sudo -u pdns pdnsutil add-record smartface. @ TXT '"first-record!"'
```

Test the server by running `dig @127.0.0.1 domain TXT +dnssec`: this should give you the same record. You can try using your public IP, too.

##### Store the address and the hash of the DNS on blockchain

Run `pdnsutil show-zone domain` and take a value of one of the DS records.

For example, from

```bash
DS = domain. IN DS 18355 13 1 76ba9064576ebd736e3bf95f04375c344c3394c2 ; ( SHA1 digest )
DS = domain. IN DS 18355 13 2 e309604f736274326ae701ad900004aa7a0fad5d5c6406272fdb0065ecdeb1d8 ; ( SHA256 digest )
DS = domain. IN DS 18355 13 4 902a5459b422008fd7126a67eed3591085b731e632b2cf836c696b33ddef9c9752af63264b870affc838145bea550b8a ; ( SHA-384 digest )
```

you can take

```bash
18355 13 2 e309604f736274326ae701ad900004aa7a0fad5d5c6406272fdb0065ecdeb1d8
```

Put this hash and the IP address of your server on blockchain:

```
Namebase > Blockhain DNS records:
Type    Name    Value/Data
NS      ns1     <IP>
DS              <Hash>
```

*or*

```
Bob Wallet > Records:
Type    Value
NS      ns1.domain.
GLUE4   ns1.domain. <IP>
DS      <Hash>
```

##### Wait

The updates to blockchain DNS happen every 6 hours. Updates to your name server's records are much faster, around 5 minutes to take effect.

### 2. DANE

##### Generate a certificate

In the following snippets replace `domain` with your TLD. Run

```bash
openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
  -keyout cert.key -out cert.crt -extensions ext  -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[ext]";
    echo "keyUsage=critical,digitalSignature,keyEncipherment";
    echo "extendedKeyUsage=serverAuth";
    echo "basicConstraints=critical,CA:FALSE";
    echo "subjectAltName=DNS:domain,DNS:*.domain";
    ) -subj "/CN=*.domain"
```

Compute the value of a TLSA record:

```bash
echo -n "3 1 1 " && openssl x509 -in cert.crt -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | xxd  -p -u -c 32
```

Move the certificate and the private key:

```bash
mv cert.key /etc/ssl/domain.key
mv cert.crt /etc/ssl/domain.crt
  ```

##### Create a TLSA record

Run the following, replacing `<value>` with the value computed above:

```bash
sudo -u pdns pdnsutil add-record domain. _443._tcp TLSA '<value>'
sudo -u pdns pdnsutil rectify-zone domain
```

In case you want to add a subdomain `sub`, run

```bash
sudo -u pdns pdnsutil add-record domain. _443._tcp.sub TLSA '<value>'
```

### 3. Web Server

##### Install Caddy

Follow the official [instructions](https://caddyserver.com/docs/install). Specifically, on Ubuntu, run

```bash
apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install caddy
```

Edit your [Caddyfile](https://caddyserver.com/docs/caddyfile/patterns) (`/var/lib/caddy/Caddyfile`):

```caddy
# Site
domain {
    tls /etc/ssl/domain.crt /etc/ssl/domain.key
    root * /path/to/site
    file_server
}

# Service
sub.domain {
    reverse_proxy localhost:7001
}
```

Restart the service with `systemctl restart caddy`.

And... that's it! Your site should now be available at `https://domain` and the service --- at `https://sub.domain`.


Troubleshooting:
- Use [HTools SiteCheck](https://sitecheck.htools.work) to analyze your setup. Allow for a cache delay, though.
