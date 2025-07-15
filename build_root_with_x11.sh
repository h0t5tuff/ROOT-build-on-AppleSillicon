#!/bin/bash

set -e

echo "🍺 Installing ROOT build dependencies via Homebrew..."

# Install core tools and libraries
brew install python wget git make xerces-c
brew install cmake ninja pkgconf
brew install xquartz qt libx11
brew install cfitsio davix fftw freetype ftgl gcc giflib gl2ps glew \
             graphviz gsl jpeg-turbo libpng libtiff lz4 mariadb-connector-c \
             nlohmann-json numpy openblas openssl pcre pcre2 python sqlite \
             tbb xrootd xxhash xz zstd

# Update and cleanup
brew update && brew upgrade && brew autoremove && brew cleanup && brew doctor

echo "📂 Setting up paths..."
ROOT_SRC=~/root
ROOT_BUILD=~/root/build
ROOT_INSTALL=~/root-x11

echo "📁 Cloning ROOT source..."
git clone https://github.com/root-project/root.git "$ROOT_SRC"
cd "$ROOT_SRC" || exit 1
git checkout v6-36-00

echo "📂 Creating build directory..."
mkdir -p "$ROOT_BUILD"
cd "$ROOT_BUILD" || exit 1

echo "🧹 Cleaning CMake cache if it exists..."
rm -rf CMakeCache.txt CMakeFiles/

echo "⚙️ Configuring ROOT..."
CFLAGS="-I/usr/local/include"
CXXFLAGS="-I/usr/local/include"
LDFLAGS="-L/usr/local/lib"

env CFLAGS="$CFLAGS" \
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS" \
    arch -x86_64 cmake .. \
      -DCMAKE_INSTALL_PREFIX="$ROOT_INSTALL" \
      -Dx11=ON \
      -Dopengl=ON \
      -Droofit=ON \
      -Dtmva=ON \
      -DCMAKE_CXX_STANDARD=17

echo "🔍 Verifying zstd detection..."
grep ZSTD CMakeCache.txt || echo "⚠️ zstd not detected properly."

echo "🛠️ Building ROOT..."
arch -x86_64 make -j$(sysctl -n hw.logicalcpu)
arch -x86_64 make install

echo "✅ ROOT built and installed at $ROOT_INSTALL"

echo "📦 Adding environment setup to ~/.zshrc..."
cat <<EOF >> ~/.zshrc

# HOMEBREW
eval "\$(/usr/local/bin/brew shellenv)"  

# ROOT X11-enabled build
export ROOTSYS=$ROOT_INSTALL
export PATH="\$ROOTSYS/bin:\$PATH"
export LD_LIBRARY_PATH="\$ROOTSYS/lib:\$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="\$ROOTSYS/lib:\$DYLD_LIBRARY_PATH"
export CMAKE_PREFIX_PATH="\$ROOTSYS:\$CMAKE_PREFIX_PATH"
export CPATH="\$ROOTSYS/include:\$CPATH"
export DISPLAY=:0
EOF

echo "🔁 Reloading shell configuration..."
source ~/.zshrc

echo "🎉 Done! ROOT with X11 GUI support is ready."
