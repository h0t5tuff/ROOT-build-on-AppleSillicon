
# Instructions

1. amd64 architicture, install homebrew:

   I found that putting <arch -x86_64 > before the official homebrew install command gets the job done ;)

2. move the two scripts in this repo (build_root_with_x11.sh and uninstall_root_x11.sh) to your home directory.

3. open .zshrc file in your home directory and comment out any Root (and any arm architicture Homebrew) related lines.

4. now excute the desired script:

   >chmod +x file_name.sh

5. finally run the desired script:

   >./file_name.sh

6. Discard of this README.md












# Build [Bacon2Data](https://github.com/liebercanis/bacon2Data/tree/runTwo) Example

### Clone
>git clone --branch runTwo https://github.com/liebercanis/bacon2Data.git
>
>cd bacon2Data && git pull
>
### clean the clone up when needed
>git fetch origin && git reset --hard origin/runTwo && git clean -fdx 

### Create symlink
>cd bobj
>
> << on mac arm64>>
>
>: ln -s /opt/homebrew/opt/root/etc/root/Makefile.arch .
>
> << on mac amd64>>
> 
>ln -s /usr/local/opt/root/etc/root/Makefile.arch .
>
> << on linux >>
>
>ln -s /snap/root-framework/current/usr/local/etc/Makefile.arch .

### Build
>
>cd bobj && make clean; make
>
>cd ../compiled && make clean; make

### Create Data Directories
>
> << on mac >>
> 
>cd compiled
>
>mkdir caenData
>
>mkdir rootData  
>
> << on linux >>
> 
>cd compiled
>
>ln -s /mnt/Data2/BaconRun4Data/rootData/ rootData
>
>ln -s /mnt/Data2/BaconRun4Data/caenDataTensor/ caenData
>
>cd bacon2Data
>
>ln -s /mnt/Data2/BaconRun4Data/rootData/ rootData
>
>ln -s /mnt/Data2/BaconRun4Data/caenDataTensor/ caenData

### Run the Excutables in bacon2Data/compiled/

btbSim
>
>btbSim <event number>
>
>root <btbSimq0000-00-00-00-00-1000000.root>
>
>new TBrowser()
>

anacg
>
> << on mac >>
>
>cp <btbSimq0000-00-00-00-00-1000000.root> rootData/
>
>anacg <btbSimq0000-00-00-00-00-1000000.root> 1000000
>
>cd caenData
>
>root <anaCRun-btbSim-0000-00-00-00-00-1000000-0.root>
>
>new TBrowser()
>
> << on linux >>
>
>cd bacon2Data
>
>nohup ./anacDir.py 00_00_0000 >& anacDir00_00_0000.log &
>
>top
>
>cd caenData
>
>root <anaCRun-run-00_00_0000-file_0-0.root>
>
>new TBrowser()
>

postAna
>
><< in gain.C change summary name (line 288) >>






BACONMONITOR
On mac:
 xhost +SI:localuser:root 
On daq (via ssh):
ln -s /home/bacon/BaconMonitor/BaconMonitor2_tensor.py /home/Tensor/BaconMonitor2_tensor.py
sudo visudo
	Tensor ALL=(ALL) NOPASSWD: SETENV: /usr/bin/python3 /home/Tensor/BaconMonitor2_tensor.py







