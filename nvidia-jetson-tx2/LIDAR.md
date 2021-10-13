# LIDAR

* Hokuyo UST-10LX (MRS-0020L)
	* [Hokuyo USA product page][hokuyo-ust-10lx-usa]
	* [Hokuyo Japan product page][hokuyo-ust-10lx-jp]
	* [Hokuyo 10LX Ethernet Connection Setup][f1tenth-docs-hokuyo-setup] in the F1Tenth docs
	* Communication protocol: SCIP2.2,
	  see [C-42-04076.pdf](https://www.generationrobots.com/media/Hokuyo%20UST-10LX/UST-10LX_20LX_SCIP_specifications_C-42-04076.pdf)
	* Ethernet communication initial values:
		* IP address: 192.168.0.10
		* Port number: 10940
	* ROS integration:
		* [urg_node ROS 2 Galactic][urg_node-galactic]
		* [ug_node ROS 2 Foxy][urg_node-foxy]
		* [ug_node ROS 1 Kinetic][urg_node-kinetic]

[hokuyo-ust-10lx-usa]: https://hokuyo-usa.com/products/lidar-obstacle-detection/ust-10lx

[hokuyo-ust-10lx-jp]: https://www.hokuyo-aut.jp/search/single.php?serial=167

[f1tenth-docs-hokuyo-setup]: https://f1tenth.readthedocs.io/en/latest/getting_started/firmware/firmware_hokuyo10.html

[urg_node-galactic]: https://index.ros.org/r/urg_node/#galactic

[urg_node-foxy]: https://index.ros.org/r/urg_node/#foxy

[urg_node-kinetic]: https://index.ros.org/r/urg_node/#kinetic
