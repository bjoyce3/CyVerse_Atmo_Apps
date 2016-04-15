#Trinity (https://trinotate.github.io/) and Trinotate (https://trinotate.github.io/) Atmosphere instance installation

#Base images history:
#1) Ubuntu 12 Trinity Trinotate (kapeelc); old versions that are > 1 year out of date
#2) Ubuntu 14.04.02 - Java 8 (aedmonds); however broken after updating, installation of packages, and imaging
#3) Ubuntu 14.04.2 - XFCE (edwins) alias: d559c236-53ef-437a-999e-02ae16c4b5f0 

#Update base image with most recent packages for Ubuntu
apt-get update
apt-get dist-upgrade
apt-get autoremove

#soft reboot to reset image and determine that it is still stable

