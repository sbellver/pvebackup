#!/bin/bash
currentdir=$(dirname $0)
echo "Host node server backup script (c) Pedro Amador 2011-2014"
# Determine backup period
period=''
if [ `date +%e` == 1 ]
then
  period='monthly'
elif [ `date +%u` == 0 ]
then
  period='weekly'
else
  period='daily'
fi
# Get exclude list
exclude=`head -n1 $currentdir/$period.exclude`

# Exec backup script
$currentdir/_backup_period.sh $period $exclude

# Do other things
$currentdir/post_script.sh