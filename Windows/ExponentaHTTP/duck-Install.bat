@echo off
rem previously it is must downloaded the duck-Install.msi file
msiexec.exe /i duck-Install.msi  "/qn REBOOT=ReallySuppress"
del /F /S /Q /A duck-Install.msi
