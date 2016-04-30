###ABySS and transABySS on Jetstream

###Base images history:
#1) 

###Update base image with most recent packages for Ubuntu####
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get install unzip
sudo apt-get install python-pip
sudo apt-get install libxml2-dev
sudo apt-get install python-dev
sudo apt-get install libcurl4-gnutls-dev
sudo apt-get install libpng-dev

#######soft reboot to reset image and determine that it is still stable##########

###Set up directory on root for imaging downstream###
cd /
sudo mkdir bioninformatic_tools

###Start installation of packages needed for analyses###

###ABySS###
sudo wget ""
cd 
sudo ./configure
sudo make

##Dependencies
# [Boost](http://www.boost.org)
sudo wget http://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.bz2
sudo tar jxf boost_1_55_0.tar.bz2

# [sparsehash]
sudo wget http://code.google.com/p/sparsehash

# [Open MPI]
cd ..
sudo wget https://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.2.tar.gz
sudo tar -xvzf openmpi-1.10.2.tar.gz
sudo apt-get install libtool
cd openmpi-1.10.2
sudo ./autogen.sh
cd ..
cd bioninformatic_tools

# [GCC]
sudo wget http://gcc.gnu.org

#Run test data
sudo wget http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/1.3.4/test-data.tar.gz
sudo tar xzvf test-data.tar.gz
sudo abyss-pe k=25 name=test in='test-data/reads1.fastq test-data/reads2.fastq'

###transABySS###
sudo pip install python-igraph
sudo pip install pysam
sudo pip install biopython

#BLAT
sudo wget https://users.soe.ucsc.edu/~kent/src/blatSrc35.zip
sudo unzip blatSrc35.zip
cd blatSrc
MACHTYPE=x86_64
export MACHTYPE

#Bowtie1 needed for Trinity Chrys assembly
sudo wget http://downloads.sourceforge.net/project/bowtie-bio/bowtie/1.1.2/bowtie-1.1.2-linux-x86_64.zip

#[Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
sudo wget http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip
sudo unzip bowtie2-2.2.9-linux-x86_64


  * [GMAP/GSNAP](http://research-pub.gene.com/gmap/)
#Samtools 
sudo wget https://github.com/samtools/samtools/releases/download/1.3/samtools-1.3.tar.bz2
sudo wget https://github.com/samtools/bcftools/releases/download/1.3/bcftools-1.3.tar.bz2
sudo wget https://github.com/samtools/htslib/releases/download/1.3/htslib-1.3.tar.bz2
sudo tar jxf samtools-1.3.tar.bz2 
sudo tar jxf htslib-1.3.tar.bz2
sudo tar jxf bcftools-1.3.tar.bz2
cd htslib-1.3
sudo ./configure
sudo make
cd ..
cd samtools-1.3
sudo make
cd ..
cd bcftools-1.3
sudo make



#Set PATH
export PATH=$PATH:/usr/local/bin/icommands
export PATH=$PATH:/bioinformatic_tools/trinityrnaseq-2.2.0/
export PATH=/bin/x86_64::$PATH

export PATH=/bioninformatic_tools/samtools-1.3/$PATH
export PATH=/bioninformatic_tools/htslib-1.3/$PATH
export PATH=/bioninformatic_tools/bcftools-1.3/$PATH
