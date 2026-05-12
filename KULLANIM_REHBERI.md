# Classification API - Kullanim Rehberi

Docker kurulu oldugu varsayilmaktadir.

---

## Calistirma

Proje klasorunde terminal acin ve asagidaki komutu calistirin:

```
make
```

Uygulama ayaga kalktiktan sonra:

```
http://localhost:8081
```

---

## Make Komutlari

| Komut      | Aciklama                              |
|------------|---------------------------------------|
| make       | Temizle, derle ve calistir            |
| make build | Sadece Docker imajini olustur         |
| make run   | Sadece konteyneri baslat              |
| make stop  | Konteyneri durdur                     |
| make clean | Konteyneri ve imaji tamamen sil       |

---

## Postman ile API Kullanimi

Tum istekler icin base URL: `http://localhost:8081/api/v1/news`

---

### 1. Saglik Kontrolu

**Yontem:** GET  
**URL:** `http://localhost:8081/api/v1/news/health`

Ornek yanit:
```json
{
  "status": "ok",
  "service": "classification-api"
}
```

---

### 2. Haber Siniflandirma (JSON)

**Yontem:** POST  
**URL:** `http://localhost:8081/api/v1/news/classify`

Postman'de: Body > raw > JSON secin

Ornek istek:
```json
{
  "headline": "Merkez Bankasi faiz oranini yuzde 50 olarak belirledi"
}
```

Ornek yanit:
```json
{
  "headline": "Merkez Bankasi faiz oranini yuzde 50 olarak belirledi",
  "assetType": "BOND",
  "symbol": "TR10Y",
  "assetScore": "0.72",
  "symbolScore": "0.68",
  "lexiconSymbol": "TR10Y",
  "topCandidates": ["BOND", "FOREX", "ECONOMY"],
  "unknown": false,
  "modelVersion": "1.0"
}
```

---

### 3. Haber Siniflandirma (Duz Metin)

**Yontem:** POST  
**URL:** `http://localhost:8081/api/v1/news/classify-text`

Postman'de: Body > raw > Text secin, haberi duz metin olarak yazin

---

### 4. Muhafazakar Siniflandirma (JSON)

**Yontem:** POST  
**URL:** `http://localhost:8081/api/v1/news/classify-safe`

Dusuk guven skorlu tahminleri `unknown: true` olarak doner. Kullanim sekli `/classify` ile aynıdır.

---

### 5. Muhafazakar Siniflandirma (Duz Metin)

**Yontem:** POST  
**URL:** `http://localhost:8081/api/v1/news/classify-safe-text`

Kullanim sekli `/classify-text` ile aynıdır.

---

### Yanit Alanlari

| Alan          | Aciklama                                    |
|---------------|---------------------------------------------|
| headline      | Gonderilen haber basligi                    |
| assetType     | Tahmin edilen varlik turu (BOND, FOREX vb.) |
| symbol        | Tahmin edilen sembol (TR10Y, USD/TRY vb.)   |
| assetScore    | Varlik turu tahmin skoru (0-1 arasi)        |
| symbolScore   | Sembol tahmin skoru (0-1 arasi)             |
| lexiconSymbol | Sozluk eslesme sonucu                       |
| topCandidates | En olasilikli sinif listesi                 |
| unknown       | Guvensiz tahminlerde true doner             |
| modelVersion  | Kullanilan model surumu                     |
