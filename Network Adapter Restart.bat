REM	In an elevated command prompt, copy and paste the command below, and press Enter. This will show you all network adapter names on your PC and you can edit the script accordingly.

REM	netsh interface show interface








netsh interface set interface "EthernetTeam" admin=disable

Timeout 60

netsh interface set interface "EthernetTeam" admin=enable

 






