#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

#download test data
mkdir testDir

wget https://github.com/jianlianggao/container-nmrML2BATMAN/blob/master/test_data/mesa_bruker_nmrml_conv_local.zip?raw=true -O ./testDir/mesa_bruker_nmrml_conv_local.zip

nmrML2batman.R -i ./testDir

temp="NMRdata_from_nmrML.txt"

if [ ! -f "$temp" ]; then
    echo "NMRdata_from_nmrML.txt not found!"
    exit 1
else
    echo "Succeeded!"
fi

