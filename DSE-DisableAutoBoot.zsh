#!/bin/zsh

# Author: Andrew W. Johnson
# Date: 2021.11.09
# Version: 1.00
# Stony Brook University/DoIT
#
# This script will turn off the AutoBoot feature on Intel Macintosh laptops. 
# When the lid is opened or power connected, the computer automatically 
# powers on and it upsets some users.
#
# Has not been tested on ARM processors.
#
# To turn off AutoBoot: /usr/sbin/nvram AutoBoot=%00
# To turn on AutoBoot: /usr/sbin/nvram AutoBoot=%03

	# Check the status of AutoBoot.
myStatus=$( /usr/sbin/nvram AutoBoot 2>/dev/null | /usr/bin/awk '{print $2}' )

	# If it's not set then set it.
if [[ -z ${myStatus} ]]; then
	/bin/echo "AutoBoot has not been set. Setting..."
	/usr/sbin/nvram AutoBoot=%00
fi

	# If %03 is returned it means that it's on. So turn it off...
	# If %00 is returned than it's off...
if [[ ${myStatus} = "%03" ]]; then
	/bin/echo "AutoBoot is on. Turning off..."
   	/usr/sbin/nvram AutoBoot=%00
elif [[ ${myStatus} = "%00" ]]; then
	/bin/echo "AutoBoot is already off."
    exit 0
fi

	# Check again to see if we had success.
myStatus=$( /usr/sbin/nvram AutoBoot 2>/dev/null | /usr/bin/awk '{print $2}' )
if [[ ${myStatus} = "%00" ]]; then
	/bin/echo "AutoBoot change successful..."
    exit 0
else
	/bin/echo "AutoBoot change unsuccessful..."
	exit 1
fi

exit 0

