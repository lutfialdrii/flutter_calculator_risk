# Calculator Risk Score App

### **A. Probability (Kemungkinan)**

| Value | Probability (Kemungkinan) | Penjelasan |
| --- | --- | --- |
| 0.1 | Practically Impossible | Hampir tidak mungkin terjadi |
| 0.5 | Conceivable (but unlikely) | Kemungkinan terjadi sangat kecil |
| 1 | Remotely Possible | Mungkin terjadi, tetapi jarang |
| 2 | Unusual but Possible | Dapat terjadi, namun tidak umum |
| 6 | Quite Possible | Kemungkinan terjadi cukup tinggi |
| 10 | Almost Certain | Hampir pasti akan terjadi |

### **B. Exposure (Paparan)**

| Value | Exposure (Paparan) | Penjelasan |
| --- | --- | --- |
| 0.5 | Very Rare  | Sangat jarang terjadi |
| 1 | Rare | Jarang terjadi |
| 2 | Infrequent | Kadang-kadang terjadi |
| 3 | Occasional | Sering terjadi |
| 6 | Frequent | Terjadi secara reguler |
| 10 | Continuous | Terjadi terus-menerus |

### **Consequence (Konsekuensi)**

| Value | Consequence (Konsekuensi) | Penjelasan |
| --- | --- | --- |
| 1 | Noticeable / First Aid Treatment  | Dampak kecil yang memerlukan perawatan kecil |
| 3 | Important / Casual Treatment  | Dampak sedang yang memerlukan perawatan ringan |
| 7 | Serious / Serious Injury  | Dampak signifikan dengan cedera serius |
| 15 | Very Serious / Fatality | Dampak sangat besar yang bisa mengakibatkan kematian tunggal |
| 40 | Disaster / Multiple Fatalities  | Dampak besar yang menyebabkan beberapa kematian |
| 100 | Catastrophe / Numerous Fatalities  | Dampak bencana dengan banyak kematian |

### Rumus menghitung Risk Score

```
Risk = Peluang x Exposure x Consequence
```

### Skala Risk Score

| Score | Tingkatan | Penjelasan |
| --- | --- | --- |
| > 400 | Very High Risk | Sangat berbahaya, tindakan harus segera diambil |
| 200 - 400 | High Risk | Risiko tinggi, perlu perhatian serius |
| 70 - 200 | Subtantial Risk | Risiko signifikan, perlu pengendalian |
| 20 - 70 | Moderate Risk | Risiko sedang, pemantauan diperlukan |
| >20 | Risk | Risiko dapat diterima |

### **Matriks Tie Line (2 Parameter: Probability & Exposure)**