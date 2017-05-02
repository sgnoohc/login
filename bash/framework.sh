#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign


# === framework === #

#--- setting up current working directory path
function _savexd() {
  echo 'export CURRENTXD='$(pwd) > ~/.currentxd
}

##--- setting up current working directory path
#function _xd() {
#  source ~/.currentxd
#  cd $CURRENTXD
#}

function _setupBREW() {
  # homebrew related
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export PATH="/home/users/phchang/.linuxbrew/bin:$PATH"
  export MANPATH="/home/users/phchang/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/users/phchang/.linuxbrew/share/info:$INFOPATH"
  export PATH="/home/users/phchang/.linuxbrew/sbin:$PATH"

}

function _setupSCRAM() {
  source /code/osgcode/cmssoft/cmsset_default.sh  > /dev/null 2>&1
  export SCRAM_ARCH=slc6_amd64_gcc530   # or whatever scram_arch you need for your desired CMSSW release
}

function _newsetupCMS() {
  source /code/osgcode/cmssoft/cmsset_default.sh  > /dev/null 2>&1
  export SCRAM_ARCH=slc6_amd64_gcc530   # or whatever scram_arch you need for your desired CMSSW release
  cd /home/users/phchang/cmssw
}

function _setupCMS() {
  source /code/osgcode/cmssoft/cmsset_default.sh  > /dev/null 2>&1
  export SCRAM_ARCH=slc6_amd64_gcc530   # or whatever scram_arch you need for your desired CMSSW release
  cd /home/users/phchang/cmssw/CMSSW_8_0_18/
  alias cmsenv='eval `scramv1 runtime -sh`'
  eval `scramv1 runtime -sh`
  cd -
}

#--- setup AtlasLocalRootBase on lx0.hep.uiuc.edu: (only works on lx0! use setupMT3SW for other nodes)
function _setupATLAS() {
  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
  #source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh --
}

#--- Athena setup with out cvmfs on lxplus
function _setupASETUP() {
  export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
  alias asetup='source $AtlasSetup/scripts/asetup.sh'
}

#--- Vanilla CxAODFramework
function _xc() {
  cd /home/atlas/pcchang2/physics/framework/CxAODFrameworkTrunk_v2
  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
  source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
  source ./FrameworkSub/bootstrap/setup-trunk.sh
}

#--- Vanilla CxAODFramework grid production
function _xg() {
  cd /home/atlas/pcchang2/physics/framework/CxAODFrameworkTrunk_v2
  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
  source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
  source FrameworkExe/scripts/setup_grid.txt
}

#--- go to ExoMaker
function _xm() {
  cd /home/atlas/pcchang2/physics/framework/ExoMakerTag-00-06-02
  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
  source ExoBootstrap/setup-exo.sh
  export PATH="$PWD/ExoTools/scripts:$PATH"
}

#--- go to ExoMaker
function _xq() {
  cd /home/atlas/pcchang2/physics/framework/ExoQAna
  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
  source ExoBootstrap/setup-exo.sh
  export PATH="$PWD/ExoTools/scripts:$PATH"
}

#--- go to ExoMaker grid submission
function _xmg() {
  cd /afs/cern.ch/user/p/phchang/scratch/bbxx/public/ExoMakerTag
  source ExoTools/scripts/setup_grid.sh
}

#--- go to ExoReader
function _xr() {
  cd /home/atlas/pcchang2/physics/framework/ExoReaderTrunk_v2
  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
  source ExoBootstrap/setup-exo.sh
  export PATH="$PWD/ExoTools/scripts:$PATH"
}

#--- go to ExoMaker grid submission
function _xrg() {
  cd /afs/cern.ch/user/p/phchang/scratch/bbxx/public/ExoMakerTag
  source ExoTools/scripts/setup_grid.sh
}

#--- download rucio datasets based on wildcards
function _ruciodownload() {
  DSLIST=$(rucio list-dids $1 | sort -g | grep $2 | awk '{print $2}')
  #echo $DSLIST
  for DSNAME in $DSLIST; do
    IFS=':' read -ra DSNAMEARRAY <<< "$DSNAME"
    DS=${DSNAMEARRAY[1]}
    rucio download --ndownloader 5 ${DS} > ${DS}_rucio.out
  done
}

#--- obtain the size information based on wildcards
function _ruciogetsize() {
  DSLIST=$(rucio list-dids $1 | sort -g | grep $2 | awk '{print $2}')
  #echo $DSLIST
  for DSNAME in $DSLIST; do
    IFS=':' read -ra DSNAMEARRAY <<< "$DSNAME"
    DS=${DSNAMEARRAY[1]}
    SIZE=$(rucio list-files ${DS} | grep "Total size" | awk '{print $4}')
    echo $SIZE
  done
}



#--- Deprecated
##--- setup mvashared
#function _mvashared() {
#  source /afs/cern.ch/user/p/phchang/physics/hsg3/HWWMVAShared/mvashared/bin/thismvashared.sh --setupROOT
#}
#
##--- setup HWWANAPackage
#function _hwwana() {
#  cd /afs/cern.ch/user/p/phchang/physics/hsg3/HWWAnalysisCode/analysis/HWWlvlv_2012
#  source setupROOT.sh
#}
#
##--- setup HWWANAPackage
#function _ftksim() {
#  cd /afs/cern.ch/user/p/phchang/trigger/ftk
#  . ftksetup.sh
#}
#
##--- setup HWWANAPackage
#function _mymacro() {
##	  ln -s $HOME/login/mymacros/functions.C
#  ln -s $HOME/login/macros/root_util.h .
#}


##--- go to ExoMaker
#function _xm() {
#  cd /home/atlas/pcchang2/physics/framework/ExoMakerTag
#  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
#  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
#  source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
#  source rcSetup.sh
#  export PATH="$PWD/ExoTools/scripts:$PATH"
#  kinit phchang@CERN.CH
#}
#
##--- go to ExoMaker grid submission
#function _xg() {
#  cd /home/atlas/pcchang2/physics/framework/ExoMakerTag
#  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
#  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
#  source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
#  setupATLAS
#  source ExoTools/scripts/setup_grid.sh
#  export PATH="$PWD/ExoTools/scripts:$PATH"
#}
#
##--- go to ExoReader
#function _xr() {
#  cd /home/atlas/pcchang2/physics/framework/ExoReaderTag
#  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
#  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
#  source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
#  source rcSetup.sh
#  export PATH="$PWD/ExoTools/scripts:$PATH"
#  kinit phchang@CERN.CH
#}
#
##--- setup panda
#function _xpanda() {
#  cd /home/atlas/pcchang2/physics/framework/ExoReaderTag
#  export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
#  alias setupATLAS="source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh"
#  source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
#  lsetup panda
#  lsetup emi
#  voms-proxy-init voms atlas
#}
##--- setup ROOT for local MBA
#if [ "${THISOS}" == "Mac" ]; then
#  function _setupROOT(){
#     source /Applications/root_v5.34.28/bin/thisroot.sh
#  }
#fi


#eof