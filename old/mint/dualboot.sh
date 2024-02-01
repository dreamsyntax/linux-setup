/etc/default/grub

change
GRUB_DEFAULT=0
to
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true


ONLY IFF EXT4 file system! btrfs has sparse error if you do this
