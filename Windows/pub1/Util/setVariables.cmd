@echo off
SetLocal EnableExtensions EnableDelayedExpansion
set KeyVars=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment

:: –егистрируем каталог ботнета
set PUB1=C:\pub1
Reg Add "%KeyVars%" /v PUB1 /t REG_SZ /d "!PUB1!" /f

:: ”казываем добавл€емый каталог
set FolderToAdd=%PUB1%\Util

:: ѕолучаем текущее значение Path
For /f "tokens=2*" %%a In ('Reg.exe query "%KeyVars%" /v Path^|Find "Path"') do set "CurPath=%%~b"

:: ƒописываем новый каталог
reg.exe add "%KeyVars%" /v Path /t REG_EXPAND_SZ /d "!CurPath!;!FolderToAdd!" /F

:: Ёта команда содержит API дл€ обновлени€ пользовательских настроек Path (только Vista+)
setx temp "%temp%"
:: дл€ XP
rundll32 user32.dll,UpdatePerUserSystemParameters
