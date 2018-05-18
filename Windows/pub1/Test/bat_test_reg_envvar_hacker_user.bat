@echo off
rem данный файл является тестовым файлом для регистрации переменной  %Hacker_User% и удаления её значения из системного окружения Windows

setlocal enableextensions enabledelayedexpansion

set sParam1=HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment
set sParam2=Hacker_User
set sParam3=yuden

echo %sParam1% %sParam2% %sParam3% %~dp0
Reg Add "!sParam1!" /v "!sParam2!" /t REG_SZ /d "!sParam3!" /f 2>&1 | %SystemRoot%\system32\find.exe >nul 2>nul /I "Ошибка" && goto UnSuccess
goto Success

:UnSuccess
echo The variable not Created
goto Finish

:Success
echo The variable Hacker_User is created. See dump...
echo Hacker_User = %Hacker_User%
pause
call %~dp0reg_del_envvar.bat %sParam2%
pause

:Finish

