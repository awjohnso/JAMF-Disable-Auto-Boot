# JAMF Disable Auto Boot
 Jamf Script to disable Auto Boot on Laptops

- Author: Andrew W. Johnson
- Date: 2021.11.09
- Version: 1.00
- Organization: Stony Brook University/DoIT
---
This Jamf script will turn off the AutoBoot feature on Intel Macintosh laptops.

When the lid is opened or power connected, the computer automatically powers on and it upsets some users.

This has **NOT** been tested on ARM processors.

- To turn off AutoBoot: /usr/sbin/nvram AutoBoot=%00
- To turn on AutoBoot: /usr/sbin/nvram AutoBoot=%03