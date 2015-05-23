#!/bin/sh
WARNINGFILE="/tmp/aktrace.txt"
SC=0
if [ -e $WARNINGFILE ] ; then
	SC=`grep Successful $WARNINGFILE | wc -l`
fi
if ! [ -e $WARNINGFILE ] ; then
	/usr/sbin/sendmail baker@miyabiit.com -t <<EOS
From: aktrace@miyabiit.com
Subject: [AKTRACE] ARMS STOP
No mail arrived. Please check ARMS.
EOS
elif ! [ $SC -ge 4 ] ; then
	/usr/sbin/sendmail baker@miyabiit.com -t <<EOS
From: aktrace@miyabiit.com
Subject: [AKTRACE] ARMS WARNING
Please check ARMS.
EOS
else
	sudo /bin/rm /tmp/aktrace.txt
fi
