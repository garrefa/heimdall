#!/usr/bin/env bash

PACKAGE_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
swift run --package-path $PACKAGE_PATH HeimdallParser $@
