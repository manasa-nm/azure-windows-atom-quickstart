#!/usr/bin/env bash

date=`date +%Y%m%d`

locations=()
locations[1]='centralus'
locations[2]='eastasia'
locations[3]='southeastasia'
locations[4]='centralus'
locations[5]='eastus'
locations[6]='eastus2'
locations[7]='westus'
locations[8]='northcentralus'
locations[9]='southcentralus'
locations[10]='northeurope'
locations[11]='westeurope'
locations[12]='japanwest'
locations[13]='japaneast'
locations[14]='brazilsouth'
locations[15]='australiaeast'
locations[16]='australiasoutheast'
locations[17]='southindia'
locations[18]='centralindia'
locations[19]='centralindia'
locations[20]='canadacentral'
locations[21]='canadaeast'
locations[22]='uksouth'
locations[23]='ukwest'
locations[24]='westcentralus'
locations[25]='westus2'
locations[26]='koreacentral'
locations[27]='koreasouth'
locations[28]='eastus'
locations[29]='eastus'
locations[30]='eastus2'


rm -rf logs
mkdir logs

for test in {1..30}
do
  resourcegroup="test"$date$(printf "%02d" $test)
  #create resource group
  az group create --name $resourcegroup --location ${locations[$test]}

  #run deployment
  parametersfile="test"$(printf "%02d" $test)".parameters.json"
  az group deployment create --name $resourcegroup --resource-group $resourcegroup --template-file ../mainTemplate.json --parameters @$parametersfile

  #capture deployment log
  az group deployment list -g $resourcegroup > logs/$resourcegroup-log.txt

  #delete resource group
  az group delete --name $resourcegroup --yes
done