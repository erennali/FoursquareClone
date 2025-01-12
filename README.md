# 🗺️ Foursquare Clone - Parse Tabanlı iOS Uygulaması

Bu proje, Swift ile geliştirilmiş bir **Foursquare Clone** uygulamasıdır. Uygulama, Firebase yerine **Parse** veritabanı kullanılarak geliştirilmiştir. Kullanıcılar restoranlar ekleyebilir, harita üzerinde yer işaretleri (annotation) koyabilir ve bu noktalara navigasyon sağlayabilir. Ayrıca, kullanıcı giriş/çıkış işlemleri ve kullanıcı hatırlama özelliği mevcuttur.

## ✨ Özellikler

- **Kullanıcı Giriş/Çıkış İşlemleri:**
  - Kullanıcılar, uygulamaya giriş yapabilir ve çıkış yapabilir.
  - Çıkış yapmayan kullanıcılar, bir sonraki girişlerinde otomatik olarak oturumları açık kalır.
  
- **Harita Entegrasyonu:**
  - Kullanıcılar restoranlarını eklerken haritaya bir **annotation** koyabilir.
  - Eklenen noktalara tıklayarak **navigasyon** başlatılabilir.
  
- **Parse Tabanlı Veritabanı:**
  - Firebase yerine Parse kullanılarak kullanıcı verileri ve restoran bilgileri saklanır.

## 🛠️ Kullanılan Teknolojiler

- **Programlama Dili:** Swift
- **Veritabanı:** Parse Server
- **Harita Servisi:** MapKit (Apple Maps)

## 📲 Özelliklerin Detayları

### 🔑 Kullanıcı Girişi
- Kullanıcı, giriş yaptıktan sonra oturumu açık kalır.
- Çıkış yapılmadığı sürece kullanıcı, uygulamayı her açtığında otomatik olarak giriş yapar.

### 🗺️ Harita Entegrasyonu
- Harita üzerinde **annotation** ekleme özelliği.
- Kullanıcı, eklediği restoranın konumuna bir pin bırakır.
- Pin üzerinden navigasyonu açarak ilgili restoranın yol tarifi alınabilir.

### 🗄️ Parse Kullanımı
- Kullanıcı bilgileri (giriş/çıkış verileri).
- Restoran konumları ve diğer veriler Parse üzerinde saklanır.


## 🚀 Kurulum

1. Bu projeyi klonlayın:

   ```bash
   git clone https://github.com/kullaniciadi/foursquare-clone.git
   cd foursquare-clone
2. Parse server ayarlarını yapılandırın:
   -	AppDelegate dosyasında Parse sunucu bağlantı bilgilerinizi düzenleyin:
     
   ```bash
   let configuration = ParseClientConfiguration { (ParseMutableClientConfiguration) in
            ParseMutableClientConfiguration.applicationId = <YOUR_APP_ID>
            ParseMutableClientConfiguration.clientKey = <YOUR_CLIENT_KEY>
            ParseMutableClientConfiguration.server = <YOUR_SERVER>
        }
        Parse.initialize(with: configuration)
  
3. Proje kök dizininde pod gereksinimlerini yükleyin:
  ```bash
  pod install
