@echo off
chcp 65001 >nul
title Prangasız İnternet - Startup Çıkar
echo.
echo  =========================================
echo   Prangasız İnternet - Otomatik Başlatma
echo  =========================================
echo.

set "SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\PrangasizInternet.lnk"

if exist "%SHORTCUT%" (
    del "%SHORTCUT%"
    echo  BAŞARILI! Otomatik başlatma kaldırıldı.
) else (
    echo  Zaten otomatik başlatma ayarlanmamış.
)

echo.
pause
