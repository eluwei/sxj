<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1416821219372" ID="ID_549895243" MODIFIED="1416822152931" TEXT="mysql-&#x4e3b;&#x4ece;">
<node CREATED="1416821383117" ID="ID_108266319" MODIFIED="1416821394699" POSITION="right" TEXT="master&#x914d;&#x7f6e;">
<node CREATED="1416821397344" ID="ID_234832930" MODIFIED="1416821484144" TEXT="&#x4fee;&#x6539;my.cnf">
<node CREATED="1416821487940" ID="ID_1056048945" MODIFIED="1416821646270">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      #master&#30340;&#26631;&#35782;
    </p>
    <p>
      server-id=12
    </p>
    <p>
      #slave&#20250;&#22522;&#20110;&#27492;log-bin&#26469;&#20570;replication
    </p>
    <p>
      log-bin=mysql-bin
    </p>
    <p>
      #&#29992;&#20110;master-slave&#30340;&#20855;&#20307;&#25968;&#25454;&#24211;
    </p>
    <p>
      binlog-do-db = sxj-supervisor
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1416821708600" ID="ID_425814670" MODIFIED="1416821718189" TEXT="&#x6dfb;&#x52a0;master&#x540c;&#x6b65;&#x7528;&#x6237;">
<node CREATED="1416821720927" ID="ID_871005544" MODIFIED="1416821781154" TEXT="GRANT REPLICATION SLAVE ON *.* TO username@slaveIP IDENTIFIED BY &apos;passwrod&apos;;"/>
</node>
<node CREATED="1416821793835" ID="ID_1180472078" MODIFIED="1416821855106" TEXT="&#x91cd;&#x542f;master">
<node CREATED="1416821801113" ID="ID_505684804" MODIFIED="1416821843925" TEXT="service mysqld restart"/>
</node>
<node CREATED="1416822206615" ID="ID_1210748765" MODIFIED="1416822220971" TEXT="&#x67e5;&#x770b;master&#x72b6;&#x6001;">
<node CREATED="1416822223306" ID="ID_1310497625" MODIFIED="1416822240195" TEXT="show master status;"/>
</node>
</node>
<node CREATED="1416821400225" ID="ID_749495201" MODIFIED="1416821421684" POSITION="right" TEXT="slave&#x914d;&#x7f6e;">
<node CREATED="1416821595081" ID="ID_861496019" MODIFIED="1416821603081" TEXT="&#x4fee;&#x6539;my.cnf">
<node CREATED="1416821607763" ID="ID_151160823" MODIFIED="1416821639372">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      #slave&#30340;&#26631;&#35782;
    </p>
    <p>
      server-id=9
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1416821884963" ID="ID_999209399" MODIFIED="1416822176284" TEXT="&#x6267;&#x884c;&#x4e0e;master&#x7684;&#x8fde;&#x63a5;">
<node CREATED="1416821963139" ID="ID_1432960344" MODIFIED="1416822421402" TEXT="CHANGE MASTER TO &#xa;MASTER_HOST=&apos;masterIP&apos;, //master&#x5730;&#x5740;&#xa;MASTER_PORT=3306,//master&#x7aef;&#x53e3;&#xa;MASTER_USER=&apos;username&apos;, //master&#x8bbe;&#x7f6e;&#x7684;&#x540c;&#x6b65;&#x7528;&#x6237;&#xa;MASTER_PASSWORD=&apos;password&apos;,//&#x5bc6;&#x7801;&#xa;MASTER_LOG_FILE=&apos;mysql-bin.000006&apos;,//&#x5f53;&#x524d;master&#x65e5;&#x5fd7;&#x6587;&#x4ef6;&#xa;MASTER_LOG_POS=1303914;//&#x5f53;&#x524d;&#x65e5;&#x5fd7;&#x6267;&#x884c;&#x4f4d;&#x7f6e;"/>
</node>
<node CREATED="1416822103758" ID="ID_188740379" MODIFIED="1416822117570" TEXT="&#x542f;&#x52a8;slave">
<node CREATED="1416822129468" ID="ID_784951598" MODIFIED="1416822131481" TEXT="start slave;"/>
</node>
<node CREATED="1416822244783" ID="ID_1236842899" MODIFIED="1416822253478" TEXT="&#x67e5;&#x770b;slave&#x72b6;&#x6001;">
<node CREATED="1416822257731" ID="ID_814583140" MODIFIED="1416822273153" TEXT="show slave status;"/>
</node>
<node CREATED="1416822443940" ID="ID_1896569744" MODIFIED="1416822452549" TEXT="&#x505c;&#x6b62;slave">
<node CREATED="1416822456607" ID="ID_123340203" MODIFIED="1416822470413" TEXT="stop slave"/>
</node>
</node>
</node>
</map>
