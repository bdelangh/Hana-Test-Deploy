#!/bin/bash

echo "Reading config...." >&2
source ./azuredeploy.cfg

echo "installing ascs cluster"
az group deployment create \
--name ASCSSWDeployment \
--resource-group $rgname \
   --template-uri "https://raw.githubusercontent.com/AzureCAT-GSI/Hana-Test-Deploy/master/sap-ascs-cluster/azuredeploy-ascs-sw.json" \
   --parameters \
   VMName1=$ASCSVMNAME1 \
   VMName2=$ASCSVMNAME2 \
   VMUserName=$vmusername \
   VMPassword=$vmpassword \
   customURI="$customuri" \
   StaticIP1=$ASCSIP1 \
   StaticIP2=$ASCSIP2 \
   HANASID=$HANASID \
   ASCSSID=$ASCSSID \
   IQN="$ASCSIQN" \
   IQNClient1="$ASCSIQNCLIENT1" \
   IQNClient2="$ASCSIQNCLIENT2" \
   iSCSIIP=$ISCSIIP \
   ILBIP=$ASCSILBIP \
   NFSILBIP=$NFSILBIP \
   SAPPASSWD="$vmpassword" \
   DBHOST="hanailb" \
   DBIP="$HANAILBIP"

echo "ascs cluster installed"