#!/usr/bin/env bash

# First, install ccache binary in ~/bin/ccache
# ```
# git clone https://github.com/ccache/ccache.git
# cd ccache
# git checkout v4.2 -b 4.2
# build
# cmake -DCMAKE_INSTALL_PREFIX=$HOME -DCMAKE_BUILD_TYPE=Release -DZSTD_FROM_INTERNET=ON ..
# make -j
# make install
# ```

# Check ccache is there.
bin_dr=$HOME/bin
ccache_bin=${bin_dr}/ccache
if [ -e ${ccache_bin} ]; then
    echo "Found: ccache at ${ccache_bin}."
else
    echo "Cannot find ccache at ${ccache_bin}, please build and install manually."
    exit 1
fi

# Create symbolic links.
pushd ${bin_dr}
compilers=(
    c++
    c89-gcc
    c99-gcc
    cc
    g++
    g++-5
    g++-7
    g++-8
    gcc
    gcc-5
    gcc-7
    gcc-8
    x86_64-linux-gnu-g++
    x86_64-linux-gnu-g++-5
    x86_64-linux-gnu-g++-7
    x86_64-linux-gnu-g++-8
    x86_64-linux-gnu-gcc
    x86_64-linux-gnu-gcc-5
    x86_64-linux-gnu-gcc-7
    x86_64-linux-gnu-gcc-8
    clang
    clang-6
    clang-7
    clang-8
    clang-9
    clang-10
    clang++
    clang++-6
    clang++-7
    clang++-8
    clang++-9
    clang++-10
)
for compiler in "${compilers[@]}"; do
    if command -v ${compiler} &>/dev/null; then
        echo "Found: ${compiler}"
        if [ -e ${bin_dr}/${compiler} ]; then
            rm ${bin_dr}/${compiler}
        fi
        echo "ln -s ccache ${bin_dr}/${compiler}"
        ln -s ccache ${bin_dr}/${compiler}
    fi
done
popd
