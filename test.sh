#!/bin/zsh

set -e

cd test
./test_files_existence.sh all
./test_download_dir.sh
./test_git_setting.sh
./test_kernel_version.sh
