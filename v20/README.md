# Setup notes for Ubuntu 20 with ROS 2

_Note: These are currently rather my personal notes on setting up an Ubuntu 20 VM from scratch._


## Setup


### Basic initial

1. setup 24-hour time
2. `sudo apt update && sudo apt upgrade`
2. `sudo apt install openssh-server`
3. `sudo systemctl status ssh`


### Set custom hostname

**Note!** Before changing hostname in _Settings > About_, ensure that _/etc/hosts_ contains the
entry `127.0.1.1	some-new-hostname`. Otherwise, a lot of commands will stop working (incl. `sudo`).

1. ensure /etc/hosts contains the entry with the new hostname
	* type `sudo nano /etc/hosts`
	* add `127.0.1.1	ubuntu20-ros`
	* save and exit (Ctrl-O Ctrl-X)
2. change hostname to `ubuntu20-ros` in _Settings > About_
3. `sudo reboot`


### Setup SSH connection from your local machine

1. add the following Host specific config to `~/.ssh/config` (with useful settings)
    ```
    # ROS
    Host ubuntu20-ros
        User pokusew
        # no need to define IP address here
        # as ubuntu20-ros is defined in /etc/hosts
        # BUT when there is no internet access ubuntu20-ros in /etc/hosts does not work for ssh
        HostName 192.168.182.136
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/ubuntu20_ros_rsa
        # DISPLAY=:0 is for running GUI on the remote display
        # for mutplie env vars use
        # SetEnv ENV1=val1 ENV2=val2 ENV3=val3 ...
        SetEnv DISPLAY=:0 POWERLINE_UPDATE_TERMINAL_CWD=1
    ```
2. generate a new SSH key
   ```bash
   ssh-keygen -t rsa -b 4096 -C "pokusew@ubuntu20-ros"
   ```
3. transfer the key to the remote machine (will prompt for the login password)
   ```bash
   ssh-copy-id -i ~/.ssh/ubuntu20_ros_rsa.pub ubuntu20-ros
   ```


### Install HSTR

[HSTR](https://github.com/dvorka/hstr) is great replacement for standard Bash Ctrl-R reverse search feature.

Install via apt:
```bash
sudo add-apt-repository ppa:ultradvorka/ppa
sudo apt-get update
sudo apt-get install hstr
```

No-need for configuration now. It will be done in the next step. Read below.


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
./scripts/upload.sh v20 ubuntu20-ros --all
```

You will be prompted to enter your sudo password on the remote machine
(only if using `--all` option that attempts to change `/etc/ssh/sshd_config`).

Then, restart SSH service on the remote machine (so the `/etc/ssh/sshd_config` takes effect):
```bash
ssh ubuntu20-ros "sudo -S systemctl restart ssh"
```
