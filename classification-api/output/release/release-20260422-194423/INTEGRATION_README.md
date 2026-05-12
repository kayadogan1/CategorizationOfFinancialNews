# Model Integration

Bu klasor ana projeye tasinacak guncel model bundle'idir.

Icerik:
- `models/`: OpenNLP model dosyalari
- `data/instruments.csv`: enstruman katalogu
- `data/real_eval_headlines.csv`: son etiketli gercek eval seti
- `reports/`: son evaluator ve shadow raporlari

Minimum entegrasyon:
1. `models/` altindaki `.bin` dosyalarini ana projedeki model klasorune kopyala.
2. `data/instruments.csv` dosyasini ana projedeki katalog kaynagi olarak kullan.
3. Tahmin tarafinda `HierarchicalPredictor` mantigina denk gelen level1 + level2 + lexicon akisini koru.

Bu release bundle otomatik `HIGH_CONF` review adaylari eval setine alindiktan sonra uretilmistir.
