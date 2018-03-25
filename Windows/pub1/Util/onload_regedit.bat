@echo off
set  Key=HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run
reg.exe add "%Key%"  /v "Onload Command Interface" /t reg_sz /d "!PUB1!\Util\onsysload.cmd"
set Key=
