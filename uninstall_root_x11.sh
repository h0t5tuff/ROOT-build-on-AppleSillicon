#!/bin/bash

set -e

echo "🗑️ Removing ROOT source and install directories..."
rm -rf ~/root ~/root-x11

echo "🧹 Removing ROOT X11 environment lines from ~/.zshrc..."
sed -i '' '/^# ROOT X11-enabled build$/d' ~/.zshrc
sed -i '' '/^export ROOTSYS=/d' ~/.zshrc
sed -i '' '/^export PATH=\\$ROOTSYS\/bin:\$PATH$/d' ~/.zshrc
sed -i '' '/^export LD_LIBRARY_PATH=\\$ROOTSYS\/lib:\$LD_LIBRARY_PATH$/d' ~/.zshrc
sed -i '' '/^export DYLD_LIBRARY_PATH=\\$ROOTSYS\/lib:\$DYLD_LIBRARY_PATH$/d' ~/.zshrc
sed -i '' '/^export CMAKE_PREFIX_PATH=\\$ROOTSYS:\$CMAKE_PREFIX_PATH$/d' ~/.zshrc
sed -i '' '/^export CPATH=\\$ROOTSYS\/include:\$CPATH$/d' ~/.zshrc
sed -i '' '/^export DISPLAY=:0$/d' ~/.zshrc

echo "🔁 Reloading ~/.zshrc..."
source ~/.zshrc

echo "✅ ROOT environment removed."
