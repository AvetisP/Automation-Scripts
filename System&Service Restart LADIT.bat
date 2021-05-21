REM @echo off

SETLOCAL

IF EXIST "C:\Program Files (x86)\PGP Corporation\PGP Desktop" (
CD "C:\Program Files (x86)\PGP Corporation\PGP Desktop"
pgpwde --add-bypass --disk 0 --count 1 --ap "Dentist1$"
)


ENDLOCAL



REM Auto Log In!
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /d Administrator /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /d Dentist1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /d Alvarado.local /f




@REM Stopping services
"C:\Eaglesoft\Shared Files\PattersonServerStatus.exe" -stop

@rem And also give time to Veeam to complete a full backup!
REM SET nTimoutSeconds=600
REM TIMEOUT %nTimoutSeconds%


@REM Starting back services
REM "C:\Eaglesoft\Shared Files\\PattersonServerStatus.exe" -start


:Continue1


@rem Request to restart this server in 20 seconds
REM MP 2019/3/22 @ 1:03 AM
REM I do not restart server since user file/folders will be unavailable! 
REM Atfer every server restart, users must log off and back on!
SHUTDOWN /r /f /t 20


timeout 10

ENDLOCAL
