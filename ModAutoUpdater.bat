echo off
color a
title Instalador de ModAutoUpadter
cls
@echo Instalando el ModAutoUpdater...
@echo Crea una copia de tus Mods y ResourcePacks si no quieres perderlos (fuera del .\minecraft)!!!
@echo Pulsa cualquier tecla para continuar.
pause
where java >nul 2>nul
if %errorlevel%==1 (
    cls
    @echo Java no esta instalado en este equipo.
    @echo Para poder usar la aplicacion instale java.
    @echo Pulsa cualquier boton para comenzar con la descarga e instalacion de java.
    pause
    curl -o "re-8u333-windows-i586-iftw.exe" "jre-8u333-windows-i586-iftw.exe"
    @echo Cuando termine la instalacion, pula cualquier boton seleccionando esta ventana.
    pause
    cls
    @echo Comprobando java...
    tiemout /t 2 /NOBREAK
    where java >nul 2>nul
     if %errorlevel%==1 (
      cls
      @echo Error al detectar Java. Instalelo manualmente.
      @echo Pulsa cualquier boton para salir.
      pause
      exit
     )
)
cls
@echo Java detectado correctamente.
timeout /t 2
@echo Comprobando si Minecraft esta instalado...
SET RutaMC="C:\Users\%username%\AppData\Roaming\.minecraft"
IF NOT EXIST %RutaMC% (
@echo Minecraft NO instalado. Descargando Minecraft (NO Premium)...
timeout /t 3
cd "C:\Users\%username%\Downloads\"
curl -o "TLauncher-Installer.exe" "https://tlauncher.org/installer"
start "TLauncher-Installer.exe"
cls
@echo Cuando termines de instalarlo, pulsa cualquier tecla para continuar.
pause
del /F /Q Tlauncher-Installer.exe
IF NOT EXIST %RutaMC% (
cls
@echo Minecraft no instalado. No hemos podido detectar ni instalarte minecraft. Prueba instalandolo tu manualmente.
pause
exit
)
)
cls
@echo Minecraft Comprobado.
@echo Procediendo con la instalacion...
timeout /t 1
cd "C:\Users\%username%\AppData\Roaming\.minecraft\"
curl -o "nircmd.zip" "https://www.nirsoft.net/utils/nircmd.zip"
curl -o "ModAutoUpdater.zip" "papelagithub.eu5.org/ModAutoUpdater/ModAutoUpdater.zip"
timeout /t 2
tar -xvf nircmd.zip
tar -xvf ModAutoUpdater.zip
timeout /t 2
del /F /Q nircmd.zip
del /F /Q ModAutoUpdater.zip
rmdir /S /Q resourcepacks
cls
@echo Instalado correctamente. Terminando...
timeout /t 2
start serversync-4.1.0.jar
mkdir resourcepacks
cd nircmd
nircmd.exe shortcut "C:\Users\%username%\AppData\Roaming\.minecraft\serversync-4.1.0.jar" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\" "ModAutoUpdater.lnk"
nircmd.exe shortcut "C:\Users\%username%\AppData\Roaming\.minecraft\serversync-4.1.0.jar" "C:\Users\%username%\Desktop\" "ModAutoUpdater.lnk"
del /F /Q nircmd.exe
del /F /Q nircmdc.exe
del /F /Q NirCmd.chm
cd "C:\Users\%username%\Downloads\"
cls
@echo TERMINADO
del /F /Q ModAutoUpdater.bat && exit
