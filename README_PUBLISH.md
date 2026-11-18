# Publikasi Skill Hack Penulisan Akademik ke GitHub

**Repositori tujuan:** https://github.com/Akbaras14/Skill-hack-skripsi

Paket ini disusun agar skill dapat dipasang menggunakan:

```bash
npx skills add Akbaras14/Skill-hack-skripsi --skill hack-penulisan-akademik
```

## Kondisi saat pembuatan

Koneksi GitHub di ChatGPT dapat membaca repositori, tetapi operasi menulis ditolak
dengan HTTP 403 `Resource not accessible by integration`.
**Berkas belum terunggah ke GitHub.**

## Cara publikasi dengan Git

1. Pastikan Git tersedia dan sudah punya izin `push` ke akun `Akbaras14`.
2. Ekstrak file ZIP ini ke folder lokal.
3. Buka terminal di folder hasil ekstraksi.
4. Jalankan `publish.ps1` (Windows PowerShell) atau `bash publish.sh` (Linux/macOS).
5. Periksa hasil di `https://github.com/Akbaras14/Skill-hack-skripsi/tree/main/.agents/skills/hack-penulisan-akademik`.
6. Setelah berhasil, orang lain dapat memakai `npx skills add ...`.

Skrip tidak menghapus file aplikasi lama, tidak melakukan force push,
dan tidak menyimpan token GitHub. Skrip menolak jika folder target sudah ada,
sehingga tidak mengubah skill versi pengguna lain secara diam-diam.

Anda juga dapat menyalin manual seluruh folder `.agents/skills/hack-penulisan-akademik`
dan `docs/hack-penulisan-akademik` ke clone lokal repositori, kemudian:

```bash
git add .agents/skills/hack-penulisan-akademik docs/hack-penulisan-akademik README.md
git commit -m "feat: publish academic writing agent skill"
git push origin main
```

**Catatan lisensi:** Repositori induk belum memiliki LICENSE pada root saat diperiksa.
Sebelum distribusi lebih luas, pemilik repositori sebaiknya memilih lisensi
untuk modul baru atau keseluruhan repositori.
