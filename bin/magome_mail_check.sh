#!/bin/sh
WARNINGFILE="/tmp/magome-mail.txt"
HEARTBEATFILE="/tmp/magome-mail-heartbeat.txt"
SC=0
if [ -e $WARNINGFILE ] ; then
	SC=`grep test $WARNINGFILE | wc -l`
fi
if ! [ -e $WARNINGFILE ] ; then
	/usr/sbin/sendmail baker@miyabiit.com -t <<EOS
From: magome-mail@miyabiit.com
Subject: [MAGOME-MAIL] Mail Server STOP
No mail arrived. Please check Magome Mail Server.
EOS
elif ! [ $SC -ge 1 ] ; then
	/usr/sbin/sendmail baker@miyabiit.com -t <<EOS
From: magome-mail@miyabiit.com
Subject: [MAGOME-MAIL] Mail Server WARNING
Please check Magome Mail Server.
EOS
else
	echo `date +%s` >> $HEARTBEATFILE
	tail -100 $HEARTBEATFILE > $HEARTBEATFILE.bak
	mv -f $HEARTBEATFILE.bak $HEARTBEATFILE
	sudo /bin/rm $WARNINGFILE
fi
/usr/sbin/sendmail tomo.ya@mentor-ss.co.jp -t <<EOS
From: magome-mail@miyabiit.com
Subject: Check Mail
This is test and check mail.
EOS
