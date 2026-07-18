@echo off
chcp 65001 >nul
title Prangasız İnternet - Servis Kur

REM ==========================================================
REM  Prangasız İnternet'i Windows SERVİSİ olarak kurar.
REM  Boylece her acilista (giristen ONCE) otomatik baslar;
REM  operatordeviren.cmd yi elle acmaya gerek kalmaz.
REM  Kurallar operatordeviren.cmd ile birebir aynidir.
REM
REM  Kaldirmak icin:  servis-sil.cmd
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
echo   Prangasız İnternet - Servis Kuruluyor...
echo  =========================================
echo.

REM Ayni isimde eski bir servis varsa once temizle
sc stop "%SVCNAME%" >nul 2>&1
sc delete "%SVCNAME%" >nul 2>&1

REM Servisi olustur (operatordeviren.cmd ile AYNI kurallar / TTL 7)
sc create "%SVCNAME%" binPath= "\"%~dp0dpi\goodbyedpi.exe\" -p -r -s -f 3 -k 3 -n -e 3 -a --native-frag --set-ttl 7 --wrong-chksum --dns-addr 94.140.14.14 --dns-port 53 --dnsv6-addr 2a10:50c0::ad1:ff --dnsv6-port 53" start= "auto"
sc description "%SVCNAME%" "Prangasiz Internet - GoodbyeDPI tabanli DPI/DNS engel asma servisi. Her acilista otomatik baslar."
sc failure "%SVCNAME%" reset= 0 actions= restart/5000/restart/5000/restart/5000

REM Kurulumdan hemen sonra baslat
sc start "%SVCNAME%"

echo.
echo  =========================================
echo   BAŞARILI! 🎉
echo   Servis şu an çalışıyor ve bilgisayar her
echo   açıldığında otomatik devreye girecek.
echo  =========================================
echo.
echo   Durum:     sc query PrangasizInternet
echo   Kaldırma:  servis-sil.cmd
echo.
echo  ⚠  NOT: startup-ekle.cmd ile birlikte KULLANMAYIN.
echo      İkisi birden açık olursa çakışır. Servisi
echo      kullanıyorsanız startup-cikar.cmd yi çalıştırın.
echo.
echo   Sorun yaşarsanız Discord: @dilimekmek
echo.
pause
