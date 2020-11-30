# shell-command-wrapper
Stores disposable shell commands without permissions to execute and wrappers to use them safely from their own directory on.

## Example usage
```
$ ./chmod-toggle.sh dd-opts.sh linux.iso /dev/dumdsfdss
################
Making dd-opts.sh executable
Attempting to execute ~/Scripts/dd-opts.sh

Running tests on args before executing...
SCRIPT: dd-opts.sh
ARGUMENTS: linux.iso /dev/dumdsfdss

Press enter to run or CTR+C to cancel.
Bad input file linux.iso. You need an iso file that exists.
Bad block device path /dev/dumdsfdss. Use lsblk to find /dev/sdax
Should be executing:
sudo dd if=linux.iso of=/dev/dumdsfdss status=progress bs=1024
NAME                  MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
loop0                   7:0    0  29.9M  1 loop  /snap/snapd/8542
loop1                   7:1    0    55M  1 loop  /snap/core18/1880
loop2                   7:2    0 255.6M  1 loop  /snap/gnome-3-34-1804/36
loop3                   7:3    0  62.1M  1 loop  /snap/gtk-common-themes/1506
loop4                   7:4    0  49.8M  1 loop  /snap/snap-store/467
loop5                   7:5    0    31M  1 loop  /snap/snapd/9721
loop6                   7:6    0  55.4M  1 loop  /snap/core18/1932
loop7                   7:7    0    51M  1 loop  /snap/snap-store/498
loop8                   7:8    0  64.8M  1 loop  /snap/gtk-common-themes/1514
loop9                   7:9    0 217.9M  1 loop  /snap/gnome-3-34-1804/60
mmcblk0               179:0    0  29.1G  0 disk  
├─mmcblk0p1           179:1    0   512M  0 part  /boot/efi
├─mmcblk0p2           179:2    0   732M  0 part  /boot
└─mmcblk0p3           179:3    0  27.9G  0 part  
  └─mmcblk0p3_crypt   253:0    0  27.9G  0 crypt 
    ├─vgubuntu-root   253:1    0  26.9G  0 lvm   /
    └─vgubuntu-swap_1 253:2    0   976M  0 lvm   [SWAP]
mmcblk0boot0          179:8    0     4M  1 disk  
mmcblk0boot1          179:16   0     4M  1 disk  
Press enter to run or CTR+C to cancel.

Uncomment line to actually run,

dd-opts.sh finished running and is no longer executable.
################
```
