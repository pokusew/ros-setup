# Network config

```bash
sudo lshw -class network
sudo lshw
lsusb -t
ll /dev | grep -i -E 'tty\.'
ip a
ifconfig
iwconfig
nmcli
```

* Wi-Fi
	* https://f1tenth.readthedocs.io/en/latest/getting_started/software_setup/optional_software_nx.html#configuring-wifi-and-ssh
	* `nmcli d`
	* `nmcli r wifi on`
	* `nmcli d wifi list`

* network interfaces, ifup, ifdown, ifconfig (Ubuntu 18)
	* https://www.computerhope.com/unix/ifup.htm
	* https://www.cyberciti.biz/faq/setting-up-an-network-interfaces-file/
	* http://manpages.ubuntu.com/manpages/bionic/man5/interfaces.5.html

* netplan (Ubuntu 20+)
	* https://ubuntu.com/server/docs/network-configuration

* TP-Link AC600 Archer T2U Nano * https://gist.github.com/electron0zero/de0eaa13336042bad347f4dbd8749609

* [What is the difference between Network Manager and 'ifconfig' 'ifup', etc?](https://askubuntu.com/questions/1786/what-is-the-difference-between-network-manager-and-ifconfig-ifup-etc)

```
nvidia@tx2-ros2 ~ $ ll /etc/network/interfaces.d/lidar.conf 
-rw-r--r-- 1 root root 158 pro  8 21:45 /etc/network/interfaces.d/lidar.conf

nvidia@tx2-ros2 ~ $ cat /etc/network/interfaces.d/lidar.conf
auto lo
iface lo inet loopback
# iface eth0 inet dhcp

# allow-hotplug eth1
# iface eth1 inet dhcp

auto eth0
iface eth0 inet static
	address 192.168.0.22/24
```

* nmcli
	* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmcli
	* https://www.tecmint.com/nmcli-configure-network-connection/
	* https://askubuntu.com/questions/882806/ethernet-device-not-managed
	* disable IPv6
		* https://unix.stackexchange.com/questions/569515/why-does-the-interface-have-an-ipv6-address-with-ipv6-disabled
	* `ll /etc/NetworkManager/system-connections/`
	* export nmcli connections:
		* https://unix.stackexchange.com/questions/351005/how-to-export-and-migrate-networkmanager-settings-to-new-system


## Setup

Useful commands:
```bash
sudo nmcli connection up [conn-name]
sudo nmcli connection down [conn-name]
sudo systemctl restart NetworkManager
```

1. **Jetson TX2 as Wireless Access Point**
	* setup:
		1. Enable AP mode in the Wi-Fi TX2 driver. Note that this breaks normal (e.g. client) Wi-Fi functionality.
		   Add a new line `options bcmdhd op_mode=2` at the end of the file `/etc/modprobe.d/bcmdhd.conf`. You can use
		   the following command for that:
			* `echo 'options bcmdhd op_mode=2' | sudo tee -a /etc/modprobe.d/bcmdhd.conf`
			* **Reboot** before continuing with the next step.
		2. Create the nmcli connection describing the
		   AP: `sudo nmcli device wifi hotspot ifname wlan0 ssid tx2-ros2 password galactic2021`
		3. Alter the connection details:
		   ```bash
		   sudo nmcli connection modify Hotspot con-name hotspot
		   sudo nmcli connection modify hotspot connection.autoconnect yes
		   sudo nmcli connection modify hotspot ipv4.addresses 192.168.33.1/24
		   ```
	* see https://github.com/surendrallam/Jetson-TX2-as-Wireless-Access-Point-WAP
	* see https://fedoramagazine.org/internet-connection-sharing-networkmanager/
2. **eth0 for LiDAR**
	* First, we rename the default `Wired connection 1` to `lidar` and then we configure it:
	  ```bash
	  sudo nmcli connection modify Wired\ connection\ 1 con-name lidar
	  sudo nmcli connection modify lidar connection.interface-name eth0
	  sudo nmcli connection modify lidar ipv4.addresses 192.168.0.22/24
	  sudo nmcli connection modify lidar ipv4.method manual
	  sudo nmcli connection modify lidar connection.autoconnect yes
	  ```
3. **Ethernet-to-USB adapter (eth1) for Internet / LAN access**
	* First, we rename the automatically (i.e., upon first connection) created connection `eth1` to `eth1-dhcp-wan`
	  and then we configure it:
     ```bash
     sudo nmcli connection modify eth1 con-name eth1-dhcp-wan
     sudo nmcli connection modify eth1-dhcp-wan connection.interface-name eth1
     sudo nmcli connection modify eth1-dhcp-wan connection.autoconnect yes
     ```
