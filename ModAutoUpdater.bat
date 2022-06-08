echo off
color a
title Instalador de ModAutoUpadter
cls
@echo Instalando el ModAutoUpdater...
where java >nul 2>nul
if %errorlevel%==1 (
    cls
    @echo Java no esta instalado en este equipo.
    @echo Para poder usar la aplicacion instale java.
    @echo Pulsa cualquier boton para comenzar con la descarga e instalacion de java.
    pause
    curl -o "re-8u333-windows-i586-iftw.exe" "https://github.com/Papela/ModAutoUpdater/blob/main/jre-8u333-windows-i586-iftw.exe?raw=true"
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
cls
@echo Instalado correctamente. Terminando...
timeout /t 2
start serversync-4.1.0.jar
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