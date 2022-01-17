#  Set End Users Permissions via munki

Simple snippet to apply some System preferences.

> *borrowed from firstboot script from : 25-LS-Corporate-Config-Script-OSX-10.10DP8_v7 by Daniel Rheiner.*

Use as a .pkg postinstall script or nopkg in munki.

## Set End Users Permissions script

`Check_EndUsersPermissions.sh` script allowing any user to change add Wifi Network, add printers - typically home wifi and printers - or change the Date & date if needed. ## munki installCheck_script

`Set_EndUsersPermissions.sh` is a munki install_check script. Sometimes settings are not applied. This will check each setting and if one isn't set it will be runned again.### munkinopkg.pkginfo`EndUsersPreferencesPermissions.nopkg.pkginfo` is a ready to use muniki .nopkg