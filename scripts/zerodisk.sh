#!/bin/bash
# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M || true
sync
rm -f /EMPTY
sync
exit
