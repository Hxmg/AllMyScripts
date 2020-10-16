@echo off

For /f "tokens=3" %%i in ('Reg Query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" ') do Set a=%%i

if %a% == 0x1 (
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f 
echo Proxy Disabled
goto endd
) else (

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f 
echo Proxy Enable

)

For /f  "tokens=3" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer') do Set a=%%i
echo %a%

:endd
pause
