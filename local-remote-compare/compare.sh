#!/bin/bash

LOCALFOLDER=$1
REMOTEHOST=$2
REMOTEFOLDER=$3

declare -A localfilesums
declare -A remotefilesums

# check local files and calculate sha256sums for them
pushd $LOCALFOLDER > /dev/null
# only files, no folders
localfiles=`ls -p | grep -v /`
# construct dictionary
for file in $localfiles
do
  localfilesums[$file]=`sha256sum $file | cut -d " " -f 1`
done
popd > /dev/null

# Fetch the remote site data
CMD="cd $REMOTEFOLDER; ls -p | grep -v / | xargs -i sha256sum {} | xargs -i echo {}"
remotefiles=`ssh $REMOTEHOST "bash -c '$CMD'"`

# parse remote filenames & checksums in arrays
indicator=1
rfiles=()
rchksums=()
rdata=`echo "$remotefiles" | awk '{ print $2,$1 }'`
for line in $rdata
do
  if [[ $indicator -eq 1 ]]
  then
    rfiles+=( $line )
    indicator=2
  elif [[ $indicator -eq 2 ]]
  then
    rchksums+=( $line )
    indicator=1
  else
    indicator=0
  fi
done

# combine remote filenames & checksumt into dictionary
lcounter=0
for line in ${rfiles[@]}
do
  remotefilesums[$line]=${rchksums[$lcounter]}
  ((lcounter=lcounter+1))
done

# compare & print
echo "local-file: in-remote is-same"
founder=0
for lfile in ${localfiles[@]}
do
  echo -n "$lfile: "
  for rfile in ${rfiles[@]}
  do
    if [ $lfile = $rfile ]
    then
      echo -n "true "
      founder=1
      if [ ${localfilesums[$lfile]} = ${remotefilesums[$lfile]} ]
      then
        echo -n "true"
      else
        echo -n "false"
      fi
      break
    fi
  done
  if [ $founder -eq 1 ]
  then
    echo
  else
    echo "false"
  fi
  founder=0
done
