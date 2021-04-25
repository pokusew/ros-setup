# L4T

see https://docs.nvidia.com/jetson/l4t/


## Notes

Useful commands:
```bash
head -1 /etc/nv_tegra_release
# # R32 (release), REVISION: 5.1, GCID: 26202423, BOARD: t186ref, EABI: aarch64, DATE: Fri Feb 19 16:50:29 UTC 2021

uname -a
# Linux tx2-ros2 4.9.201-tegra #1 SMP PREEMPT Tue Mar 2 19:53:23 PST 2021 aarch64 aarch64 aarch64 GNU/Linux

# from jtop terminal UI:
# NVIDIA Jetson TX2 - Jetpack 4.5.1 [L4T 32.5.1]
```

Original Python:
```
# Python 2
python = Python 2.7.17
which python = /usr/bin/python -> python2.7*

# Python 3
python3 = Python 3.6.9
which python3 = /usr/bin/python3 -> python3.6*

which pip = none
which pip3 = none
```
