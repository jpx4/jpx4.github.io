@echo off

title MCSMaker - MineCraftServerMaker

mkdir serverfiles

:question
set /p quest=You downloaded Files / configured server ? (y,N): 
if %quest%==n goto selver
if %quest%==N goto selver
if %quest%==y goto runserver
if %quest%==Y goto runserver







:selver
set /p version=Select a version {1.8.9, 1.12.2, 1.18.2}: 
if %version%==1.8.9 goto download1.8.9
if %version%==1.12.2 goto download1.12.2
if %version%==1.18.2 goto download1.18.2

:download1.8.9
cls
echo Downloading 1.8.9 Engine
cd serverfiles
curl https://ftp.jpx4.ml/mcs-maker/engine-versions/paper-1.8.9.jar -o engine.jar
cd ..
cls
goto conf2

:download1.18.2
cls
echo Downloading 1.18.2 Engine
cd serverfiles
curl https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar -o engine.jar
cd ..
cls
goto conf2

:download1.12.2
cls
echo Downloading 1.12.2 Engine
cd serverfiles
curl https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar -o engine.jar
cd ..
cls
goto conf2


:conf2
set /p motd=Type the server name: 
cd serverfiles
echo motd=%motd%>>server.properties
echo server-ip=localhost>>server.properties
echo eula=true>>eula.txt
cls
echo configured server.
echo.
echo server name = %motd%
echo server ip = localhost
cd ..
pause
goto runserver








:runserver
echo If you dont have the JDK installed then install here: https://adoptium.net
echo If you have JDK then click enter . . .
pause>nul
cd serverfiles
echo Running the server!
java -Xmx2G -Xms2G -jar engine.jar nogui
pause

