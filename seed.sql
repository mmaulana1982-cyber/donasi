INSERT INTO programs (id, slug, title, category, description, target, deadline, image, featured, status, created_at, updated_at) VALUES
('prg-1', 'pembangunan-masjid-santri', 'Pembangunan Masjid Al-Hidayah Santri Sorong', 'Pembangunan', 'Pembangunan masjid utama 2 lantai sebagai pusat ibadah, hafalan Al-Qur''an, dan dakwah bagi 350+ santri penghafal Qur''an di SP.3 Mayamuk Sorong.', 750000000, '2026-12-31', 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?auto=format&fit=crop&w=800&q=80', 1, 'ACTIVE', '2026-08-01 00:00:00', '2026-08-01 00:00:00');

INSERT INTO campaigns (id, program_id, title, slug, description, goal_amount, raised_amount, start_date, end_date, image, status, featured, created_at, updated_at) VALUES
('cmp-1', 'prg-1', 'Pembangunan Masjid Al-Hidayah Santri Sorong', 'pembangunan-masjid-santri', 'Pembangunan masjid utama 2 lantai sebagai pusat ibadah, hafalan Al-Qur''an, dan dakwah bagi 350+ santri penghafal Qur''an di SP.3 Mayamuk Sorong.', 750000000, 12500000, '2026-08-01', '2026-12-31', 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?auto=format&fit=crop&w=800&q=80', 'ACTIVE', 1, '2026-08-01 00:00:00', '2026-08-01 00:00:00');

INSERT INTO donations (id, code, program_id, donor_name, donor_email, donor_phone, amount, payment_method, status, is_anonymous, notes, proof_url, created_at, verified_at, verified_by, reject_reason) VALUES
('don-101', 'HP-20260808-000101', 'prg-1', 'H. Abdullah Rahman', 'abdullah@example.com', '081234567890', 5000000, 'Bank BSI', 'VERIFIED', 0, 'Semoga pembangunan masjid berjalan lancar dan membawa keberkahan.', 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=400&q=80', '2026-08-05 09:30:00', '2026-08-05 10:15:00', 'Admin Donasi', NULL),
('don-102', 'HP-20260808-000102', 'prg-1', 'Hamba Allah', 'anon@example.com', '082199887766', 1000000, 'Bank Mandiri', 'VERIFIED', 1, 'Untuk pendidikan anak-anak santri yatim di Sorong.', 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=400&q=80', '2026-08-06 14:20:00', '2026-08-06 15:00:00', 'Admin Donasi', NULL),
('don-103', 'HP-20260808-000103', 'prg-1', 'Ibu Hj. Mariam', 'mariam@example.com', '081344556677', 250000, 'QRIS', 'PENDING', 0, 'Bismillah, donasi untuk masjid.', 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=400&q=80', '2026-08-08 08:10:00', NULL, NULL, NULL);

INSERT INTO expenses (id, program_id, category, description, amount, date, proof_url, created_at) VALUES
('exp-1', 'prg-1', 'Material Bangunan', 'Pembelian 200 Sak Semen Tonasa & Pasir Pasang 2 Truk', 18500000, '2026-08-02', 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=400&q=80', '2026-08-02 00:00:00');

INSERT INTO audit_logs (id, timestamp, user, action, details) VALUES
('log-1', '2026-08-08 08:00:00', 'SUPER_ADMIN', 'SYSTEM_INITIALIZED', 'Aplikasi Hidayatullah Peduli berjalan dengan mode aman.'),
('log-2', '2026-08-05 10:15:00', 'ADMIN_DONATION', 'VERIFY_DONATION', 'Memverifikasi donasi HP-20260808-000101 (Rp5.000.000)');

INSERT INTO content_items (id, title, slug, category, excerpt, body, image, published, created_at) VALUES
('content-1', 'Pembinaan Santri Baru di Masjid Al-Hidayah', 'pembinaan-santri-baru-di-masjid-al-hidayah', 'Berita', 'Program pembinaan santri baru sedang berjalan dengan semangat belajar dan ibadah.', 'Dalam rangka meningkatkan kualitas ibadah dan pemahaman keislaman, santri baru mengikuti pembinaan intensif di Masjid Al-Hidayah. Kegiatan ini mencakup hafalan, pembacaan Al-Qur''an, dan pembelajaran akhlak.', 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=900&q=80', 1, '2026-08-01'),
('content-2', 'Kegiatan Bakti Sosial dan Donasi Sembako', 'kegiatan-bakti-sosial-dan-donasi-sembako', 'Kegiatan', 'Bakti sosial memperkuat semangat berbagi bagi keluarga dhuafa di sekitar Sorong.', 'Program donasi sembako rutin dilaksanakan untuk meringankan beban keluarga dhuafa. Distribusi dilakukan dengan pendekatan yang humanis dan terukur.', 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?auto=format&fit=crop&w=900&q=80', 1, '2026-08-05');

INSERT INTO about_content (id, title, content, image, sort_order, created_at) VALUES
('about-1', 'Sejarah dan Visi', 'Pondok Pesantren Hidayatullah Kabupaten Sorong berdiri di Jl. Supriyadi, Kelurahan Makbusun SP.3, Distrik Mayamuk, Kabupaten Sorong, Provinsi Papua Barat Daya. Kami berdedikasi untuk menyiapkan generasi yang cerdas, berakhlak mulia, dan siap menjadi pemimpin umat di tanah Papua.', 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=900&q=80', 1, '2026-08-01'),
('about-2', 'Program dan Dampak', 'Melalui wadah Hidayatullah Peduli, kami menghimpun, mengelola, serta menyalurkan bantuan donasi dari masyarakat luas untuk mendukung program pendidikan santri, pembangunan fisik fasilitas dakwah, penyediaan nutrisi santri, serta pemberdayaan masyarakat sekitar.', 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?auto=format&fit=crop&w=900&q=80', 2, '2026-08-01');

INSERT INTO admin_accounts (id, username, password, name, role, created_at) VALUES
('admin-1', 'admin', '123456', 'Super Admin', 'SUPER_ADMIN', '2026-08-01 00:00:00'),
('admin-2', 'donasi', '123456', 'Admin Donasi', 'ADMIN_DONATION', '2026-08-01 00:00:00'),
('admin-3', 'bendahara', '123456', 'Bendahara', 'TREASURER', '2026-08-01 00:00:00');

INSERT INTO app_settings (id, name, app_name, tagline, address, phone, email, logo, facebook_url, instagram_url, youtube_url, tiktok_url, bank_bsi, bank_mandiri, qris_merchant, hero_image, updated_at) VALUES
('setting-1', 'Pondok Pesantren Hidayatullah Kabupaten Sorong', 'HIDAYATULLAH PEDULI', 'Bersama Berbagi, Bersama Membangun Generasi', 'Jl. Supriyadi, Kelurahan Makbusun SP.3, Distrik Mayamuk, Kabupaten Sorong, Provinsi Papua Barat Daya.', '+62 823 1793 1921', 'peduli@hidayatullahsorong.or.id', 'https://i.ibb.co.com/JRpdV2rR/Logo-hidayatullah.jpg', 'https://facebook.com/hidayatullahpeduli', 'https://instagram.com/hidayatullahpeduli', 'https://youtube.com/@hidayatullahpeduli', 'https://tiktok.com/@hidayatullahpeduli', '712-345-6789 (a.n. Ponpes Hidayatullah Sorong)', '160-00-9876543-2 (a.n. Yayasan Hidayatullah Sorong)', 'HIDAYATULLAH PEDULI SORONG', 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?auto=format&fit=crop&w=800&q=80', '2026-08-01 00:00:00');

INSERT INTO payment_gateways (id, default_method, qris_image, qris_label, active, updated_at) VALUES
('gw-1', 'Bank BSI', 'https://images.unsplash.com/photo-1556740749-887f6717d7e4?auto=format&fit=crop&w=600&q=80', 'HIDAYATULLAH PEDULI SORONG', 1, '2026-08-01 00:00:00');

INSERT INTO payment_banks (id, gateway_id, name, account, holder, active) VALUES
('bank-1', 'gw-1', 'Bank BSI', '712-345-6789 (a.n. Ponpes Hidayatullah Sorong)', 'Ponpes Hidayatullah Sorong', 1),
('bank-2', 'gw-1', 'Bank Mandiri', '160-00-9876543-2 (a.n. Yayasan Hidayatullah Sorong)', 'Yayasan Hidayatullah Sorong', 1);

INSERT INTO chat_messages (id, sender, text, role, created_at) VALUES
('chat-1', 'system', 'Assalamu''alaikum! Selamat datang di Hidayatullah Peduli. Ada yang dapat kami bantu terkait donasi?', NULL, '2026-08-01 00:00:00');
