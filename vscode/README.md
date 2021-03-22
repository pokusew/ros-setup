# VSCode and ROS


## Common

* [ROS extension](https://github.com/ms-iot/vscode-ros) `ms-iot.vscode-ros`


## In the workspace

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
    * does not affect terminal
    * see https://code.visualstudio.com/docs/python/environments#_use-of-the-pythonpath-variable
    * so the workaround is to run my `ros-vsc-sync.sh` script that creates `.env` file with correct `PYTHONPATH`


## Related links

* https://code.visualstudio.com/docs/python/environments#_use-of-the-pythonpath-variable
* https://stackoverflow.com/questions/43574995/visual-studio-code-pylint-unable-to-import-protorpc
* https://github.com/microsoft/vscode-python/issues/2791
