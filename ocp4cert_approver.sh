#!/bin/bash
# This script will look for and approve any OpenShift4 certificates that
# are in 'pending' state

OC=/usr/local/bin/oc
KUBECONFIG=/home/quickcluster/oc4/auth/kubeconfig

echo "---- START $0" `date`
for i in `$OC get csr --kubeconfig $KUBECONFIG |grep Pending |awk '{print $1}'`;
do
   echo "- Executing:  $ oc adm certificate approve $i --kubeconfig $KUBECONFIG"
   $OC adm certificate approve $i --kubeconfig $KUBECONFIG;
   echo "- RC Code  :  $?"
done
echo "----  END  $0" `date`

