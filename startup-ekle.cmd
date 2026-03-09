@echo off
chcp 65001 >nul
title Prangasız İnternet - Startup Ekle
echo.
echo  =========================================
echo   Prangasız İnternet - Otomatik Başlatma
echo  =========================================
echo.

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "TARGET=%~dp0operatordeviren.cmd"
set "SHORTCUT=%STARTUP%\PrangasizInternet.lnk"

echo  Başlangıç klasörüne kısayol oluşturuluyor...

powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT%'); $s.TargetPath = '%TARGET%'; $s.WorkingDirectory = '%~dp0'; $s.Save()"

if exist "%SHORTCUT%" (
    echo.
    echo  BAŞARILI! Bilgisayarınız her açıldığında otomatik olarak başlatılacak.
) else (
    echo.
    echo  HATA: Kısayol oluşturulamadı. Yönetici olarak çalıştırmayı deneyin.
)

echo.
pause
