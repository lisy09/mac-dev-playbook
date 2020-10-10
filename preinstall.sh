#!/usr/bin/env bash

xcode-select --install
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
python -m pip install --user ansible