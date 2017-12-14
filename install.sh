#!/bin/bash
set -eu

prefix="$HOME"

if [ "${PREFIX:-}" != "" ] ; then
  prefix=${PREFIX:-}
elif [ "${BOXEN_HOME:-}" != "" ] ; then
  prefix=${BOXEN_HOME:-}
fi

rm -rf $prefix/geth-pbft
mkdir -p $prefix/geth-pbft

for i in `ls -l |awk 'NR>1 {print $NF}' `
do
  for FILE in `echo $i | awk  '/yaml$/{print $i}'`
    do
       mv $i  "$prefix/geth-pbft"
    done
done

mv $HOME/geth-pbft $HOME/.geth-pbft
rm -rf rm -rf $prefix/geth-pbft

prefix2="/usr/local"

if [ "${PREFIX:-}" != "" ] ; then
  prefix2=${PREFIX:-}
elif [ "${BOXEN_HOME:-}" != "" ] ; then
  prefix2=${BOXEN_HOME:-}
fi

rm -rf $prefix2/geth-pbft
mkdir -p $prefix2/geth-pbft

pushd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null

  install bootnode "$prefix2/geth-pbft"
  install puppeth "$prefix2/geth-pbft"
  install geth "$prefix2/geth-pbft"
  
popd > /dev/null
