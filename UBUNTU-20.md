# Ubuntu setup notes for running ROS


## Setup

1. setup 24-hour time
2. sudo apt install openssh-server
3. sudo systemctl status ssh
4. cat /etc/ssh/sshd_config

4. modify /etc/hosts
5. ssh-keygen -t rsa -b 4096 -C "pokusew@ubuntu20-ros"
6. ssh-copy-id -i /Users/pokusew/.ssh/ubuntu20_ros_rsa.pub ubuntu20-ros 

7. sudo nano /etc/hosts
    ```127.0.1.1	ubuntu20-ros```
8. change hostname in Settings > About
9. Reboot

10.
    sudo add-apt-repository ppa:ultradvorka/ppa
    sudo apt-get update
    sudo apt-get install hstr

```
# ROS
Host ubuntu16-ros
	User pokusew
	# no need to define IP address here
	# as ubuntu16-ros is defined in /etc/hosts
	# BUT when there is no internet access ubuntu16-ros in /etc/hosts does not work for ssh
	HostName 192.168.182.135
	AddKeysToAgent yes
	UseKeychain yes
	IdentityFile ~/.ssh/ubuntu16_ros_rsa
	# DISPLAY=:0 is for running GUI on the remote display
	# for mutplie env vars use
	# SetEnv ENV1=val1 ENV2=val2 ENV3=val3 ...
	SetEnv DISPLAY=:0
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
	SetEnv DISPLAY=:0
```
