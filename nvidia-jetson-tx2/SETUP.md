# Setup notes for NVIDIA Jetson TX2 with ROS 2

_Note: These are currently rather my personal notes on setting up a NVIDIA Jetson TX2 from scratch._


## Setup


### Set custom hostname

**Note!** Before changing hostname in _Settings > About_, ensure that _/etc/hosts_ contains the
entry `127.0.1.1	some-new-hostname`. Otherwise, a lot of commands will stop working (incl. `sudo`).

1. ensure /etc/hosts contains the entry with the new hostname
	* type ```sudo nano /etc/hosts```
	* add ```127.0.1.1	tx2-ros2```
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
      SetEnv DISPLAY=:1
   ```

2. generate a new SSH key
   ```
   ssh-keygen -t rsa -b 4096 -C "pokusew@tx2-ros2"
   ```
3. transfer the key to the remote machine (will prompt for the login password)
   ```
   ssh-copy-id -i /Users/pokusew/.ssh/ubuntu20_ros_rsa.pub tx2-ros2
   ```

### Install HSTR

[HSTR](https://github.com/dvorka/hstr) is great replacement for standard Bash Ctrl-R reverse search feature.

Install from sources (as there are currently no builds for ARMv8):
```bash
# missing needed dependencies
sudo apt install libncursesw5-dev libreadline-dev

# hstr
cd ~/code
git clone https://github.com/dvorka/hstr.git
cd hstr
cd ./build/tarball && ./tarball-automake.sh && cd ../..
./configure && make
sudo make install
```

No-need for configuration now. It will be done in the next step. Read below.


### Install other useful utils

* https://github.com/tmux/tmux

```bash
sudo apt install tmux nano
```


### Install ROS 2

Follow https://docs.ros.org/en/foxy/Installation/Linux-Install-Debians.html


### Copy my custom scripts and configs

It copies and configures:
* [rh.sh](https://github.com/pokusew/rh) – _a simple helper to make working with ROS easier_
* (TODO: fix add link once published) **pokusew-bash-powerline.sh**
* `~/.bashrc` (fully setup ROS, rh, HSTR and more)
* `~/.tmux.conf`
* `/etc/ssh/sshd_config` (only when `upload.sh --all` option is used, see below)
* see contents of [upload.sh](../scripts/upload.sh) script for more info

Run in the root of this project (`ubuntu-ros`) on your local machine:
```bash
./scripts/upload.sh nvidia-jetson-tx2 tx2-ros2 --all
```

You will be prompted to enter your sudo password on the remote machine
(only if using `--all` option that attempts to change `/etc/ssh/sshd_config`).

Then, restart SSH service on the remote machine (so the `/etc/ssh/sshd_config` takes effect):
```bash
ssh -S tx2-ros2 "sudo systemctl restart ssh"
```
