# Hidayatullah Peduli

Website donasi statis untuk Pondok Pesantren Hidayatullah Sorong.

## Deploy ke Cloudflare Pages

### 1) Install dependency

```bash
npm install
```

### 2) Deploy ke Cloudflare

```bash
npm run deploy:cloudflare
```

Atau upload project ke Cloudflare Pages secara manual melalui dashboard lalu pilih folder project yang berisi file `index.html`.

### 3) Preview lokal

```bash
npm run dev
```

## Catatan

- Project ini bersifat static, jadi cocok untuk Cloudflare Pages tanpa build step.
- File `wrangler.toml` sudah disiapkan untuk deployment langsung.
- Jika Anda ingin deploy otomatis dari GitHub, hubungkan repo ke Cloudflare Pages dan pilih framework preset "None" atau upload folder statis.
