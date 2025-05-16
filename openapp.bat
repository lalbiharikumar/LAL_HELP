1. Open multiple application once
File Name: openapp.bat

@echo off
cd /d "%~dp0"

set basePath=D:\Software\Portable_Software\PortableApps

rem Launch Notepad++
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\Notepad++Portable\Notepad++Portable.exe""

rem Launch Xlight
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\xlight\xlight.exe""

rem Launch mRemoteNG
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\mRemoteNG-Portable-1.76.20.24669\mRemoteNG.exe""

rem Launch Postman
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\postman-portable\postman-portable.exe""

rem Launch MySQL Server
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\MYSQL\mysql8install\bin\mysqld.exe""

rem Launch MySQL Workbench
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\MySQLWorkbench8.0CE\MySQLWorkbench.exe""

rem Launch Spring Tool Suite
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\sts-4.29.1.RELEASE\SpringToolSuite4.exe""

rem Launch Google Chrome
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\GoogleChromePortable64\GoogleChromePortable.exe""

rem Launch smartsvn
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" "%basePath%\SmartSVN 14.5\bin\smartsvn.exe" ""

rem Launch smartsvn
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" D:\Software\Portable_Software\Start.exe""

rem Launch smartsvn
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %basePath%\ThunderbirdPortable\ThunderbirdPortable.exe""

exit
