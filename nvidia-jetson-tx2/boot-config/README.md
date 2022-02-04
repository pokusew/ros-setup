# Boot Config of NVIDIA Jetson TX2

See https://www.jetsonhacks.com/2017/01/26/run-jetson-tx1-sd-card/.


## Notes:

* U-Boot device names:
	* `mmcblk0` = internal eMMC
	* `mmcblk2` = SD card (as enumerated on JetPack 4.5.x)
	* `mmcblk1` = SD card (as enumerated on JetPack 3.x)
* U-Boot versions:
	* tx2-auto-3 (JetPack 3.x)
		* Tegra186 (P2771-0000-500) # help
		* U-Boot 2016.07-g9c3b9a4 (May 17 2018 - 00:08:48 -0700)
		  aarch64-unknown-linux-gnu-gcc (GCC) 4.8.5 GNU ld (GNU Binutils) 2.24
	* tx2-ros2 (JetPack 4.5.x)
		*
* serial console on Jetson TX2
	* Connection speed is **115200, with 8 bits, no parity, and 1 stop bit (115200 8N1)**. For these three wire cables,
	  the correct setting is software control, no hardware control. If you choose a 5 wire setup with RTS and CTS lines,
	  then select hardware control, and no software control.
	* `screen /dev/tty.usbserial-A50285BI 115200`, exit with `Ctrl-A Ctrl-\`
	* See also [this article][tx2-serial-console] (for TX2)
	  or [this one][tx1-serial-console] (for TX1) (almost same). Both were both published
	  on [JetsonHacks](https://www.jetsonhacks.com)



[tx2-serial-console]: https://www.jetsonhacks.com/2017/03/24/serial-console-nvidia-jetson-tx2/

[tx1-serial-console]: https://connecttech.com/resource-center/kdb347-reassigning-disable-serial-debug-connect-tech-tx1-carriers/
