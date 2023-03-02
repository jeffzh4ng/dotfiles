#!/bin/sh

################################################################################
# application firewall
################################################################################
# enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# enable logging mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# enable stealth mode (does not respond to ICMP reqs)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# disable auto signing of built-in applications
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off

# disable auto signing of downloaded applications
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# restart process with line hangup signal
sudo pkill -HUP socketfilterfw

echo "enter firmwarepasswd"
sudo firmwarepasswd -setpasswd -setmode -disable-reset-capability command
