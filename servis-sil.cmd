@echo off
chcp 65001 >nul
title Prangasız İnternet - Servis Sil

REM ==========================================================
REM  Prangasız İnternet servisini kaldirir.
REM  Bundan sonra acilista otomatik baslamaz.
REM  Tekrar istersen:  servis-kur.cmd
REM ==========================================================

REM --- Yonetici izni yoksa UAC ile kendini yeniden baslat ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Yonetici izni gerekiyor. Acilan UAC penceresini ONAYLAYIN...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set "SVCNAME=PrangasizInternet"

echo.
echo  =========================================
echo   Prangasız İnternet - Servis Kaldırılıyor
echo  =========================================
echo.

sc stop "%SVCNAME%"
sc delete "%SVCNAME%"

REM WinDivert surucu servisleri arkada kalmis olabilir, temizle
sc stop "WinDivert" >nul 2>&1
sc delete "WinDivert" >nul 2>&1
sc stop "WinDivert14" >nul 2>&1
sc delete "WinDivert14" >nul 2>&1

echo.
echo  =========================================
echo   BAŞARILI! 🗑️
echo   Servis kaldırıldı, artık otomatik başlamaz.
echo   Tekrar kurmak için: servis-kur.cmd
echo  =========================================
echo.
pause
