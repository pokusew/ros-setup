sudo apt update 
apt list --upgradable 
apt list --upgradable | grep cti
sudo apt upgrade 
sudo reboot 
lsusb
lsusb -t
lshw
cat /proc/cpuinfo
head -1 /etc/nv_tegra_release
uname -a
lsb_release -a
python3 -V
python2 -V
which pip
which pip3
cat /etc/hosts
sudo apt install libncursesw5-dev libreadline-dev
cd ~/code
git clone https://github.com/dvorka/hstr.git
cd hstr
git ag
git tag
git log
cd ./build/tarball && ./tarball-automake.sh && cd ../..
./configure && make
sudo make install
cd ..
sudo apt install libevent-dev libncurses5-dev
git clone https://github.com/tmux/tmux.git
cd tmux
git ag
git tag
git checkout 3.2a
sh autogen.sh
./configure && make
sudo make install
cd ..
sudo apt install libncursesw5-dev
git clone https://github.com/htop-dev/htop.git
cd htop
git tag
git checkout 3.1.1
./autogen.sh && ./configure && make
sudo make install
cd ..
sudo -H python3 -m pip install -U jetson-stats
apt search pip
apt search pythhon-pip
apt search python-pip
apt search python3-pip
sudo apt install python3-pip
pip
pip3 -V
python3 -m pip -U pip
sudo -H python3 -m pip install -U jetson-stats
sudo systemctl status jetson_stats.service
jtop
sudo reboot 
jtop
nano
sudo apt install nano
ping 8.8.8.8
sudo systemctl reload sshd.service 
gnome-terminal
echo $DISPLAY 
gnome-terminal
jtop
sudo poweroff 
jtop
sudo poweroff 
sudo apt update 
apt list --upgradable 
sudo apt upgrade 
apt-cache policy | grep universe
echo $LANG
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
sudo apt install curl gnupg2
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
wget
sudo apt install build-essential cmake git libbullet-dev libpython3-dev python3-colcon-common-extensions python3-flake8 python3-pip python3-pytest-cov python3-rosdep python3-setuptools python3-vcstool python3-rosinstall-generator libasio-dev libtinyxml2-dev libcunit1-dev
python3 -m pip install -U argcomplete flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes pytest-repeat pytest-rerunfailures pytest
jtop
sudo apt show nvidia-jetpack
sudo apt install nvidia-jetpack
head -1 /etc/nv_tegra_release
ll  /etc/apt/sources.list.d
cat /etc/apt/sources.list.d/nvidia-l4t-apt-source.list 
cat /etc/apt/sources.list.d/cti-l4t-apt-source.list 
cat /etc/apt/sources.list.d/ros2.list 
nano /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
sudo nano /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
sudo apt update 
apt list --upgradable 
sudo apt show nvidia-jetpack
sudo apt show nvidia-jetpack -a
sudo apt install nvidia-jetpack 
sudo apt autoremove 
man test
man ping
man printf
man x
man bash
man ssh
sudo reboot 
sudo apt show nvidia-jetpack
sudo apt install nvidia-cuda nvidia-opencv nvidia-container
sudo reboot 
jtop
apt list --installed 
free -m
free -mh
jtop
mkdir -p ~/ros/galactic/src
cd ros/galactic/
cd ..
rm -rf galactic/
git clone git@github.com:pokusew/ros2-build.git galactic
cd galactic/
make clone-ros2
jtop
cd ros/galactic/
ll /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
cd ros/galactic/
colcon build --merge-install --
colcon build --merge-install
make clean
sudo rosdep init
rosdep update
rosdep -h
rosdep check -y --ignore-src --from-paths src --rosdistro galactic
rosdep check -y --ignore-src --from-paths src --rosdistro galactic --skip-keys "fastcdr rti-connext-dds-5.3.1 urdfdom_headers"
jtop
rosdep install -y --ignore-src --from-paths src --rosdistro galactic --skip-keys "fastcdr rti-connext-dds-5.3.1 urdfdom_headers"
cd ros/galactic/
colcon build --merge-install 
make clean
make build
make clean
cmake -v
cmake --version
sudo apt search cmake
cat /proc/cpuinfo 
uname -.a
uname -a
sudo apt remove cmake
cd ../..
cd code
mkdir code
cd code/
mkdir cmake
cd cmake/
wget https://github.com/Kitware/CMake/releases/download/v3.22.0-rc3/cmake-3.22.0-rc3-linux-aarch64.sh
wget https://github.com/Kitware/CMake/releases/download/v3.22.0-rc3/cmake-3.22.0-rc3-linux-aarch64.tar.gz
ll
chmod +x cmake-3.22.0-rc3-linux-aarch64.sh 
./cmake-3.22.0-rc3-linux-aarch64.sh 
ll
./cmake-3.22.0-rc3-linux-aarch64.sh -h
./cmake-3.22.0-rc3-linux-aarch64.sh --help
./cmake-3.22.0-rc3-linux-aarch64.sh --skip-license --prefix=/
ll /doc
ll /usr/doc
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
ll /usr/share/keyrings/
echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
sudo apt-get update
sudo apt search cmake
sudo apt remove --purge --auto-remove cmake
sudo apt install kitware-archive-keyring
sudo rm /etc/apt/trusted.gpg.d/kitware.gpg
sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg
sudo apt-get install kitware-archive-keyring
sudo apt-get remove kitware-archive-keyring
sudo apt-get install kitware-archive-keyring
ll /usr/share/keyrings/kitware-archive-keyring.gpg
sudo apt update
sudo apt install cmake
cmake --version
sudo apt install build-essential cmake git libbullet-dev libpython3-dev python3-colcon-common-extensions python3-flake8 python3-pip python3-pytest-cov python3-rosdep python3-setuptools python3-vcstool python3-rosinstall-generator libasio-dev libtinyxml2-dev libcunit1-dev
cd ..
cd ros/galactic/
sudo rosdep init
rosdep update
rosdep install -y --ignore-src --from-paths src --rosdistro galactic --skip-keys "fastcdr rti-connext-dds-5.3.1 urdfdom_headers"
make clean
cmake --version
rm -rf code/cmake/
df -fh
df
df -h
colcon build --merge-install
htop
cd ros/galactic/
htop
jtop
rh env
echo $PATH | tr : '\n'
echo $PATH | tr : '\n' | wc
man wc
echo $PATH | tr : '\n' | wc -l
apt list --installed | grep man
jtop
echo $PYTHONPATH
echo $PYTHONPATH | tr : '\n' | wc -l
htop
colcon build --merge-install
time source ~/ros/galactic/install/setup.bash 
echo $PYTHONPATH | tr : '\n' | wc -l
echo $PYTHONPATH | tr : '\n'
echo $PATH | tr : '\n' | wc -l
rh env
ros2 doctor
ros2 run demo_nodes_py talker
ros2 run demo_nodes_cpp listener
df -h
time source ~/ros/galactic/install/setup.bash
source ~/ros/galactic/install/setup.bash
ip -a
ip d -a
ip s -a
ip -a s
ip -as
ifconfig 
sudo apt update 
apt list --upgradable 
sudo apt upgrade 
ll /media/
ll /media/nvidia/
ll /
ll /mnt
ll /dev
df -h
gdisk -l mmcblk0
gdisk -l /dev/mmcblk0
sudo gdisk -l /dev/mmcblk0
man gdisk
man man
apt list --installed | grep -i manpages
sudo mandb
manpath -g
man man
echo $MANPATH
apt list --installed | grep -i man-db
sudo apt install man-db manpages-posix manpages-dev manpages-posix-dev
sudo mandb
man
man man
man 7 undocumented
sudo /usr/local/sbin/unminimize
sudo gdisk -l /dev/mmcblk0
sudo gdisk -l /dev/mmcblk0 > gdisk-l-mmcblk0-orbitty.txt
sudo gdisk -l /dev/mmcblk0 > gdisk-l-mmcblk0-orbitty.txt 2>&1
ll gdisk-l-mmcblk0-orbitty.txt 
ll /mnt
ll /media/
ll /media/nvidia/
cd ..
ll /mnt
ll /media/nvidia/
ll /media/nvidia/POKUSEW-SDCARD-2/
ll lost+found/
df -f
df -h
htop
cat /proc/device-tree/chosen/bootargs 
cat /proc/cmdline 
htop
jtop
htop
jtop
htop
apt list --installed | modem
apt list --installed | grep modem
sudo poweroff 
sudo apt upgrade 
apt list --upgradable 
sudo reboot 
apt list --installed | grep modem
sudo apt remove modemmanager
apt list --installed | grep libre
apt list --installed | grep libreoffice
sudo apt remove libreoffice-*
sudo apt remove thunderbird thunderbird-*
apt list --installed 
sudo reboot 
ll code
cd code/
ll
htop
htop -V
tmux -V
apt list --installed | grep htop
cd ..
ll
mv tmux/ code/
mv hstr/ code/
mv htop/ code/
ll
cd code/
ll
sg
s
man sg
cd ..
ll ros
cd code
ll
git clone git@github.com:pokusew/f1tenth-rewrite.git
sl
ss
man ss
rs
rg
rs
rw
rg
rgr
rg
rb
s
g
b
w
wsl
sl
sudo apt remove modemmanager
sudo systemctl status ModemManager
sudo reboot 
groups
getent groups
getent group
getent group | uuc
getent group | uucp
getent group | ucp
getent group | cp
getent group | grep cp
getent group | grep dial
man usermod
sudo usermod -a -G dialout nvidia
groups
reboot 
sudo reboot 
ll /etc/udev/rules.d/
groups
cat <<-"EOF" | sudo tee /etc/udev/rules.d/50-f1tenth-hw.rules
ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="0483", SYMLINK+="tty.teensy"
ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", SYMLINK+="tty.vesc"
ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1b4f", ATTRS{idProduct}=="9d0f", SYMLINK+="tty.imu"
EOF

cat /etc/udev/rules.d/50-f1tenth-hw.rules
sudo udevadm control --reload
cd code
ll
git clone git@github.com:pokusew/ros2-build.git additional
cd additional/
ll
make clone-stage
make clone-stage-additional 
make patch-stage 
apt list --installed | grep libfltk
apt list --installed | grep libjpeg
sudo apt install libfltk1.1-dev libjpeg-dev
cd ..
mv additional/ base
cd base/
ll /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
cd code/base/
make build-merge-install 
make clean
g
time g
jtop
g
tmux
cd code/bas
cd code/base
g
make build-merge-install 
rosdep check -y --ignore-src --from-paths src
rosdep check -y --ignore-src --from-paths src --ignore-keys "stage"
rosdep check -y --ignore-src --from-paths src --rosdistro galactic --skip-keys "stage"
rosdep install --ignore-src --from-paths src --rosdistro galactic --skip-keys "stage"
make clean
make build-merge-install 
time s
sudo unminimize -h
cd code/f1tenth-rewrite/
git pull
gst
git log
git pull
cd ws
time b
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
time s
s
ros2 node list
ros2 node list -h
ros2 node list -a
htop
jtop
ros2 launch launchers stage_sample_ftg.launch.py 
jtop
git pull
make clone-auto-additional 
rosdep check --ignore-src --from-paths src
make build-merge-install 
apt list --installed | grep asio
colcon build --merge-install --packages-up-to io_context 
clear
colcon build --merge-install --packages-up-to io_context 
nano src/transport_drivers/io_context/include/io_context/common.hpp
colcon build --merge-install --packages-up-to io_context 
colcon build --merge-install
nano src/transport_drivers/serial_driver/include/serial_driver/serial_port.hpp 
colcon build --merge-install
apt list --installed | grep asio
apt search asio
cd code
mkdir asio
cd asio/
ll
man tar
tar -zxvf asio-1.20.0.tar.gz 
ll
cd asio-1.20.0/
ll
./configure 
htop
jtop
make -j4
pwd
make install --prefix=/home/nvidia/code/asio/install
autoreconf 
autoreconf -h
./configure -h
./configure --prefix=/home/nvidia/code/install/
make -j4
make install
cd ..
ll
cd asio-1.20.0/
ll
make install
./configure --prefix=/home/nvidia/code/asio/install/
make -j4
make install
cd ..
ll
rm -rf install/
cd asio/
ll install/
ll install/include/
ll install/include/asio
cd asio-1.20.0/
./configure -h
ll /usr/local/include/
dpkg -L libasio-dev
cd ..
echo "# dpkg -L libasio-dev" >>original-asio.txt
dpkg -L libasio-dev >>original-asio.txt
cat original-asio.txt 
sudo apt remove libasio-dev 
ll /us
ll /usr
ll /usr/include/
cd asio-1.20.0/
ll
./configure --prefix=/usr
make -j4
sudo make install
cat ../original-asio.txt 
clear
colcon build --merge-install
time s
b
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
git pull
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
ws-clean 
g
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
time s
time s
ll src/auto/launch/
ros2 launch auto auto.ftg.launch.py 
git pull
colcon info
b
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
time s
time s
ros2 launch auto auto.ftg.launch.py 
clear
time s
ros2 launch auto auto.ftg.launch.py 
time s
tmux
tmux
w
sudo poweroff 
sudo apt update 
ip -a
ip a
apt list --upgradable 
sudo reboot
ll
ip a
cd code/base/
git pull
git log
ll src
cd ..
ll
ll ~/ros/galactic/
cd f1tenth-rewrite/
ll
cd ws
ros2
clear
time s
s
b
git log
ros2 launch ust10lx start.launch.py
ip a
ip route show
ll /etc/network
ll /etc/network/interfaces.d/
ll /etc/netconfig 
cat /etc/netconfig 
cat /etc/networks
cat /etc/network/interfaces
lsb_release -a
uname -a
cd /etc/network/interfaces
cd /etc/network/interfaces.d/
ll
ifconfig -a
ip a
sudo lshw -class network
ll /run/network/ifstate
cat /run/network/ifstate
ifquery -l
ifquery -l --allow=hotplug
ll
cd ..
ll
ll if-up.d/
ll if-up.d/wpasupplicant 
cat if-up.d/wpasupplicant 
ll
cat fan 
ifconfig -a
ip a
ifconfig -a
nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d
ifconfig -
ifconfig -a
ip a
nmcli d
nmcli d wifi list
nmcli d wifi rescan 
nmcli d wifi help
nmcli d wifi hotspot 
nmcli d wifi list
nmcli d
ip a
sudo lshw -class network
dmesg --
dmesg | grep wifi
dmesg | grep wlan
dmesg | grep wire
dmesg | grep less
dmesg -a | grep wifi
dmesg a | grep wifi
nmcli device 
nmcli device status 
nmcli device status -V
nmcli device status -H
nmcli device status -h
nmcli device status wifi
nmcli -h
nmcli radio 
nmcli radio help
nmcli radio
nmcli radio wifi on
nmcli radio
nmcli -h
nmcli g
jtop
htop
jtop
sudo systemctl status jetson_stats.service 
jtop
sudo systemctl restart jetson_stats.service
jtop
sudo systemctl restart jetson_stats.service
sudo systemctl status jetson_stats.service 
tegrastats 
nmcli r
nmcli r -h
nmcli r wifi -h
nmcli r wifi off
nmcli r wifi on
nmcli r
nmcli r wifi-hw
nmcli d status 
nmcli d wifi connect 
nmcli d wifi list
nmcli d status 
nmcli d wifi connect 
nmcli d wifi connect F1Tenth-lab
nmcli d status 
nmcli r wifi-hw
nmcli r
nmcli r wwan help
nmcli r wwan on
nmcli r wwan of
nmcli r wwan off
nmcli r
nmcli r wwan on
sudo nmcli r wwan on
sudo nmcli r wifi on
sudo nmcli r
nmcli d wifi list
nmcli r
nmcli d
nmcli d wifi list 
sudo nmcli d wifi list 
nmcli d wifi list 
nmcli c show
nmcli d
nmcli dd
nmcli d
who
nmcli 
ip -a
ip a
tmux
sudo reboot 
nmcli 
nmcli r
nmcli rr
nmcli r
sudo nmcli d wifi list 
ifconfig -a
sudo lshw -class network
sudo lshw
dmesg | grep ndis
dmesg
sudo lshw
sudo apt install modemmanager
sudo lshw
dmesg
sudo apt list --installed | grep dkms
sudo apt install dkms
cd code
git clone https://github.com/jeremyb31/rtl8812au-1.git
cd rtl8812au-1/
sudo ./dkms-install.sh
sudo apt install linux-headers-4.4.38-tegra
apt list --installed | grep linux-headers
apt search tegra
apt search tegra | grep headers
sudo apt install linux-headers-4.4.38
sudo apt install linux-headers-4.4
apt list --installed | grep linux-headers
ll /usr/src/
sudo poweroff 
cd code/
ll
cd rtl8812au-1/
ll
./dkms-install.sh 
sudo ./dkms-install.sh 
sudo ./dkms-install.sh --kernelsourcedir /usr/src/linux-headers-4.4.38-tegra/
sudo ./dkms-remove.sh 
sudo ./dkms-install.sh --kernelsourcedir /usr/src/linux-headers-4.4.38-tegra/
cd /usr/src/linux-headers-4.4.38-tegra/
ll
cat README 
sudo make modules_prepare 
ll
cd ~/code/rtl8812au-1/
sudo ./dkms-remove.sh 
sudo ./dkms-install.sh --kernelsourcedir /usr/src/linux-headers-4.4.38-tegra/
sudo ./dkms-install.sh -h
cat ./dkms-install.sh
nano dkms-install.sh 
sudo ./dkms-remove.sh 
sudo ./dkms-install.sh --kernelsourcedir /usr/src/linux-headers-4.4.38-tegra/
make
ll /lib/modules/4.4.38-tegra/
ll /usr/src/linux-headers-4.4.38-tegra/
ll /usr/src/linux-headers-4.4.38-tegra/kernel/
ll /lib/modules/
uname -r
ll /lib/modules/4.15.0-163-generic/
sudo lshw
nano Makefile 
make
cd /etc/network/interfaces.d/
ll
sudo nano lidar.conf
sudo systemctl restart NetworkManager
ifconfig -a
sudo reboot 
ip a
sudo ifup eth0
sudo ifup eth0:1
sudo ifup eth1
sudo ifdown eth1
sudo ifnames
sudo ifquery 
sudo ifquery -a
sudo ifquery a
sudo if
ifconfig 
ifconfig -a
ip a
sudo ifdown eth0:1
sudo ifdown eth1
sudo nano /etc/network/interfaces.d/lidar.conf 
sudo reboot 
ip a
sudo nano /etc/network/interfaces.d/lidar.conf 
cat /etc/network/interfaces
fg
ip a
sudo ifup eth0 
cat /run/network/ifstate
sudo ifconfig eth0 up
ifconfig -a
ip a
cat /run/network/ifstate
ll /run/network/ifstate
ll /run/network/
cat /run/network/ifstate.lo 
cat /run/network/.ifstate.lock 
sudo ifconfig eth0 192.168.0.22 netmask 255.255.255.0 up
ip a
cd code/f1tenth-rewrite/ws/
j
s
ros2 launch ust10lx 
ros2 launch ust10lx start.launch.py 
cd code/
ll
mkdir dds
cd dds/
nano cyclonedds.xml
ll
cd ..
ll
cd htop/
ll
l
cd ..
s
ros2 launch ust10lx start.launch.py 
pwd
s
ros2 launch ust10lx start.launch.py 
exit
tmux
tmux ls
sudo poweroff 
cd code/f1tenth-rewrite/ws/
s
ros2 launch auto auto.ftg.launch.py 
ip a
sudo ifconfig eth0 192.168.0.22 netmask 255.255.255.0 up
ll /dev | grep tty
ll /dev | grep tty.
ll /dev | grep tty\.
ll /dev | grep vesc
ll /dev | grep vesc imu
ll /dev | grep vesc
ll /dev | grep teensy
ll /dev | grep -E 'ttY'
ll /dev | grep -E 'tty
ll /dev | grep -E 'ttY'
ll /dev | grep -E 'tty'
ll /dev | grep -i -E 'tty'
ll /dev | grep -i -E 'tty.'
ll /dev | grep -i -E 'tty\.'
nano src/auto/config/
nano src/auto/config/tx2-auto-3.yaml 
gst
ros2 launch auto auto.ftg.launch.py 
tmux
cd code/f1tenth-rewrite/
cd ws/
ll
cd src/
ll
cd ..
s
ros2 launch auto auto.ftg.launch.py 
sudo ifconfig eth0 192.168.0.22 netmask 255.255.255.0 up
ros2 launch auto auto.ftg.launch.py 
ip a
s
sleep 10 && car-start 
ros2 launch auto auto.ftg.launch.py 
nano ~/code/dds/cyclonedds.xml 
car-stop 
sleep 10 && car-start 
tmux
clear
nano ~/code/dds/cyclonedds.xml 
ros2 launch auto auto.ftg.launch.py 
ll
nano src/decision_and_control/follow_the_gap_v0_ride/
nano src/decision_and_control/follow_the_gap_v0_ride/follow_the_gap_v0_ride/ride_node.py 
nano src/auto/config/
nano src/auto/config/tx2-auto-3.
nano src/auto/config/tx2-auto-3.yaml 
sleep 10 && car-start 
car-start 
ros2 launch auto auto.ftg.launch.py 
cat src/decision_and_control/follow_the_gap_v0_ride/follow_the_gap_v0_ride/ride_node.py 
car-start 
ros2 launch auto auto.ftg.launch.py 
gst
git checkout -- src/decision_and_control/
gst
nano src/decision_and_control/follow_the_gap_v0_ride/follow_the_gap_v0_ride/ride_node.py 
ros2 launch auto auto.ftg.launch.py 
nano src/auto/config/
nano src/auto/config/*.yaml
car-start 
sleep 10 && car-start 
car-start 
ros2 launch auto auto.ftg.launch.py 
car-start 
sleep 20 && car-start 
sleep 10 && car-start 
ros2 topic
ros2 topic list
ros2 topic echo /drive_pwm 
ros2 topic echo /drive_pwm --raw
ros2 topic pub /drive_pwm --rate 10 f1tenth_race/msg/DriveValues '{pwm_drive: 9500, pwm_angle: 10053}'
ros2 launch auto auto.ftg.launch.py 
car-start 
ros2 topic pub /drive_pwm --rate 10 f1tenth_race/msg/DriveValues '{pwm_drive: 9500, pwm_angle: 10053}'
car-start 
ros2 topic pub /drive_pwm --rate 10 f1tenth_race/msg/DriveValues '{pwm_drive: 9500, pwm_angle: 10053}'
ros2 topic pub /drive_pwm --rate 10 f1tenth_race/msg/DriveValues '{pwm_drive: 11500, pwm_angle: 10053}'
ros2 topic echo /pwm_high
ros2 topic pub /drive_pwm --rate 10 f1tenth_race/msg/DriveValues '{pwm_drive: 9500, pwm_angle: 10053}'
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto-3.yaml 
b
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --packages-select teensy_drive 
rm -rf src/vehicle_platform/teensy_drive/
ws-clean 
nano src/decision_and_control/follow_the_gap_v0_ride/follow_the_gap_v0_ride/ride_node.py 
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
ros2
s
clear
clear
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto-3.yaml 
s
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto-3.yaml 
gst
ws-clean 
git checkout -- src/
gst
nano src/auto/config/tx2-auto-3.yaml 
gst
rm -rf src/vehicle_platform/teensy
gst
clear
clear
ros2
clear
clear
ros2
clear
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
s
s
car-start
ros2 topic pub /drive_pwm --rate 10 f1tenth_race/msg/DriveValues '{pwm_drive: 9500, pwm_angle: 10053}'
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto-3.yaml 
s
car-start 
ros2 topic echo /drive_pwm 
ros2 topic echo /drive_api/command 
ros2 launch auto auto.ftg.launch.py 
nano src/vehicle_platform/drive_api/drive_api/drive_api_node.py 
ros2 topic echo /drive_pwm 
car-start 
s
car-start 
ros2 topic echo /drive_pwm 
ros2 launch auto auto.ftg.launch.py 
clear
car-start 
ros2 topic echo /drive_pwm 
car-start 
sleep 10 && car-start 
tmux attach
tmux-at
ros2 launch auto auto.ftg.launch.py 
nano src/decision_and_control/follow_the_gap_v0_ride/follow_the_gap_v0_ride/ride_node.py 
tmux attach
sudo poweroff 
lsusb -t
lsusb
sudo lsusb
lsusb -t
sudo lshw 
sudo lshw -class usb
sudo lshw -class 
sudo lshw
sudo lshw -class usbohst
sudo lshw -class bus
lsusb 
ip a
ll /dev | grep -i -E 'tty\.'
ip -a
ip a
ifconfig -a
ifconfig
ifconfig -a
who
nmcli d
nmcli -h
nmcli -p
nmcli -t
nmcli -p
nmcli -h
nmcli d
nmcli d -p
nmcli d -h
nmcli
nmcli -t
nmcli
nmcli d
nmcli
nmcli -h
nmcli g
nmcli c
nmcli c -h
ll /etc/udev/rules.d/
sudo apt update 
logout 
sudo apt remove modemmanager 
sudo apt update 
apt list --upgradable 
ip route
sudo apt upgrade 
ll /etc/network/interfaces.d/lidar.conf 
cat /etc/network/interfaces.d/lidar.conf 
ifconfig -a
sudo reboot 
iwconfig -a
iwconfig 
iwconfig
cat /etc/network/interfaces.d/lidar.conf 
ll /etc/network/interfaces.d/lidar.conf 
sudo rm /etc/network/interfaces.d/lidar.conf
ll /etc/network/interfaces.d/lidar.conf 
ncli
nmcli
nmcli con
nmcli c
nmcli c -h
nmcli c a
nmcli c add
nmcli conn add con-name "lidar" ifname eth0 type ethernet 
nmcli conn add con-name "lidar" ifname eth0 type ethernet ip4 192.168.0.22/24
sudo nmcli conn add con-name "lidar" ifname eth0 type ethernet ip4 192.168.0.22/24
nmcli c
sudo nmcli conn modify lidar
sudo nmcli conn show lidar 
ifconfig -a
nmcli connection up lidar 
sudo nmcli connection up lidar 
sudo nmcli conn show lidar 
sudo nmcli connection up lidar ifname eth0
nmcli c
sudo nmcli conn show lidar 
nmcli device connect eth0
sudo nmcli device connect eth0
mncli c
n
nmcli c
nmcli con edit
nmcli
sudo nmcli conn show lidar 
cat /etc/NetworkManager/conf.d/99-unmanaged-devices.conf
cat /etc/NetworkManager/conf.d/10-globally-managed-devices.conf 
nmcli d
ifup eth0
sudo ifup eth0
sudo ifconfig eth0 up
ip a
sudo nmcli device connect eth0
sudo nmcli device set eth0 managed yes
nmcli
sudo ifconfig eth0 192.168.0.22 netmask 255.255.255.0 up
ip a
cat /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
ll /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
sudo nmcli
sudo nmcli dev
sudo nmcli dev eth0
sudo nmcli dev eth0 -h
sudo nmcli dev -h
sudo nmcli dev show eth0
sudo nmcli dev set eth0 managed true
sudo nmcli dev show eth0
sudo mv /etc/NetworkManager/conf.d/10-globally-managed-devices.conf  /etc/NetworkManager/conf.d/10-globally-managed-devices.conf_orig
sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf  
ll /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
cat /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
ll /usr/lib/NetworkManager/conf.d/
ll /etc/NetworkManager/conf.d/10-globally-managed-devices.conf_orig
ll /etc/NetworkManager/conf.d/
sud rm /etc/NetworkManager/conf.d/10-globally-managed-devices.conf_orig 
sudo rm /etc/NetworkManager/conf.d/10-globally-managed-devices.conf_orig 
nmcli d eth0
nmcli d show eth0
sudo nano /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
sudo systemctl restart NetworkManager
nmcli
ll /usr/lib/NetworkManager/
ll /usr/lib/NetworkManager/conf.d/
nmcli c
nmcli c delete eth0
sudo nmcli c delete eth0
nmcli c
nmcli connection modify Wired\ connection\ 1 
nmcli connection modify Wired\ connection\ 1 connection.id "eth1-dhcp-wan"
sudo nmcli connection modify Wired\ connection\ 1 connection.id "eth1-dhcp-wan"
mncli c
nmcli c
ip a
ifconfig -a
nmcli c show lidar 
nmcli c edit lidar 
sudo nmcli c edit lidar 
nmcli c show lidar 
cat  /org/freedesktop/NetworkManager/Settings/1
cat /org/freedesktop/NetworkManager/Settings/1
ifconfig -a
nmcli c
nmcli c reload li
nmcli c reload
sudo nmcli c reload
sudo nmcli c down lidar 
ifconfig -a
sudo nmcli c
sudo nmcli device disconnect eth0
ifconfig -a
sudo nmcli device connect eth0
sudo nmcli c
sudo nmcli c modify lidar ipv6.method disabled
sudo nmcli c modify lidar ipv6.method manual
sudo nmcli c modify lidar ipv6.method ignore 
nmcli device wifi hotspot ifname wlan0 ssid tx2-ros2 password galactic2021
sudo nmcli device wifi hotspot ifname wlan0 ssid tx2-ros2 password galactic2021
nmcli 
nmcli r
nmcli c
ifconfig -a
sudo nmcli c edit Hotspot
nmcli c
sudo nmcli c edit \"wlan0-tx2-ros2-access-point\" 
sudo nmcli c modify \"wlan0-tx2-ros2-access-point\" connection.id wlan0-tx2-ros2-access-point
nmcli c
ll /etc/NetworkManager/system-connections/
cat  /etc/NetworkManager/system-connections/wlan0-tx2-ros2-access-point 
sudo cat /etc/NetworkManager/system-connections/wlan0-tx2-ros2-access-point 
sudo cat /etc/NetworkManager/system-connections/lidar 
sudo cat /etc/NetworkManager/system-connections/eth1-dhcp-wan 
ll /etc/NetworkManager/system-connections/
ip route
ip -o addr
ip
ip adddr
ip addr
sudo nmcli connection modify local ipv4.addresses 192.168.1.1/24
sudo nmcli connection modify wlan0-tx2-ros2-access-point ipv4.addresses 192.168.1.1/24
sudo nmcli c up wlan0-tx2-ros2-access-point 
ifconfig -a
ip route
cat /etc/NetworkManager/dnsmasq-shared.d/
ll /etc/NetworkManager/dnsmasq-shared.d/
sudo nmcli c
cat  /etc/modprobe.d/bcmdhd.conf
ll /etc/modprobe.d/bcmdhd.conf
sudo nano /etc/modprobe.d/bcmdhd.conf
sudo nmcli c edit wlan0-tx2-ros2-access-point 
sudo reboot 
nmcli d
nmcli r wifi yes
nmcli r wifi on
nmcli d
nmcli c up wlan0-tx2-ros2-access-point 
sudo nmcli c up wlan0-tx2-ros2-access-point 
nmcli d
sudo nmcli c edit wlan0-tx2-ros2-access-point 
ip -a
ip a
ip 
ip a
time g
ip route
time g
time b
cd code/
ll
cd f1tenth-rewrite/
ll
git log
gst
cat ws/src/auto/config/tx2-auto-3.yaml
gst
git checkout -- ws/src/vehicle_platform/
git checkout -- ws/src/auto/
gst
nano ../dds/cyclonedds.xml 
gst
git pull
cd ws
gst
ws-clean 
cd code/f1tenth-rewrite/ws/
b
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
ll /media/
ll /media/nvidia/
ll /media/nvidia/1ae829db-877c-43ad-b6c1-0b99e617c635/
gst
git pull
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
s
s
s
ros2 launch auto auto.ftg.launch.py 
ros2 launch auto auto.ftg.launch.py -s
htop
cd code/f1tenth-rewrite/ws/
tmux ls
tmux
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
tmux attach
sudo reboot 
jtop
sudo poweroff 
cd code/
cd f1tenth-rewrite/
ll
cd ws
b
s
b
s
ros2 node lis
ros2 node list
ros2 node list -a
jtop
ros2 topic echo /pwm_high 
tmux
htop
nmcli
nmcli c 
sudo nmcli c edit wlan0-tx2-ros2-access-point 
sudo nmcli c down wlan0-tx2-ros2-access-point 
nmcli c 
ifconfig -a
nmcli d wifi list
nmcli r wifi on
nmcli d wifi list
sudo nano /etc/modprobe.d/bcmdhd.conf
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
sudo reboot 
nmcli d wifi list
sudo nmcli d wifi connect CIIRC-GUEST password Praha234
nmcli c
sudo nmcli c modify CIIRC-GUEST 
sudo nmcli c edit CIIRC-GUEST 
nmcli c
ifconfig -a
ip rout
ip route
tmux ls
cd code/f1tenth-rewrite/ws/
jtop
s
b
clear
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
clear
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
ros2 node list
ros2 node list -a
nano ~/code/dds/cyclonedds.xml 
ros2 daemon stop
ros2 daemon start
ros2 node list -a
sudo nmcli d wifi connect martin-mbp password pokusew2021
nmcli d wifi list
sudo nmcli c
sudo nmcli c down wlan0-CIIRC-GUEST 
sudo nmcli c modify wlan0-CIIRC-GUEST connection.autoconnect no
nmcli d wifi list
sudo nmcli d wifi connect martin-mbp password pokusew2021
ifconfig -a
sudo nmcli c
sudo nmcli c edit martin-mbp 
sudo nmcli c
ip a
htop
jtop
ros2 daemon stop
sudo nmcli c modify wlan0-martin-mbp connection.autoconnect no
sudo nmcli c modify wlan0-tx2-ros2-access-point connection.autoconnect no
sudo nmcli c modify wlan0-tx2-ros2-access-point connection.autoconnect yes
sudo nmcli c
iwconfig 
sudo nano /etc/modprobe.d/bcmdhd.conf
tmux
tmux attach
sudo reboot 
sudo iwconfig 
sudo iwconfig -a
sudo iwconfig -v
sudo iwconfig
iw reg get
sudo nmcli c edit wlan0-tx2-ros2-access-point 
tmux ls
ifconfig -a
sudo reboot 
sudo nmcli c edit wlan0-tx2-ros2-access-point 
cd code/f1tenth-rewrite/ws/
time b
time s
ros2 node list
ros2 node list -a
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
clear
jtop
ros2 node echo /pwm_drive
ros2 topic echo /pwm_high 
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
tmux
cd code/f1tenth-rewrite/ws/
b
s
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto.yaml 
htop
cd code/f1tenth-rewrite/ws/
cd ..
ros-vsc-sync 
/usr/bin/python3 -m pip install -U autopep8
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --packages-select teensy_drive 
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto.yaml 
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --packages-select teensy_drive 
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto.yaml 
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --packages-select teensy_drive 
gst
git pull
gst
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --packages-select teensy_drive 
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto.yaml 
gst
git pull
colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --packages-select teensy_drive 
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
clear
tmux
sudo poweroff 
cd code/f1tenth-rewrite/ws/
time b
s
clear
clear
s
clear
ros2 node list -a
clear
car-start
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
tmux
cd code/f1tenth-rewrite/ws/
s
s
ifconfig 
iwconfig
ping 8.8.8.8
sudo apt install iftop
iftop -i wlan0
sudo 
sudo iftop
sudo iftop -i wlan0
sudo htop
tmux attach
sudo htop
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
tmux attach
tmux
sudo htop
g
ros2 daemon stop
sudo htop
tr
ros2 daemon start
cd code/f1tenth-rewrite/ws/
s
sudo iftop -i wlan0
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
ros2 daemon stop
nano ~/code/dds/cyclonedds.xml 
tmux
ip a
sudo iftop -i wlan0
s
car-start
ros2 node list
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
ros2 daemon stop
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ros2 node list -a
car-start
tmux attach
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
htop
tmux attach
sudo poweroff 
echo $RMW_IMPLEMENTATION 
cd code/f1tenth-rewrite/ws/
gst
s
s
g
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
tmux
htop
sudo poweroff 
ll
ping 8.8.8.8
ip route
nmcli c
cd code/
ll
cd f1tenth-rewrite/
ll
cd ws
cd code/f1tenth-rewrite/ws/
ll
ping 8.8.8.8
htop
sudo apt update
apt list --upgradable 
ip route
ip s a
ip a
htop
echo $RMW_IMPLEMENTATION 
sudo apt upgrade 
sudo reboot 
ip a
cd code/f1tenth-rewrite/ws/
s
time s
clear
clear
b
clear
cat src/auto/config/tx2-auto-3.yaml 
cat src/auto/config/tx2-auto.yaml 
clear
cat src/auto/config/tx2-auto-3.yaml 
cat src/auto/config/tx2-auto.yaml 
clear
cat src/auto/config/tx2-auto.yaml 
clear
ros2 run teensy_drive teensy_drive --ros-args --params-file src/auto/config/tx2-auto.yaml 
gst
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
ros2 run follow_the_gap_v0_ride ride_node --ros-args --params-file src/auto/config/tx2-auto.yaml 
ros2 topic echo /drive_api/command 
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
clear
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
clear
fs
htop
sudo apt install strace
htop
perf
sudo apt install linux-tools
uname -a
sudo apt install aptitude
sudo apt install linux-tools-generic
perf
sudo apt install linux-tools-tegra
ll
cd /
ll
cd usr/src/
uname -a
cd ~
ll
head -1 /etc/nv_tegra_release
jtop
cd ~/code
mkdir kernel
cd kernel/
wget https://developer.nvidia.com/embedded/l4t/r32_release_v5.2/sources/t186/public_sources.tbz2
ll
tar -xf public_sources.tbz2 
ll
cd Linux_for_Tegra/
ll
cd source/
ll
cd public/
ll
tar -xf kernel_src.tbz2 
ll
mv kernel ../../
cd ..
ll
cd kernel/
ll
cd kernel-4.9/
ll
ls tools/
ll tools/
cd tools/perf/
ll
make
sudo apt install libelf-dev
sudo aptitude
make
make clean
make
make clean
jtop
make -j4
sudo make install
perf
perf record -p 14316
sudo perf record -p 14316
sudo which perf
which perf
sudo /home/nvidia/bin/perf record -p 14316
ll
sudo /home/nvidia/bin/perf report
/home/nvidia/bin/perf report
sudo /home/nvidia/bin/perf stat -p 14316
sudo /home/nvidia/bin/perf stat -h
sudo /home/nvidia/bin/perf stat -t 14316
sudo /home/nvidia/bin/perf record -p 14316 -e branch-misses
sudo /home/nvidia/bin/perf report
sudo /home/nvidia/bin/perf record -p 14316 -g --help
sudo /home/nvidia/bin/perf record -p 14316 -g --call-graph dwarf
htop
ros2 launch auto auto.ftg.launch.py config:=tx2-auto.yaml
tmux
sudo /home/nvidia/bin/perf report
sudo poweroff 
ll
nmcli
nmcli -h
ll /etc/NetworkManager/system-connections
cat /etc/NetworkManager/system-connections/*
sudo cat /etc/NetworkManager/system-connections/*
sudo cat /etc/NetworkManager/system-connections/* | grep mac
systemctl status rsync
man rsync
ll /etc/NetworkManager/system-connections
stat -c "%a %n" *
stat -c "%a %n" /etc/NetworkManager/
stat -c "%a %n" /etc/NetworkManager/system-connections/
stat -c "%a %n" /etc/NetworkManager/system-connections/*
man stat
lsattr 
lsattr
lsmod 
lslogins 
lsattr
pwd
ll /home
ll /root
sudo ll /root
sudo ls -lh root
sudo ls -lh /root
ll
ll bin
ll et
ll etc
ll etc/bash_completion.d/
ll /etc/NetworkManager/system-connections/
ll .ssh
ll
ll bin
ll code
cat code/+ /home/nvidia/.ssh/
cat code/ros2.code-workspace 
ll
which ros-vsc-sync 
ll bin
ll .ssh
ll
rsync -v
rsync --versio
rsync --version
ll
systemctl statusrsyncd
systemctl status rsyncd
systemctl status rsync
ll /etc
sudo nano /etc/rsyncd.conf
jobs
sudo netstat -tulpn | grep LISTEN
sudo nano /etc/rsyncd.conf
sudo systemctl restart rsync
sudo systemctl status rsync
sudo netstat -tulpn | grep LISTEN
sudo ss -tulpn
sudo nano /etc/rsyncd.conf
sudo systemctl restart rsync
sudo ss -tulpn
sudo netstat -tulpn | grep LISTEN | grep rsync
sudo nano /etc/rsyncd.conf
sudo systemctl restart rsync
ll /etc
ll /etc/NetworkManager/
ll /etc/NetworkManager/system-connections/
ll .bash*
apt list --installed | grep modemmanager
head -1 /etc/nv_tegra_release
uname -a
lsb_release -a
jtop
ping 8.8.8.8
sudo apt update
apt list --upgradable 
sudo apt upgrade 
python -V
which python
readlink /usr/bin/python
ll /usr/bin/ | grep python
ll /usr/bin/
python3 -V
which pip
which pip3
pip3 install -U jetson-stats
sudo -H pip3 install -U jetson-stats
ll
sudo reboot 
sudo systemctl status jetson_stats.service
jtop
