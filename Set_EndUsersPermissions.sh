#!/bin/bash
# Oem at oemden dot com
# 20211015
# Give all end-users permissions full access to Print Scan, Network, Time Preference Pane
# borrowed from Original source firstboot script from : 25-LS-Corporate-Config-Script-OSX-10.10DP8_v7 by Daniel Rheiner

version=0.2.2
# NEEDS to be ROOT

security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.datetime allow
security authorizationdb write system.preferences.network allow
security authorizationdb write system.services.systemconfiguration.network allow
security authorizationdb write system.preferences.printing allow
/usr/bin/security authorizationdb write system.print.operator allow
/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin
/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group _lpadmin
/usr/sbin/dseditgroup -o edit -n /Local/Default -a 'Domain Users' -t group lpadmin

exit 0
