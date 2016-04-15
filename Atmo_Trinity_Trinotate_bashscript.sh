###Trinity (https://trinotate.github.io/) and Trinotate (https://trinotate.github.io/) Atmosphere instance installation

###Base images history:
#1) Ubuntu 12 Trinity Trinotate (kapeelc); old versions that are > 1 year out of date
#2) Ubuntu 14.04.02 - Java 8 (aedmonds); however broken after updating, installation of packages, and imaging
#3) Ubuntu 14.04.2 - XFCE (edwins) alias: d559c236-53ef-437a-999e-02ae16c4b5f0 

###Update base image with most recent packages for Ubuntu####
apt-get update
apt-get dist-upgrade
apt-get autoremove

#######soft reboot to reset image and determine that it is still stable##########

###Set up directory on root for imaging downstream###
cd /
sudo mkdir tools

###Start installation of packages needed for analyses###

#Trinity package

#Trinoate package
wget "https://github.com/Trinotate/Trinotate/archive/v3.0.0.tar.gz" &
tar -xvzf v3.0.0.tar.gz 

#Transdecoder
wget "https://github.com/TransDecoder/TransDecoder/archive/v2.1.0.tar.gz" &
tar -xvzf v2.1.0.tar.gz

#Install latest BLAST+ from NCBI
wget "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz" &
tar -xvzf ncbi-blast-2.3.0+-x64-linux.tar.gz

#Install hmmer
wget "http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-linux-intel-x86_64.tar.gz" &
tar -xvzf hmmer-3.1b2-linux-intel-x86_64.tar.gz 
cd hmmer-3.1b2-linux-intel-x86_64/
./configure
make
make check
cd ..

#Install tmmhmm

tar -xvzf tmhmm-2.0c.Linux.tar.gz

###Install rnammer###

#Requires a different version of tmhmm than above
sudo mkdir rnammer-1.2
wget "http://eddylab.org/software/hmmer/2.3.2/hmmer-2.3.2.tar.gz" &
tar -xvzf hmmer-2.3.2.tar.gz
#Rename this version to t


#Install SQLite 3.12 package for use in creating annotate database
wget "http://sqlite.org/2016/sqlite-autoconf-3120000.tar.gz" &
tar -xvzf sqlite-autoconf-3120000.tar.gz
cd sqlite-autoconf-3120000/
./configure --prefix=/usr --disable-static
make -j1
sudo make install
cd ..


#Install the boilerplate Trinotate SQLite database
wget "https://data.broadinstitute.org/Trinity/Trinotate_v3_RESOURCES/Trinotate_v3.sqlite.gz" -O Trinotate.sqlite.gz
gunzip Trinotate.sqlite.gz


###Install iCommands for moving data###

#complete install with autocomplete and all the bells and whistles
wget "https://pods.iplantcollaborative.org/wiki/download/attachments/6720192/i-commands-auto.bash?version=1&modificationDate=1320265052000&api=v2"
mv i-commands-auto.bash\?version\=1 .i-commands-auto.bash
source .i-commands-auto.bash


#Set PATHs for each of the packages to the Desktop tools folder 
#The tools folder will be moved to the Desktop to work with the Swissprot and PFAM databases because these are too large to fit on the root
export PATH=$PATH:~/Desktop/tools