# Notes

TODO: categorize and split


## ROS visualization

* [Webviz](https://webviz.io/)
	* Visualizing robotics data in the browser
	* https://github.com/cruise-automation/webviz
	* a project of [Cruise](https://www.getcruise.com/)
	* currently, no ROS 2 support,
	  see [cruise-automation/webviz#348](https://github.com/cruise-automation/webviz/issues/348)
* [Foxglove Studio](https://foxglove.dev/)
	* [Foxglove Studio - visualization and debugging for ROS (ROS Discourse)](https://discourse.ros.org/t/foxglove-studio-visualization-and-debugging-for-ros/19627/14)
	* https://foxglove.dev/
	* https://github.com/foxglove/studio
	* a fork of Webviz
	* desktop app (in the future it should support direct connection to ROS nodes)
	* currently, no ROS 2 support, but planned


## ROS and macOS

* [Installing (binary) ROS 2 Foxy on macOS](https://docs.ros.org/en/foxy/Installation/macOS-Install-Binary.html)
	* `brew install asio tinyxml2 tinyxml eigen poco opencv console_bridge log4cxx spdlog sip pyqt5`
* [Is anyone using ROS2 GUI tools like rviz on macOS? (ROS Discourse)](https://discourse.ros.org/t/is-anyone-using-ros2-gui-tools-like-rviz-on-macos/16353/4)
* [ROS2 on MacOSX Catalina](http://www.robotandchisel.com/2020/08/10/rviz2-on-mac/)
* It is needed to use source `/opt/ros/foxy/setup.bash` when using `install/setup.bash` in the already successfully
  built ROS 2 colcon workspace?
	* It seems that it is NOT needed. It is only logical (it's the difference between `local_setup.bash`
	  and `setup.bash`).
* macOS <= 10.14.6 (Mojave)
  ```
  ---
  
  cd /Users/pokusew/ros/foxy/include/pluginlib
  
  ---
  
  -bash: /Users/pokusew/ros/foxy/bin/ros2: /usr/local/bin/python3: chybný interpretr: No such file or directory
  
  ---
  
  https://github.com/Homebrew/homebrew-core/blob/ecfc0a04cdfb39697f2fc0bd4c089cede614e12c/Formula/boost-python3.rb
  /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/pokusew-boost-python3.rb
  
  ---
  
  https://stackoverflow.com/questions/58667853/does-use-of-c17-stdfilesystem-require-macos-10-15-xcode-11-1
  
  dyld: lazy symbol binding failed: Symbol not found: __ZNKSt3__14__fs10filesystem4path13__parent_pathEv
	Referenced from: /Users/pokusew/Sites/ros/image_common/install/image_transport/lib/libimage_transport.dylib
	Expected in: /usr/lib/libc++.1.dylib
  
  dyld: Symbol not found: __ZNKSt3__14__fs10filesystem4path13__parent_pathEv
	Referenced from: /Users/pokusew/Sites/ros/image_common/install/image_transport/lib/libimage_transport.dylib
	Expected in: /usr/lib/libc++.1.dylib
  
  https://stackoverflow.com/questions/58943032/c-build-failed-on-xcode-osx-with-multiple-errors-file-io-is-unavailable-i
  https://answers.ros.org/question/338832/ros2-source-install-macos-10151-qt_gui_cpp-fails/
  https://github.com/ros-perception/image_common/issues/139
  https://github.com/ClickHouse/ClickHouse/issues/8541
  
  https://github.com/ros/pluginlib/issues/215
  
  ----
  ```
* [Requiring users to disable SIP on OS X](https://github.com/ros2/ros2/issues/409)
	* https://github.com/ros2/ros2_documentation/pull/968/commits/bc32e9573fd8a63f5138c07b51f7da94c053fafd
* [macOS support in ROS 2 Galactic and beyond](https://discourse.ros.org/t/macos-support-in-ros-2-galactic-and-beyond/17891/5)


## General

* https://askubuntu.com/questions/1197683/how-do-i-install-python-3-8-in-lubuntu-18-04
* https://unix.stackexchange.com/questions/275824/simulate-the-running-of-a-make-install-a-dry-run-or-simulator-utility
* https://unix.stackexchange.com/questions/591760/what-does-smp-preempt-rt-mean-in-uname-a
