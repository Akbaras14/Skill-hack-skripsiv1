# Hack Penulisan Akademik — Agent Skill (120 Aturan)

Skill lintas platform untuk **penulisan, revisi, parafrase, sitasi APA 7, audit, dan finalisasi** naskah akademik berbahasa Indonesia.

- 60 aturan penulisan akademik (`HP-001` hingga `HP-060`)
- 25 aturan parafrase (`P-001` hingga `P-025`)
- 35 aturan sitasi dan integritas akademik (`S-001` hingga `S-035`)
- Tanpa API key, server, Docker, dan database
- Tidak menjanjikan lolos detektor AI, Turnitin, atau penilaian dosen
- Selalu memverifikasi sumber dan tidak mengarang data/sitasi

## Instalasi dengan Skills CLI

Prasyarat: Node.js dan npm tersedia. Instal dari repositori publik:

```bash
npx skills add Akbaras14/Skill-hack-skripsi --skill hack-penulisan-akademik
```

Pilih agen tujuan saat CLI meminta, misalnya **Codex, Gemini CLI, Antigravity, atau Claude Code**. Dokumentasi installer: https://github.com/vercel-labs/skills.

Untuk penggunaan global:

```bash
npx skills add Akbaras14/Skill-hack-skripsi --skill hack-penulisan-akademik -g
```

Perintah di atas **baru bisa dipakai setelah berkas dikirim dan tersedia pada branch `main` GitHub**.

## Instalasi manual

Unduh atau clone repositori. Salin direktori lengkap:

`/.agents/skills/hack-penulisan-akademik/`

Ke lokasi berikut sesuai agen:

| Agen | Tujuan salin |
|---|---|
| Codex | `<proyek>/.agents/skills/hack-penulisan-akademik/` |
| Gemini CLI | `<proyek>/.agents/skills/hack-penulisan-akademik/` atau `.gemini/skills/...` |
| Antigravity | `<proyek>/.agents/skills/hack-penulisan-akademik/` |
| Claude Code | `<proyek>/.claude/skills/hack-penulisan-akademik/` |
| ChatGPT | Unggah ZIP skill bila fitur tersedia, atau gunakan Project Instructions dari file dokumentasi |
| Claude web/desktop | Unggah ZIP skill bila tersedia pada akun |

**Penting:** Menyalin satu `SKILL.md` tanpa subfolder `references/` dan `assets/` tidak cukup. Semua berkas harus ikut.

## Struktur

```text
.agents/skills/hack-penulisan-akademik/
├── SKILL.md
├── references/
│   ├── hack-penulisan.md
│   ├── hack-prafrasesitasi.md
│   └── petunjuk-sumber.md
└── assets/
    ├── template-audit.md
    └── matriks-bukti.md
```

## Contoh penggunaan

```text
Gunakan hack-penulisan-akademik mode TULIS untuk Bab I skripsi saya.
Jangan menambahkan data penelitian atau sitasi yang belum diverifikasi.
```

```text
Gunakan hack-penulisan-akademik mode AUDIT untuk menilai naskah ini
berdasarkan 120 aturan. Laporkan hanya temuan yang memiliki bukti.
```

```text
Gunakan hack-penulisan-akademik mode PARAFRASE untuk teks ini.
Pertahankan makna dan format sitasi APA 7 yang benar.
```

## Dokumentasi

- [SKILL.md](../../.agents/skills/hack-penulisan-akademik/SKILL.md)
- [Aturan mutu penulisan](../../.agents/skills/hack-penulisan-akademik/references/hack-penulisan.md)
- [Aturan parafrase dan sitasi](../../.agents/skills/hack-penulisan-akademik/references/hack-prafrasesitasi.md)
- [ChatGPT Project Instructions](CHATGPT_PROJECT_INSTRUCTIONS.md)
- [Claude Upload Instructions](CLAUDE_UPLOAD_INSTRUCTIONS.md)
- [GPT API System Instructions](GPT_API_SYSTEM_INSTRUCTIONS.md)

## Batas validasi

Pemeriksaan lokal memastikan `SKILL.md` dan seluruh 120 ID aturan tersedia.
Aktivasi agen dan instalasi via Skills CLI pada masing-masing mesin belum diuji otomatis.
Bukti dapat diperiksa melalui hasil audit, log penelitian, dan sumber asli.
