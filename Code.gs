const GAS_DATA_KEY = 'hidayatullah_peduli_data';

function doOptions(e) {
  return ContentService.createTextOutput('')
    .setMimeType(ContentService.MimeType.TEXT);
}

function doGet(e) {
  try {
    const json = getData();
    return ContentService.createTextOutput(JSON.stringify(json))
      .setMimeType(ContentService.MimeType.JSON);
  } catch (err) {
    return ContentService.createTextOutput(JSON.stringify({ error: err.message }))
      .setMimeType(ContentService.MimeType.JSON);
  }
}

function doPost(e) {
  try {
    const body = JSON.parse(e.postData.contents);
    saveData(body);
    return ContentService.createTextOutput(JSON.stringify({ success: true, message: 'Data saved successfully' }))
      .setMimeType(ContentService.MimeType.JSON);
  } catch (err) {
    return ContentService.createTextOutput(JSON.stringify({ error: err.message }))
      .setMimeType(ContentService.MimeType.JSON);
  }
}

function getData() {
  const props = PropertiesService.getScriptProperties();
  const raw = props.getProperty(GAS_DATA_KEY);
  if (!raw) {
    const initial = getInitialData();
    saveData(initial);
    return initial;
  }
  try {
    return JSON.parse(raw);
  } catch (err) {
    const initial = getInitialData();
    saveData(initial);
    return initial;
  }
}

function saveData(data) {
  const props = PropertiesService.getScriptProperties();
  const json = data ? JSON.stringify(data) : '{}';
  props.setProperty(GAS_DATA_KEY, json);
}

function getInitialData() {
  return {
    programs: [
      {
        id: 'prg-1',
        slug: 'pembangunan-masjid-santri',
        title: 'Pembangunan Masjid Al-Hidayah Santri Sorong',
        category: 'Pembangunan',
        description: 'Pembangunan masjid utama 2 lantai sebagai pusat ibadah, hafalan Al-Qur\'an, dan dakwah bagi 350+ santri penghafal Qur\'an di SP.3 Mayamuk Sorong.',
        target: 750000000,
        deadline: '2026-12-31',
        image: 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?auto=format&fit=crop&w=800&q=80',
        featured: true,
        status: 'ACTIVE',
        updates: [],
        rab: []
      }
    ],
    donations: [],
    expenses: [],
    auditLogs: [
      {
        id: 'log-1',
        timestamp: new Date().toISOString().replace('T', ' ').substring(0, 19),
        user: 'SYSTEM',
        action: 'SYSTEM_INITIALIZED',
        details: 'Backend GAS Hidayatullah Peduli berhasil diinisialisasi.'
      }
    ],
    contentItems: [],
    aboutContent: [],
    adminAccounts: [
      { id: 'admin-1', username: 'admin', password: '123456', name: 'Super Admin', role: 'SUPER_ADMIN' }
    ],
    appSettings: {
      name: 'Pondok Pesantren Hidayatullah Kabupaten Sorong',
      appName: 'HIDAYATULLAH PEDULI',
      tagline: 'Bersama Berbagi, Bersama Membangun Generasi',
      address: 'Jl. Supriyadi, Kelurahan Makbusun SP.3, Distrik Mayamuk, Kabupaten Sorong, Provinsi Papua Barat Daya.',
      phone: '+62 823 1793 1921',
      email: 'peduli@hidayatullahsorong.or.id',
      logo: 'https://i.ibb.co.com/JRpdV2rR/Logo-hidayatullah.jpg',
      facebookUrl: 'https://facebook.com/hidayatullahpeduli',
      instagramUrl: 'https://instagram.com/hidayatullahpeduli',
      youtubeUrl: 'https://youtube.com/@hidayatullahpeduli',
      tiktokUrl: 'https://tiktok.com/@hidayatullahpeduli',
      bankBSI: '712-345-6789 (a.n. Ponpes Hidayatullah Sorong)',
      bankMandiri: '160-00-9876543-2 (a.n. Yayasan Hidayatullah Sorong)',
      qrisMerchant: 'HIDAYATULLAH PEDULI SORONG',
      heroImage: 'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?auto=format&fit=crop&w=800&q=80'
    },
    paymentGateway: {
      defaultMethod: 'Bank BSI',
      qrisImage: 'https://images.unsplash.com/photo-1556740749-887f6717d7e4?auto=format&fit=crop&w=600&q=80',
      qrisLabel: 'HIDAYATULLAH PEDULI SORONG',
      banks: [
        { id: 'bank-bsi', name: 'Bank BSI', account: '712-345-6789 (a.n. Ponpes Hidayatullah Sorong)', holder: 'Ponpes Hidayatullah Sorong', active: true },
        { id: 'bank-mandiri', name: 'Bank Mandiri', account: '160-00-9876543-2 (a.n. Yayasan Hidayatullah Sorong)', holder: 'Yayasan Hidayatullah Sorong', active: true }
      ]
    },
    chatMessages: []
  };
}
