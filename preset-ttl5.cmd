@echo off
chcp 65001 >nul
title Prangasız İnternet - Preset TTL 5
echo.
echo  =========================================
echo   Prangasız İnternet - Preset: TTL 5
echo  =========================================
echo.
echo  DPI engelleri aşılıyor (TTL=5), lütfen bekleyin...
echo.

cd /d "%~dp0\dpi"
start /min "" goodbyedpi.exe -p -r -s -f 3 -k 3 -n -e 3 -a ^
  --native-frag ^
  --set-ttl 5 ^
  --wrong-chksum ^
  --dns-addr 94.140.14.14 --dns-port 53 ^
  --dnsv6-addr 2a10:50c0::ad1:ff --dnsv6-port 53

echo  Başarılı! Program arka planda çalışıyor (TTL=5).
echo.
echo  Sorun yaşarsanız Discord: @dilimekmek
echo.
timeout /t 3 /nobreak >nul
