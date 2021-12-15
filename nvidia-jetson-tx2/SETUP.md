# Setup notes for NVIDIA Jetson TX2 with ROS 2

_Note: These are currently rather my personal notes on setting up an NVIDIA Jetson TX2 from scratch._


## Setup


### Set custom hostname

**Note!** Before changing hostname in _Settings > About_, ensure that _/etc/hosts_ contains the
entry `127.0.1.1	some-new-hostname`. Otherwise, a lot of commands will stop working (incl. `sudo`).

1. ensure /etc/hosts contains the entry with the new hostname
	* type `sudo nano /etc/hosts`
	* add `127.0.1.1	tx2-ros2`
	* save and exit (Ctrl-O Ctrl-X)
2. change hostname to `tx2-ros2` in _Settings > About_
3. `sudo reboot`


### Setup SSH connection from your local machine

1. add the following Host specific config to `~/.ssh/config` (with useful settings)
   ```
   # NVIDIA Jetson TX2
   Host tx2-ros2
       User nvidia
       # no need to define IP address here
       # as tx2-ros2 is defined in /etc/hosts
       # BUT when there is no internet access tx2-ros2 in /etc/hosts does not work for ssh
       HostName 192.168.1.42
       AddKeysToAgent yes
       UseKeychain yes
       IdentityFile ~/.ssh/tx2-ros2
       ForwardAgent yes
       # DISPLAY=:1 is for running GUI on the remote display
       # for mutplie env vars use
       # SetEnv ENV1=val1 ENV2=val2 ENV3=val3 ...
       SetEnv DISPLAY=:1 POWERLINE_UPDATE_TERMINAL_CWD=1
   ```

2. generate a new SSH key
   ```bash
   ssh-keygen -t rsa -b 4096 -C "nvidia@tx2-ros2"
   ```
3. transfer the key to the remote machine (will prompt for the login password)
   ```bash
   ssh-copy-id -i ~/.ssh/tx2-ros2.pub tx2-ros2
   ```


### Install HSTR

[HSTR](https://github.com/dvorka/hstr) is great replacement for standard Bash Ctrl-R reverse search feature.

Install from sources (as there are currently no builds for ARMv8):
```bash
# install missing needed dependencies
sudo apt install libncursesw5-dev libreadline-dev

# hstr
cd ~/code
git clone https://github.com/dvorka/hstr.git
cd hstr
cd ./build/tarball && ./tarball-automake.sh && cd ../..
./configure && make
sudo make install
```

No-need for configuration now. It will be done in the next steps. Read below.


### Install tmux

[tmux](https://github.com/tmux/tmux) is a great terminal multiplexer.

Install from sources (as the builds for ARMv8 are outdated):
```bash
# install missing needed dependencies
sudo apt install libevent-dev libncurses5-dev

# tmux
cd ~/code
git clone https://github.com/tmux/tmux.git
cd tmux
git checkout 3.2a
sh autogen.sh
./configure && make
sudo make install
```

No-need for configuration now. It will be done in the next steps. Read below.


### htop

[htop](https://github.com/htop-dev/htop) is an interactive process viewer.

Install from sources (as the builds for ARMv8 are outdated):
```bash
# htop README states: Running htop requires ncurses libraries (typically named libncursesw*).
# install missing needed dependencies
sudo apt install libncursesw5-dev

# htop
cd ~/code
git clone https://github.com/htop-dev/htop.git
cd htop
git checkout 3.1.1
./autogen.sh && ./configure && make
sudo make install

# TODO: missing bins: lsof, strace
# TODO: consider https://packages.debian.org/sid/libsensors-dev
```

No-need for configuration now. It will be done in the next steps. Read below.


### Install jetson-stats

[jetson-stats](https://github.com/rbonghi/jetson_stats) is a package for monitoring and control your NVIDIA
Jetson [Xavier NX, Nano, AGX Xavier, TX1, TX2]. Works with all NVIDIA Jetson ecosystem.

```bash
sudo -H python3 -m pip install -U jetson-stats
```

See [jetson-stats Wiki] to learn more about all its features.

jetson-stats install a service [jetson_stats.service](https://github.com/rbonghi/jetson_stats/wiki/jetson_stats.service)
which run automatically in background upon system startup (4 processes in total). It can be controlled via `systemctl`.
To see current status, use:
```bash
sudo systemctl status jetson_stats.service
```


### Install other useful utils

```bash
sudo apt install nano
```


### Upgrade CMake

Ubuntu 18 ships CMake 3.10. However, during the ROS 2 build, at least one package (foonathan_memory_vendor) requires
CMake 3.11. So we install the latest CMake from the [Kitware APT repository](https://apt.kitware.com/):
```bash
# 1. uninstall the default version shipped from Ubuntu repos
sudo apt remove --purge --auto-remove cmake
# 2. obtain a copy of Kitware's signing key
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
# 3. add the repository to the sources list and update
echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
sudo apt-get update
# 4. install the kitware-archive-keyring package to ensure that the keyring stays up to date as Kitware rotate their keys
sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg
sudo apt-get install kitware-archive-keyring
# 5. install the latest CMake from the Kitware APT repository
sudo apt-get install cmake
# 6. verify the version (cmake version 3.21.3 is the latest as of November 15, 2021)
cmake --version
```

**Useful info:**
* [Kitware APT repository usage guide](https://apt.kitware.com/)
* [StackOverflow: How do I install the latest version of cmake from the command line?](https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line)


### Install ROS 2

ROS 2 Galactic targets Ubuntu Focal Fossa (20.04) and prebuilt binaries are available only for Ubuntu 20.04.

JetPack 4.x is based on Ubuntu Bionic Beaver 18.04. According to the
official [NVIDIA Jetson Roadmap](https://developer.nvidia.com/embedded/develop/roadmap), JetPack 5.x (which is scheduled
as Developer Preview for Q1 2022) will be based on Ubuntu 20.

As there are currently no ROS 2 Galactic binaries for Ubuntu 18, we have to **build ROS 2 Galactic from sources**
(and maybe face some minor incompatibility issues) or we can run **ROS 2 Galactic in Docker containers**.

**Resources:**
* [Building ROS 2 Galactic on Ubuntu Linux (official ROS 2 Galactic docs)](https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html)
* ROS 2 Galactic base Docker image for
  L4T: [Dockerfile.ros.galactic](https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ros.galactic)
  from [dusty-nv/jetson-containers](https://github.com/dusty-nv/jetson-containers)


#### Building ROS 2 from sources

```bash

# Add ROS 2 apt repository
# see https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html#add-the-ros-2-apt-repository
sudo apt install curl gnupg2
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update

# Install development tools and ROS tools
# see https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html#install-development-tools-and-ros-tools
# see https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ros.galactic#L44
sudo apt install \
	build-essential \
	cmake \
	git \
	libbullet-dev \
	libpython3-dev \
	python3-colcon-common-extensions \
	python3-flake8 \
	python3-pip \
	python3-pytest-cov \
	python3-rosdep \
	python3-setuptools \
	python3-vcstool \
	python3-rosinstall-generator \
	libasio-dev \
	libtinyxml2-dev \
	libcunit1-dev
python3 -m pip install -U \
	argcomplete \
	flake8-blind-except \
	flake8-builtins \
	flake8-class-newline \
	flake8-comprehensions \
	flake8-deprecated \
	flake8-docstrings \
	flake8-import-order \
	flake8-quotes \
	pytest-repeat \
	pytest-rerunfailures \
	pytest

# Get ROS 2 code
# see https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html#get-ros-2-code
# see also https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ros.galactic#L78
mkdir -p ~/ros/galactic/src
cd ~/ros/galactic
wget https://raw.githubusercontent.com/ros2/ros2/galactic/ros2.repos
vcs import src < ros2.repos

# Install dependencies using rosdep
# see https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html#install-dependencies-using-rosdep
# see https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ros.galactic#L96
sudo rosdep init
rosdep update
rosdep install -y \
	--ignore-src \
	--from-paths src \
	--rosdistro galactic \
	--skip-keys "fastcdr rti-connext-dds-5.3.1 urdfdom_headers"

# Build the code in the workspace
# see https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html#build-the-code-in-the-workspace
# see https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ros.galactic#L152
colcon build --merge-install
```


### Copy my custom scripts and configs

It copies and configures:
* [rh.sh](https://github.com/pokusew/rh) – _a simple helper to make working with ROS easier_
* (TODO: fix add link once published) **pokusew-bash-powerline.sh**
* `~/.bashrc` (fully setup ROS, rh, HSTR and more)
* `~/.tmux.conf`
* `/etc/ssh/sshd_config` (only when `upload.sh --all` option is used, see below)
* see contents of [upload.sh](../scripts/upload.sh) script for more info

Run in the root of this project (`ros-setup`) on your local machine:
```bash
./scripts/upload.sh nvidia-jetson-tx2 tx2-ros2 --all
```

You will be prompted to enter your sudo password on the remote machine
(only if using `--all` option that attempts to change `/etc/ssh/sshd_config`).

Then, restart SSH service on the remote machine (so the `/etc/ssh/sshd_config` takes effect):
```bash
ssh tx2-ros2 "sudo -S systemctl restart ssh"
```


### Add udev rules for USB devices

See [UDEV.md](./UDEV.md).


### Create a bootable SD card

See [these notes](./boot-config/README.md).
