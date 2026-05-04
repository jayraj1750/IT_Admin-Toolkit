@echo off
title IT ADMIN TOOLKIT v2.2
mode con: cols=95 lines=40
color 1f

:: ==================== LOGIN CREDENTIALS ====================
set "username=Jayraj"
set "password=123"

:: Check for administrator privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    cls
    echo ================================================
    echo         ADMINISTRATOR PRIVILEGES REQUIRED
    echo ================================================
    echo.
    echo This toolkit requires administrator privileges to
    echo access system tools and perform diagnostics.
    echo.
    echo Please right-click the batch file and select
    echo "Run as administrator" to continue.
    echo.
    pause
    exit /b 1
)

:login
cls
echo  ================================================================================
echo  ^|                          IT ADMIN TOOLKIT v2.2                             ^|
echo  ^|----------------------------------------------------------------------------^|
echo  ^|               Secure Management Console for IT Admins                      ^|
echo  ================================================================================
echo.
echo  Login Required
echo  -----------------
echo.
set /p "user=Username: "
set /p "pass=Password: "

if /i "%user%"=="%username%" if /i "%pass%"=="%password%" goto menu

echo.
echo  [ERROR] Invalid Username or Password!
timeout /t 2 >nul
goto login

:menu
cls
echo  ================================================================================
echo  ^|                          IT ADMIN TOOLKIT v2.2                             ^|
echo  ^|----------------------------------------------------------------------------^|
echo  ^|  Select an admin tool from the dashboard below.                            ^|
echo  ================================================================================
echo.

echo   [System ^& Diagnostics]
echo   1. System Information           2. Disk Drive Status
echo   3. System File Scan (SFC)       4. Check Disk (CHKDSK)
echo   5. Disk Management              6. Reliability Monitor
echo   7. Event Viewer                 8. Task Manager
echo.
echo   [Management ^& Configuration]
echo   9. Computer Management         10. Services
echo  11. System Configuration        12. Group Policy Editor
echo  13. Registry Editor             14. Device Manager
echo  15. Programs and Features       16. Local User Management
echo.
echo   [Security ^& Network]
echo  17. Windows Security            18. Advanced Firewall
echo  19. Windows Update              20. Network Information
echo  21. Network Connections         22. Command Prompt
echo  23. PowerShell                  24. DirectX Diagnostic Tool
echo.
echo   25. Exit
echo  ================================================================================
echo.
set /p "choice=Select option (1-25): "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto disk
if "%choice%"=="3" goto sfc
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto diskmgmt
if "%choice%"=="6" goto reliability
if "%choice%"=="7" goto eventvwr
if "%choice%"=="8" goto taskmgr
if "%choice%"=="9" goto compmgmt
if "%choice%"=="10" goto services
if "%choice%"=="11" goto msconfig
if "%choice%"=="12" goto gpedit
if "%choice%"=="13" goto regedit
if "%choice%"=="14" goto devmgmt
if "%choice%"=="15" goto appwiz
if "%choice%"=="16" goto lusrmgr
if "%choice%"=="17" goto winsec
if "%choice%"=="18" goto firewall
if "%choice%"=="19" goto winupdate
if "%choice%"=="20" goto netinfo
if "%choice%"=="21" goto netconn
if "%choice%"=="22" goto cmdprompt
if "%choice%"=="23" goto powershell
if "%choice%"=="24" goto dxdiag
if "%choice%"=="25" goto end

echo.
echo  [WARNING] Invalid option! Please enter number 1 to 25.
timeout /t 2 >nul
goto menu

REM ==================== TOOLS START HERE ====================

:sysinfo
cls
echo ================================================
echo            SYSTEM INFORMATION
echo ================================================
systeminfo
echo.
pause
goto menu

:disk
cls
echo ================================================
echo            DISK DRIVE STATUS
echo ================================================
wmic logicaldisk get caption,drivetype,filesystem,size,freespace
echo.
pause
goto menu

:sfc
cls
echo ================================================
echo          RUNNING SYSTEM FILE CHECKER
echo ================================================
sfc /scannow
pause
goto menu

:chkdsk
cls
echo ================================================
echo               CHECK DISK (C:)
echo ================================================
chkdsk C: /F
pause
goto menu

:diskmgmt
start diskmgmt.msc
goto menu

:reliability
start perfmon /rel
goto menu

:eventvwr
start eventvwr.msc
goto menu

:taskmgr
start taskmgr
goto menu

:compmgmt
start compmgmt.msc
goto menu

:services
start services.msc
goto menu

:msconfig
start msconfig
goto menu

:gpedit
start gpedit.msc
goto menu

:regedit
start regedit
goto menu

:devmgmt
start devmgmt.msc
goto menu

:appwiz
start appwiz.cpl
goto menu

:lusrmgr
start lusrmgr.msc
goto menu

:winsec
start windowsdefender:
goto menu

:firewall
start wf.msc
goto menu

:winupdate
start ms-settings:windowsupdate
goto menu

:netinfo
cls
echo ================================================
echo            NETWORK INFORMATION
echo ================================================
ipconfig /all
pause
goto menu

:netconn
start ncpa.cpl
goto menu

:cmdprompt
start cmd
goto menu

:powershell
start powershell
goto menu

:dxdiag
dxdiag
goto menu

:end
cls
echo.
echo  Thank you for using IT Admin Toolkit!
echo  Logged out successfully.
echo.
timeout /t 3 >nul
exit