#!/bin/bash

export UID=$UID
docker build --build-arg UID -t javachips/android-builder .
