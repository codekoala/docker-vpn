# docker-vpn

Simple OpenVPN client for when you need VPN isolation.

This image is not intended to function correctly as is. It is assumed that you
will mount your OpenVPN client configuration file at ``/etc/openvpn/vpn.ovpn``.
For example:

    docker run -d --name vpn --privileged -v $HOME/Documents/my.ovpn:/etc/openvpn/vpn.ovpn:ro codekoala/vpn

If your OpenVPN client configuration is valid, you should have access to
systems on your VPN via a simple ``docker exec -it vpn /bin/bash`` command.

If you have cloned this repository, you can use the ``Makefile`` to quickly get
up and running. The ``make run`` target will start the container, mount your
home directory within it, and create a user within the container that looks
like your user on the host system. You must set the ``VPN`` environment
variable for this to work:

    make VPN=$HOME/Documents/my.ovpn run

Here are some other helpful targets:

* ``make logs``: see what the container is up to
* ``make stop``: turn the VPN container off
* ``make start``: start the VPN container again
* ``make clean``: stop and remove the VPN container
