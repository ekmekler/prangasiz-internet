@echo off
title Prangasiz Internet - Servis Kur

REM ==========================================================
REM  Prangasiz Internet'i Windows servisi olarak kurar.
REM  Boylece her acilista (giristen once) otomatik baslar;
REM  operatordeviren.cmd yi elle acmaya gerek kalmaz.
REM  Servis, otomatik-TTL (auto-ttl) kural setini kullanir.
REM
REM  Kaldirmak icin:  servis-sil.cmd
REM ==========================================================

REM --- Yonetici izni yoksa UAC ile kendini yeniden baslat ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Yonetici izni gerekiyor. Acilan UAC penceresini onaylayin...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set "SVCNAME=PrangasizInternet"

echo.
echo  =========================================
echo    Prangasiz Internet - Servis Kuruluyor
echo  =========================================
echo.

REM Ayni isimde eski servis varsa once temizle
sc stop "%SVCNAME%" >nul 2>&1
sc delete "%SVCNAME%" >nul 2>&1

REM Servisi olustur (otomatik-TTL kural seti)
sc create "%SVCNAME%" binPath= "\"%~dp0dpi\goodbyedpi.exe\" --auto-ttl 1-4-10 --dns-addr 94.140.14.14 --dns-port 53 --dnsv6-addr 2a10:50c0::ad1:ff --dnsv6-port 53" start= "auto"
sc description "%SVCNAME%" "Prangasiz Internet - GoodbyeDPI tabanli DPI/DNS engel asma servisi. Her acilista otomatik baslar."
sc failure "%SVCNAME%" reset= 0 actions= restart/5000/restart/5000/restart/5000

REM Kurulumdan hemen sonra baslat
sc start "%SVCNAME%"

echo.
echo  =========================================
echo    BASARILI. Servis calisiyor ve bilgisayar
echo    her acildiginda otomatik devreye girecek.
echo  =========================================
echo.
echo    Durum kontrol : sc query PrangasizInternet
echo    Kaldirmak icin: servis-sil.cmd
echo.
echo   NOT: startup-ekle.cmd ile AYNI ANDA kullanmayin.
echo        Ikisi birden calisirsa cakisir. Servisi
echo        kullaniyorsaniz startup-cikar.cmd yi calistirin.
echo.
echo   Sorun yasarsaniz Discord: @dilimekmek
echo.
pause
