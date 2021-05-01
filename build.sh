#!/bin/bash

export UID=$UID
docker build --build-arg UID -t android-builder .
