@echo off
REM      BATCH FILE CREATED BY CHARLES DE HAVILLAND 20/02/2012, v2 08/09/2015
cls
If "%1"=="" GOTO :norulename
SET RULENAME=%1
ECHO.
ECHO.
ECHO   Add 'In AND Out' Firewall rules to all *.exe ^& *.dll files in,
ECHO.
ECHO   %CD% (inc subfolders)
ECHO.
ECHO   "%RULENAME%" Firewall rule name will be used ?
ECHO.
ECHO.
ECHO.
ECHO press CTRL+C to stop now or
pause
cls
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
Echo.
Echo done.
GOTO :Finish

:norulename
for %%* in (.) do set RULENAME=%%~nx*
ECHO.
ECHO   Add 'In AND Out' Firewall rules to all *.exe ^& *.dll files in,
ECHO.
ECHO   %CD% (inc subfolders)
ECHO.
ECHO   "%RULENAME%" Firewall rule name will be used ?
ECHO.
ECHO.
ECHO.
ECHO press CTRL+C to stop now or
pause
cls
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
Echo.
Echo done.

:Finish
Echo.
Echo.
Echo Batch ended...