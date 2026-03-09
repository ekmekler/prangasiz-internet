# Prangasız İnternet 🌐

DPI (Deep Packet Inspection) engellerini aşmak için hazırlanmış, kullanımı kolay bir araç.

## Hakkında

- DPI kuralları minimum gecikme (ping/jitter/lag) ile maksimum etki sağlayacak şekilde ayarlanmıştır.
- Temel olarak **Superonline** için yazılmıştır ancak diğer operatörlerde de çalışmaktadır.
- Sizde çalışmaz ise Discord'dan **@dilimekmek** adresine operatörünüzün ismini belirterek ulaşın, birlikte çözelim.

### Kullanılan Ayarlar

Ayarlar, Android'deki **DPI Tunnel** uygulamasında iyi çalışan profille eşdeğer olacak şekilde yapılandırılmıştır:

| DPI Tunnel Ayarı | Değer | goodbyedpi Karşılığı |
|---|---|---|
| İlk saldırı – Disorder | Disorder + Fake | `--native-frag` |
| İlk saldırı – Sahte paket | Disorder + Fake | `--set-ttl 7 --wrong-chksum` |
| Otomatik TTL (Auto TTL) | Kapalı | — (kaldırıldı) |
| Sahte paket TTL'i | 7 | `--set-ttl 7` |
| Yanlış SEQ (Wrong SEQ) | Kapalı | — (eklenmedi) |
| Paket bölme konumu | 3 | `-f 3 -k 3 -n -e 3` |
| DNS sunucusu (IPv4) | 8.8.8.8 (Google) | `--dns-addr 8.8.8.8` |
| DNS sunucusu (IPv6) | 2001:4860:4860::8888 (Google) | `--dnsv6-addr 2001:4860:4860::8888` |

---

## Kullanım

### Tek Seferlik Çalıştırma

`operatordeviren.cmd` dosyasına **çift tıklayın**. Arka planda çalışmaya başlar.

### Bilgisayar Açıldığında Otomatik Başlatma

`startup-ekle.cmd` dosyasına **çift tıklayın** — bu kadar! 🎉  
Artık bilgisayarı her açtığınızda otomatik olarak devreye girecektir.

> Elle yapmak isterseniz: `operatordeviren.cmd` ye sağ tıklayıp **"Kısayol Oluştur"** seçin.  
> Ardından `Win + R` tuşlarına basıp `shell:startup` yazın ve kısayolu açılan klasöre taşıyın.

### Otomatik Başlatmayı Kaldırma

`startup-cikar.cmd` dosyasına **çift tıklayın** — hepsi bu. 🗑️

> Elle yapmak isterseniz: `Win + R` tuşlarına basıp `shell:startup` yazın ve açılan klasörden kısayolu silin.

---

## Sorun Giderme

| Sorun | Çözüm |
|-------|-------|
| Çalışmıyor | `operatordeviren.cmd` dosyasına sağ tıklayıp "Yönetici olarak çalıştır" deneyin |
| Operatörünüze göre çalışmıyor | Discord'dan **@dilimekmek** ile iletişime geçin |

---

## Yasal Uyarı

Bu uygulamanın kullanımından doğan her türlü yasal sorumluluk kullanan kişiye aittir.  
Uygulama yalnızca **eğitim ve araştırma amaçları** ile yazılmış ve düzenlenmiş olup; bu uygulamayı bu şartlar altında kullanmak ya da kullanmamak kullanıcının kendi seçimidir.  
Açık kaynak kodlarının paylaşıldığı bu platformdaki düzenlenmiş bu proje, bilgi paylaşımı ve kodlama eğitimi amaçları ile yazılmış ve düzenlenmiştir.

---

Keyifli gezinmeler... :>
