# VSCode and ROS

What's **great** on VSCode:
* can be used in [Remote mode over SSH](https://code.visualstudio.com/docs/remote/ssh)
    * the Remote mode is a first-class feature and everything works really great
    * compared to that, CLion's Remote mode is a very bad


What's **not so good** on VSCode:
* autocomplete, linting, IntelliSense, other code assistance and overall features
  are **way worse** than what CLion offers


## Setup ROS 2 and VSCode

That's currently the setup I use. 

**VSCode extensions:**
* C/C++ `ms-vscode.cpptools`
* Python `ms-python.python`

**Project setup:**
1. Download [ros-vsc-sync.sh](./ros-vsc-sync.sh) script. Add it to your PATH.
2. Add **.rh-project** file to your ROS 2 project root (can be different from the colcon workspace root).  
   Example content:
   ```bash
    # currently used by ros-vsc-sync tool
    #   see https://github.com/pokusew/ros-setup/blob/master/vscode/ros-vsc-sync.sh
    # in the future, it might be as well used by rh (https://github.com/pokusew/rh)
    # set RH_WORKSPACE_ROOT to point to your ROS workspace root (colcon or catkin)
    # RH_WORKSPACE_ROOT is relative to the project root (location of this file)
    # use "." if workspace root and project root are the same
    RH_WORKSPACE_ROOT="ws"
   ```
3. Build your workspace using colcon but enable also **Compilation Database** creation:
    ```bash
    colcon build --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 
    ```
4. Run `ros-vsc-sync` in your project root.
5. Create `.vscode/c_cpp_properties.json` in your project:
    ```json
    {
        "configurations": [
            {
                "name": "ROS 2",
                "includePath": [
                    "${workspaceFolder}/**"
                ],
                "defines": [],
                "compilerPath": "/usr/bin/gcc",
                "cStandard": "c99",
                "cppStandard": "gnu++14",
                "intelliSenseMode": "linux-gcc-x64",
                "compileCommands": "${workspaceFolder}/compile_commands.json"
            }
        ],
        "version": 4
    }
    ```
   * This is an example. You can change what you need.
   * Note the `compileCommands` option. It tells VSCode to use the **Compilation Database** produced by colcon build.
6. Open your project root in VSCode.


## Common


## Files in the workspace

* `${workspaceFolder}/.vscode/settings.json`
    * `python.autoComplete.extraPaths`
        * used by Python autocompletion (IntelliSense)
        * however, ignored by linting tools (such as pylint) (even when they are invoked automatically
          under the hood by VSCode), see below for solution (.env file)
        * ~~auto-managed by the ROS extension~~ it turned out that my solution is better, see below
            * the ROS extension will automatically detect the `devel/setup*` file (for both ROS 1 and ROS 2),
            * **note!** When `PYTHONPATH` changes, **the whole VSCode must be restarted** in order for
              run it and extract the `PYTHONPATH` from it (and update `python.autoComplete.extraPaths`)
              the ROS extension to detect the change. The setup `devel/setup*` file is evaluated only on the ROS extension's
              activation and then the PYTHONPATH is cached (even when using the action _ROS: Update Python Path_).
        * now it is automatically updated while running `ros-vsc-sync.sh` script (workspaces not directly in workspaceFolder are also supported)
* `${workspaceFolder}/.env` (can be changed via setting `python.envFile`)
    * respected by tools run by Python extension (e.g. pylint)
    * does not affect VSCode's Terminal
    * see https://code.visualstudio.com/docs/python/environments#_use-of-the-pythonpath-variable
    * so the workaround is to run the `ros-vsc-sync.sh` script that creates `.env` file with correct `PYTHONPATH`


## Related links

* https://code.visualstudio.com/docs/python/environments#_use-of-the-pythonpath-variable
* https://stackoverflow.com/questions/43574995/visual-studio-code-pylint-unable-to-import-protorpc
* https://github.com/microsoft/vscode-python/issues/2791
* [ROS extension](https://github.com/ms-iot/vscode-ros) `ms-iot.vscode-ros`
    * actually it does not work well (at least for ROS 2)
