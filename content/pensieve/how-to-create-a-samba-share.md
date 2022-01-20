+++
title = "How to create a Samba share?"
description = "How would one create a Samba share?"
+++

# {{ title() }} {#}
#### Updated: 21-Jan-2022 {#}

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

You should now be able to connect to your Samba share by providing `sfb://yourmachinename.local` where necessary and using your username and the newly created password. For example, on an iPhone, you can use the standard Files app to access files on your machine: tap the three dots and choose "Connect to Server".
