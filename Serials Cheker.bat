@echo off
title Serial Checker
mode con: cols=180 lines=40

:: Definir colores
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "CYAN=[96m"
set "RESET=[0m"

:: Mostrar el encabezado de ASCII Art
echo %CYAN%===================================
echo %RED%         Trust Serial Cheker
echo %CYAN%===================================
echo %RESET%

:: Menú principal
:MENU

echo %YELLOW%*************************************
echo %YELLOW%*       Serial Information Menu     *
echo %YELLOW%*************************************
echo.
echo %GREEN%1. Mostrar serial del Disco
echo %GREEN%2. Mostrar serial de la Placa Madre
echo %GREEN%3. Mostrar UUID del SMBios
echo %GREEN%4. Mostrar informacion de la GPU
echo %GREEN%5. Mostrar serial de la RAM
echo %GREEN%6. Mostrar UUID del BIOS
echo %GREEN%7. Mostrar ID del CPU
echo %GREEN%8. Mostrar direccion MAC
echo %CYAN%9. Mostrar todo
echo %CYAN%0. Salir
echo.
set /p option=Selecciona una opcion (0-9):

:: Opciones del menú
if "%option%"=="1" goto DISK
if "%option%"=="2" goto MOTHERBOARD
if "%option%"=="3" goto SMBIOS
if "%option%"=="4" goto GPU
if "%option%"=="5" goto RAM
if "%option%"=="6" goto BIOS
if "%option%"=="7" goto CPU
if "%option%"=="8" goto MAC
if "%option%"=="9" goto SHOWALL
if "%option%"=="0" exit

:: Opción de disco
:DISK
cls
echo %GREEN%Serial del Disco:
echo %GREEN%-------------------------
wmic diskdrive get serialnumber
pause
goto MENU

:: Opción de Placa Madre
:MOTHERBOARD
cls
echo %GREEN%Serial de la Placa Madre:
echo %GREEN%---------------------------
wmic baseboard get serialnumber
pause
goto MENU

:: Opción de SMBios
:SMBIOS
cls
echo %GREEN%UUID del SMBios:
echo %GREEN%-----------------------
wmic path win32_computersystemproduct get uuid
pause
goto MENU

:: Opción de GPU
:GPU
cls
echo %GREEN%Informacion de la GPU:
echo %GREEN%-------------------------
wmic PATH Win32_VideoController GET Description,PNPDeviceID
pause
goto MENU

:: Opción de RAM
:RAM
cls
echo %GREEN%Serial de la RAM:
echo %GREEN%-------------------
wmic memorychip get serialnumber
pause
goto MENU

:: Opción de BIOS
:BIOS
cls
echo %GREEN%UUID del BIOS:
echo %GREEN%-----------------
wmic csproduct get uuid
pause
goto MENU

:: Opción de CPU
:CPU
cls
echo %GREEN%ID del CPU:
echo %GREEN%-----------
wmic cpu get processorid
pause
goto MENU

:: Opción de Dirección MAC
:MAC
cls
echo %GREEN%Direccion MAC:
echo %GREEN%-------------------------
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
pause
goto MENU

:: Opción de Mostrar Todo
:SHOWALL
cls
echo %CYAN%*************************************
echo %CYAN%*        Mostrando toda la info    *
echo %CYAN%*************************************
echo.
echo %GREEN%Serial del Disco:
echo %GREEN%-------------------------
wmic diskdrive get serialnumber
echo.
echo %GREEN%Serial de la Placa Madre:
echo %GREEN%---------------------------
wmic baseboard get serialnumber
echo.
echo %GREEN%UUID del SMBios:
echo %GREEN%-----------------------
wmic path win32_computersystemproduct get uuid
echo.
echo %GREEN%Informacion de la GPU:
echo %GREEN%-------------------------
wmic PATH Win32_VideoController GET Description,PNPDeviceID
echo.
echo %GREEN%Serial de la RAM:
echo %GREEN%-------------------
wmic memorychip get serialnumber
echo.
echo %GREEN%UUID del BIOS:
echo %GREEN%-----------------
wmic csproduct get uuid
echo.
echo %GREEN%ID del CPU:
echo %GREEN%-----------
wmic cpu get processorid
echo.
echo %GREEN%Direccion MAC:
echo %GREEN%-------------------------
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
echo.
pause
goto MENU
