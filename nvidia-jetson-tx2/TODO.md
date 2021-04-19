# TODO

* GNOME System Monitor _Resources tab_ shows only one processor utilization
  (even when all processors are utilized) > **bug?** (htop works correctly)

* When using apt, these errors pop out (but I think that's okay):
  ```text
  /sbin/ldconfig.real: Warning: ignoring configuration file that cannot be opened:
  /etc/ld.so.conf.d/aarch64-linux-gnu_EGL.conf: No such file or directory /sbin/ldconfig.real: Warning: ignoring
  configuration file that cannot be opened: /etc/ld.so.conf.d/aarch64-linux-gnu_GL.conf: No such file or directory
  ```

* **automatic fan control?**
	* https://forums.developer.nvidia.com/t/automatically-control-pwm-fan-based-on-temperature/76801
	* https://forums.developer.nvidia.com/t/automagic-fan-control-for-the-jetson-nano-is-here/76057
	* https://github.com/Pyrestone/jetson-fan-ctl
	* [Power Management for Jetson TX2 Series Devices > Thermal Management in Linux > Thermal Cooling (Jetson L4T Docs)](https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/power_management_tx2_32.html#wwpID0E06I0HA)
