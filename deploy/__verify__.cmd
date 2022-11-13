@echo off
cd "%~dp0"
powershell -exec bypass -file scripts\__verify__.ps1
pause
