@echo off
chcp 65001 >nul
title Prangasız İnternet
echo.
echo  =========================================
echo   Prangasız İnternet - Başlatılıyor...
echo  =========================================
echo.
echo  DPI engelleri aşılıyor, lütfen bekleyin...
echo.

cd /d "%~dp0\dpi"
start /min "" goodbyedpi.exe --auto-ttl 1-4-10 --dns-addr 94.140.14.14 --dns-port 53 --dnsv6-addr 2a10:50c0::ad1:ff --dnsv6-port 53

echo  Başarılı! Program arka planda çalışıyor.
echo.
echo  Sorun yaşarsanız Discord: @dilimekmek
echo.
timeout /t 3 /nobreak >nul
