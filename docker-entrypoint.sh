#!/bin/sh

set -e

#terraforming $2 --assume $1 $3 $4 $5 $6 $7 $8 $9

if [ "$1" == "help" ]
then
  terraforming
elif [ "$1" == "all" ]
then
  terraforming alb >alb.tf
  terraforming cwa >cwa.tf

  terraforming dbpg >dbpg.tf
  terraforming dbsg >dbsg.tf

  #sometimes have gotten error on unknown referenced subnet for this
  terraforming dbsn >dbsn.tf

  terraforming ec2 >ec2.tf
  terraforming ecc >ecc.tf
  terraforming ecsn >ecsn.tf
  terraforming efs >efs.tf
  terraforming eip >eip.tf
  terraforming elb >elb.tf

  terraforming iamg >iamg.tf
  terraforming iamgm >iamgm.tf
  terraforming iamgp >iamgp.tf

  #currently getting error during below
  #terraforming iamip >iamip.tf

  terraforming iamp >iamp.tf
  terraforming iampa >iampa.tf
  terraforming iamr >iamr.tf
  terraforming iamrp >iamrp.tf
  terraforming iamu >iamu.tf
  terraforming iamup >iamup.tf

  terraforming igw >igw.tf
  terraforming kmsa >kmsa.tf
  terraforming kmsk >kmsk.tf
  terraforming lc >lc.tf
  terraforming nacl >nacl.tf
  terraforming nat >nat.tf
  terraforming nif >nif.tf
  terraforming r53r >r53r.tf
  terraforming r53z >r53z.tf
  terraforming rds >rds.tf
  terraforming rs >rs.tf
  terraforming rt >rt.tf
  terraforming rta >rta.tf
  terraforming s3 >s3.tf
  terraforming sg >sg.tf
  terraforming sn >sn.tf
  terraforming snss >snss.tf
  terraforming snst >snst.tf
  terraforming sqs >sqs.tf
  terraforming vgw >vgw.tf
  terraforming vpc >vpc.tf
else
  terraforming $1 >$1.tf
fi
