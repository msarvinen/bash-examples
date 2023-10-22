#!/bin/bash

if [ $1 -gt 32 ]
then
  echo "CIDR mask too long, must be less than 33"
  exit 1
fi

fullipdigits=$(($1/8))
bitstodo=$(($1%8))

#echo "full ip digits: $fullipdigits"
#echo "bits to do: $bitstodo"

#######################
# make "premask" for full digits
case $fullipdigits in
  0)
    maskip=""
    ;;
  1)
    maskip="255"
	;;
  2)
    maskip="255.255"
    ;;
  3)
    maskip="255.255.255"
	;;
  4)
    maskip="255.255.255.255"
	;;
  *)
    maskip="255.255.255.255"
	;;
esac

remainingdigits=$((4-$fullipdigits))
#echo "remaining digits: $remainingdigits"

#######################
# calculate meaningful mask
cumulativemask=0
start=128

for (( n=7; n>$((7-$bitstodo)); n--))
do
  cumulativemask=$(($cumulativemask + 2**$n))
done

if  [ $fullipdigits -gt 0 ] && [ $fullipdigits -lt 4 ]
then
  maskip="$maskip.$cumulativemask"
elif [ $fullipdigits -eq 0 ]
then
  maskip="$cumulativemask"
else
  maskip="$maskip"
fi

##############################
# add remaining zeroes
remainingdigits=$(($remainingdigits-1))
#echo "remaining digits - zeroes: " $remainingdigits
while [ $remainingdigits -gt 0  ]
do
  maskip=$maskip.0
  remainingdigits=$(($remainingdigits-1))
done

##############################
# return the result
echo "ip mask: $maskip"

