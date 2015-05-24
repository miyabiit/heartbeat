# heartbeat
alive log visualize by p5.js

### release

```
(サーバで)
su -
cddir /var/www/html/site/
mkdir heartbeat
chmod 777 heartbeat
(ここで localから)
$ scp index.html sketch.js xxxxx:/var/www/html/site/heartbeat/
(サーバで)
chown -R apache:apache heartbeat
mkdir heartbeat/log
ln -s /tmp/magome-mail-heartbeat.txt heartbeat/log/
chmod -R 755 heartbeat
```

### heartbeatデータに関するドキュメント

* magome-mail-heartbeat.md を参照のこと
