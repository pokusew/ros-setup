# VSCode and ROS


## Common

* [ROS extension](https://github.com/ms-iot/vscode-ros) `ms-iot.vscode-ros`


## In the workspace

* `${workspaceFolder}/.vscode/settings.json`
    * `python.autoComplete.extraPaths`
        * auto-managed by the ROS extension
        * used by Python autocompletion (IntelliSense)
        * however, ignored by linting tools (such as pylint) (even when they are invoked automatically under the hood by VSCode), see below for solution (.env file)
        * the ROS extension will automatically detect the `devel/setup*` file (for both ROS 1 and ROS 2),
          run it and extract the `PYTHONPATH` from it (and update `python.autoComplete.extraPaths`)
        * **note!** When `PYTHONPATH` changes, **the whole VSCode must be restarted** in order for
          the ROS extension to detect the change. The setup `devel/setup*` file is evaluated only on the ROS extension's
          activation and then the PYTHONPATH is cached (even when using the action _ROS: Update Python Path_).
* `${workspaceFolder}/.env` (can be changed via setting `python.envFile`)
    * respected by tools run by Python extension (e.g. pylint)
    * does not affect terminal
    * see https://code.visualstudio.com/docs/python/environments#_use-of-the-pythonpath-variable
    * so the workaround is to run my `create-dot-env.sh` script that creates `.env` file wit correct `PYTHONPATH`


## Related links

* https://code.visualstudio.com/docs/python/environments#_use-of-the-pythonpath-variable
* https://stackoverflow.com/questions/43574995/visual-studio-code-pylint-unable-to-import-protorpc
* https://github.com/microsoft/vscode-python/issues/2791
