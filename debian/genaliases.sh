#!/usr/bin/env bash

rm debian/rtw88-dkms.modaliases

for moduleFile in *.ko; do
  moduleName=$(basename -s .ko $moduleFile)
  modinfo $moduleFile | perl -nae "print \"alias \$1 $moduleName\n\" if /^alias:\s+(.*)$/" >> debian/rtw88-dkms.modaliases
done
