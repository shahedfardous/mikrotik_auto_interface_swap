/system scheduler
add interval=1h name=auto_interface_swap on-event="# Name: Mikrotik Auto Interface Swap or Di\
    sable or Shutdown Script\r\
    \n# Description: Enable or disable the selected interfaces on a schedule.\
    \r\
    \n# Author: Samy \A9 2021\r\
    \n# License: GPL-3.0 License\r\
    \n# Verified: RouterBOARD CCR 1036\r\
    \n\r\
    \n:local ifNameFirst ether2;\r\
    \n:local ifNameSecond ether3;\r\
    \n:local ifStatusFirst [/interface get \$ifNameFirst disabled];\r\
    \n:local ifStatusSecond [/interface get \$ifNameSecond disabled];\r\
    \n:log warning \"\$ifStatusFirst\";\r\
    \n:log warning \"\$ifStatusSecond\";\r\
    \ndelay 1s;\r\
    \n\r\
    \n:if  (\$ifStatusFirst) do={\r\
    \n\t:if  (!\$ifStatusSecond) do={\r\
    \n\t\t[/interface set \$ifNameFirst disabled=no];\r\
    \n\t\t[/interface set \$ifNameSecond disabled=yes];\r\
    \n\t\t:log warning \"\$ifNameFirst is Enabled Now!!\";\r\
    \n\t} else={\r\
    \n\t\t[/interface set \$ifNameSecond disabled=no];\r\
    \n\t\t:log warning \"\$ifNameSecond is Enabled Now!!\";\r\
    \n\t}\r\
    \n} else={\r\
    \n\t:if  (\$ifStatusSecond) do={\r\
    \n\t\t\t[/interface set \$ifNameSecond disabled=no];\r\
    \n\t\t\t[/interface set \$ifNameFirst disabled=yes];\r\
    \n\t\t\t:log warning \"\$ifNameSecond is Enabled Now!!\";\r\
    \n\t} else={\r\
    \n\t\t\t[/interface set \$ifNameFirst disabled=yes];\r\
    \n\t\t\t:log warning \"\$ifNameFirst is Disabled Now!!\";\r\
    \n\t\t}\r\
    \n\t\t\r\
    \n\t}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/08/2021 start-time=13:16:29
