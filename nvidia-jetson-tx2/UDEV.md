# udev

* https://www.freedesktop.org/software/systemd/man/udev.html
* https://opensource.com/article/18/11/udev
* https://opensource.com/article/20/2/linux-systemd-udevd
* https://www.abclinuxu.cz/clanky/piseme-pravidla-pro-udev
* https://unix.stackexchange.com/questions/333697/etc-udev-rules-d-vs-lib-udev-rules-d-which-to-use-and-why

```bash
systemctl status systemd-udevd
udevadm info -a /dev/ttyACM0
udevadm monitor
sudo udevadm control --reload
```

```bash
echo 'ACTION=="add", SUBSYSTEM=="tty", ATTRS{product}=="SFE 9DOF-D21", OWNER="pokusew", GROUP="pokusew", MODE="0660", SYMLINK+="tty.imu"' | sudo tee /etc/udev/rules.d/99-custom-hw.rules
```
