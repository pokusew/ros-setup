#!/usr/bin/env bash

ssh -L localhost:8730:127.0.0.1:873 -o ExitOnForwardFailure=yes -N nvidia@tx2-ros2
