#!/bin/bash
# Oem at oemden dot com
# 20211129
# Give all end-users permissions full access to Print Scan, Network, Time Preference Pane
# MUNKI Install Check Script
# exit 0 NOT INSTALLED - aka run the script or reinstall
# exit 1 OK - don't install
version=0.2.2
# NEEDS to be ROOT

user_permissions=( "system.preferences" "system.preferences.datetime" "system.preferences.0datetime" "system.preferences.network" "system.services.systemconfiguration.network" "system.preferences.printing" "system.print.operator" )

function READ_enduser_permissions () {
 ##${1} is the Preference checked.
 /usr/bin/security authorizationdb read "${1}" > /tmp/"${1}".plist 2>&1
 defaults read /tmp/"${1}".plist rule | grep allow | sed 's/ //g' ; rm -f /tmp/"${1}".plist
}

function CHECK_enduser_permissions () {
 ##${1} is the Preference checked.
 USER_Permission=$(READ_enduser_permissions "${1}" )

 if [[ "${USER_Permission}" != "allow" ]] ; then
  echo "permission ${1} not set"
  Set_Permission=1
 fi
}

for enduser_permission in ${user_permissions[@]} ; do
 echo
 CHECK_enduser_permissions "${enduser_permission}"
 #echo "Set_Permission: ${Set_Permission} "
done

echo "Set_Permission: ${Set_Permission}"

if [[ "${Set_Permission}" -eq "1" ]] ; then
 exit 0
else
 exit 1
fi
