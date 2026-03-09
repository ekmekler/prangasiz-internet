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
start /min "" goodbyedpi.exe -p -r -s -f 3 -k 3 -n -e 3 -a ^
  --native-frag ^
  --set-ttl 7 ^
  --wrong-chksum ^
  --dns-addr 8.8.8.8 --dns-port 53 ^
  --dnsv6-addr 2001:4860:4860::8888 --dnsv6-port 53

echo  Başarılı! Program arka planda çalışıyor.
echo.
echo  Sorun yaşarsanız Discord: @dilimekmek
echo.
timeout /t 3 /nobreak >nul
