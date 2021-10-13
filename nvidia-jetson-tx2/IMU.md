# IMU

* [Inertial Measurement Unit (wiki)](https://en.wikipedia.org/wiki/Inertial_measurement_unit)

* [Attitude and Heading Reference System (AHRS) (wiki)](https://en.wikipedia.org/wiki/Attitude_and_heading_reference_system)

* SparkFun 9DoF Razor IMU M0
	* [Product page][sparkfun-sen-14001] (descriptions, features, links to all resources)
	* [GitHub][sparkfun-sen-14001-gh] (an example firmware, HW specs)
	* [Hookup Guide][sparkfun-sen-14001-hookup-guide]

* ROS integration
	* [razor_imu_9dof][razor_imu_9dof-gh]
		* [ROS Wiki][razor_imu_9dof-ros-wiki] (including info about calibration)
		* [ROS Index][razor_imu_9dof-ros-index-kinetic]
		* [GitHub][razor_imu_9dof-gh]
		* requires a [modified version][razor-9dof-ahrs-modified] of the [Razor-AHRS/razor-9dof-ahrs][razor-9dof-ahrs]
		  firmware instead of the factory-programmed ["example" firmware][sparkfun-sen-14001-gh]
		* at least one ROS 2 port exists
			* see [github.com/klintan/ros2_razor_imu](https://github.com/klintan/ros2_razor_imu)
	* https://github.com/mitll-ros-pkg/razor_imu_m0_driver
		* supports SparkFun 9DoF Razor IMU M0 with **the
		  factory-programmed ["example" firmware][sparkfun-sen-14001-gh]**

[imu]: https://en.wikipedia.org/wiki/Inertial_measurement_unit

[ahrs]: https://en.wikipedia.org/wiki/Attitude_and_heading_reference_system

[sparkfun-sen-14001]: https://www.sparkfun.com/products/retired/14001

[sparkfun-sen-14001-gh]: https://github.com/sparkfun/9DOF_Razor_IMU

[sparkfun-sen-14001-hookup-guide]: https://learn.sparkfun.com/tutorials/9dof-razor-imu-m0-hookup-guide

[razor_imu_9dof-gh]: https://github.com/ENSTABretagneRobotics/razor_imu_9dof/tree/indigo-devel

[razor_imu_9dof-ros-wiki]: https://wiki.ros.org/razor_imu_9dof

[razor_imu_9dof-ros-index-kinetic]: https://index.ros.org/p/razor_imu_9dof/github-ENSTABretagneRobotics-razor_imu_9dof/#kinetic

[razor-9dof-ahrs-modified]: https://github.com/lebarsfa/razor-9dof-ahrs

[razor-9dof-ahrs]: https://github.com/Razor-AHRS/razor-9dof-ahrs
