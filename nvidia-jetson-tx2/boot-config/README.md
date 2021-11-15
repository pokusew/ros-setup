# Boot Config of NVIDIA Jetson TX2

See https://www.jetsonhacks.com/2017/01/26/run-jetson-tx1-sd-card/.


## Notes:

Files from [mmcblk0 (Internal EMMC)](./mmcblk0) and [mmcblk2 (SD Card)](./mmcblk2) are from the `/boot/extlinux/`
directory. They must be root owned (`sudo chown root * && sudo chgrp root *`).
