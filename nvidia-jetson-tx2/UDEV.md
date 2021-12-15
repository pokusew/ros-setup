# udev

* https://www.freedesktop.org/software/systemd/man/udev.html
* https://opensource.com/article/18/11/udev
* https://opensource.com/article/20/2/linux-systemd-udevd
* https://www.abclinuxu.cz/clanky/piseme-pravidla-pro-udev
* https://unix.stackexchange.com/questions/333697/etc-udev-rules-d-vs-lib-udev-rules-d-which-to-use-and-why

**Two directories:**
* /lib/udev/rules.d/ – system udev rules
* /etc/udev/rules.d/ – user udev rules – **place custom rules here** (should be root/root owned)

**Useful commands:**
```bash
systemctl status systemd-udevd
udevadm info -a /dev/ttyACM0
udevadm monitor
sudo udevadm control --reload
```


## Disable ModemManager

Beware of ModemManager on Ubuntu, it can collide with serial port devices (it can grab/claim them, causing unnecessary
delays). The best way is to uninstall it if it is not needed:
```bash
apt list --installed | grep modemmanager
# modemmanager/bionic-updates,now 1.10.0-1~ubuntu18.04.2 arm64 [installed,automatic]
sudo apt remove modemmanager
```

Alternatively, it is possible to configure it to avoid grabbing specific devices, see:
* https://askubuntu.com/questions/399263/udev-rules-seem-ignored-can-not-prevent-modem-manager-from-grabbing-device
* https://askubuntu.com/questions/216114/how-can-i-remove-modem-manager-from-boot
* http://manpages.ubuntu.com/manpages/focal/man8/ModemManager.8.html
* [VESC Tool's 45-vesc.rules workaround](../v20/45-vesc.rules)


## Add user to the `dialout` group

* **dialout:** _Full and direct access to serial ports. Members of this group can reconfigure the modem, dial anywhere,
  etc._
* see https://wiki.debian.org/SystemGroups
* `groups` – list groups of which the current user is a member
* `sudo usermod -a -G dialout nvidia` – add user `nvidia` to the `dialout` group. Do not forget to **reboot** as _group
  membership of a user only takes effect on the next login._
* [SO: usermod vs adduser](https://askubuntu.com/questions/1011809/difference-between-adduser-and-usermod-g-a)
* `getent group` – list all groups together with their members


## Rules


### F1Tenth

3 USB 2 devices:
* VESC (Enertion FOCBOX VESC X)
* IMU (SparkFun 9DoF Razor IMU M0)
* Teensy 3.2

```bash
cat <<-"EOF" | sudo tee /etc/udev/rules.d/50-f1tenth-hw.rules
	ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="0483", SYMLINK+="tty.teensy"
	ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", SYMLINK+="tty.vesc"
	ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b4f", ATTRS{idProduct}=="9d0f", SYMLINK+="tty.imu"
EOF
```


## Example: Change device permissions

```bash
echo 'ACTION=="add", SUBSYSTEM=="tty", ATTRS{product}=="SFE 9DOF-D21", OWNER="pokusew", GROUP="pokusew", MODE="0660", SYMLINK+="tty.imu"' | sudo tee /etc/udev/rules.d/99-custom-hw.rules
```
