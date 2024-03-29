# NVIDIA Jetson TX2


## Docs

General:
* 👉 **[SETUP](./SETUP.md)** 👈
* [L4T and JetPack](./L4T.md)
* [proc-cpuinfo.txt](./proc-cpuinfo.txt)
* [OS and software versions](./VERSIONS.md)
* [TODO](./TODO.md)

AV hardware:
* [LIDAR](./LIDAR.md)
* [VESC](./VESC.md)
* [IMU](./IMU.md)


## General

* https://developer.nvidia.com/embedded/community/support-resources
* https://docs.nvidia.com/jetson/l4t/

* [MAXN, MAXQ, MAXP CORE ALL, MAXP CORE ARM](https://docs.nvidia.com/jetson/l4t/#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/power_management_tx2_32.html#wwpID0E0OO0HA)

* https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-tx2/
* https://developer.nvidia.com/embedded/downloads#?tx=$product,jetson_tx2



* https://developer.nvidia.com/embedded/jetson-tx2-developer-kit
* **https://elinux.org/Jetson_TX2**
* https://developer.nvidia.com/blog/jetson-tx2-delivers-twice-intelligence-edge/


## Docker

* https://github.com/dusty-nv/jetson-containers


## ROS 2

* https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ros.foxy
* https://github.com/NVIDIA-AI-IOT/ros2_jetson


## Ubuntu 20

JetPack is currently based on Ubuntu 18.
* https://forums.developer.nvidia.com/t/when-will-jetpack-move-to-ubuntu-20-04/142517/6
* https://carlosedp.medium.com/upgrading-your-nvidia-jetson-xavier-nx-to-latest-ubuntu-focal-fossa-20-04-5e92ccc5a66



* [SDK Manager + Ubuntu 20.04 LTS (NVIDIA Developer Forums)](https://forums.developer.nvidia.com/t/sdk-manager-ubuntu-20-04-lts/125711)
	* https://github.com/jungin500/nvidia-sdk-manager-gui-docker
	* https://docs.nvidia.com/sdk-manager/docker-containers/index.html
	* https://developer.nvidia.com/nvidia-sdk-manager


## SD Card

* According to the **Jetson_TX1_TX2_Developer_Kit_Carrier_Board_Specification_v20170501, Section 2.4**:  
  _A full size SD Card (J12) is implemented, supporting up to SDR104 mode (UHS-1)._



* https://elinux.org/Boot_from_sd
* https://forums.developer.nvidia.com/t/jetson-tx2-sd-card-boot-sd-card-type-sdhc-sdxc-uhs-ii/167718
* https://www.jetsonhacks.com/2017/01/26/run-jetson-tx1-sd-card/
* https://forums.developer.nvidia.com/t/tx2-sd-card-driver-bug-sd-does-not-enumerate-in-uhs-mode/59238/4
* https://forums.developer.nvidia.com/t/how-to-generate-the-sd-card-flashable-image-for-tx2/79510/2
* https://forums.developer.nvidia.com/t/tx2-sd-card-slot/51397/10
* https://developer.nvidia.com/embedded/faq#jetson-differences-tx2i
* https://forums.developer.nvidia.com/t/boot-jetson-tx2-from-sd-card-require-to-know-config-changes/51431



* off-topic: [UFS 3.0 vs SD cards](https://fossbytes.com/ufs-3-0-features-comparison-microsd/)


## Serial console

* See [the Boot config notes](./boot-config/README.md) for links about using the serial console.
* [Connect Tech kdb347: Disable Serial Debug Console on Connect Tech TX2/TX1 Carriers](https://connecttech.com/product/orbitty-carrier-for-nvidia-jetson-tx2-tx1/)


## Orbitty Carrier for NVIDIA Jetson TX2/TX2i

* https://connecttech.com/product/orbitty-carrier-for-nvidia-jetson-tx2-tx1/


## SSD

* [Is there any PCIe SSD compatible with TX2? (NVIDIA Developer Forums)](https://forums.developer.nvidia.com/t/is-there-any-pcie-ssd-compatible-with-tx2/50004/2)
