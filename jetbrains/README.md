# JetBrains IDEs and ROS

What's **great** on JetBrains IDEs:
* autocomplete, linting, IntelliSense, other code assistance and overall features are **superior** to others


What's **not so good** on JetBrains IDEs:
* the remote mode is very limited and does not work well


## Common

There are two different situations to consider:
1. ROS and JetBrains IDE are both running in the same system (OS).
2. ROS is running in the remote/virtual machine (or in Docker container).

Further, ROS 2 setup is different from ROS 1 setup.

The best JetBrains IDE to use is CLion as it has also Python support (so it will work as well as PyCharm).
However, CLion does NOT support remote Python interpreter.


## CLion + ROS 2 (same system)

The best way (and practically the only way) is to use the CLion's support
for [Compilation database](https://www.jetbrains.com/help/clion/2021.1/compilation-database.html).

1. Build your workspace using colcon but enable also **Compilation Database** creation:
   ```bash
   colcon build --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
   ```

2. Symlink the `build/compile_commands.json` (from colcon workspace) to your project root (or colcon workspace
   root).

3. Source the `install/setup.bash` (from colcon workspace) in your terminal.

4. Start CLion from the terminal where you sourced the workspace setup script. You can use the CLion's menu
   option _Tools > Create Command-Line Launcher..._ to create the start script. Or refer
   to [the docs](https://www.jetbrains.com/help/clion/2021.2/working-with-the-ide-features-from-command-line.html)
   for additional possibilities.

5. Open the directory (to which you symlinked the `compile_commands.json`) in CLion. It should detect the
   compilation database and open the project as a **Compilation Database Project.**

6. The code completion and navigation should work for both C++ and Python code.

**Note 1:** When you add/remove some package from your workspace, you must close CLion. Build the workspace.
Source the setup script. Open CLion from that terminal.

**Note 2:** It seems the closing-sourcing-opening is not enough for Python autocomplete/navigation cache to
update. It needs the CLion cache to be invalidated before closing. Use File > Invalidate Caches... > Just
invalidate.


## Other scenarios

All combinations of ROS 1 / ROS 2, local/remote are possible to use. I tried them all, but I haven't got time
to document the setup (yet). In case you need help, feel free to contact me. Nevertheless, the remote mode in
JetBrains IDEs is not good and for remote work and recommend [VSCode](../vscode/README.md).


## Related links

* (ROS 1) https://www.jetbrains.com/help/clion/ros-setup-tutorial.html
* (not recommend)
  [CLion top level ROS2 Workspace CMakeLists](https://gist.github.com/rotu/1eac858b808b82bbf1b475f515e91636)
* (plugin for ROS 1, but also usable for ROS 2) https://github.com/duckietown/hatchery
* https://www.reddit.com/r/ROS/comments/hkpgao/ros2_and_clion/
