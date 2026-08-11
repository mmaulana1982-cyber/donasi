export async function onRequestGet(context) {
    const { request, params, env } = context;
    const slug = params?.slug || '';

    let programs = [];
    try {
        const data = await env.HIDAYATULLAH_DATA.get('app-data');
        if (data) {
            const parsed = JSON.parse(data);
            programs = parsed.programs || [];
        }
    } catch (e) {
        console.error('Failed to load programs', e);
    }

    const program = programs.find(p => p.slug === slug) || programs[0];

    if (!program) {
        return new Response('Program not found', { status: 404 });
    }

    const title = program.title || 'Program Donasi Hidayatullah Peduli';
    const image = program.image || 'https://i.ibb.co.com/JRpdV2rR/Logo-hidayatullah.jpg';
    const description = program.description || 'Salurkan kepedulian Anda untuk mendukung program Pondok Pesantren Hidayatullah Sorong.';
    const url = `https://${request.headers.get('host')}/program/${slug}`;

    const html = `<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <meta name="description" content="${description.replace(/"/g, '&quot;')}">
    
    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="${url}">
    <meta property="og:title" content="${title}">
    <meta property="og:description" content="${description.replace(/"/g, '&quot;')}">
    <meta property="og:image" content="${image}">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    
    <!-- Twitter -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:url" content="${url}">
    <meta name="twitter:title" content="${title}">
    <meta name="twitter:description" content="${description.replace(/"/g, '&quot;')}">
    <meta name="twitter:image" content="${image}">
    
    <!-- Canonical -->
    <link rel="canonical" href="${url}">
    
    <script>
        window.location.href = '/?view=program-detail&slug=${encodeURIComponent(slug)}';
    </script>
</head>
<body>
    <p>Memuat program donasi...</p>
</body>
</html>`;

    return new Response(html, {
        headers: {
            'Content-Type': 'text/html; charset=utf-8',
            'Cache-Control': 'public, max-age=3600, s-maxage=3600',
            'X-Robots-Tag': 'noindex, follow',
        },
    });
}
