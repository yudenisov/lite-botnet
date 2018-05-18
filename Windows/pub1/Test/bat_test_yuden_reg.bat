@echo off
rem данный файл демонстрирует сохранение резервной копии, удаление и восстановление куста реестра Windows
rem используется куст реестра HKCU\Software\yuden, который записывается в инициализационную переменную
rem затем последовательно вызываются скрипты reg_export_reserve.bat, reg_del_node.bat и reg_import_file bat
rem для примера файл резервной копии -- yuden.reg_del_node

setlocal enableextensions enabledelayedexpansion

set sParam1="HKCU\Software\yuden"
set sParam2="yuden.reg"

call .\reg_export_reserve.bat %sParam1% %sParam2%
echo reg_export_reserve done...
pause
call .\reg_del_node.bat %sParam1% %sParam2%
echo reg_del_node done...
pause
call .\reg_import_file.bat %sParam2%
echo reg_import_file done...
pause




