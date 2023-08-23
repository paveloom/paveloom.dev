---
date: 2022-01-20
---

# How to create a Samba share?

<!-- separator -->

Make sure you have [Samba](https://wiki.samba.org/index.php/Installing_Samba) installed.

Allow read/write access to the filesystem:

```bash
sudo setsebool -P samba_export_all_rw on
```

Add Samba as a permanent service to the Firewall:

```bash
sudo firewall-cmd --add-service=samba --permanent
sudo firewall-cmd --reload
```

You should have a default config file after the installation at `/etc/samba/smb.conf`. Here we will be using the default `homes` section:

```conf
[homes]
	comment = Home Directories
	valid users = %S, %D%w%S
	browseable = No
	read only = No
	inherit acls = Yes
```

Alternatively, you can specify additional sections like so:

```conf
[downloads]
	comment = Downloads
	path = /home/user/Downloads
	read only = yes
	guest ok = yes
```

You can check the manual for the configuration file [here](https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html).

Set the password for the user:

```bash
sudo smbpasswd -a $USER
```

Finally, enable and start the service:

```bash
sudo systemctl enable smb
sudo systemctl start smb
```

You should now be able to connect to your Samba share by providing the path `smb://<hostname>/<sharename>` where necessary and using your username and the newly created password. `<hostname>` is either a hostname (e.g., `yourmachinename.local`) or an IP address (e.g., the IP address of your current wireless interface) of the Samba server. The latter can be obtained by issuing `ifconfig` in a terminal. `<sharename>` is the name of a shared directory you'd like to browse.
