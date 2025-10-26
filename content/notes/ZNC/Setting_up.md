+++
title = "Setting up"
+++

Follow the upstream instructions for [installation](https://wiki.znc.in/Installation).

Then, create a new config interactively by calling `znc --makeconf`. 

Here's an example of a config for the [Libera.Chat](https://libera.chat) IRC network:

```
[ .. ] Checking for list of available modules...
[ ** ]
[ ** ] -- Global settings --
[ ** ]
[ ?? ] Listen on port (1025 to 65534): 6697
[ !! ] WARNING: Some web browsers reject ports 6667 and 6697. If you intend to
[ !! ] use ZNC's web interface, you might want to use another port.
[ ?? ] Proceed anyway? (yes/no) [yes]: yes
[ ?? ] Listen using SSL (yes/no) [no]: yes
[ ?? ] Listen using both IPv4 and IPv6 (yes/no) [yes]: yes
[ .. ] Verifying the listener...
[ ** ] Unable to locate pem file: [/var/lib/znc/.znc/znc.pem], creating it
[ .. ] Writing Pem file [/var/lib/znc/.znc/znc.pem]...
[ ** ] Enabled global modules [corecaps, webadmin]
[ ** ]
[ ** ] -- Admin user settings --
[ ** ]
[ ?? ] Username (alphanumeric): paveloom
[ ?? ] Enter password:
[ ?? ] Confirm password:
[ ?? ] Nick [paveloom]:
[ ?? ] Alternate nick [paveloom_]:
[ ?? ] Ident [paveloom]:
[ ?? ] Real name (optional): Pavel Sobolev
[ ?? ] Bind host (optional):
[ ** ] Enabled user modules [chansaver, controlpanel]
[ ** ]
[ ?? ] Set up a network? (yes/no) [yes]:
[ ** ]
[ ** ] -- Network settings --
[ ** ]
[ ?? ] Name [libera]:
[ ?? ] Server host [irc.libera.chat]:
[ ?? ] Server uses SSL? (yes/no) [yes]:
[ ?? ] Server port (1 to 65535) [6697]:
[ ?? ] Server password (probably empty):
[ ?? ] Initial channels:
[ ** ] Enabled network modules [simple_away]
[ ** ]
[ .. ] Writing config [/var/lib/znc/.znc/configs/znc.conf]...
[ ** ]
[ ** ] To connect to this ZNC you need to connect to it as your IRC server
[ ** ] using the port that you supplied.  You have to supply your login info
[ ** ] as the IRC server password like this: user/network:pass.
[ ** ]
[ ** ] Try something like this in your IRC client...
[ ** ] /server <znc_server_ip> +6697 paveloom:<pass>
[ ** ]
[ ** ] To manage settings, users and networks, point your web browser to
[ ** ] https://<znc_server_ip>:6697/
[ ** ]
[ ?? ] Launch ZNC now? (yes/no) [yes]: no
```

Then, run `systemctl start znc` to start ZNC as a system daemon.

Make sure the server is available from outside (this means setting up DNS and firewall). You can skip setting up an [SSL endpoint](https://wiki.znc.in/Signed_SSL_certificate) for ZNC as many IRC clients accept self-signed certificates. 
