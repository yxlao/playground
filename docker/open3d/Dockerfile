FROM ubuntu:18.04

# Setup CMake repo
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg \
    software-properties-common \
    wget

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null

RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'

# Build system deps
RUN apt-get update && apt-get install -y \
    cmake \
    git \
    g++

# Open3D default deps
# ./util/install_deps_ubuntu.sh
RUN apt-get update && apt-get install -y \
    xorg-dev \
    libglu1-mesa-dev \
    python3-dev \
    libsdl2-dev \
    libc++-7-dev \
    libc++abi-7-dev \
    ninja-build \
    libxi-dev \
    libtbb-dev \
    libosmesa6-dev

# uild Open3D
RUN git clone --recursive https://github.com/intel-isl/Open3D.git
WORKDIR Open3D
RUN ls -alh
RUN git --no-pager log --name-status HEAD^..HEAD

# Open3D standard deps
RUN cmake \
    -DBUILD_BENCHMARKS=ON \
    -DBUILD_FILAMENT_FROM_SOURCE=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_GUI=ON \
    -DBUILD_TENSORFLOW_OPS=OFF \
    -DBUILD_PYTORCH_OPS=OFF \
    -DBUILD_CUDA_MODULE=OFF \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DBUILD_UNIT_TESTS=ON \
    -DCMAKE_INSTALL_PREFIX=~/open3d_install ..
