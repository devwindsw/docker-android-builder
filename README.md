# Dockerfile for Android Open Source Project

Dockerfile for android open source project

## Running

### 1. Create a directory for Android
```
mkdir aosp
```

### 2. Download Android aosp

### 3. Start a container
```
docker run --privileged -it -v /path/to/aosp/you/created:/aosp --memory=16g --rm android-builder
```
