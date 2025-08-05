

1. install homebrew for amd architicture:

   I found that putting <arch -x86_64 > before the official homebrew install command gets the job done ;)
2. move the two scripts in this repo (build_root_with_x11.sh and uninstall_root_x11.sh) to your home directory.
3. open .zshrc file in your home directory and comment out any Root (and any arm architicture Homebrew) related lines.
4. now excute the build/uninstall script:

   >chmod +x file_name.sh
5. finally run the build/uninstall script:

   >./file_name.sh

6. Discard of this README.md



## Build Bacon2Data example

### Build
>git clone --branch runTwo https://github.com/liebercanis/bacon2Data.git
>
>cd bacon2Data/
>
>git pull

Create symlink
>cd bobj

on mac
>
>ln -s /usr/local/Cellar/root/6.36.02/etc/root/Makefile.arch .

on linux
>
>ln -s /snap/root-framework/current/usr/local/etc/Makefile.arch .

Make it
>
>cd bobj && make clean; make
>
>cd ../compiled && make clean; make

### Data Directories
on mac
>cd compiled
>
>mkdir caenData
>
>mkdir rootData  

on linux
>cd compiled
>
>ln -s /mnt/Data2/BaconRun4Data/rootData/ rootData
>
>ln -s /mnt/Data2/BaconRun4Data/caenDataTensor/ caenData

>cd bacon2Data
>
>ln -s /mnt/Data2/BaconRun4Data/rootData/ rootData
>
>ln -s /mnt/Data2/BaconRun4Data/caenDataTensor/ caenData

