+++
title = "MTA-STS"
+++

A quote from [RFC 8461](https://datatracker.ietf.org/doc/html/rfc8461):

> SMTP MTA Strict Transport Security (MTA-STS) is a mechanism enabling mail service providers (SPs) to declare their ability to receive Transport Layer Security (TLS) secure SMTP connections and to specify whether sending SMTP servers should refuse to deliver to MX hosts that do not offer TLS with a trusted server certificate.

Links:

- [RFC 8461](https://datatracker.ietf.org/doc/html/rfc8461)

## Setup

The setup essentially boils down to two steps:

1. Add a TXT DNS record:

   ```
   _mta-sts.example.com.  IN TXT "v=STSv1; id=20160831085700Z;"
   ```

2. Add a policy at `https://mta-sts.example.com/.well-known/mta-sts.txt`:

   ```
   version: STSv1
   mode: enforce
   max_age: 604800
   mx: mail.example.com
   ```
