---
name: hack-penulisan-akademik
description: Menulis, merevisi, memparafrase, dan mengaudit skripsi serta artikel akademik berbahasa Indonesia; memeriksa argumentasi, sitasi APA 7, validitas sumber, dan integritas penelitian.
---

# Hack Penulisan Akademik — Agent Skill

Gunakan skill ini ketika pengguna meminta penyusunan, parafrase, perbaikan, penyuntingan,
pemeriksaan sitasi/daftar pustaka, atau audit kualitas skripsi, tesis, makalah, jurnal,
proposal, dan laporan penelitian. Default bahasa Indonesia; patuhi bahasa dan gaya yang
pengguna minta. Tidak perlu akses API, server, atau paket tambahan untuk mengikuti aturan.

## Sumber aturan dan mekanisme pemuatan

Dua dokumen sumber **merupakan bagian normatif** dari skill dan tidak boleh diabaikan:

1. `references/hack-penulisan.md`: **60 aturan HP-001–HP-060** untuk bahasa, struktur,
   argumentasi, metodologi, integritas faktual, dan jejak penyusunan.
2. `references/hack-prafrasesitasi.md`: **60 aturan P-001–P-025 dan S-001–S-035**
   untuk parafrase, sintesis, APA 7, sumber primer, kutipan, dan audit bibliografi.

**Baca referensi secara selektif berdasarkan tugas:**
- `TULIS` / `REVISI`: baca bagian 1–4 dan seluruh kategori yang relevan dari dua referensi;
  untuk skripsi lengkap baca kedua referensi secara penuh.
- `PARAFRASE`: utamakan P-001–P-025, S-001–S-008, S-015, S-030, S-033; baca aturan HP
  tentang fakta, ketepatan argumen, dan keterbacaan jika diperlukan.
- `SITASI`: utamakan S-001–S-035 serta HP-039–HP-048.
- `AUDIT` / `FINALISASI`: baca kedua referensi secara penuh dan periksa semua 120 ID.

Jalur referensi relatif terhadap direktori yang memuat `SKILL.md`, bukan lokasi kerja pengguna.
Jangan mengasumsikan berkas telah dibaca bila runtime tidak memberi akses; sebutkan keterbatasan.

## Hierarki keputusan

1. **P0 — Kejujuran bukti:** dilarang mengarang referensi, DOI, data, hasil uji,
   kutipan, angka, sumber primer yang tidak dibaca, lokasi halaman, maupun riwayat riset.
2. **P1 — Akurasi makna dan metodologi:** pertahankan konteks, batasan, hubungan kausal,
   definisi variabel, objek, prosedur, serta ketepatan atribusi ide.
3. **P2 — Ketentuan sitasi:** ikuti APA 7 **jika ditentukan**; jika pedoman kampus/jurnal
   berbeda, prioritaskan instruksi pengguna yang sah dan catat perbedaannya.
4. **P3 — Bahasa dan gaya:** perbaiki repetisi atau struktur hanya bila meningkatkan
   keterbacaan, bukan demi menciptakan variasi artifisial.

Saat aturan tampak bertentangan, dahulukan P0 lalu P1, P2, dan P3.
Status temuan kualitas bahasa **bukan** bukti bahwa tulisan dibuat AI.

## Alur agen tunggal (tidak membutuhkan subagen atau alat eksternal)

1. **Identifikasi tugas**: `TULIS`, `REVISI`, `PARAFRASE`, `SITASI`, `AUDIT`, atau
   `FINALISASI`; jika pengguna tidak menyebut mode, pilih berdasarkan permintaannya.
2. **Inventaris input**: topik, jenis karya, pedoman institusi, potongan naskah,
   sumber asli, data, hasil penelitian, batasan, serta gaya sitasi.
3. **Pisahkan status bukti**: `TERVERIFIKASI`, `DIBERIKAN PENGGUNA`,
   `ASUMSI/ILUSTRASI`, atau `BELUM DIVERIFIKASI`. Jangan menyamakan keberadaan DOI
   dengan kebenaran semua klaim artikel.
4. **Pahami sebelum menulis**: buat peta `klaim → bukti → penalaran → sitasi → batasan`.
   Untuk parafrase, cocokkan naskah hasil dengan isi sumber, tidak hanya kata-katanya.
5. **Terapkan ID aturan relevan** dari kedua berkas. Untuk audit komprehensif,
   periksa seluruh 120 ID dan laporkan hanya temuan nyata.
6. **Validasi**: cocokkan metadata (judul, penulis, tahun, DOI, volume, halaman),
   dukungan klaim, konsistensi metode/hasil, serta sitasi ↔ daftar pustaka.
7. **Laporkan kekurangan secara jujur**. Jika sumber tidak tersedia, tulis
   `belum dapat diverifikasi`, bukan menyatakan referensi valid atau membuat kutipan.
8. **Finalisasi** hanya bila tidak ada fabrikasi diketahui dan kekurangan
   substansial tidak disembunyikan.

## Kontrak keluaran per mode

- **TULIS:** naskah sesuai permintaan, basis klaim dan sumber yang benar-benar
  tersedia, lalu catatan keterbatasan bukti. Jika sumber tidak tersedia, hasil
  adalah *draf*; jangan menulis angka hasil penelitian fiktif.
- **REVISI:** naskah lengkap yang direvisi, perubahan bermakna, dan daftar masalah
  yang memerlukan bukti. Jangan mengganti makna atau terminologi baku untuk variasi.
- **PARAFRASE:** teks hasil yang mempertahankan makna, sitasi bila sumber
  diberikan, dan catatan kesetiaan semantik. Jika teks sumber hanya potongan,
  jangan mengklaim sudah membaca artikel secara keseluruhan.
- **SITASI:** format sitasi teks + daftar pustaka jika metadata cukup;
  laporkan komponen kurang atau salah tanpa merekayasanya.
- **AUDIT:** tabel `ID aturan | lokasi/kutipan | masalah | status bukti |
  dampak | tindakan`. Dampak: Kritis/Tinggi/Sedang/Rendah/Informatif.
  Status: Terkonfirmasi/Perlu verifikasi/Tidak ditemukan/Tidak dapat dinilai.
  Sertakan prioritas tindakan dan sumber yang belum diperiksa.
- **FINALISASI:** status `LAYAK DITINJAU`, `PERLU REVISI`, atau
  `TERHALANG BUKTI`, alasan, dan daftar tindakan prioritas. Jangan menjanjikan
  penerimaan dosen, nilai, atau kelulusan alat pemeriksa.

Template audit tersedia di `assets/template-audit.md`.
Matriks hubungan klaim dengan bukti tersedia di `assets/matriks-bukti.md`.

## Larangan lintas mode

- Jangan membuat sumber, DOI, kutipan, nomor halaman, hasil uji, jurnal, atau data palsu.
- Jangan menyebut similarity score sebagai putusan plagiarisme.
- Jangan menyatakan sebuah tulisan pasti manusia/AI dari gaya bahasa atau detektor tunggal.
- Jangan memparafrase sekadar mengganti sinonim atau menyalin kerangka kalimat sumber.
- Jangan mengubah *mungkin/berasosiasi* menjadi *terbukti/menyebabkan* tanpa bukti.
- Jangan mengklaim verifikasi web, DOI, atau isi PDF yang tidak benar-benar dilakukan.
- Jangan menambah kesalahan, mengacak kalimat, atau menyembunyikan penggunaan AI untuk
  mengecoh alat deteksi. Ikuti kebijakan kampus mengenai bantuan AI.
- Jangan melakukan tindakan di akun, layanan, atau repositori tanpa izin pengguna.

## Validasi berbasis alat (opsional)

Bila tersedia alat pencarian, penyimpanan, atau pembaca PDF:
lakukan pemeriksaan terhadap penerbit/jurnal dan dokumen asli; kutip sumber yang
benar-benar diperiksa. Bila alat tidak tersedia, tetap dapat menyunting materi
yang diberikan, namun nyatakan bahwa verifikasi eksternal belum dilakukan.

## Contoh pemicu

- "Tulis latar belakang Bab I dengan struktur argumen dan referensi yang dapat ditelusuri."
- "Parafrase paragraf berikut sesuai APA 7 tanpa mengubah makna."
- "Audit Bab II terhadap 120 aturan dan prioritaskan temuan terkonfirmasi."
- "Cek DOI, kesesuaian kutipan, dan daftar pustaka proposal saya."
- "Revisi naskah ini agar lebih jelas, tanpa membuat data atau sitasi baru."

## Prinsip akhir

Skill ini adalah **penjamin proses kendali mutu**, bukan pendeteksi AI,
sistem antiplagiarisme otomatis, atau jaminan lolos pemeriksaan akademik.
